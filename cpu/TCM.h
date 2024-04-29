#ifndef _TCM_H_
#define _TCM_H_

#include <bits/stdc++.h>
#include "hash.h"
#include "graph.h"

template<typename ID_TYPE, typename DATA_TYPE>
class TCMSketch {
public:
    uint32_t Sum;
    TCMSketch() {}
    TCMSketch(uint32_t memory) {
        d = sqrt(memory * 1024 / sizeof(DATA_TYPE) * 2);
        counter = new DATA_TYPE* [d];
        for (int i = 0; i < d; ++i) {
            counter[i] = new DATA_TYPE [d];
            memset(counter[i], 0, d * sizeof(DATA_TYPE));
        }
    }
    ~TCMSketch() {
        for (int i = 0; i < d; ++i) {
            delete[] counter[i];
        }
        delete[] counter;
    }
    void insert(ID_TYPE src, ID_TYPE dst, uint32_t weight) {
        Sum += weight;
        uint32_t src_index = hash(src, 0) % d, dst_index = hash(dst, 0) % d;
        counter[src_index][dst_index] += weight;
    }
    DATA_TYPE query_edge(ID_TYPE src, ID_TYPE dst) {
        uint32_t src_index = hash(src, 0) % d, dst_index = hash(dst, 0) % d;
        return counter[src_index][dst_index];
    }
    DATA_TYPE query_vertex_start(ID_TYPE src) {
        uint32_t src_index = hash(src, 0) % d;
        DATA_TYPE sum = 0;
        for (int i = 0; i < d; ++i) {
            sum += counter[src_index][i];
        }
        return sum;
    }
    DATA_TYPE query_vertex_end(ID_TYPE dst) {
        uint32_t dst_index = hash(dst, 0) % d;
        DATA_TYPE sum = 0;
        for (int i = 0; i < d; ++i) {
            sum += counter[i][dst_index];
        }
        return sum;
    }
private:
    uint32_t d;
    DATA_TYPE** counter;
    // std::priority_queue<Edge<ID_TYPE, DATA_TYPE>> edge_heap;
    // std::priority_queue<Vertex<ID_TYPE, DATA_TYPE>> vertex_start_heap;
    // std::priority_queue<Vertex<ID_TYPE, DATA_TYPE>> vertex_end_heap;
};


template<typename ID_TYPE, typename DATA_TYPE>
class MultiHashTCM {
public:

    uint32_t Sum;
    MultiHashTCM() {}
    MultiHashTCM(uint32_t memory) {
        array_n = 3;
        d = sqrt(memory * 1024 / sizeof(DATA_TYPE) / array_n);
        counter = new DATA_TYPE** [array_n];
        for (int i = 0; i < array_n; ++i) {
            counter[i] = new DATA_TYPE *[d];
            for (int j = 0; j < d; ++j) {
                counter[i][j] = new DATA_TYPE [d];
                memset(counter[i][j], 0, d * sizeof(DATA_TYPE));
            }
        }
    }
    ~MultiHashTCM() {
        for (int i = 0; i < array_n; ++i) {
            for (int j = 0; j < d; ++j) {
                delete[] counter[i][j];
            }
            delete[] counter[i];
        }
        delete[] counter;
    }
    void insert(ID_TYPE src, ID_TYPE dst, uint32_t weight) {
        int min_w = 1e9;
        for (int i = 0; i < array_n; ++i) {
            uint32_t src_index = hash(src, i + 5) % d, dst_index = hash(dst, i + 5) % d;
            if (min_w > counter[i][src_index][dst_index])
                min_w = counter[i][src_index][dst_index];
        }
        for (int i = 0; i < array_n; ++i) {
            uint32_t src_index = hash(src, i + 5) % d, dst_index = hash(dst, i + 5) % d;
            if (min_w == counter[i][src_index][dst_index]){
                counter[i][src_index][dst_index] += weight,
                Sum += weight;
            }
        }
    }
    DATA_TYPE query_edge(ID_TYPE src, ID_TYPE dst) {
        int min_w = 1e9;
        for (int i = 0; i < array_n; ++i) {
            uint32_t src_index = hash(src, i + 5) % d, dst_index = hash(dst, i + 5) % d;
            if (min_w > counter[i][src_index][dst_index])
                min_w = counter[i][src_index][dst_index];
        }
        return min_w;
    }
    DATA_TYPE query_vertex_start(ID_TYPE src) {
        DATA_TYPE ans = 1e9;
        for (int i = 0; i < array_n; ++i) {
            uint32_t src_index = hash(src, i + 5) % d;
            DATA_TYPE sum = 0;
            for (int j = 0; j < d; ++j) 
                sum += counter[i][src_index][j];
            ans = std::min(ans, sum);
        }
        return ans;
    }
    DATA_TYPE query_vertex_end(ID_TYPE dst) {
        DATA_TYPE ans = 1e9;
        for (int i = 0; i < array_n; ++i) {
            uint32_t dst_index = hash(dst, i + 5) % d;
            DATA_TYPE sum = 0;
            for (int j = 0; j < d; ++j) 
                sum += counter[i][j][dst_index];
            ans = std::min(ans, sum);
        }
        return ans;
    }
private:
    uint32_t d;
    uint32_t array_n;
    DATA_TYPE*** counter;
    // std::priority_queue<Edge<ID_TYPE, DATA_TYPE>> edge_heap;
    // std::priority_queue<Vertex<ID_TYPE, DATA_TYPE>> vertex_start_heap;
    // std::priority_queue<Vertex<ID_TYPE, DATA_TYPE>> vertex_end_heap;
};



#endif

