#ifndef _COCO_H_
#define _COCO_H_

#include <bits/stdc++.h>
#include "hash.h"
#include "graph.h"
#include "TCM.h"
#include "TowerTCM.h"
#include "coco_freeze.h"
using namespace std;
#define inf 2147483647


template<typename ID_TYPE, typename DATA_TYPE>
class Coco_TCM {
public:
    Coco_TCM() {}
    Coco_TCM(uint32_t memory, double rate){
        tcm_sketch = new MultiHashTCM<ID_TYPE, DATA_TYPE> (memory * (1 - rate) * 2);
        array_n = 2;
        d = sqrt(memory * rate * 1024 / (sizeof(Coco_Cell<ID_TYPE, DATA_TYPE>)) / array_n);
        counter = new Coco_Cell<ID_TYPE, DATA_TYPE> **[array_n];
        for (int i = 0; i < array_n; ++i) {
            counter[i] = new Coco_Cell<ID_TYPE, DATA_TYPE> *[d];
            for (int j = 0; j < d; ++j){
                counter[i][j] = new Coco_Cell<ID_TYPE, DATA_TYPE> [d];
                memset(counter[i][j], 0, d * sizeof(Coco_Cell<ID_TYPE, DATA_TYPE>));
            }
        }
    }
    ~Coco_TCM() {
        for (int i = 0; i < array_n; ++i){
            for (int j = 0; j < d; ++j) {
                delete[] counter[i][j];
            }
            delete[] counter[i];
        }
        delete[] counter;
    }
    void insert(ID_TYPE src, ID_TYPE dst, uint32_t weight) {

        for (int i = 0; i < array_n; ++i) {
            uint32_t src_index = ::hash(src, i + 20) % d, dst_index = ::hash(dst, i + 25) % d;
            if (counter[i][src_index][dst_index].src == src &&
                counter[i][src_index][dst_index].dst == dst){
                
                counter[i][src_index][dst_index].pure_count += weight;
                counter[i][src_index][dst_index].coco_count += weight;
                return;
            }
        }
        for (int i = 0; i < array_n; ++i) {
            uint32_t src_index = ::hash(src, i + 20) % d, dst_index = ::hash(dst, i + 25) % d;
            if (counter[i][src_index][dst_index].src == 0 &&
                counter[i][src_index][dst_index].dst == 0){
                
                counter[i][src_index][dst_index].src = src;
                counter[i][src_index][dst_index].dst = dst;
                counter[i][src_index][dst_index].pure_count = weight;
                counter[i][src_index][dst_index].coco_count = weight;
                return;
            }
        }
        uint32_t min_index, min_c = 1e9;

        for (int i = 0; i < array_n; ++i) {
            uint32_t src_index = ::hash(src, i + 20) % d, dst_index = ::hash(dst, i + 25) % d;
            if (min_c > counter[i][src_index][dst_index].coco_count) {
                min_c = counter[i][src_index][dst_index].coco_count;
                min_index = i;
            }
        }

        uint32_t src_index = ::hash(src, min_index + 20) % d, dst_index = ::hash(dst, min_index + 25) % d;
        counter[min_index][src_index][dst_index].coco_count += weight;
        double x = 1.0 * rand() / RAND_MAX;
        double p = 1.0 * weight / counter[min_index][src_index][dst_index].coco_count;
        if (x < p) { // evict
            ID_TYPE SRC = counter[min_index][src_index][dst_index].src,
                    DST = counter[min_index][src_index][dst_index].dst;
            counter[min_index][src_index][dst_index].src = src;
            counter[min_index][src_index][dst_index].dst = dst;
            tcm_sketch->insert(SRC, DST, counter[min_index][src_index][dst_index].pure_count);
            counter[min_index][src_index][dst_index].pure_count = weight;
        } else {
            tcm_sketch->insert(src, dst, weight);
        }
    }
    DATA_TYPE query_edge(ID_TYPE src, ID_TYPE dst) {
        for (int i = 0; i < array_n; ++i) {
            uint32_t src_index = ::hash(src, i + 20) % d, dst_index = ::hash(dst, i + 25) % d;
            
            if (counter[i][src_index][dst_index].src == src &&
                counter[i][src_index][dst_index].dst == dst){
                return counter[i][src_index][dst_index].pure_count
                     + tcm_sketch->query_edge(src, dst);
            }
        }
        return tcm_sketch->query_edge(src, dst);
    }
    DATA_TYPE query_vertex_start(ID_TYPE src) {
        uint32_t ans = 0;
        for (int i = 0; i < array_n; ++i) {
            uint32_t src_index = ::hash(src, i + 20) % d;
            for (int j = 0; j < d; ++j) {
                if (counter[i][src_index][j].src == src)
                    ans += counter[i][src_index][j].coco_count;
            }
        }
        return ans;
    }
    DATA_TYPE query_vertex_end(ID_TYPE dst) {
        uint32_t ans = 0;
        for (int i = 0; i < array_n; ++i) {
            uint32_t dst_index = ::hash(dst, i + 20) % d;
            for (int j = 0; j < d; ++j) {
                if (counter[i][j][dst_index].dst == dst)
                    ans += counter[i][j][dst_index].coco_count;
            }
        }
        return ans;
    }
private:
    uint32_t array_n;
    uint32_t d;
    uint32_t cnt = 0;
    uint32_t u_val = 0, v_val = 0;
    uint32_t u_val1 = 0, v_val1 = 0, sum = 0;

    Coco_Cell<ID_TYPE, DATA_TYPE>*** counter;
    MultiHashTCM<ID_TYPE, DATA_TYPE>* tcm_sketch;
};



#endif