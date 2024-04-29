#ifndef _HOURGLASS_SKETCH_P4_
#define _HOURGLASS_SKETCH_P4_

#include <core.p4>
#include <tna.p4>

const bit<16> ETHERTYPE_IPV4 = 0x0800;
const bit<8> IPV4PROTOCOL_UDP = 17;

#define RECIRCULATE_IN_PORT 0xD
#define RECIRCULATE_OUT_PORT 0xD

#define ID_BITS 32

/////////////////////// COCO ///////////////////////
// only used in hash
#define COCO_INDEX_BITS 10

#define COCO_BUCKETS 1024
#define COCO_BITS 32

#define RAND_BITS 16
#define RAND_MAX (1 << RAND_BITS)

#define COCO_ID_CONTROL_BITS 1
#define COCO_ID_NO_ACTION 0
#define COCO_ID_REPLACE 1

#define COCO_PURE_COUNTER_CONTROL_BITS 2
#define COCO_PURE_COUNTER_NO_ACTION 0
#define COCO_PURE_COUNTER_INC 1
#define COCO_PURE_COUNTER_RESET 2

/////////////////////// TOWER TCM ///////////////////////
// only used in hash
#define TOWER_TCM_INDEX_BITS_1 14
#define TOWER_TCM_INDEX_BITS_2 14
#define TOWER_TCM_INDEX_BITS_3 12
#define TOWER_TCM_INDEX_BITS_4 12

#define TOWER_TCM_BUCKETS_1 16384
#define TOWER_TCM_BUCKETS_2 16384
#define TOWER_TCM_BUCKETS_3 4096
#define TOWER_TCM_BUCKETS_4 4096

#define TOWER_TCM_BUCKET_BITS_1 8
#define TOWER_TCM_BUCKET_BITS_2 8
#define TOWER_TCM_BUCKET_BITS_3 8
#define TOWER_TCM_BUCKET_BITS_4 16
#define TOWER_TCM_MAX_1 255
#define TOWER_TCM_MAX_2 255
#define TOWER_TCM_MAX_3 255
#define TOWER_TCM_MAX_4 65535

#define TOWER_TCM_CONTROL_BITS 1
#define TOWER_TCM_HOLD 0
#define TOWER_TCM_INSERT 1

/////////////////////// ERROR FUNNEL ///////////////////////

#define ERROR_FUNNEL_CONTROL_BITS 1
#define ERROR_FUNNEL_LOOKUP 0
#define ERROR_FUNNEL_FREEZE 1

#define FREEZING_COUNTER_BITS 16
#define FREEZING_COUNTER_MAX 65535

#define ERROR_FUNNEL_OFFSET_BITS 2 // freezing_counter_id_1 = tower_tcm_id_4 >> 2

header ethernet_h {
    bit<48> dst_addr;
    bit<48> src_addr;
    bit<16> ether_type;
}

header ipv4_h {
    bit<4> version;
    bit<4> ihl;
    bit<8> diffserv;
    bit<16> total_len;
    bit<16> identification;
    bit<3> flags;
    bit<13> frag_offset;
    bit<8> ttl;
    bit<8> protocol;
    bit<16> hdr_checksum;
    bit<32> src_addr;
    bit<32> dst_addr;
}

header udp_h {
    bit<16> src_port;
    bit<16> dst_port;
    bit<16> total_len;
    bit<16> checksum;
}

header my_protocol_h {
    bit<ID_BITS> id;
}

header egress_control_h {
    bit<1> tower_tcm_control;
    bit<7> padding;
}

header egress_data_h {
    bit<1> is_recirculated;
    @padding bit<7> _pad0;

    bit<ERROR_FUNNEL_CONTROL_BITS> error_funnel_control;
    @padding bit<7> _pad1;

    bit<32> freeze_tower_tcm_index_4;
    bit<32> unfreeze_tower_tcm_index_4;

    bit<FREEZING_COUNTER_BITS> freezing_counter;

    bit<ID_BITS> tower_tcm_id;
    bit<ID_BITS> tower_tcm_inc;
}

struct my_ingress_header_t {
    egress_control_h egress_control;
    egress_data_h egress_data;
    ethernet_h ethernet;
    ipv4_h ipv4;
    udp_h udp;
    my_protocol_h my_protocol;
}

struct my_ingress_metadata_t {
    bit<COCO_ID_CONTROL_BITS> coco_id_control;
    bit<COCO_PURE_COUNTER_CONTROL_BITS> coco_pure_counter_control;
    bit<32> coco_rand_num;
    bit<32> coco_cond;

    bit<32> coco_index;
    bit<COCO_BITS> coco_counter;
    bit<COCO_BITS> coco_pure_counter;
}

struct freezing_bucket_t {
    bit<16> tower_tcm_index_4;
    bit<FREEZING_COUNTER_BITS> freezing_counter;
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*----------------------------------------------------------------------------------- INGRESS -----------------------------------------------------------------------------------*/
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

parser IngressParser(packet_in        pkt,
    /* User */
    out my_ingress_header_t           hdr,
    out my_ingress_metadata_t         meta,
    /* Intrinsic */
    out ingress_intrinsic_metadata_t  ig_intr_md) 
{
    state start {
        pkt.extract(ig_intr_md);
        pkt.advance(PORT_METADATA_SIZE);
        
        transition meta_init;
    }

    state meta_init {
        meta.coco_id_control = COCO_ID_NO_ACTION;
        meta.coco_pure_counter_control = COCO_PURE_COUNTER_NO_ACTION;
        meta.coco_rand_num = 0;
        meta.coco_cond = 0;

        meta.coco_index = 0;
        meta.coco_counter = 0;
        meta.coco_pure_counter = 0;

        transition select(ig_intr_md.ingress_port) {
            RECIRCULATE_IN_PORT: parse_egress_control;
            default: egress_data_init;
        }
    }

    state egress_data_init {

        hdr.egress_control.setValid();
        hdr.egress_control.tower_tcm_control = TOWER_TCM_HOLD;

        hdr.egress_data.setValid();
        hdr.egress_data.is_recirculated = 0;

        hdr.egress_data.error_funnel_control = ERROR_FUNNEL_LOOKUP;
        hdr.egress_data.freeze_tower_tcm_index_4 = 0;
        hdr.egress_data.unfreeze_tower_tcm_index_4 = 0;

        hdr.egress_data.freezing_counter = 0;
    
        hdr.egress_data.tower_tcm_id = 0;
        hdr.egress_data.tower_tcm_inc = 1;

        transition parse_ethernet;
    }

    state parse_egress_control {
        pkt.extract(hdr.egress_control);
        transition select(hdr.egress_control.tower_tcm_control) {
            TOWER_TCM_INSERT: parse_egress_data;
            default: accept;
        }
    }
    
    state parse_egress_data {
        pkt.extract(hdr.egress_data);
        transition accept;
    }

    state parse_ethernet {
        pkt.extract(hdr.ethernet);
        transition select(hdr.ethernet.ether_type) {
            ETHERTYPE_IPV4: parse_ipv4;
            default: accept;
        }
    }
    state parse_ipv4 {
        pkt.extract(hdr.ipv4);
        transition select(hdr.ipv4.protocol) {
            IPV4PROTOCOL_UDP: parse_udp;
            default: accept;
        }
    }
    state parse_udp {
        pkt.extract(hdr.udp);
        transition parse_my_protocol;
    }
    state parse_my_protocol {
        pkt.extract(hdr.my_protocol);
        transition accept;
    }
}

control Ingress(
    /* User */
    inout my_ingress_header_t                        hdr,
    inout my_ingress_metadata_t                      meta,
    /* Intrinsic */
    in    ingress_intrinsic_metadata_t               ig_intr_md,
    in    ingress_intrinsic_metadata_from_parser_t   ig_prsr_md,
    inout ingress_intrinsic_metadata_for_deparser_t  ig_dprsr_md,
    inout ingress_intrinsic_metadata_for_tm_t        ig_tm_md)
{
    /////////////////////////////////// COCO ///////////////////////////////////

	Hash<bit<COCO_INDEX_BITS>>(HashAlgorithm_t.IDENTITY) hash_coco;
    action apply_hash_coco() {
        meta.coco_index = (bit<32>)hash_coco.get(hdr.my_protocol.id);
    }

    table table_hash_coco {
        actions = {
            apply_hash_coco;
        }
        size = 1;
        const default_action = apply_hash_coco;
    }

    /*-------------------------------- COCO COUNTER --------------------------------*/

    Register<bit<COCO_BITS>, bit<32>>(COCO_BUCKETS) register_coco_counter;
    RegisterAction<bit<COCO_BITS>, bit<32>, bit<COCO_BITS>>(register_coco_counter) coco_counter_action = {
        void apply(inout bit<COCO_BITS> reg_data, out bit<COCO_BITS> coco_counter) {
            reg_data = reg_data + 1;
            coco_counter = reg_data;
        }
    };

    action apply_coco_counter() {
        meta.coco_counter = coco_counter_action.execute(meta.coco_index);
    }

    table table_coco_counter {
        actions = {
            apply_coco_counter;
        }
        size = 1;
        const default_action = apply_coco_counter;
    }

    /*-------------------------------- COCO RAND --------------------------------*/
    // code from CocoSketch github
    Random<bit<RAND_BITS>>() rand;

    Register<bit<32>,bit<1>>(1) num_32;

	MathUnit<bit<32>>(true,0,9,{68,73,78,85,93,102,113,128,0,0,0,0,0,0,0,0}) prog_64K_div_mu;

	RegisterAction<bit<32>, bit<1>, bit<32>>(num_32) prog_64K_div_x = {
		void apply(inout bit<32> register_data, out bit<32> mau_value){
			register_data = prog_64K_div_mu.execute(meta.coco_counter);
            mau_value = register_data;
		}
	};

    action calc_cond(){
		meta.coco_cond = prog_64K_div_x.execute(0);
	}
    
    table table_calc_cond {
        actions = {
            calc_cond;
        }
        size = 1;
        const default_action = calc_cond;
    }

    /*-------------------------------- COCO ID --------------------------------*/
    Register<bit<ID_BITS>, bit<32>>(COCO_BUCKETS) register_coco_id;
    RegisterAction<bit<ID_BITS>, bit<32>, bit<ID_BITS>>(register_coco_id) coco_id_action = {
        void apply(inout bit<ID_BITS> reg_data, out bit<ID_BITS> coco_id) {
            coco_id = reg_data;
            if (meta.coco_id_control == COCO_ID_REPLACE) 
                reg_data = hdr.my_protocol.id;
        }
    };

    action apply_coco_id() {
        hdr.egress_data.tower_tcm_id = coco_id_action.execute(meta.coco_index);
    }

    table table_coco_id {
        actions = {
            apply_coco_id;
        }
        size = 1;
        const default_action = apply_coco_id;
    }

    /*-------------------------------- COCO PURE COUNTER --------------------------------*/
    Register<bit<COCO_BITS>, bit<32>>(COCO_BUCKETS) register_coco_pure_counter;
    RegisterAction<bit<COCO_BITS>, bit<32>, bit<COCO_BITS>>(register_coco_pure_counter) coco_pure_counter_action = {
        void apply(inout bit<COCO_BITS> reg_data, out bit<COCO_BITS> coco_pure_counter) {
            coco_pure_counter = reg_data;
            if (meta.coco_pure_counter_control == COCO_PURE_COUNTER_RESET)  
                reg_data = 1;
            else if (meta.coco_pure_counter_control == COCO_PURE_COUNTER_INC)
                reg_data = reg_data + 1;
        }
    };
    
    action apply_coco_pure_counter() {
        meta.coco_pure_counter = coco_pure_counter_action.execute(meta.coco_index);
    }
    
    table table_coco_pure_counter {
        actions = {
            apply_coco_pure_counter;
        }
        size = 1;
        const default_action = apply_coco_pure_counter;
    }

    /////////////////////////////////// ERROR FUNNEL ///////////////////////////////////

    CRCPolynomial<bit<32>>(0xDB710641,false,false,false,32w0xFFFFFFFF,32w0xFFFFFFFF) crc32c;

    Hash<bit<TOWER_TCM_INDEX_BITS_4>>(HashAlgorithm_t.CUSTOM, crc32c) hash_freeze_tower_tcm_4;
    Hash<bit<TOWER_TCM_INDEX_BITS_4>>(HashAlgorithm_t.CUSTOM, crc32c) hash_unfreeze_tower_tcm_4;

    action apply_hash_freeze_tower_tcm_4() {
        hdr.egress_data.freeze_tower_tcm_index_4 = (bit<32>)hash_freeze_tower_tcm_4.get(hdr.my_protocol.id);
    } 

    table table_hash_freeze_tower_tcm_4 {
        actions = {
            apply_hash_freeze_tower_tcm_4;
        }
        size = 1;
        const default_action = apply_hash_freeze_tower_tcm_4;
    }

    action apply_hash_unfreeze_tower_tcm_4() {
        hdr.egress_data.unfreeze_tower_tcm_index_4 = (bit<32>)hash_unfreeze_tower_tcm_4.get(hdr.egress_data.tower_tcm_id);
    }

    table table_hash_unfreeze_tower_tcm_4 {
        actions = {
            apply_hash_unfreeze_tower_tcm_4;
        }
        size = 1;
        const default_action = apply_hash_unfreeze_tower_tcm_4;
    }

    /*-------------------------------- FREEZING COUNTER 1 --------------------------------*/

    Register<freezing_bucket_t, bit<32>>(TOWER_TCM_BUCKETS_4 >> ERROR_FUNNEL_OFFSET_BITS) register_freezing_counter_1;
    RegisterAction<freezing_bucket_t, bit<32>, bit<FREEZING_COUNTER_BITS>>(register_freezing_counter_1) freezing_counter_1_freeze_action = {
        void apply(inout freezing_bucket_t reg_data, out bit<FREEZING_COUNTER_BITS> counter) {
            counter = 0;
            if (reg_data.freezing_counter == FREEZING_COUNTER_MAX) { // empty counter
                counter = reg_data.freezing_counter;
                reg_data.tower_tcm_index_4 = (bit<16>)hdr.egress_data.freeze_tower_tcm_index_4;
                reg_data.freezing_counter = 0;
            }
        }
    };
    
    action apply_freezing_counter_1() {
        hdr.egress_data.freezing_counter = freezing_counter_1_freeze_action.execute(hdr.egress_data.freeze_tower_tcm_index_4);
        hdr.egress_data.freeze_tower_tcm_index_4 = hdr.egress_data.freeze_tower_tcm_index_4 >> 1;
    }

    RegisterAction<freezing_bucket_t, bit<32>, bit<FREEZING_COUNTER_BITS>>(register_freezing_counter_1) freezing_counter_1_unfreeze_action = {
        void apply(inout freezing_bucket_t reg_data, out bit<FREEZING_COUNTER_BITS> counter) {
            counter = 0;
            if (reg_data.tower_tcm_index_4 != FREEZING_COUNTER_MAX 
                && reg_data.tower_tcm_index_4 == (bit<16>)hdr.egress_data.unfreeze_tower_tcm_index_4) {
                counter = reg_data.freezing_counter;
                reg_data.freezing_counter = FREEZING_COUNTER_MAX;
            }
        }
    };

    action apply_unfreezing_counter_1() {
        hdr.egress_data.freezing_counter = hdr.egress_data.freezing_counter + freezing_counter_1_unfreeze_action.execute(hdr.egress_data.unfreeze_tower_tcm_index_4);
        hdr.egress_data.unfreeze_tower_tcm_index_4 = hdr.egress_data.unfreeze_tower_tcm_index_4 >> 1;
    }

    RegisterAction<freezing_bucket_t, bit<32>, bit<FREEZING_COUNTER_BITS>>(register_freezing_counter_1) freezing_counter_1_lookup_action = {
        void apply(inout freezing_bucket_t reg_data, out bit<FREEZING_COUNTER_BITS> counter) {
            counter = 0;
            if (reg_data.tower_tcm_index_4 != FREEZING_COUNTER_MAX 
                && reg_data.tower_tcm_index_4 == (bit<16>)hdr.egress_data.freeze_tower_tcm_index_4) {
                counter = 1;
                reg_data.freezing_counter = reg_data.freezing_counter + 1;
            }
        }
    };

    action apply_lookup_freezing_counter_1() {
        hdr.egress_data.freezing_counter = freezing_counter_1_lookup_action.execute(hdr.egress_data.freeze_tower_tcm_index_4);
        hdr.egress_data.freeze_tower_tcm_index_4 = hdr.egress_data.freeze_tower_tcm_index_4 >> 1;
    }

    @stage(9)
    table table_freezing_counter_1{
        actions = {
            apply_freezing_counter_1;
        }
        size = 1;
        const default_action = apply_freezing_counter_1;
    }

    @stage(9)
    table table_unfreezing_counter_1{
        actions = {
            apply_unfreezing_counter_1;
        }
        size = 1;
        const default_action = apply_unfreezing_counter_1;
    }

    @stage(9)
    table table_lookup_freezing_counter_1{
        actions = {
            apply_lookup_freezing_counter_1;
        }
        size = 1;
        const default_action = apply_lookup_freezing_counter_1;
    }
    
    /*-------------------------------- FREEZING COUNTER 2 --------------------------------*/

    Register<freezing_bucket_t, bit<32>>(TOWER_TCM_BUCKETS_4 >> ERROR_FUNNEL_OFFSET_BITS + 1) register_freezing_counter_2;
    RegisterAction<freezing_bucket_t, bit<32>, bit<FREEZING_COUNTER_BITS>>(register_freezing_counter_2) freezing_counter_2_freeze_action = {
        void apply(inout freezing_bucket_t reg_data, out bit<FREEZING_COUNTER_BITS> counter) {
            counter = 0;
            if (reg_data.freezing_counter == FREEZING_COUNTER_MAX) { // empty counter
                counter = reg_data.freezing_counter;
                reg_data.tower_tcm_index_4 = (bit<16>)hdr.egress_data.freeze_tower_tcm_index_4;
                reg_data.freezing_counter = 0;
            }
        }
    };
    
    action apply_freezing_counter_2() {
        hdr.egress_data.freezing_counter = freezing_counter_2_freeze_action.execute(hdr.egress_data.freeze_tower_tcm_index_4);
        hdr.egress_data.freeze_tower_tcm_index_4 = hdr.egress_data.freeze_tower_tcm_index_4 >> 1;
    }

    RegisterAction<freezing_bucket_t, bit<32>, bit<FREEZING_COUNTER_BITS>>(register_freezing_counter_2) freezing_counter_2_unfreeze_action = {
        void apply(inout freezing_bucket_t reg_data, out bit<FREEZING_COUNTER_BITS> counter) {
            counter = 0;
            if (reg_data.tower_tcm_index_4 != FREEZING_COUNTER_MAX 
                && reg_data.tower_tcm_index_4 == (bit<16>)hdr.egress_data.unfreeze_tower_tcm_index_4) {
                counter = reg_data.freezing_counter;
                reg_data.freezing_counter = FREEZING_COUNTER_MAX;
            }
        }
    };

    action apply_unfreezing_counter_2() {
        hdr.egress_data.freezing_counter = hdr.egress_data.freezing_counter + freezing_counter_2_unfreeze_action.execute(hdr.egress_data.unfreeze_tower_tcm_index_4);
        hdr.egress_data.unfreeze_tower_tcm_index_4 = hdr.egress_data.unfreeze_tower_tcm_index_4 >> 1;
    }

    RegisterAction<freezing_bucket_t, bit<32>, bit<FREEZING_COUNTER_BITS>>(register_freezing_counter_2) freezing_counter_2_lookup_action = {
        void apply(inout freezing_bucket_t reg_data, out bit<FREEZING_COUNTER_BITS> counter) {
            counter = 0;
            if (reg_data.tower_tcm_index_4 != FREEZING_COUNTER_MAX 
                && reg_data.tower_tcm_index_4 == (bit<16>)hdr.egress_data.freeze_tower_tcm_index_4) {
                counter = 1;
                reg_data.freezing_counter = reg_data.freezing_counter + 1;
            }
        }
    };

    action apply_lookup_freezing_counter_2() {
        hdr.egress_data.freezing_counter = freezing_counter_2_lookup_action.execute(hdr.egress_data.freeze_tower_tcm_index_4);
        hdr.egress_data.freeze_tower_tcm_index_4 = hdr.egress_data.freeze_tower_tcm_index_4 >> 1;
    }

    @stage(10)
    table table_freezing_counter_2{
        actions = {
            apply_freezing_counter_2;
        }
        size = 1;
        const default_action = apply_freezing_counter_2;
    }

    @stage(10)
    table table_unfreezing_counter_2{
        actions = {
            apply_unfreezing_counter_2;
        }
        size = 1;
        const default_action = apply_unfreezing_counter_2;
    }

    @stage(10)
    table table_lookup_freezing_counter_2{
        actions = {
            apply_lookup_freezing_counter_2;
        }
        size = 1;
        const default_action = apply_lookup_freezing_counter_2;
    }

    /*-------------------------------- FREEZING COUNTER 3 --------------------------------*/

    Register<freezing_bucket_t, bit<32>>(TOWER_TCM_BUCKETS_4 >> ERROR_FUNNEL_OFFSET_BITS + 2) register_freezing_counter_3;
    RegisterAction<freezing_bucket_t, bit<32>, bit<FREEZING_COUNTER_BITS>>(register_freezing_counter_3) freezing_counter_3_freeze_action = {
        void apply(inout freezing_bucket_t reg_data, out bit<FREEZING_COUNTER_BITS> counter) {
            counter = 0;
            if (reg_data.freezing_counter == FREEZING_COUNTER_MAX) { // empty counter
                counter = reg_data.freezing_counter;
                reg_data.tower_tcm_index_4 = (bit<16>)hdr.egress_data.freeze_tower_tcm_index_4;
                reg_data.freezing_counter = 0;
            }
        }
    };
    
    action apply_freezing_counter_3() {
        hdr.egress_data.freezing_counter = freezing_counter_3_freeze_action.execute(hdr.egress_data.freeze_tower_tcm_index_4);
        hdr.egress_data.freeze_tower_tcm_index_4 = hdr.egress_data.freeze_tower_tcm_index_4 >> 1;
    }

    RegisterAction<freezing_bucket_t, bit<32>, bit<FREEZING_COUNTER_BITS>>(register_freezing_counter_3) freezing_counter_3_unfreeze_action = {
        void apply(inout freezing_bucket_t reg_data, out bit<FREEZING_COUNTER_BITS> counter) {
            counter = 0;
            if (reg_data.tower_tcm_index_4 != FREEZING_COUNTER_MAX 
                && reg_data.tower_tcm_index_4 == (bit<16>)hdr.egress_data.unfreeze_tower_tcm_index_4) {
                counter = reg_data.freezing_counter;
                reg_data.freezing_counter = FREEZING_COUNTER_MAX;
            }
        }
    };

    action apply_unfreezing_counter_3() {
        hdr.egress_data.freezing_counter = hdr.egress_data.freezing_counter + freezing_counter_3_unfreeze_action.execute(hdr.egress_data.unfreeze_tower_tcm_index_4);
        hdr.egress_data.unfreeze_tower_tcm_index_4 = hdr.egress_data.unfreeze_tower_tcm_index_4 >> 1;
    }

    RegisterAction<freezing_bucket_t, bit<32>, bit<FREEZING_COUNTER_BITS>>(register_freezing_counter_3) freezing_counter_3_lookup_action = {
        void apply(inout freezing_bucket_t reg_data, out bit<FREEZING_COUNTER_BITS> counter) {
            counter = 0;
            if (reg_data.tower_tcm_index_4 != FREEZING_COUNTER_MAX 
                && reg_data.tower_tcm_index_4 == (bit<16>)hdr.egress_data.freeze_tower_tcm_index_4) {
                counter = 1;
                reg_data.freezing_counter = reg_data.freezing_counter + 1;
            }
        }
    };

    action apply_lookup_freezing_counter_3() {
        hdr.egress_data.freezing_counter = freezing_counter_3_lookup_action.execute(hdr.egress_data.freeze_tower_tcm_index_4);
        hdr.egress_data.freeze_tower_tcm_index_4 = hdr.egress_data.freeze_tower_tcm_index_4 >> 1;
    }

    @stage(11)
    table table_freezing_counter_3{
        actions = {
            apply_freezing_counter_3;
        }
        size = 1;
        const default_action = apply_freezing_counter_3;
    }

    @stage(11)
    table table_unfreezing_counter_3{
        actions = {
            apply_unfreezing_counter_3;
        }
        size = 1;
        const default_action = apply_unfreezing_counter_3;
    }

    @stage(11)
    table table_lookup_freezing_counter_3{
        actions = {
            apply_lookup_freezing_counter_3;
        }
        size = 1;
        const default_action = apply_lookup_freezing_counter_3;
    }

    /////////////////////////////////// TOWER TCM ///////////////////////////////////

    /////////////////////////////////// RECIRCULATION ///////////////////////////////////

    action recirculate_packet() {
        ig_tm_md.ucast_egress_port = RECIRCULATE_OUT_PORT;
    }

    table table_recirculate_packet {
        actions = {
            recirculate_packet;
        }
        size = 1;
        const default_action = recirculate_packet;
    }

    /////////////////////////////////// APPLY ///////////////////////////////////

    apply {

        if (ig_intr_md.ingress_port == RECIRCULATE_IN_PORT) { // recirculate
            hdr.egress_data.is_recirculated = 1;

            table_freezing_counter_1.apply();
            if (hdr.egress_data.freezing_counter != FREEZING_COUNTER_MAX) {
                table_freezing_counter_2.apply();
            }
            if (hdr.egress_data.freezing_counter != FREEZING_COUNTER_MAX) {
                table_freezing_counter_3.apply();
            }
        }
        else {
            // apply hash
            table_hash_coco.apply();
            meta.coco_index = meta.coco_index & (COCO_BUCKETS - 1);
            table_coco_counter.apply();

            meta.coco_rand_num = (bit<32>)rand.get();
            table_calc_cond.apply();
            meta.coco_cond = meta.coco_cond - meta.coco_rand_num;

            // replace or insert new
            if (meta.coco_cond < RAND_MAX || meta.coco_counter == 1) 
                meta.coco_id_control = COCO_ID_REPLACE;
            table_coco_id.apply();
            table_hash_freeze_tower_tcm_4.apply();
            table_hash_unfreeze_tower_tcm_4.apply();
            hdr.egress_data.freeze_tower_tcm_index_4 = hdr.egress_data.freeze_tower_tcm_index_4 >> ERROR_FUNNEL_OFFSET_BITS;
            hdr.egress_data.unfreeze_tower_tcm_index_4 = hdr.egress_data.unfreeze_tower_tcm_index_4 >> ERROR_FUNNEL_OFFSET_BITS;

            // replaced
            if (meta.coco_id_control == COCO_ID_REPLACE && hdr.egress_data.tower_tcm_id != hdr.my_protocol.id && meta.coco_counter != 1) {
                hdr.egress_data.error_funnel_control = ERROR_FUNNEL_FREEZE;
                table_recirculate_packet.apply();
            }
            // insert to tower tcm
            if (hdr.egress_data.tower_tcm_id != hdr.my_protocol.id && meta.coco_counter != 1) {
                hdr.egress_control.tower_tcm_control = TOWER_TCM_INSERT;
            }
            // replaced or inserted new
            if ((meta.coco_id_control == COCO_ID_REPLACE && hdr.egress_data.tower_tcm_id != hdr.my_protocol.id) || meta.coco_counter == 1) 
                meta.coco_pure_counter_control = COCO_PURE_COUNTER_RESET;
            // increase
            if (hdr.egress_data.tower_tcm_id == hdr.my_protocol.id)
                meta.coco_pure_counter_control = COCO_PURE_COUNTER_INC;
            table_coco_pure_counter.apply();

            if (hdr.egress_data.tower_tcm_id != hdr.my_protocol.id && meta.coco_counter != 1) {
                if (meta.coco_id_control == COCO_ID_REPLACE) 
                    hdr.egress_data.tower_tcm_inc = meta.coco_pure_counter;
                else 
                    hdr.egress_data.tower_tcm_id = hdr.my_protocol.id;
            }

            if (hdr.egress_control.tower_tcm_control == TOWER_TCM_INSERT) {
                if(hdr.egress_data.error_funnel_control == ERROR_FUNNEL_FREEZE) {
                    table_unfreezing_counter_1.apply();
                    table_unfreezing_counter_2.apply();
                    table_unfreezing_counter_3.apply();
                }
                else {
                    table_lookup_freezing_counter_1.apply();
                    table_lookup_freezing_counter_2.apply();
                    table_lookup_freezing_counter_3.apply();
                }
            }
        }
    }
}

control IngressDeparser(packet_out                   pkt,
    /* User */
    inout my_ingress_header_t                        hdr,
    in    my_ingress_metadata_t                      meta,
    /* Intrinsic */
    in    ingress_intrinsic_metadata_for_deparser_t  ig_dprsr_md)
{
    apply {
        pkt.emit(hdr);   
    }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*----------------------------------------------------------------------------------- EGRESS -----------------------------------------------------------------------------------*/
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

struct my_egress_headers_t {
    egress_control_h egress_control;
    egress_data_h egress_data;
}

struct my_egress_metadata_t {
    bit<32> tower_tcm_index_1;
    bit<32> tower_tcm_index_2;
    bit<32> tower_tcm_index_3;
    bit<32> tower_tcm_index_4;

    bit<TOWER_TCM_BUCKET_BITS_1> tower_tcm_inc_1;
    bit<TOWER_TCM_BUCKET_BITS_2> tower_tcm_inc_2;
    bit<TOWER_TCM_BUCKET_BITS_3> tower_tcm_inc_3;
    bit<TOWER_TCM_BUCKET_BITS_4> tower_tcm_inc_4;
}

parser EgressParser(packet_in        pkt,
    /* User */
    out my_egress_headers_t          hdr,
    out my_egress_metadata_t         meta,
    /* Intrinsic */
    out egress_intrinsic_metadata_t  eg_intr_md)
{
    /* This is a mandatory state, required by Tofino Architecture */
    state start {
        pkt.extract(eg_intr_md);
        transition meta_init;
    }

    state meta_init {
        meta.tower_tcm_index_1 = 0;
        meta.tower_tcm_index_2 = 0;
        meta.tower_tcm_index_3 = 0;
        meta.tower_tcm_index_4 = 0;
        
        meta.tower_tcm_inc_1 = 0;
        meta.tower_tcm_inc_2 = 0;
        meta.tower_tcm_inc_3 = 0;
        meta.tower_tcm_inc_4 = 0;

        transition parse_egress_control;
    }

    state parse_egress_control {
        pkt.extract(hdr.egress_control);
        transition select(hdr.egress_control.tower_tcm_control) {
            TOWER_TCM_INSERT: parse_egress_data;
            default: accept;
        }
    }
    
    state parse_egress_data {
        pkt.extract(hdr.egress_data);
        transition accept;
    }
}

control Egress(
    /* User */
    inout my_egress_headers_t                          hdr,
    inout my_egress_metadata_t                         meta,
    /* Intrinsic */    
    in    egress_intrinsic_metadata_t                  eg_intr_md,
    in    egress_intrinsic_metadata_from_parser_t      eg_prsr_md,
    inout egress_intrinsic_metadata_for_deparser_t     eg_dprsr_md,
    inout egress_intrinsic_metadata_for_output_port_t  eg_oport_md)
{

    /////////////////////////////////// ERROR FUNNEL ///////////////////////////////////

    /*-------------------------------- FREEZING COUNTER 4 --------------------------------*/

    Register<freezing_bucket_t, bit<32>>(TOWER_TCM_BUCKETS_4 >> ERROR_FUNNEL_OFFSET_BITS + 3) register_freezing_counter_4;
    RegisterAction<freezing_bucket_t, bit<32>, bit<FREEZING_COUNTER_BITS>>(register_freezing_counter_4) freezing_counter_4_freeze_action = {
        void apply(inout freezing_bucket_t reg_data, out bit<FREEZING_COUNTER_BITS> counter) {
            counter = 0;
            if (reg_data.freezing_counter == FREEZING_COUNTER_MAX) { // empty counter
                counter = reg_data.freezing_counter;
                reg_data.tower_tcm_index_4 = (bit<16>)hdr.egress_data.freeze_tower_tcm_index_4;
                reg_data.freezing_counter = 0;
            }
        }
    };
    
    action apply_freezing_counter_4() {
        hdr.egress_data.freezing_counter = freezing_counter_4_freeze_action.execute(hdr.egress_data.freeze_tower_tcm_index_4);
        hdr.egress_data.freeze_tower_tcm_index_4 = hdr.egress_data.freeze_tower_tcm_index_4 >> 1;
    }

    RegisterAction<freezing_bucket_t, bit<32>, bit<FREEZING_COUNTER_BITS>>(register_freezing_counter_4) freezing_counter_4_unfreeze_action = {
        void apply(inout freezing_bucket_t reg_data, out bit<FREEZING_COUNTER_BITS> counter) {
            counter = 0;
            if (reg_data.tower_tcm_index_4 != FREEZING_COUNTER_MAX 
                && reg_data.tower_tcm_index_4 == (bit<16>)hdr.egress_data.unfreeze_tower_tcm_index_4) {
                counter = reg_data.freezing_counter;
                reg_data.freezing_counter = FREEZING_COUNTER_MAX;
            }
        }
    };

    action apply_unfreezing_counter_4() {
        hdr.egress_data.freezing_counter = hdr.egress_data.freezing_counter + freezing_counter_4_unfreeze_action.execute(hdr.egress_data.unfreeze_tower_tcm_index_4);
        hdr.egress_data.unfreeze_tower_tcm_index_4 = hdr.egress_data.unfreeze_tower_tcm_index_4 >> 1;
    }

    RegisterAction<freezing_bucket_t, bit<32>, bit<FREEZING_COUNTER_BITS>>(register_freezing_counter_4) freezing_counter_4_lookup_action = {
        void apply(inout freezing_bucket_t reg_data, out bit<FREEZING_COUNTER_BITS> counter) {
            counter = 0;
            if (reg_data.tower_tcm_index_4 != FREEZING_COUNTER_MAX 
                && reg_data.tower_tcm_index_4 == (bit<16>)hdr.egress_data.freeze_tower_tcm_index_4) {
                counter = 1;
                reg_data.freezing_counter = reg_data.freezing_counter + 1;
            }
        }
    };

    action apply_lookup_freezing_counter_4() {
        hdr.egress_data.freezing_counter = freezing_counter_4_lookup_action.execute(hdr.egress_data.freeze_tower_tcm_index_4);
        hdr.egress_data.freeze_tower_tcm_index_4 = hdr.egress_data.freeze_tower_tcm_index_4 >> 1;
    }

    @stage(1)
    table table_freezing_counter_4{
        actions = {
            apply_freezing_counter_4;
        }
        size = 1;
        const default_action = apply_freezing_counter_4;
    }

    @stage(1)
    table table_unfreezing_counter_4{
        actions = {
            apply_unfreezing_counter_4;
        }
        size = 1;
        const default_action = apply_unfreezing_counter_4;
    }

    @stage(1)
    table table_lookup_freezing_counter_4{
        actions = {
            apply_lookup_freezing_counter_4;
        }
        size = 1;
        const default_action = apply_lookup_freezing_counter_4;
    }

    /*-------------------------------- FREEZING COUNTER 5 --------------------------------*/

    Register<freezing_bucket_t, bit<32>>(TOWER_TCM_BUCKETS_4 >> ERROR_FUNNEL_OFFSET_BITS + 3) register_freezing_counter_5;
    RegisterAction<freezing_bucket_t, bit<32>, bit<FREEZING_COUNTER_BITS>>(register_freezing_counter_5) freezing_counter_5_freeze_action = {
        void apply(inout freezing_bucket_t reg_data, out bit<FREEZING_COUNTER_BITS> counter) {
            counter = 0;
            if (reg_data.freezing_counter == FREEZING_COUNTER_MAX) { // empty counter
                counter = reg_data.freezing_counter;
                reg_data.tower_tcm_index_4 = (bit<16>)hdr.egress_data.freeze_tower_tcm_index_4;
                reg_data.freezing_counter = 0;
            }
        }
    };
    
    action apply_freezing_counter_5() {
        hdr.egress_data.freezing_counter = freezing_counter_5_freeze_action.execute(hdr.egress_data.freeze_tower_tcm_index_4);
        hdr.egress_data.freeze_tower_tcm_index_4 = hdr.egress_data.freeze_tower_tcm_index_4 >> 1;
    }

    RegisterAction<freezing_bucket_t, bit<32>, bit<FREEZING_COUNTER_BITS>>(register_freezing_counter_5) freezing_counter_5_unfreeze_action = {
        void apply(inout freezing_bucket_t reg_data, out bit<FREEZING_COUNTER_BITS> counter) {
            counter = 0;
            if (reg_data.tower_tcm_index_4 != FREEZING_COUNTER_MAX 
                && reg_data.tower_tcm_index_4 == (bit<16>)hdr.egress_data.unfreeze_tower_tcm_index_4) {
                counter = reg_data.freezing_counter;
                reg_data.freezing_counter = FREEZING_COUNTER_MAX;
            }
        }
    };

    action apply_unfreezing_counter_5() {
        hdr.egress_data.freezing_counter = hdr.egress_data.freezing_counter + freezing_counter_5_unfreeze_action.execute(hdr.egress_data.unfreeze_tower_tcm_index_4);
        hdr.egress_data.unfreeze_tower_tcm_index_4 = hdr.egress_data.unfreeze_tower_tcm_index_4 >> 1;
    }

    RegisterAction<freezing_bucket_t, bit<32>, bit<FREEZING_COUNTER_BITS>>(register_freezing_counter_5) freezing_counter_5_lookup_action = {
        void apply(inout freezing_bucket_t reg_data, out bit<FREEZING_COUNTER_BITS> counter) {
            counter = 0;
            if (reg_data.tower_tcm_index_4 != FREEZING_COUNTER_MAX 
                && reg_data.tower_tcm_index_4 == (bit<16>)hdr.egress_data.freeze_tower_tcm_index_4) {
                counter = 1;
                reg_data.freezing_counter = reg_data.freezing_counter + 1;
            }
        }
    };

    action apply_lookup_freezing_counter_5() {
        hdr.egress_data.freezing_counter = freezing_counter_5_lookup_action.execute(hdr.egress_data.freeze_tower_tcm_index_4);
        hdr.egress_data.freeze_tower_tcm_index_4 = hdr.egress_data.freeze_tower_tcm_index_4 >> 1;
    }

    @stage(2)
    table table_freezing_counter_5{
        actions = {
            apply_freezing_counter_5;
        }
        size = 1;
        const default_action = apply_freezing_counter_5;
    }

    @stage(2)
    table table_unfreezing_counter_5{
        actions = {
            apply_unfreezing_counter_5;
        }
        size = 1;
        const default_action = apply_unfreezing_counter_5;
    }

    @stage(2)
    table table_lookup_freezing_counter_5{
        actions = {
            apply_lookup_freezing_counter_5;
        }
        size = 1;
        const default_action = apply_lookup_freezing_counter_5;
    }

    /*-------------------------------- FREEZING COUNTER 6 --------------------------------*/

    Register<freezing_bucket_t, bit<32>>(TOWER_TCM_BUCKETS_4 >> ERROR_FUNNEL_OFFSET_BITS + 3) register_freezing_counter_6;
    RegisterAction<freezing_bucket_t, bit<32>, bit<FREEZING_COUNTER_BITS>>(register_freezing_counter_6) freezing_counter_6_freeze_action = {
        void apply(inout freezing_bucket_t reg_data, out bit<FREEZING_COUNTER_BITS> counter) {
            counter = 0;
            if (reg_data.freezing_counter == FREEZING_COUNTER_MAX) { // empty counter
                counter = reg_data.freezing_counter;
                reg_data.tower_tcm_index_4 = (bit<16>)hdr.egress_data.freeze_tower_tcm_index_4;
                reg_data.freezing_counter = 0;
            }
        }
    };
    
    action apply_freezing_counter_6() {
        hdr.egress_data.freezing_counter = freezing_counter_6_freeze_action.execute(hdr.egress_data.freeze_tower_tcm_index_4);
        hdr.egress_data.freeze_tower_tcm_index_4 = hdr.egress_data.freeze_tower_tcm_index_4 >> 1;
    }

    RegisterAction<freezing_bucket_t, bit<32>, bit<FREEZING_COUNTER_BITS>>(register_freezing_counter_6) freezing_counter_6_unfreeze_action = {
        void apply(inout freezing_bucket_t reg_data, out bit<FREEZING_COUNTER_BITS> counter) {
            counter = 0;
            if (reg_data.tower_tcm_index_4 != FREEZING_COUNTER_MAX 
                && reg_data.tower_tcm_index_4 == (bit<16>)hdr.egress_data.unfreeze_tower_tcm_index_4) {
                counter = reg_data.freezing_counter;
                reg_data.freezing_counter = FREEZING_COUNTER_MAX;
            }
        }
    };

    action apply_unfreezing_counter_6() {
        hdr.egress_data.freezing_counter = hdr.egress_data.freezing_counter + freezing_counter_6_unfreeze_action.execute(hdr.egress_data.unfreeze_tower_tcm_index_4);
        hdr.egress_data.unfreeze_tower_tcm_index_4 = hdr.egress_data.unfreeze_tower_tcm_index_4 >> 1;
    }

    RegisterAction<freezing_bucket_t, bit<32>, bit<FREEZING_COUNTER_BITS>>(register_freezing_counter_6) freezing_counter_6_lookup_action = {
        void apply(inout freezing_bucket_t reg_data, out bit<FREEZING_COUNTER_BITS> counter) {
            counter = 0;
            if (reg_data.tower_tcm_index_4 != FREEZING_COUNTER_MAX 
                && reg_data.tower_tcm_index_4 == (bit<16>)hdr.egress_data.freeze_tower_tcm_index_4) {
                counter = 1;
                reg_data.freezing_counter = reg_data.freezing_counter + 1;
            }
        }
    };

    action apply_lookup_freezing_counter_6() {
        hdr.egress_data.freezing_counter = freezing_counter_6_lookup_action.execute(hdr.egress_data.freeze_tower_tcm_index_4);
        hdr.egress_data.freeze_tower_tcm_index_4 = hdr.egress_data.freeze_tower_tcm_index_4 >> 1;
    }

    @stage(3)
    table table_freezing_counter_6{
        actions = {
            apply_freezing_counter_6;
        }
        size = 1;
        const default_action = apply_freezing_counter_6;
    }

    @stage(3)
    table table_unfreezing_counter_6{
        actions = {
            apply_unfreezing_counter_6;
        }
        size = 1;
        const default_action = apply_unfreezing_counter_6;
    }

    @stage(3)
    table table_lookup_freezing_counter_6{
        actions = {
            apply_lookup_freezing_counter_6;
        }
        size = 1;
        const default_action = apply_lookup_freezing_counter_6;
    }

    /*-------------------------------- FREEZING COUNTER 7 --------------------------------*/

    Register<freezing_bucket_t, bit<32>>(TOWER_TCM_BUCKETS_4 >> ERROR_FUNNEL_OFFSET_BITS + 3) register_freezing_counter_7;
    RegisterAction<freezing_bucket_t, bit<32>, bit<FREEZING_COUNTER_BITS>>(register_freezing_counter_7) freezing_counter_7_freeze_action = {
        void apply(inout freezing_bucket_t reg_data, out bit<FREEZING_COUNTER_BITS> counter) {
            counter = 0;
            if (reg_data.freezing_counter == FREEZING_COUNTER_MAX) { // empty counter
                counter = reg_data.freezing_counter;
                reg_data.tower_tcm_index_4 = (bit<16>)hdr.egress_data.freeze_tower_tcm_index_4;
                reg_data.freezing_counter = 0;
            }
        }
    };
    
    action apply_freezing_counter_7() {
        hdr.egress_data.freezing_counter = freezing_counter_7_freeze_action.execute(hdr.egress_data.freeze_tower_tcm_index_4);
        hdr.egress_data.freeze_tower_tcm_index_4 = hdr.egress_data.freeze_tower_tcm_index_4 >> 1;
    }

    RegisterAction<freezing_bucket_t, bit<32>, bit<FREEZING_COUNTER_BITS>>(register_freezing_counter_7) freezing_counter_7_unfreeze_action = {
        void apply(inout freezing_bucket_t reg_data, out bit<FREEZING_COUNTER_BITS> counter) {
            counter = 0;
            if (reg_data.tower_tcm_index_4 != FREEZING_COUNTER_MAX 
                && reg_data.tower_tcm_index_4 == (bit<16>)hdr.egress_data.unfreeze_tower_tcm_index_4) {
                counter = reg_data.freezing_counter;
                reg_data.freezing_counter = FREEZING_COUNTER_MAX;
            }
        }
    };

    action apply_unfreezing_counter_7() {
        hdr.egress_data.freezing_counter = hdr.egress_data.freezing_counter + freezing_counter_7_unfreeze_action.execute(hdr.egress_data.unfreeze_tower_tcm_index_4);
        hdr.egress_data.unfreeze_tower_tcm_index_4 = hdr.egress_data.unfreeze_tower_tcm_index_4 >> 1;
    }

    RegisterAction<freezing_bucket_t, bit<32>, bit<FREEZING_COUNTER_BITS>>(register_freezing_counter_7) freezing_counter_7_lookup_action = {
        void apply(inout freezing_bucket_t reg_data, out bit<FREEZING_COUNTER_BITS> counter) {
            counter = 0;
            if (reg_data.tower_tcm_index_4 != FREEZING_COUNTER_MAX 
                && reg_data.tower_tcm_index_4 == (bit<16>)hdr.egress_data.freeze_tower_tcm_index_4) {
                counter = 1;
                reg_data.freezing_counter = reg_data.freezing_counter + 1;
            }
        }
    };

    action apply_lookup_freezing_counter_7() {
        hdr.egress_data.freezing_counter = freezing_counter_7_lookup_action.execute(hdr.egress_data.freeze_tower_tcm_index_4);
        hdr.egress_data.freeze_tower_tcm_index_4 = hdr.egress_data.freeze_tower_tcm_index_4 >> 1;
    }

    @stage(4)
    table table_freezing_counter_7{
        actions = {
            apply_freezing_counter_7;
        }
        size = 1;
        const default_action = apply_freezing_counter_7;
    }

    @stage(4)
    table table_unfreezing_counter_7{
        actions = {
            apply_unfreezing_counter_7;
        }
        size = 1;
        const default_action = apply_unfreezing_counter_7;
    }

    @stage(4)
    table table_lookup_freezing_counter_7{
        actions = {
            apply_lookup_freezing_counter_7;
        }
        size = 1;
        const default_action = apply_lookup_freezing_counter_7;
    }

    /*-------------------------------- FREEZING COUNTER 8 --------------------------------*/

    Register<freezing_bucket_t, bit<32>>(TOWER_TCM_BUCKETS_4 >> ERROR_FUNNEL_OFFSET_BITS + 3) register_freezing_counter_8;
    RegisterAction<freezing_bucket_t, bit<32>, bit<FREEZING_COUNTER_BITS>>(register_freezing_counter_8) freezing_counter_8_freeze_action = {
        void apply(inout freezing_bucket_t reg_data, out bit<FREEZING_COUNTER_BITS> counter) {
            counter = 0;
            if (reg_data.freezing_counter == FREEZING_COUNTER_MAX) { // empty counter
                counter = reg_data.freezing_counter;
                reg_data.tower_tcm_index_4 = (bit<16>)hdr.egress_data.freeze_tower_tcm_index_4;
                reg_data.freezing_counter = 0;
            }
        }
    };
    
    action apply_freezing_counter_8() {
        hdr.egress_data.freezing_counter = freezing_counter_8_freeze_action.execute(hdr.egress_data.freeze_tower_tcm_index_4);
        hdr.egress_data.freeze_tower_tcm_index_4 = hdr.egress_data.freeze_tower_tcm_index_4 >> 1;
    }

    RegisterAction<freezing_bucket_t, bit<32>, bit<FREEZING_COUNTER_BITS>>(register_freezing_counter_8) freezing_counter_8_unfreeze_action = {
        void apply(inout freezing_bucket_t reg_data, out bit<FREEZING_COUNTER_BITS> counter) {
            counter = 0;
            if (reg_data.tower_tcm_index_4 != FREEZING_COUNTER_MAX 
                && reg_data.tower_tcm_index_4 == (bit<16>)hdr.egress_data.unfreeze_tower_tcm_index_4) {
                counter = reg_data.freezing_counter;
                reg_data.freezing_counter = FREEZING_COUNTER_MAX;
            }
        }
    };

    action apply_unfreezing_counter_8() {
        hdr.egress_data.freezing_counter = hdr.egress_data.freezing_counter + freezing_counter_8_unfreeze_action.execute(hdr.egress_data.unfreeze_tower_tcm_index_4);
        hdr.egress_data.unfreeze_tower_tcm_index_4 = hdr.egress_data.unfreeze_tower_tcm_index_4 >> 1;
    }

    RegisterAction<freezing_bucket_t, bit<32>, bit<FREEZING_COUNTER_BITS>>(register_freezing_counter_8) freezing_counter_8_lookup_action = {
        void apply(inout freezing_bucket_t reg_data, out bit<FREEZING_COUNTER_BITS> counter) {
            counter = 0;
            if (reg_data.tower_tcm_index_4 != FREEZING_COUNTER_MAX 
                && reg_data.tower_tcm_index_4 == (bit<16>)hdr.egress_data.freeze_tower_tcm_index_4) {
                counter = 1;
                reg_data.freezing_counter = reg_data.freezing_counter + 1;
            }
        }
    };

    action apply_lookup_freezing_counter_8() {
        hdr.egress_data.freezing_counter = freezing_counter_8_lookup_action.execute(hdr.egress_data.freeze_tower_tcm_index_4);
        hdr.egress_data.freeze_tower_tcm_index_4 = hdr.egress_data.freeze_tower_tcm_index_4 >> 1;
    }

    @stage(5)
    table table_freezing_counter_8{
        actions = {
            apply_freezing_counter_8;
        }
        size = 1;
        const default_action = apply_freezing_counter_8;
    }

    @stage(5)
    table table_unfreezing_counter_8{
        actions = {
            apply_unfreezing_counter_8;
        }
        size = 1;
        const default_action = apply_unfreezing_counter_8;
    }

    @stage(5)
    table table_lookup_freezing_counter_8{
        actions = {
            apply_lookup_freezing_counter_8;
        }
        size = 1;
        const default_action = apply_lookup_freezing_counter_8;
    }

    /////////////////////////////////// TOWER TCM ///////////////////////////////////

    CRCPolynomial<bit<32>>(0x04C11DB7,false,false,false,32w0xFFFFFFFF,32w0xFFFFFFFF) crc32a;
    CRCPolynomial<bit<32>>(0x741B8CD7,false,false,false,32w0xFFFFFFFF,32w0xFFFFFFFF) crc32b;
    CRCPolynomial<bit<32>>(0xDB710641,false,false,false,32w0xFFFFFFFF,32w0xFFFFFFFF) crc32c;

    Hash<bit<TOWER_TCM_INDEX_BITS_1>>(HashAlgorithm_t.CRC32) hash_tower_tcm_1;
    Hash<bit<TOWER_TCM_INDEX_BITS_2>>(HashAlgorithm_t.CUSTOM, crc32a) hash_tower_tcm_2;
    Hash<bit<TOWER_TCM_INDEX_BITS_3>>(HashAlgorithm_t.CUSTOM, crc32b) hash_tower_tcm_3;
    Hash<bit<TOWER_TCM_INDEX_BITS_4>>(HashAlgorithm_t.CUSTOM, crc32c) hash_tower_tcm_4;

    action apply_hash_tower_tcm_1() {
        meta.tower_tcm_index_1 = (bit<32>)hash_tower_tcm_1.get(hdr.egress_data.tower_tcm_id);
    }

    @stage(0)
    table table_hash_tower_tcm_1 {
        actions = {
            apply_hash_tower_tcm_1;
        }
        size = 1;
        const default_action = apply_hash_tower_tcm_1;
    }

    action apply_hash_tower_tcm_2() {
        meta.tower_tcm_index_2 = (bit<32>)hash_tower_tcm_2.get(hdr.egress_data.tower_tcm_id);
    }

    @stage(8)
    table table_hash_tower_tcm_2 {
        actions = {
            apply_hash_tower_tcm_2;
        }
        size = 1;
        const default_action = apply_hash_tower_tcm_2;
    }
    
    action apply_hash_tower_tcm_3() {
        meta.tower_tcm_index_3 = (bit<32>)hash_tower_tcm_3.get(hdr.egress_data.tower_tcm_id);
    } 

    @stage(7)
    table table_hash_tower_tcm_3 {
        actions = {
            apply_hash_tower_tcm_3;
        }
        size = 1;
        const default_action = apply_hash_tower_tcm_3;
    }

    action apply_hash_tower_tcm_4() {
        meta.tower_tcm_index_4 = (bit<32>)hash_tower_tcm_4.get(hdr.egress_data.tower_tcm_id);
    }

    @stage(0)
    table table_hash_tower_tcm_4 {
        actions = {
            apply_hash_tower_tcm_4;
        }
        size = 1;
        const default_action = apply_hash_tower_tcm_4;
    }

    /*-------------------------------- TOWER TCM 1 --------------------------------*/

    Register<bit<TOWER_TCM_BUCKET_BITS_1>, bit<32>>(TOWER_TCM_BUCKETS_1) register_tower_tcm_1;
    RegisterAction<bit<TOWER_TCM_BUCKET_BITS_1>, bit<32>, bit<TOWER_TCM_BUCKET_BITS_1>>(register_tower_tcm_1) tower_tcm_1_action = {
        void apply(inout bit<TOWER_TCM_BUCKET_BITS_1> reg_data) {
            reg_data = reg_data |+| meta.tower_tcm_inc_1;
        }
    };

    action apply_tower_tcm_1() {
        tower_tcm_1_action.execute(meta.tower_tcm_index_1);
    }
    
    @stage(8)
    table table_tower_tcm_1 {
        actions = {
            apply_tower_tcm_1;
        }
        size = 1;
        const default_action = apply_tower_tcm_1;
    }

    /*-------------------------------- TOWER TCM 2 --------------------------------*/

    Register<bit<TOWER_TCM_BUCKET_BITS_2>, bit<32>>(TOWER_TCM_BUCKETS_2) register_tower_tcm_2;
    RegisterAction<bit<TOWER_TCM_BUCKET_BITS_2>, bit<32>, bit<TOWER_TCM_BUCKET_BITS_2>>(register_tower_tcm_2) tower_tcm_2_action = {
        void apply(inout bit<TOWER_TCM_BUCKET_BITS_2> reg_data) {
            reg_data = reg_data |+| meta.tower_tcm_inc_2;
        }
    };

    action apply_tower_tcm_2() {
        tower_tcm_2_action.execute(meta.tower_tcm_index_2);
    }
    
    @stage(9)
    table table_tower_tcm_2 {
        actions = {
            apply_tower_tcm_2;
        }
        size = 1;
        const default_action = apply_tower_tcm_2;
    }
    
    /*-------------------------------- TOWER TCM 3 --------------------------------*/

    Register<bit<TOWER_TCM_BUCKET_BITS_3>, bit<32>>(TOWER_TCM_BUCKETS_3) register_tower_tcm_3;
    RegisterAction<bit<TOWER_TCM_BUCKET_BITS_3>, bit<32>, bit<TOWER_TCM_BUCKET_BITS_3>>(register_tower_tcm_3) tower_tcm_3_action = {
        void apply(inout bit<TOWER_TCM_BUCKET_BITS_3> reg_data) {
            reg_data = reg_data |+| meta.tower_tcm_inc_3;
        }
    };

    action apply_tower_tcm_3() {
        tower_tcm_3_action.execute(meta.tower_tcm_index_3);
    }
    
    @stage(8)
    table table_tower_tcm_3 {
        actions = {
            apply_tower_tcm_3;
        }
        size = 1;
        const default_action = apply_tower_tcm_3;
    }

    /*-------------------------------- TOWER TCM 4 --------------------------------*/

    Register<bit<TOWER_TCM_BUCKET_BITS_4>, bit<32>>(TOWER_TCM_BUCKETS_4) register_tower_tcm_4;
    RegisterAction<bit<TOWER_TCM_BUCKET_BITS_4>, bit<32>, bit<TOWER_TCM_BUCKET_BITS_4>>(register_tower_tcm_4) tower_tcm_4_action = {
        void apply(inout bit<TOWER_TCM_BUCKET_BITS_4> reg_data) {
            reg_data = reg_data |+| meta.tower_tcm_inc_4;
        }
    };

    action apply_tower_tcm_4() {
        tower_tcm_4_action.execute(meta.tower_tcm_index_4);
    }
    
    @stage(7)
    table table_tower_tcm_4_freeze {
        actions = {
            apply_tower_tcm_4;
        }
        size = 1;
        const default_action = apply_tower_tcm_4;
    } 

    @stage(7)
    table table_tower_tcm_4_lookup {
        actions = {
            apply_tower_tcm_4;
        }
        size = 1;
        const default_action = apply_tower_tcm_4;
    } 

    /////////////////////////////////// APPLY ///////////////////////////////////

    apply { 
        table_hash_tower_tcm_1.apply();
        table_hash_tower_tcm_2.apply();
        table_hash_tower_tcm_3.apply();
        table_hash_tower_tcm_4.apply();

        meta.tower_tcm_inc_1 = (bit<TOWER_TCM_BUCKET_BITS_1>) hdr.egress_data.tower_tcm_inc;
        if (hdr.egress_data.tower_tcm_inc > TOWER_TCM_MAX_1)
            meta.tower_tcm_inc_1 = TOWER_TCM_MAX_1;

        meta.tower_tcm_inc_2 = (bit<TOWER_TCM_BUCKET_BITS_2>) hdr.egress_data.tower_tcm_inc;
        if (hdr.egress_data.tower_tcm_inc > TOWER_TCM_MAX_2)
            meta.tower_tcm_inc_2 = TOWER_TCM_MAX_2;

        meta.tower_tcm_inc_3 = (bit<TOWER_TCM_BUCKET_BITS_3>) hdr.egress_data.tower_tcm_inc;
        if (hdr.egress_data.tower_tcm_inc > TOWER_TCM_MAX_3)
            meta.tower_tcm_inc_3 = TOWER_TCM_MAX_3;
        
        meta.tower_tcm_inc_4 = (bit<TOWER_TCM_BUCKET_BITS_4>) hdr.egress_data.tower_tcm_inc;
        if (hdr.egress_data.tower_tcm_inc > TOWER_TCM_MAX_4)
            meta.tower_tcm_inc_4 = TOWER_TCM_MAX_4;

        if (hdr.egress_control.tower_tcm_control == TOWER_TCM_INSERT) {
            table_tower_tcm_1.apply();
            table_tower_tcm_2.apply();
            table_tower_tcm_3.apply();
        }

        if (hdr.egress_data.is_recirculated == 1) { // recirculated
            if (hdr.egress_data.freezing_counter != FREEZING_COUNTER_MAX) {
                table_freezing_counter_4.apply();
            }
            if (hdr.egress_data.freezing_counter != FREEZING_COUNTER_MAX) {
                table_freezing_counter_5.apply();
            }
            if (hdr.egress_data.freezing_counter != FREEZING_COUNTER_MAX) {
                table_freezing_counter_6.apply();
            }
            if (hdr.egress_data.freezing_counter != FREEZING_COUNTER_MAX) {
                table_freezing_counter_7.apply();
            }
            if (hdr.egress_data.freezing_counter != FREEZING_COUNTER_MAX) {
                table_freezing_counter_8.apply();
            }

            hdr.egress_control.setInvalid();
            hdr.egress_data.setInvalid();
        }
        else { // not recirculated
            if (hdr.egress_control.tower_tcm_control == TOWER_TCM_INSERT) {

                if (hdr.egress_data.error_funnel_control == ERROR_FUNNEL_FREEZE) {
                    table_unfreezing_counter_4.apply();
                    table_unfreezing_counter_5.apply();
                    table_unfreezing_counter_6.apply();
                    table_unfreezing_counter_7.apply();
                    table_unfreezing_counter_8.apply();

                    meta.tower_tcm_inc_4 = max(hdr.egress_data.freezing_counter, meta.tower_tcm_inc_4);
                    table_tower_tcm_4_freeze.apply();
                }
                else {
                    table_lookup_freezing_counter_4.apply();
                    table_lookup_freezing_counter_5.apply();
                    table_lookup_freezing_counter_6.apply();
                    table_lookup_freezing_counter_7.apply();
                    table_lookup_freezing_counter_8.apply();

                    if (hdr.egress_data.freezing_counter == 1) 
                        meta.tower_tcm_inc_4 = 0;
                    table_tower_tcm_4_lookup.apply();

                    hdr.egress_control.setInvalid();
                    hdr.egress_data.setInvalid();
                }
            }
        }
    }
}

control EgressDeparser(packet_out pkt,
    /* User */
    inout my_egress_headers_t                       hdr,
    in    my_egress_metadata_t                      meta,
    /* Intrinsic */
    in    egress_intrinsic_metadata_for_deparser_t  eg_dprsr_md)
{
    apply {
        pkt.emit(hdr);
    }
}

Pipeline(
    IngressParser(),
    Ingress(),
    IngressDeparser(),
    EgressParser(),
    Egress(),
    EgressDeparser()
) pipe;

Switch(pipe) main;

#endif