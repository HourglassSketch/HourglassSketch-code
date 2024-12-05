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
public class TowerTCM {
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
    public class TowerTCM_Level {
        public TowerTCM_Level(double memory, int bit) {
            bit_n = bit;
            max_value = (1 << bit) - 1;
            d = (int)Math.sqrt(memory * 1024 / 4);
            counter = new int [d * d];
            bitmap = new int [(d * d * 32 / bit_n + 31) / 32];
            d = (int)Math.sqrt(d * d * 32 / bit_n);
            int seed = random.nextInt();
            hashes = new APHash2();
            hashes.setSeed(bit_n);
        }
        public int query(int index){
            int index1 = index * bit_n / 32;
            int index2 = (index * bit_n % 32) / bit_n;
            return (counter[index1] >> (index2 * bit_n)) & max_value;
        }

        public int query_edge(int src, int dst) {
            int src_index = hashes.hash(String.valueOf(src)) % d, dst_index = hashes.hash(String.valueOf(dst)) % d;
            int index = src_index * d + dst_index;
            return query(index);
        }

        public void modify(int index, int val){
            int index1 = index * bit_n / 32;
            int index2 = (index * bit_n % 32) / bit_n;
            int p = index2 * bit_n, v = max_value << p;
            counter[index1] = ((counter[index1] | v) ^ v) | (val << p);
        }

        public void modify(int src, int dst, int val) {
            int src_index = hashes.hash(String.valueOf(src)) % d, dst_index = hashes.hash(String.valueOf(dst)) % d;
            int index = src_index * d + dst_index;
            if ((bitmap[index >> 5] & (1 << (index & 31))) != 0){
                //puts("***");
                return;
            }
            modify(index, val);
            return;
        }

        public void freeze(int src, int dst) {
            int src_index = hashes.hash(String.valueOf(src)) % d, dst_index = hashes.hash(String.valueOf(dst)) % d;
            int index = src_index * d + dst_index;
            bitmap[index >> 5] |= (1 << (index & 31));
        }

        public void unfreeze(int src, int dst) {
            int src_index = hashes.hash(String.valueOf(src)) % d, dst_index = hashes.hash(String.valueOf(dst)) % d;
            int index = src_index * d + dst_index;
            bitmap[index >> 5] |= (1 << (index & 31));
            bitmap[index >> 5] ^= (1 << (index & 31));
        }
    
        public int d;
        public int bit_n;
        public int max_value;
        public int[] counter;
        public int[] bitmap;
        public APHash2 hashes;
    }

    public TowerTCM(int memory) {
        int sum_bit = 0, sum_fbit = 0;
        for (int i = 0; i < level_n; ++i) {
            sum_bit += 16;
            sum_fbit += (int)(16 + 16 / level_bit[i]);
        }
        memory = (int)(memory * 1.0 * sum_bit / sum_fbit);
        tcm = new TowerTCM_Level[4];
        for (int i = 0; i < level_n; ++i) {
            tcm[i] = new TowerTCM_Level(memory * 1.0 / level_n, level_bit[i]);
            max_value[i] = (1 << level_bit[i]) - 1;
        }
    }

    public void insertmax(int src, int dst, int weight) {
        for (int i = 0; i < level_n; ++i) {
            int val = tcm[i].query_edge(src, dst);
            val = Math.min(Math.max(val, weight), max_value[i]);
            tcm[i].modify(src, dst, val);
        }
    }
    public void insert_cm(int src, int dst, int weight) {
        for (int i = 0; i < level_n; ++i) {
            int val = tcm[i].query_edge(src, dst);
            val = Math.min(val + weight, max_value[i]);
            tcm[i].modify(src, dst, val);
        }
    }
    public void insert(int src, int dst, int weight) {
        int v = 1000000000;
        for (int i = 0; i < level_n; ++i) {
            int val = tcm[i].query_edge(src, dst);
            if (val != max_value[i])
                v = Math.min(v, val);
        }
        for (int i = 0; i < level_n; ++i) {
            int val = tcm[i].query_edge(src, dst);
            if (val < v + weight && val != max_value[i]) {
                //std::cout << i;
                val = Math.min(v + weight, max_value[i]);
                tcm[i].modify(src, dst, val);
            }
        }
    }
    public void freeze(int src, int dst) {
        for (int i = 0; i < 4; ++i) 
            tcm[i].freeze(src, dst);
    }
    public void unfreeze(int src, int dst) {
        for (int i = 0; i < level_n; ++i) 
            tcm[i].unfreeze(src, dst);
    }
    public int query_edge(int src, int dst) {
        int min_v = 1000000000;
        for (int i = 0; i < level_n; ++i) {
            int val = tcm[i].query_edge(src, dst);
            if (val != max_value[i] && min_v > val)
                min_v = val;
        }
        return min_v;
    }
    public TowerTCM_Level[] tcm;
    public int level_n = 4;
    public int[] level_bit = {2, 4, 8, 16};
    public int[] max_value = {3, 15, 255, 65535};
}