#ifndef _GRAPH_H_
#define _GRAPH_H_

const int K=100;
template<typename ID_TYPE, typename DATA_TYPE>
class Vertex {
public:
    ID_TYPE id;
    DATA_TYPE cnt;
    Vertex() {}
    Vertex(ID_TYPE _id, DATA_TYPE _cnt): id(_id), cnt(_cnt) {}
    ~Vertex() {}
    friend bool operator < (const Vertex &x, const Vertex &y) {
        return x.cnt == y.cnt ? x.id < y.id : x.cnt < y.cnt;
    }
};

template<typename ID_TYPE, typename DATA_TYPE>
class Edge {
public:
    ID_TYPE src, dst;
    DATA_TYPE cnt;
    Edge() {}
    Edge(ID_TYPE _src, ID_TYPE _dst, ID_TYPE _cnt): src(_src), dst(_dst), cnt(_cnt) {}
    ~Edge() {}
    friend bool operator < (const Edge &x, const Edge &y) {
        return x.cnt == y.cnt ? (x.src == y.src ? x.dst < y.dst : x.src < y.src) : x.cnt < y.cnt;
    }
};



#endif