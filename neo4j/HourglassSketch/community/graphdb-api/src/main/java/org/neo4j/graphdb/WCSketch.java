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
public class WCSketch {
    public String filePath;
    public int length;
    public int relationNum;
    public int recordNum;
    public int[] seeds;
    public static APHash[] hashes;
    public static Random random = new Random();
    public final int ROW = 0;
    public final int COL = 2;
    public final int MINN = 2000000;
    public final int MAXX = -1;
    public int rowNum = 1;
    public int colNum = 1;
    public static int timeThreshold = 3;
    public WBBucket[][] buckets;
    public ArrayList<WBRelation> relations;
    public ArrayList<WBRecord> records;

    public class APHash {
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

    public WCSketch(int length, String filePath){
        System.out.println("Processing Initialize ex");
        System.out.println("building " + length  + " in " + filePath);
        this.length = length;
        this.filePath = filePath;
        relationNum = 0;
        recordNum = 0;
        rowNum = colNum = 2;
        random.setSeed(10);
        seeds = new int[4];
        hashes = new APHash[4];
        for(int i = 0; i < 4; ++i){
            seeds[i] = random.nextInt();
            hashes[i] = new APHash();
            hashes[i].setSeed(seeds[i]);
        }
        buckets = new WBBucket[length][length];
        for(int i = 0; i < length; ++i){
            for(int j = 0; j < length; ++j){
                buckets[i][j] = new WBBucket();
            }
        }
        //System.out.println("buckets.length = " + buckets.length);
        //System.out.println("buckets.length.length = " + buckets[0].length);
        relations = new ArrayList<>();
        records = new ArrayList<>();
    }

    public void insert(int srcID, int dstID, WBRecord record, int x){
        System.out.println("doing ex inserting");
        records.add(record);
        int newRec = recordNum;
        recordNum++;
        String src = String.valueOf(srcID);
        String dst = String.valueOf(dstID);
        WBRelation res = queryRel(srcID, dstID);
        if(res != null){
            record.nextRec = res.nextRec;
            res.nextRec = newRec;
            return;
        }
        int[] row = new int[rowNum];
        int[] col = new int[colNum];
        for(int i = 0; i < rowNum; ++i){
            row[i] = hashes[ROW + i].hash(src);
            row[i] %= length;
            col[i] = hashes[COL + i].hash(dst);
            col[i] %= length;
        }
        WBBucket tempBuc = buckets[row[0]][col[0]];
        int minn = MINN;
        int maxx = MAXX;
        WBBucket tempBig = buckets[row[0]][col[0]];
        for(int i = 0; i < rowNum; ++i){
            for(int j = 0; j < colNum; ++j){
                int temp = buckets[row[i]][col[j]].counter;
                if(temp < minn){
                    minn = temp;
                    tempBuc = buckets[row[i]][col[j]];
                }
                if(temp > maxx){
                    maxx = temp;
                    tempBig = buckets[row[i]][col[j]];
                }
            }
        }
        WBRelation relation = new WBRelation(srcID, dstID);
        relations.add(relation);
        relation.nextRel = tempBuc.pointer_h;

        relation.nextRec = newRec;
        if(tempBuc.counter == 0) {
            tempBuc.pointer_t = relationNum;
        } else {
            relations.get(tempBuc.pointer_h).preRel = relationNum;
        }
        tempBuc.pointer_h = relationNum++;
        tempBuc.counter++;

        if(maxx > 2 * minn && minn > 10){
            tempBig.counter--;
            int tempRel = tempBig.pointer_t;
            WBRelation OutRel = relations.get(tempRel);
            relations.get(OutRel.preRel).nextRel = -1;
            OutRel.preRel = -1;
            insert_new(OutRel.srcID, OutRel.dstID, tempRel, 0);
        }
    }

    public WBRelation queryRel(int srcID, int dstID){
        String src = String.valueOf(srcID);
        String dst = String.valueOf(dstID);
        int[] row = new int[2];
        int[] col = new int[2];
        for(int i = 0; i < rowNum; ++i){
            row[i] = hashes[ROW + i].hash(src);
            row[i] %= length;
            col[i] = hashes[COL + i].hash(dst);
            col[i] %= length;
        }

        for(int i = 0; i < rowNum; ++i){
            for(int j = 0; j < colNum; ++j){
                //System.out.println("row[i]: " + row[i]);
                //System.out.println("col[j]: " + col[j]);
                //System.out.println(buckets[row[i]][col[j]].pointer_h);
                if(buckets[row[i]][col[j]].pointer_h == -1)
                    continue;
                WBRelation temp = relations.get(buckets[row[i]][col[j]].pointer_h);
                WBRelation result = find(srcID, dstID, temp);
                if(result != null)
                    return result;
            }
        }
        return null;
    }

    public WBRelation find(int srcID, int dstID, WBRelation header){
        for(; ; header = relations.get(header.nextRel)){
            if(srcID == header.srcID && dstID == header.dstID){
                return header;
            }
            if(header.nextRel == -1)
                break;
        }
        return null;
    }

    public WBRecord queryRec(String src, String dst, int recID){
        return null;
    }

    public static class WBBucket {
        public int counter;
        public int pointer_h;
        public int pointer_t;

        public WBBucket(){
            counter = 0;
            pointer_h = -1;
            pointer_t = -1;
        }
    }

    public static class WBRelation {
        public int srcID;
        public int dstID;
        public int nextRel;
        public int preRel;
        public int nextRec;
        public WBRelation(int srcID, int dstID){
            this.srcID = srcID;
            this.dstID = dstID;
            nextRel = -1;
            nextRec = -1;
            preRel = -1;
        }
    }

    public static class WBRecord {
        public int relID;
        public int nextRec;

        public WBRecord(int relID){
            this.relID = relID;
            nextRec = -1;
        }
    }

    public static int CLHtoInt(char[] c){
        int res = 0;
        for(int i = 0; i < c.length; ++i){
            res += (c[i] & 0xff) << (8 * i);
        }
        return res;
    }

    public static char[] CtoLH(int n){
        char[] c = new char[4];
        c[0] = (char) (n & 0xff);
        c[1] = (char) (n >> 8 & 0xff);
        c[2] = (char) (n >> 16 & 0xff);
        c[3] = (char) (n >> 24 & 0xff);
        return c;
    }

    public static WBRecord buildWBRecord(int relationshipID){
        return new WBRecord(relationshipID);
    }

//    public static WBSketch loadFromFile(File file){
//        try {
//            System.out.println("Processing loadFromFile");
//            System.out.println("file: "  + file.getAbsolutePath());
//            FileInputStream fis = new FileInputStream(file);
//            InputStreamReader isr = new InputStreamReader(fis);
//            char[] tempBuf = new char[4];
//            isr.read(tempBuf);
//            int len = CLHtoInt(tempBuf);
//            isr.read(tempBuf);
//            int relNum = CLHtoInt(tempBuf);
//            isr.read(tempBuf);
//            int recNum = CLHtoInt(tempBuf);
//            WBSketch WBSketch = new WBSketch(len, file.getPath());
//            WBSketch.relationNum = relNum;
//            WBSketch.recordNum = recNum;
//            //System.out.println("length relationNum recordNum\n" + wbSketch.length + " " + wbSketch.relationNum + " " + wbSketch.recordNum);
//            for(int i = 0; i < len; ++i){
//                for(int j = 0; j < len; ++j){
//                    isr.read(tempBuf);
//                    WBSketch.buckets[i][j].counter = CLHtoInt(tempBuf);
//                    isr.read(tempBuf);
//                    WBSketch.buckets[i][j].pointer_h = CLHtoInt(tempBuf);
//                    isr.read(tempBuf);
//                    WBSketch.buckets[i][j].pointer_t = CLHtoInt(tempBuf);
//                }
//            }
//            for(int i = 0; i < relNum; ++i){
//                isr.read(tempBuf);
//                int srcID = CLHtoInt(tempBuf);
//                isr.read(tempBuf);
//                int dstID = CLHtoInt(tempBuf);
//                WBRelation tempRel = new WBRelation(srcID, dstID);
//                isr.read(tempBuf);
//                tempRel.nextRel = CLHtoInt(tempBuf);
//                isr.read(tempBuf);
//                tempRel.preRel = CLHtoInt(tempBuf);
//                isr.read(tempBuf);
//                tempRel.nextRec = CLHtoInt(tempBuf);
//                WBSketch.relations.add(tempRel);
//            }
//            for(int i = 0; i < recNum; ++i){
//                isr.read(tempBuf);
//                int relID = CLHtoInt(tempBuf);
//                WBRecord tempRec = new WBRecord(relID);
//                isr.read(tempBuf);
//                tempRec.nextRec = CLHtoInt(tempBuf);
//                WBSketch.records.add(tempRec);
//            }
//            isr.close();
//            return WBSketch;
//        } catch (Exception e){
//            e.printStackTrace();
//            //log.error(e.getMessage());
//        }
//        return null;
//    }
//    public static void SaveToFile(File file, WBSketch WBSketch){
//        try {
//            System.out.println("Processing SaveToFile");
//            System.out.println("file: " + file.getAbsolutePath());
//            FileOutputStream fos = new FileOutputStream(file);
//            OutputStreamWriter osw = new OutputStreamWriter(fos);
//            //System.out.println("length relationNum recordNum\n" + wbSketch.length + " " + wbSketch.relationNum + " " + wbSketch.recordNum);
//            osw.write(CtoLH(WBSketch.length));
//            osw.write(CtoLH(WBSketch.relationNum));
//            osw.write(CtoLH(WBSketch.recordNum));
//            for(int i = 0; i < WBSketch.length; ++i){
//                for(int j = 0; j < WBSketch.length; ++j){
//                    osw.write(CtoLH(WBSketch.buckets[i][j].counter));
//                    osw.write(CtoLH(WBSketch.buckets[i][j].pointer_h));
//                    osw.write(CtoLH(WBSketch.buckets[i][j].pointer_t));
//                }
//            }
//            for(int i = 0; i < WBSketch.relationNum; ++i){
//                osw.write(CtoLH(WBSketch.relations.get(i).srcID));
//                osw.write(CtoLH(WBSketch.relations.get(i).dstID));
//                osw.write(CtoLH(WBSketch.relations.get(i).nextRel));
//                osw.write(CtoLH(WBSketch.relations.get(i).preRel));
//                osw.write(CtoLH(WBSketch.relations.get(i).nextRec));
//            }
//            for(int i = 0; i < WBSketch.recordNum; ++i){
//                osw.write(CtoLH(WBSketch.records.get(i).relID));
//                osw.write(CtoLH(WBSketch.records.get(i).nextRec));
//            }
//            osw.close();
//        } catch (Exception e){
//            e.printStackTrace();
//        }
//    }

    public void insert_new(int srcID, int dstID, int relation, int time) {
        String src = String.valueOf(srcID);
        String dst = String.valueOf(dstID);
        int[] row = new int[rowNum];
        int[] col = new int[colNum];
        for(int i = 0; i < rowNum; ++i){
            row[i] = hashes[ROW + i].hash(src);
            row[i] %= length;
            col[i] = hashes[COL + i].hash(dst);
            col[i] %= length;
        }
        WBBucket tempBuc = buckets[row[0]][col[0]];
        int minn = MINN;
        int maxx = MAXX;
        WBBucket tempBig = buckets[row[0]][col[0]];
        for(int i = 0; i < rowNum; ++i){
            for(int j = 0; j < colNum; ++j){
                int temp = buckets[row[i]][col[j]].counter;
                if(temp < minn){
                    minn = temp;
                    tempBuc = buckets[row[i]][col[j]];
                }
                if(temp > maxx){
                    maxx = temp;
                    tempBig = buckets[row[i]][col[j]];
                }
            }
        }

        relations.get(relation).nextRel = tempBuc.pointer_h;
        if(tempBuc.counter == 0) {
            tempBuc.pointer_t = relation;
        } else {
            relations.get(tempBuc.pointer_h).preRel = relation;
        }
        tempBuc.pointer_h = relation;
        tempBuc.counter++;

        if(time < timeThreshold && maxx > 2 * minn && minn > 10 ){
            tempBig.counter--;
            int tempRel = tempBig.pointer_t;
            WBRelation OutRel = relations.get(tempRel);
            relations.get(OutRel.preRel).nextRel = -1;
            OutRel.preRel = -1;
            insert_new(OutRel.srcID, OutRel.dstID, tempRel, time + 1);
        }
    }

    public static WCSketch loadFromFile(File file){
        try {
            //System.out.println("Processing loadFromFile");
            //System.out.println("file: "  + file.getAbsolutePath());
            FileInputStream fis = new FileInputStream(file);
            //InputStreamReader isr = new InputStreamReader(fis);
            DataInputStream dis = new DataInputStream(fis);
            int len=dis.readInt();
            int relNum = dis.readInt();
            int recNum = dis.readInt();
            /*
            char[] tempBuf = new char[4];
            isr.read(tempBuf);
            int len = CLHtoInt(tempBuf);
            isr.read(tempBuf);
            int relNum = CLHtoInt(tempBuf);
            isr.read(tempBuf);
            int recNum = CLHtoInt(tempBuf);
            */
            WCSketch wbSketch = new WCSketch(len, file.getPath());
            wbSketch.relationNum = relNum;
            wbSketch.recordNum = recNum;
            System.out.println("length relationNum recordNum\n" + wbSketch.length + " " + wbSketch.relationNum + " " + wbSketch.recordNum);
            for(int i = 0; i < len; ++i){
                for(int j = 0; j < len; ++j){
                    wbSketch.buckets[i][j].counter = dis.readInt();
                    wbSketch.buckets[i][j].pointer_h = dis.readInt();
                    wbSketch.buckets[i][j].pointer_t = dis.readInt();
                    /*
                    isr.read(tempBuf);
                    wbSketch.buckets[i][j].counter = CLHtoInt(tempBuf);
                    isr.read(tempBuf);
                    wbSketch.buckets[i][j].pointer_h = CLHtoInt(tempBuf);
                    isr.read(tempBuf);
                    wbSketch.buckets[i][j].pointer_t = CLHtoInt(tempBuf);
                    */
                }
            }
            for(int i = 0; i < relNum; ++i){
                int srcID = dis.readInt();
                int dstID = dis.readInt();
                WBRelation tempRel = new WBRelation(srcID, dstID);
                tempRel.nextRel = dis.readInt();
                tempRel.preRel = dis.readInt();
                tempRel.nextRec = dis.readInt();
                wbSketch.relations.add(tempRel);
                /*
                isr.read(tempBuf);
                int srcID = CLHtoInt(tempBuf);
                isr.read(tempBuf);
                int dstID = CLHtoInt(tempBuf);
                WCRelation tempRel = new WCRelation(srcID, dstID);
                isr.read(tempBuf);
                tempRel.nextRel = CLHtoInt(tempBuf);
                isr.read(tempBuf);
                tempRel.preRel = CLHtoInt(tempBuf);
                isr.read(tempBuf);
                tempRel.nextRec = CLHtoInt(tempBuf);
                wbSketch.relations.add(tempRel);
                */
            }
            for(int i = 0; i < recNum; ++i){
                int relID = dis.readInt();
                WBRecord tempRec = new WBRecord(relID);
                tempRec.nextRec = dis.readInt();
                wbSketch.records.add(tempRec);
                /*
                isr.read(tempBuf);
                int relID = CLHtoInt(tempBuf);
                WBRecord tempRec = new WBRecord(relID);
                isr.read(tempBuf);
                tempRec.nextRec = CLHtoInt(tempBuf);
                wbSketch.records.add(tempRec);
                */
            }
            //   isr.close();
            dis.close();
            return wbSketch;
        } catch (Exception e){
            e.printStackTrace();
            //log.error(e.getMessage());
        }
        return null;
    }
    public static void SaveToFile(File file, WCSketch wbSketch){
        try {
            //System.out.println("Processing SaveToFile");
            //System.out.println("file: " + file.getAbsolutePath());
            FileOutputStream fos = new FileOutputStream(file);
            DataOutputStream dos = new DataOutputStream(fos);
            //OutputStreamWriter osw = new OutputStreamWriter(fos);
            System.out.println("length relationNum recordNum\n" + wbSketch.length + " " + wbSketch.relationNum + " " + wbSketch.recordNum);

            dos.writeInt(wbSketch.length);
            dos.writeInt(wbSketch.relationNum);
            dos.writeInt(wbSketch.recordNum);

            /*
            osw.write(CtoLH(wbSketch.length));
            osw.write(CtoLH(wbSketch.relationNum));
            osw.write(CtoLH(wbSketch.recordNum));
            */
            for(int i = 0; i < wbSketch.length; ++i){
                for(int j = 0; j < wbSketch.length; ++j){

                    dos.writeInt(wbSketch.buckets[i][j].counter);
                    dos.writeInt(wbSketch.buckets[i][j].pointer_h);
                    dos.writeInt(wbSketch.buckets[i][j].pointer_t);

                /*
                    osw.write(CtoLH(wbSketch.buckets[i][j].counter));
                    osw.write(CtoLH(wbSketch.buckets[i][j].pointer_h));
                    osw.write(CtoLH(wbSketch.buckets[i][j].pointer_t));
                */
                }
            }
            for(int i = 0; i < wbSketch.relationNum; ++i){

                dos.writeInt(wbSketch.relations.get(i).srcID);
                dos.writeInt(wbSketch.relations.get(i).dstID);
                dos.writeInt(wbSketch.relations.get(i).nextRel);
                dos.writeInt(wbSketch.relations.get(i).preRel);
                dos.writeInt(wbSketch.relations.get(i).nextRec);

            /*
                osw.write(CtoLH(wbSketch.relations.get(i).srcID));
                osw.write(CtoLH(wbSketch.relations.get(i).dstID));
                osw.write(CtoLH(wbSketch.relations.get(i).nextRel));
                osw.write(CtoLH(wbSketch.relations.get(i).preRel));
                osw.write(CtoLH(wbSketch.relations.get(i).nextRec));
            */
            }
            for(int i = 0; i < wbSketch.recordNum; ++i){

                dos.writeInt(wbSketch.records.get(i).relID);
                dos.writeInt(wbSketch.records.get(i).nextRec);

            /*
                osw.write(CtoLH(wbSketch.records.get(i).relID));
                osw.write(CtoLH(wbSketch.records.get(i).nextRec));
            */
            }
            dos.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }

}


