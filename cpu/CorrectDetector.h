#ifndef _CORRECT_H_
#define _CORRECT_H_

#include <bits/stdc++.h>
#include "graph.h"

template<typename ID_TYPE>
class CorrectDetector {
public:
    CorrectDetector() {
        edge.clear();
        vertex_start_set.clear();
    }
    ~CorrectDetector() {}
    void insert(ID_TYPE src, ID_TYPE dst) {
        if (vertex_start_set.find(src) == vertex_start_set.end()) {
            vertex_start_set.insert(src);
            edge[src] = {};
        }
        if (edge[src].find(dst) == edge[src].end()) {
            edge[src][dst] = 0;
        }
        edge[src][dst]++;
    }
    uint32_t query_edge(ID_TYPE src, ID_TYPE dst) {
        if (edge.find(src) == edge.end() || edge[src].find(dst) == edge[src].end()) {
            return 0;
        }
        return edge[src][dst];
    }
    uint32_t query_vertex_start(ID_TYPE src) {
        if (edge.find(src) == edge.end()) {
            return 0;
        }
        uint32_t sum = 0;
        for (auto &i : edge[src]) {
            sum += i.second;
        }
        return sum;
    }
    uint32_t query_vertex_end(ID_TYPE dst) {
        uint32_t sum = 0;
        for (auto &i : edge) {
            if (i.second.find(dst) == i.second.end()) {
                continue;
            }
            sum += i.second[dst];
        }
        return sum;
    }
private:
    std::map<ID_TYPE, std::map<ID_TYPE, uint32_t>> edge;
    std::set<ID_TYPE> vertex_start_set;
};

#endif