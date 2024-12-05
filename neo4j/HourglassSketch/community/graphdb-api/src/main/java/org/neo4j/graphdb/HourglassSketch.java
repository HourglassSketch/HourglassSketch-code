/*
 * Copyright (c) 2002-2020 "Neo4j,"
 * Neo4j Sweden AB [http://neo4j.com]
 *
 * This file is part of Neo4j.
 *
 * Neo4j is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package org.neo4j.graphdb;

import org.neo4j.annotations.api.PublicApi;

import java.io.*;
import java.util.ArrayList;
import java.util.Random;

@PublicApi
public class HourglassSketch {    
    public static Random random = new Random();
    public class APHash2 {
        public int seed;

        public void setSeed(int seed){ this.seed = seed;}

        public int hash(String key) {
            int hash = seed;
            int n = key.length();
            for (int i = 0; i < n; i++) {
                if ((i & 1) == 0) {
                    hash ^= ((hash << 7) ^ key.charAt(i) ^ (hash >> 3));
                } else {
                    hash ^= (~((hash << 11) ^ key.charAt(i) ^ (hash >> 5)));
                }
            }
            return (hash & 0x7FFFFFFF);
        }
    }
    public class Coco_Cell {
        int src;
        int dst;
        int coco_count;
        int pure_count;
    };
    public int d;
    public int array_n = 3;
    public Coco_Cell[][][] counter;
    public TowerTCM tcm_sketch;

    public APHash2[] hashes;

    public HourglassSketch(int memory){
        tcm_sketch = new TowerTCM((int)(memory * 0.8));
        d = (int)Math.sqrt(memory * 0.2 * 1024 * 0.97 / 16 / array_n);
        counter = new Coco_Cell[array_n][d][d];
        for (int i = 0; i < array_n; ++i) {
            for (int j = 0; j < d; ++j){
                for (int k = 0; k < d; ++k) {
                    counter[i][j][k] = new Coco_Cell();
                }
            }
        }
        hashes = new APHash2[3];
        random.setSeed(10);
        for(int i = 0; i < 3; ++i){
            int seed = random.nextInt();
            hashes[i] = new APHash2();
            hashes[i].setSeed(seed);
        }
    }

    public void insert(int src, int dst, int weight) {
        System.out.println("Insert: " + src + " " + dst);
        for (int i = 0; i < array_n; ++i) {
            int src_index = hashes[i].hash(String.valueOf(src)) % d, dst_index = hashes[i].hash(String.valueOf(dst)) % d;
            if (counter[i][src_index][dst_index].src == src &&
                counter[i][src_index][dst_index].dst == dst){
                //tcm_sketch->freeze(src, dst);
                counter[i][src_index][dst_index].pure_count += weight;
                counter[i][src_index][dst_index].coco_count += weight;
                return;
            }
        }
        for (int i = 0; i < array_n; ++i) {
            int src_index = hashes[i].hash(String.valueOf(src)) % d, dst_index = hashes[i].hash(String.valueOf(dst)) % d;
            if (counter[i][src_index][dst_index].src == 0 &&
                counter[i][src_index][dst_index].dst == 0){
                
                counter[i][src_index][dst_index].src = src;
                counter[i][src_index][dst_index].dst = dst;
                counter[i][src_index][dst_index].pure_count = weight;
                counter[i][src_index][dst_index].coco_count = weight;
                tcm_sketch.freeze(src, dst);
                return;
            }
        }
        int min_index = 0, min_c = 1000000000;

        for (int i = 0; i < array_n; ++i) {
            int src_index = hashes[i].hash(String.valueOf(src)) % d, dst_index = hashes[i].hash(String.valueOf(dst)) % d;
            if (min_c > counter[i][src_index][dst_index].coco_count) {
                min_c = counter[i][src_index][dst_index].coco_count;
                min_index = i;
            }
        }

        int src_index = hashes[min_index].hash(String.valueOf(src)) % d, dst_index = hashes[min_index].hash(String.valueOf(dst)) % d;
        counter[min_index][src_index][dst_index].coco_count += weight;
        double x = Math.random();
        double p = 1.0 * weight / counter[min_index][src_index][dst_index].coco_count;
        if (x < p) { // evict
            int SRC = counter[min_index][src_index][dst_index].src, DST = counter[min_index][src_index][dst_index].dst;
            counter[min_index][src_index][dst_index].src = src;
            counter[min_index][src_index][dst_index].dst = dst;
            //tcm_sketch->insert(SRC, DST, counter[min_index][src_index][dst_index].pure_count + counter[min_index][src_index][dst_index].freeze_count);
            tcm_sketch.insert(SRC, DST, counter[min_index][src_index][dst_index].pure_count);
            tcm_sketch.freeze(src, dst);
            counter[min_index][src_index][dst_index].pure_count = weight;
        } else {
            tcm_sketch.insert(src, dst, weight);
        }
    }
    int query_edge(int src, int dst) {
        for (int i = 0; i < array_n; ++i) {
            int src_index = hashes[i].hash(String.valueOf(src)) % d, dst_index = hashes[i].hash(String.valueOf(dst)) % d;
            if (counter[i][src_index][dst_index].src == src &&
                counter[i][src_index][dst_index].dst == dst){
                return counter[i][src_index][dst_index].pure_count 
                     + tcm_sketch.query_edge(src, dst);
            }
        }
        return tcm_sketch.query_edge(src, dst);
    }
    int query_vertex_start(int src) {
        int ans = 0;
        for (int i = 0; i < array_n; ++i) {
            int src_index = hashes[i].hash(String.valueOf(src)) % d;
            for (int j = 0; j < d; ++j) {
                if (counter[i][src_index][j].src == src)
                    ans += counter[i][src_index][j].coco_count;
            }
        }
        return ans;
    }
}