#ifndef _BENCHMARK_H_
#define _BENCHMARK_H_

#include <bits/stdc++.h>
#include <hash.h>
#include <Mmap.h>
#include "CorrectDetector.h"
#include "TCM.h"
#include "TowerTCM.h"
#include "coco_freeze.h"
#include "coco.h"

using namespace std;

struct CAIDA_Tuple {
    uint64_t timestamp;
    uint32_t src;
    uint32_t dst;
};

struct Edges {
    uint32_t src;
    uint32_t dst;
};

int Abs(int x){
    return x < 0 ? -x : x;
}
class CAIDABenchmark {
public:
	CAIDABenchmark(std::string PATH, const char* Dataset) {
        for(int i = 0; i < strlen(Dataset); ++i)
            dataset_name[i] = Dataset[i];
        if (dataset_name[0] == 'c') {
            load_result = Load(PATH.c_str());
            dataset_ = (CAIDA_Tuple*)load_result.start;
            length = load_result.length / sizeof(CAIDA_Tuple);
            dataset = new Edges[length];
            for (int i = 0; i < length; ++i) {
                dataset[i].src = dataset_[i].src;
                dataset[i].dst = dataset_[i].dst;
            } 
            length = 1e7;
            printf("length: %lu\n", length);
        }
        if (dataset_name[0] == 'd') {
            length = 1e7;
            dataset = new Edges[length];
            freopen(PATH.c_str(), "r", stdin);
            uint32_t a;
            for (int i = 0; i < length; ++i) {
                scanf("%u%u\n", &dataset[i].src, &dataset[i].dst);
            }
            fclose(stdin);
        }
        if (dataset_name[0] == 'e') {
            length = 332334;
            dataset = new Edges[length];
            freopen(PATH.c_str(), "r", stdin);
            uint32_t a;
            for (int i = 0; i < length; ++i) {
                scanf("%u%u%u\n", &dataset[i].src, &dataset[i].dst, &a);
            }
            fclose(stdin);
        }
        if (dataset_name[0] == 's') {
            length = 10999480;
            dataset = new Edges[length];
            std::ifstream file(PATH.c_str()); // 打开文件

            if (!file) { // 检查文件是否成功打开
                std::cerr << "Unable to open file";
                exit(1);
            }
            uint32_t a;
            for (int i = 0; i < length; ++i) {
                file >> dataset[i].src >>  dataset[i].dst >> a;
            }
            file.close();
        }
        if (dataset_name[0] == 't') {
            length = 1e7;
            dataset = new Edges[length];
            freopen(PATH.c_str(), "r", stdin);
            for (int i = 0; i < length; ++i) {
                scanf("%u%u", &dataset[i].src, &dataset[i].dst);
            }
            fclose(stdin);
        }
        if (dataset_name[0] == 'N') {
            length = 1497134;
            dataset = new Edges[length];
            freopen(PATH.c_str(), "r", stdin);
            for (int i = 0; i < length; ++i) {
                scanf("%u%u", &dataset[i].src, &dataset[i].dst);
            }
            fclose(stdin);
        }
    }
	~CAIDABenchmark() {}
    

    void Run_Node(uint32_t memory, double rate) {
        srand(time(0));
        uint32_t running_length = length;

        Coco_TCM_freeze<uint32_t, uint32_t>* coco_tcmf = new Coco_TCM_freeze<uint32_t, uint32_t>(memory, rate);
        Coco_TCM<uint32_t, uint32_t>* coco_tcm = new Coco_TCM<uint32_t, uint32_t>(memory, rate);
        MultiHashTCM<uint32_t, uint32_t>* mhash_tcm = new MultiHashTCM<uint32_t, uint32_t>(memory);
        CorrectDetector<uint32_t>* correct_detector = new CorrectDetector<uint32_t>();
        std::map<uint32_t, std::set<uint32_t>> id_map;
        std::set<uint32_t> node_set;
        std::cout << "Initialization finish.\n";
        for (int i = 0; i < running_length; ++i){
            node_set.insert(dataset[i].src);
            correct_detector->insert(dataset[i].src, dataset[i].dst);
            id_map[dataset[i].src].insert(dataset[i].dst);
        }
        map<uint32_t, int> mp;
        for (auto x:node_set) {
            uint32_t truth = correct_detector->query_vertex_start(x);
            mp[x] = truth;
        }
        int k = max(mp.size() * 0.01, 100.0);
        for (int i = 0; i < running_length; ++i) {
            coco_tcmf->insert(dataset[i].src, dataset[i].dst, 1);
            mhash_tcm->insert(dataset[i].src, dataset[i].dst, 1);
        }
        std::cout << "Insertion finish. \n";
        uint32_t num = 0;
        double are_coco = 0.0, aae_coco = 0.0;
        double are_cocof = 0.0, aae_cocof = 0.0;
        double are_mtcm = 0.0, aae_mtcm = 0.0;
        for (auto x:node_set) {
            uint32_t truth = correct_detector->query_vertex_start(x);
            uint32_t result_cocof = coco_tcmf->query_vertex_start(x);
            uint32_t result_mtcm = mhash_tcm->query_vertex_start(x);
            are_cocof += 1.0 * Abs(result_cocof - truth) / truth;
            aae_cocof += Abs(result_cocof - truth);
            are_mtcm += 1.0 * Abs(result_mtcm - truth) / truth;
            aae_mtcm += Abs(result_mtcm - truth);
            ++num;
        }
        std::cout << "Query finish.\n";
        std::cout << "Estimate: " << num << "\n";

        std::cout << "CocoTCM_freeze: \n";
        std::cout << "ARE: " << are_cocof / num << "\n";
        std::cout << "AAE: " << aae_cocof / num << "\n";
        
        std::cout << "Multi Hash TCM: \n";
        std::cout << "ARE: " << are_mtcm / num << "\n";
        std::cout << "AAE: " << aae_mtcm / num << "\n";
    }
    void Run_Edge(uint32_t memory, double rate) {
        srand(time(0));
        uint32_t running_length = length;
        printf("len: %u\n", running_length);

        Coco_TCM_freeze<uint32_t, uint32_t>* coco_tcmf = new Coco_TCM_freeze<uint32_t, uint32_t>(memory, rate);
        MultiHashTCM<uint32_t, uint32_t>* mhash_tcm = new MultiHashTCM<uint32_t, uint32_t>(memory);
        CorrectDetector<uint32_t>* correct_detector = new CorrectDetector<uint32_t>();
        std::map<uint32_t, std::set<uint32_t>> id_map;
        std::set<uint32_t> node_set;
        std::cout << "Initialization finish.\n";
        for (int i = 0; i < running_length; ++i) {
            coco_tcmf->insert(dataset[i].src, dataset[i].dst, 1);
            mhash_tcm->insert(dataset[i].src, dataset[i].dst, 1);
            correct_detector->insert(dataset[i].src, dataset[i].dst);
            id_map[dataset[i].src].insert(dataset[i].dst);
        } 
        std::cout << "Insertion finish. \n";
        uint32_t num = 0;
        double are_cocof = 0.0, aae_cocof = 0.0;
        double are_mtcm = 0.0, aae_mtcm = 0.0;

        for (auto &i : id_map) {
            for (auto &j : i.second) {
                uint32_t truth = correct_detector->query_edge(i.first, j);
                ++num;
                uint32_t result_cocof = coco_tcmf->query_edge(i.first, j);
                uint32_t result_mtcm = mhash_tcm->query_edge(i.first, j);
                are_cocof += 1.0 * Abs(result_cocof - truth) / truth;
                aae_cocof += Abs(result_cocof - truth);
                are_mtcm += 1.0 * Abs(result_mtcm - truth) / truth;
                aae_mtcm += Abs(result_mtcm - truth);
            }
        }
        std::cout << "Query finish.\n";
        std::cout << "Estimate: " << num << "\n";

        std::cout << "CocoTCM_freeze: \n";
        std::cout << "ARE: " << are_cocof / num << "\n";
        std::cout << "AAE: " << aae_cocof / num << "\n";
        
        std::cout << "Multi Hash TCM: \n";
        std::cout << "ARE: " << are_mtcm / num << "\n";
        std::cout << "AAE: " << aae_mtcm / num << "\n";
    }
private:
    char dataset_name[50];
	std::string filename;
    LoadResult load_result;
    Edges *dataset;
    CAIDA_Tuple *dataset_;
    uint64_t length;
    uint64_t K;
};

#endif
