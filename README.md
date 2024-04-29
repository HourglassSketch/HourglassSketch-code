## HourglassSketch: A Framework for Accurate Graph Stream Summarization

This code provides a code implementation of HourglassSketch and TowerTCMSketch and implements a script to compare HourglassSketch and TCM. HourglassSketch supports a variety of queries, including edge queries and node queries on graph data streams, and has a significant advantage in accuracy over other algorithms.

#### How to run

Suppose you've already cloned the repository.

```bash
$ cd src && mkdir build
$ cd build
$ cmake .. && make
$ ./cpu
```

#### Parameter setting

```
-dataset: name of test dataset
-path: path of the graph dataset
-memory: total memory of data structures
-rate: CocoSketch's share of total memory
```

- For example, you can run the following script if you have downloaded the CAIDA dataset:

  ```
  ./cpu -dataset caida -path ./CAIDA.dat -memory 1200 -rate 0.1
  ```

#### Datasets and baselines

- Our code now runs on four datasets:
  - [The CAIDA Anonymized Internet Traces](http://www.caida.org/data/)
  - [The DBLP Archive](https://dblp.dagstuhl.de/xml/).
  - [The network dataset internet traces.](http://snap.stanford.edu/data/email-Eu-core-temporal.html)
  - Synthetic datasets.

- If you want to run this code on other datasets, you can modify the code in Benchmark.h.

- To compare with the other baselines in our paper, you can get their code from the following link:
  - Auxo: [CGCL-codes/Auxo: Auxo is a scalable and efficient framework for graph stream summarization (github.com)](https://github.com/CGCL-codes/Auxo)
  - GSS: [Puppy95/Graph-Stream-Sketch (github.com)](https://github.com/Puppy95/Graph-Stream-Sketch)

#### hardware implementation

- We provide a FPGA implementation of HourglassSketch in fpga.
- We provide a P4 implementation of HourglassSketch in p4.