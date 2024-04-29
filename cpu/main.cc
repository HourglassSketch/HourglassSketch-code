#include <bits/stdc++.h>
#include "Benchmark.h"
using namespace std;

int main(int argc, char** argv) {
	string dataset, path;
	int mem = 200;
	double rate = 0.1;
    for (int i = 0; i < argc; i++) {
		if (strcmp(argv[i], "-dataset") == 0) {
			dataset = argv[++i];
		}
		if (strcmp(argv[i], "-path") == 0) {
			path = argv[++i];
		}
		if (strcmp(argv[i], "-memory") == 0) {
			mem = atoi(argv[++i]);
		}
		if (strcmp(argv[i], "-rate") == 0) {
			rate = stod(argv[++i]);
		}
    }
	cout << "path: " << path << " dataset:" << dataset << " memory:" << mem << " rate:" << rate << endl;
	CAIDABenchmark benchmark(path, dataset.c_str());
	benchmark.Run_Node(mem, rate);
	return 0;
}