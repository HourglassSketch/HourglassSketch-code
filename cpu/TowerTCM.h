#ifndef _TOWER_H_
#define _TOWER_H_

#include <bits/stdc++.h>
#include "hash.h"
#include "graph.h"


template<typename ID_TYPE, typename DATA_TYPE>
class TowerTCM_Level {
public:
    TowerTCM_Level() {}
    TowerTCM_Level(double memory, uint32_t bit) {
        bit_n = bit;
        max_value = (1 << bit) - 1;
        d = sqrt(memory * 1024 / sizeof(unsigned int));
        counter = new unsigned int [d * d];
        d = sqrt(d * d * 32 / bit_n);
        memset(counter, 0, sizeof(counter));
    }
    ~TowerTCM_Level() {
        delete[] counter;
    }
    
    uint32_t query(uint32_t index){
        uint32_t index1 = index * bit_n / 32;
        uint32_t index2 = (index * bit_n % 32) / bit_n;
        return (counter[index1] >> (index2 * bit_n)) & max_value;
    }

    uint32_t query_edge(ID_TYPE src, ID_TYPE dst) {
        uint32_t src_index = hash(src, bit_n) % d, dst_index = hash(dst, bit_n) % d;
        uint32_t index = src_index * d + dst_index;
        return query(index);
    }

    void modify(uint32_t index, uint32_t val){
        uint32_t index1 = index * bit_n / 32;
        uint32_t index2 = (index * bit_n % 32) / bit_n;
        uint32_t p = index2 * bit_n, v = max_value << p;
        counter[index1] = ((counter[index1] | v) ^ v) | (val << p);
    }

    void modify(ID_TYPE src, ID_TYPE dst, uint32_t val) {
        uint32_t src_index = hash(src, bit_n) % d, dst_index = hash(dst, bit_n) % d;
        uint32_t index = src_index * d + dst_index;
        return modify(index, val);
    }

    uint32_t query_vertex_start(ID_TYPE src) {
        uint32_t src_index = hash(src, bit_n) % d, ans = 0;
        for (int i = src_index * d; i < src_index * d + d; ++i) {
            uint32_t v = query(i);
            if (v < max_value)
                ans += query(i);
            else ans = 1e9;
        }
        return ans;
    }
    
private:
    uint32_t d;
    uint32_t bit_n;
    uint32_t max_value;
    unsigned int* counter;
};

template<typename ID_TYPE, typename DATA_TYPE>
class TowerTCM {
public:

    TowerTCM() {}
    TowerTCM(uint32_t memory) {
        //memory = memory * 64.0 / 79;
        for (int i = 0; i < level_n; ++i) {
            tcm[i] = new TowerTCM_Level<ID_TYPE, DATA_TYPE>(memory * 1.0 / level_n, level_bit[i]);
            max_value[i] = (1 << level_bit[i]) - 1;
        }
    }
    ~TowerTCM() {}
    void insertmax(ID_TYPE src, ID_TYPE dst, uint32_t weight) {
        for (int i = 0; i < level_n; ++i) {
            uint32_t val = tcm[i] -> query_edge(src, dst);
            val = std::min(std::max(val, weight), max_value[i]);
            tcm[i] -> modify(src, dst, val);
        }
    }
    void insert_cm(ID_TYPE src, ID_TYPE dst, uint32_t weight) {
        for (int i = 0; i < level_n; ++i) {
            uint32_t val = tcm[i] -> query_edge(src, dst);
            val = std::min(val + weight, max_value[i]);
            tcm[i] -> modify(src, dst, val);
        }
    }
    void insert(ID_TYPE src, ID_TYPE dst, uint32_t weight) {
        uint32_t v = 1e9;
        for (int i = 0; i < level_n; ++i) {
            uint32_t val = tcm[i] -> query_edge(src, dst);
            if (val != max_value[i])
                v = std::min(v, val);
        }
        for (int i = 0; i < level_n; ++i) {
            uint32_t val = tcm[i] -> query_edge(src, dst);
            if (val < v + weight && val != max_value[i]) {
                //std::cout << i;
                val = std::min(v + weight, max_value[i]);
                tcm[i] -> modify(src, dst, val);
            }
        }
    }
    DATA_TYPE query_edge(ID_TYPE src, ID_TYPE dst) {
        int min_v = 1e9;
        for (int i = 0; i < level_n; ++i) {
            uint32_t val = tcm[i] -> query_edge(src, dst);
            if (val != max_value[i] && min_v > val)
                min_v = val;
        }
        if (min_v > 1e7) min_v = 65536;
        return min_v;
    }
    uint32_t query_vertex_start(ID_TYPE src) {
        int min_v = 1e9;
        for (int i = 0; i < level_n; ++i) {
            uint32_t val = tcm[i] -> query_vertex_start(src);
            if (min_v > val)
                min_v = val;
        }
        return min_v;
    }
private:
    TowerTCM_Level<ID_TYPE, DATA_TYPE>* tcm[4];
    uint32_t level_n = 4;
    uint32_t level_bit[4] = {2, 4, 8, 16};
    uint32_t max_value[4];
    // std::priority_queue<Edge<ID_TYPE, DATA_TYPE>> edge_heap;
    // std::priority_queue<Vertex<ID_TYPE, DATA_TYPE>> vertex_start_heap;
    // std::priority_queue<Vertex<ID_TYPE, DATA_TYPE>> vertex_end_heap;
};



template<typename ID_TYPE, typename DATA_TYPE>
class TowerTCM_Level_v1 {
public:
    TowerTCM_Level_v1() {}
    TowerTCM_Level_v1(double memory, uint32_t bit) {
        bit_n = bit;
        max_value = (1 << bit) - 1;
        d = sqrt(memory * 1024 / sizeof(unsigned int));
        counter = new unsigned int [d * d];
        bitmap = new unsigned int [(d * d * 32 / bit_n + 31) / 32];
        d = sqrt(d * d * 32 / bit_n);
        memset(counter, 0, sizeof(counter));
        memset(bitmap, 0, sizeof(bitmap));
    }
    ~TowerTCM_Level_v1() {
        delete[] counter;
        delete[] bitmap;
    }
    
    uint32_t query(uint32_t index){
        uint32_t index1 = index * bit_n / 32;
        uint32_t index2 = (index * bit_n % 32) / bit_n;
        return (counter[index1] >> (index2 * bit_n)) & max_value;
    }

    uint32_t query_edge(ID_TYPE src, ID_TYPE dst) {
        uint32_t src_index = hash(src, bit_n) % d, dst_index = hash(dst, bit_n) % d;
        uint32_t index = src_index * d + dst_index;
        return query(index);
    }

    void modify(uint32_t index, uint32_t val){
        uint32_t index1 = index * bit_n / 32;
        uint32_t index2 = (index * bit_n % 32) / bit_n;
        uint32_t p = index2 * bit_n, v = max_value << p;
        counter[index1] = ((counter[index1] | v) ^ v) | (val << p);
    }

    void modify(ID_TYPE src, ID_TYPE dst, uint32_t val) {
        uint32_t src_index = hash(src, bit_n) % d, dst_index = hash(dst, bit_n) % d;
        uint32_t index = src_index * d + dst_index;
        if (bitmap[index >> 5] & (1 << (index & 31))){
            //puts("***");
            return;
        }
        return modify(index, val);
    }

    void freeze(ID_TYPE src, ID_TYPE dst) {
        uint32_t src_index = hash(src, bit_n) % d, dst_index = hash(dst, bit_n) % d;
        uint32_t index = src_index * d + dst_index;
        bitmap[index >> 5] |= (1 << (index & 31));
    }

    void unfreeze(ID_TYPE src, ID_TYPE dst) {
        uint32_t src_index = hash(src, bit_n) % d, dst_index = hash(dst, bit_n) % d;
        uint32_t index = src_index * d + dst_index;
        bitmap[index >> 5] |= (1 << (index & 31));
        bitmap[index >> 5] ^= (1 << (index & 31));
    }
    
private:
    uint32_t d;
    uint32_t bit_n;
    uint32_t max_value;
    unsigned int* counter;
    unsigned int* bitmap;
};

template<typename ID_TYPE, typename DATA_TYPE>
class TowerTCM_v1 {
public:

    TowerTCM_v1() {}
    TowerTCM_v1(uint32_t memory) {
        int sum_bit = 0, sum_fbit = 0;
        for (int i = 0; i < level_n; ++i) {
            sum_bit += 16;
            sum_fbit += 16 + 16 / level_bit[i];
        }
        memory = memory * 1.0 * sum_bit / sum_fbit;
        for (int i = 0; i < level_n; ++i) {
            tcm[i] = new TowerTCM_Level_v1<ID_TYPE, DATA_TYPE>(memory * 1.0 / level_n, level_bit[i]);
            max_value[i] = (1 << level_bit[i]) - 1;
        }
    }
    ~TowerTCM_v1() {}
    void insertmax(ID_TYPE src, ID_TYPE dst, uint32_t weight) {
        for (int i = 0; i < level_n; ++i) {
            uint32_t val = tcm[i] -> query_edge(src, dst);
            val = std::min(std::max(val, weight), max_value[i]);
            tcm[i] -> modify(src, dst, val);
        }
    }
    void insert_cm(ID_TYPE src, ID_TYPE dst, uint32_t weight) {
        for (int i = 0; i < level_n; ++i) {
            uint32_t val = tcm[i] -> query_edge(src, dst);
            val = std::min(val + weight, max_value[i]);
            tcm[i] -> modify(src, dst, val);
        }
    }
    void insert(ID_TYPE src, ID_TYPE dst, uint32_t weight, bool unfreeze=false) {
        uint32_t v = 1e9;
        for (int i = 0; i < level_n; ++i) {
            uint32_t val = tcm[i] -> query_edge(src, dst);
            if (val != max_value[i])
                v = std::min(v, val);
            if (unfreeze)
                tcm[i]->unfreeze(src, dst);
        }
        for (int i = 0; i < level_n; ++i) {
            uint32_t val = tcm[i] -> query_edge(src, dst);
            if (val < v + weight && val != max_value[i]) {
                //std::cout << i;
                val = std::min(v + weight, max_value[i]);
                tcm[i] -> modify(src, dst, val);
            }
        }
    }
    void freeze(ID_TYPE src, ID_TYPE dst) {
        for (int i = 0; i < 4; ++i) 
            tcm[i] -> freeze(src, dst);
    }
    void unfreeze(ID_TYPE src, ID_TYPE dst) {
        for (int i = 0; i < level_n; ++i) 
            tcm[i] -> unfreeze(src, dst);
    }
    DATA_TYPE query_edge(ID_TYPE src, ID_TYPE dst) {
        int min_v = 1e9;
        for (int i = 0; i < level_n; ++i) {
            uint32_t val = tcm[i] -> query_edge(src, dst);
            if (val != max_value[i] && min_v > val)
                min_v = val;
        }
        return min_v;
    }
private:
    TowerTCM_Level_v1<ID_TYPE, DATA_TYPE>* tcm[4];
    uint32_t level_n = 4;
    uint32_t level_bit[4] = {2, 4, 8, 32};
    uint32_t max_value[4];
    // std::priority_queue<Edge<ID_TYPE, DATA_TYPE>> edge_heap;
    // std::priority_queue<Vertex<ID_TYPE, DATA_TYPE>> vertex_start_heap;
    // std::priority_queue<Vertex<ID_TYPE, DATA_TYPE>> vertex_end_heap;
};


template<typename ID_TYPE, typename DATA_TYPE>
class TowerTCM_Level_v2 {
public:
    TowerTCM_Level_v2() {}
    TowerTCM_Level_v2(double memory, uint32_t bit, bool freeze):should_freeze(freeze) {
        bit_n = bit;
        max_value = (1u << bit) - 1;
        d = sqrt(memory * 1024 / sizeof(unsigned int));
        counter = new unsigned int [d * d];
        //puts("*************1");
        if (should_freeze) {
            max_value2 = (1u << bit) - 1;
            max_offset[0] = 512 / bit_n;
            Offset[0] = 0;
            for (int count = d * d * 32 / bit_n / max_offset[0] + 1, i = 1; count; count = (count+1 >> 1), ++i) {
                max_offset[i] = max_offset[i-1] * 2;
                Offset[i] = Offset[i-1] + count;
                //printf("Offset: %u, max_offset: %u, %u\n", Offset[i], max_offset[i], d * d * 32 / bit_n / max_offset[0] * 2 + 1);
                max_level = i;
                if (count == 1) break;
            }
            int cnt = d * d * 32 / bit_n / max_offset[0] * 2 + 10;
            bitmap = new unsigned int [cnt];
            collision_counter = new unsigned int [cnt];
            memset(bitmap, 0, cnt * sizeof(unsigned int));
            memset(collision_counter, 0, cnt * sizeof(unsigned int));
        }
        //puts("**************");
        d = sqrt(d * d * 32 / bit_n);
        memset(counter, 0, sizeof(counter));
    }
    ~TowerTCM_Level_v2() {
        delete[] counter;
        delete[] bitmap;
    }

    
    int freezed_counter_sum(uint32_t index) {
        if (!should_freeze) return 0;
        int ans = 0;
        for (int i = 0; i <= max_level; ++i) {
            if (bitmap[Offset[i] + index / max_offset[i]] == index % max_offset[i] + 1) {
                ans += collision_counter[Offset[i] + index / max_offset[i]];
            }
        }
        return ans;
    }

    int freezed_counter(uint32_t index) {
        if (!should_freeze) return -1;
        for (int i = 0; i <= max_level; ++i) {
            if (bitmap[Offset[i] + index / max_offset[i]] == index % max_offset[i] + 1) {
                return Offset[i] + index / max_offset[i];
            }
        }
        return -1;
    }


    uint32_t Query_i(uint32_t index){
        uint32_t index1 = index * bit_n / 32;
        uint32_t index2 = (index * bit_n % 32) / bit_n;
        DATA_TYPE ans = (counter[index1] >> (index2 * bit_n)) & max_value;
        return ans;
    }

    uint32_t Query(uint32_t index){
        uint32_t index1 = index * bit_n / 32;
        uint32_t index2 = (index * bit_n % 32) / bit_n;
        DATA_TYPE ans = (counter[index1] >> (index2 * bit_n)) & max_value;
        uint32_t a = freezed_counter_sum(index);
        return std::min(ans + a, max_value);
    }
    
    uint32_t Query_edge(ID_TYPE src, ID_TYPE dst) {
        uint32_t src_index = hash(src, bit_n) % d, dst_index = hash(dst, bit_n) % d;
        uint32_t index = src_index * d + dst_index;
        return Query(index);
    }

    uint32_t query(uint32_t index){
        uint32_t index1 = index * bit_n / 32;
        uint32_t index2 = (index * bit_n % 32) / bit_n;
        DATA_TYPE ans = (counter[index1] >> (index2 * bit_n)) & max_value;
        uint32_t a = freezed_counter_sum(index);
        return std::min(a + ans, max_value);
    }

    uint32_t query_edge(ID_TYPE src, ID_TYPE dst) {
        uint32_t src_index = hash(src, bit_n) % d, dst_index = hash(dst, bit_n) % d;
        uint32_t index = src_index * d + dst_index;
        return query(index);
    }


    bool freezed(ID_TYPE src, ID_TYPE dst) {
        uint32_t src_index = hash(src, bit_n) % d, dst_index = hash(dst, bit_n) % d;
        uint32_t index = src_index * d + dst_index;
        return freezed_counter(index) != -1;
    }

    void modify(uint32_t index, uint32_t val){
        // if (val > 10000)
        //     printf("val: %u, index: %u\n", val, index);
        uint32_t index1 = index * bit_n / 32;
        uint32_t index2 = (index * bit_n % 32) / bit_n;
        uint32_t p = index2 * bit_n, v = max_value << p;
        counter[index1] = ((counter[index1] | v) ^ v) | (val << p);
    }

    void modify(ID_TYPE src, ID_TYPE dst, uint32_t val, uint32_t add_val) {
        uint32_t src_index = hash(src, bit_n) % d, dst_index = hash(dst, bit_n) % d;
        uint32_t index = src_index * d + dst_index;
        int a = freezed_counter(index);
        // if (a != -1)
        //     printf("modify: src: %u, dst: %u, add_val: %u, a: %d\n", src, dst, add_val, a);
        if (a != -1) {
            //printf("add_val: %u\n", add_val);
            collision_counter[a] += add_val;
            collision_counter[a] = std::min(collision_counter[a], max_value2);
            return;
        }
        return modify(index, val);
    }

    void freeze(ID_TYPE src, ID_TYPE dst) {
        if (!should_freeze) return;
        uint32_t src_index = hash(src, bit_n) % d, dst_index = hash(dst, bit_n) % d;
        uint32_t index = src_index * d + dst_index;
        for (int i = 0; i <= max_level; ++i) {
            if (bitmap[Offset[i] + index / max_offset[i]] == 0) {
                bitmap[Offset[i] + index / max_offset[i]] = index % max_offset[i] + 1;
                collision_counter[Offset[i] + index / max_offset[i]] = 0;
                break;
            }
            // if (bitmap[Offset[i] + index / max_offset[i]] == index % max_offset[i] + 1)
            //     break;
        }
    }

    void unfreeze(ID_TYPE src, ID_TYPE dst, DATA_TYPE val, DATA_TYPE v) {
        uint32_t src_index = hash(src, bit_n) % d, dst_index = hash(dst, bit_n) % d;
        uint32_t index = src_index * d + dst_index;
        int a = freezed_counter(index);
        int sum = 0;
        while (a != -1) {
            sum += collision_counter[a];
            bitmap[a] = 0;
            collision_counter[a] = 0;
            a = freezed_counter(index);
        }
        modify(index, std::min(max_value, std::max(Query_i(index) + sum,v + val)));
    }

    uint32_t query_vertex_start(ID_TYPE src) {
        uint32_t src_index = hash(src, bit_n) % d, ans = 0;
        for (int i = src_index * d; i < src_index * d + d; ++i) {
            uint32_t v = query(i);
            if (v < max_value)
                ans += query(i);
            else ans = 1e9;
        }
        return ans;
    }

    
private:
    bool should_freeze;
    uint32_t d;
    uint32_t bit_n;
    uint32_t max_value;
    uint32_t max_value2;
    uint32_t max_level;
    uint32_t max_offset[25];
    uint32_t Offset[25];
    unsigned int* counter;
    unsigned int* bitmap;
    unsigned int* collision_counter;
};

template<typename ID_TYPE, typename DATA_TYPE>
class TowerTCM_v2 {
public:

    TowerTCM_v2() {}
    TowerTCM_v2(uint32_t memory) {
        for (int i = 0; i < level_n; ++i) {
            if (i > 2)
                tcm[i] = new TowerTCM_Level_v2<ID_TYPE, DATA_TYPE>(memory * 1.0 / level_n, level_bit[i], true);
            else
                tcm[i] = new TowerTCM_Level_v2<ID_TYPE, DATA_TYPE>(memory * 1.0 / level_n, level_bit[i], false);
            max_value[i] = (1 << level_bit[i]) - 1;
        }
    }
    ~TowerTCM_v2() {}
    void insertmax(ID_TYPE src, ID_TYPE dst, uint32_t weight) {
        for (int i = 0; i < level_n; ++i) {
            uint32_t val = tcm[i] -> query_edge(src, dst);
            val = std::min(std::max(val, weight), max_value[i]);
            tcm[i] -> modify(src, dst, val);
        }
    }
    void insert_cm(ID_TYPE src, ID_TYPE dst, uint32_t weight) {
        for (int i = 0; i < level_n; ++i) {
            uint32_t val = tcm[i] -> query_edge(src, dst);
            val = std::min(val + weight, max_value[i]);
            tcm[i] -> modify(src, dst, val);
        }
    }
    void insert(ID_TYPE src, ID_TYPE dst, uint32_t weight, bool unfreeze=false) {
        uint32_t v = 1e9;
        
        for (int i = 0; i < level_n; ++i) {
            uint32_t val = tcm[i] -> query_edge(src, dst);
            if (val < max_value[i])
                v = std::min(v, val);
        }
        if (unfreeze) {
            for (int i = 0; i < level_n; ++i) {
                uint32_t val = tcm[i] -> query_edge(src, dst);
                tcm[i]->unfreeze(src, dst, weight, v);
            }
            return;
        }
        for (int i = 0; i < level_n; ++i) {
            uint32_t val = tcm[i] -> query_edge(src, dst);
            if (val < v + weight && val != max_value[i]) {
                //std::cout << i;
                val = std::min(v + weight, max_value[i]);
                tcm[i] -> modify(src, dst, val, weight);
            }
        }
    }
    void freeze(ID_TYPE src, ID_TYPE dst) {
        for (int i = 0; i < 4; ++i) 
            tcm[i] -> freeze(src, dst);
    }
    DATA_TYPE query_edge(ID_TYPE src, ID_TYPE dst) {
        int min_v = 1e9;
        for (int i = 0; i < level_n; ++i) {
            uint32_t val = tcm[i] -> query_edge(src, dst);
            if (val < max_value[i] && min_v > val)
                min_v = val;
        }
        //std::cout << "min_v = " << min_v << " " << src << " " << dst << std::endl;
        if (min_v > 1e7) min_v = 65536;
        return min_v;
    }
    DATA_TYPE Query_edge(ID_TYPE src, ID_TYPE dst) {
        int min_v = 1e9;
        for (int i = 0; i < level_n; ++i) {
            uint32_t val = tcm[i] -> Query_edge(src, dst);
            if (val < max_value[i] && min_v > val)
                min_v = val;
        }
        if (min_v > 1e7) min_v = 65536;
        return min_v;
    }
    uint32_t query_vertex_start(ID_TYPE src) {
        int min_v = 1e9;
        for (int i = 0; i < level_n; ++i) {
            uint32_t val = tcm[i] -> query_vertex_start(src);
            if (min_v > val)
                min_v = val;
        }
        return min_v;
    }
private:
    TowerTCM_Level_v2<ID_TYPE, DATA_TYPE>* tcm[4];
    uint32_t level_n = 4;
    uint32_t level_bit[4] = {2, 4, 8, 16};
    uint32_t max_value[4];
    // std::priority_queue<Edge<ID_TYPE, DATA_TYPE>> edge_heap;
    // std::priority_queue<Vertex<ID_TYPE, DATA_TYPE>> vertex_start_heap;
    // std::priority_queue<Vertex<ID_TYPE, DATA_TYPE>> vertex_end_heap;
};


#endif
