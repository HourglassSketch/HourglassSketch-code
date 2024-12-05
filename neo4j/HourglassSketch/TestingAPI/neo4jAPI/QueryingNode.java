package neo4jAPI;

import org.neo4j.cypher.internal.expressions.In;
import org.neo4j.dbms.api.DatabaseManagementService;
import org.neo4j.dbms.api.DatabaseManagementServiceBuilder;
import org.neo4j.graphdb.*;
import org.parboiled.common.Tuple2;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Random;

public class QueryingNode {        
    public static Random random = new Random();

    public static int hash(String key, int seed) {
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
    public static int threshold = 700000;
    public static void main(String[] args){
        String pathName = "/root/neo4j/Wind-Bell-Index/packaging/standalone/target/neo4j-community-4.2.0-SNAPSHOT";
        String dataset = "/root/neo4j/Wind-Bell-Index/TestingAPI/20.dat";
        String dbName = "neo4j";
        File dataBaseFile = new File(pathName);
        DatabaseManagementServiceBuilder dmsb = new DatabaseManagementServiceBuilder(dataBaseFile);
        DatabaseManagementService dms = dmsb.build();
        GraphDatabaseService db = dms.database(dbName);        
        try (Transaction tx = db.beginTx()) {
            File file = new File(dataset);
            InputStream in = new FileInputStream(file);
            byte[] temp = new byte[26];
            Set<Integer> set = new HashSet<>();
            //int threshold = 1000000;
            int cont = 0;
            while(in.read(temp) != -1){
                if(++cont == threshold){
                    break;
                }
                byte[] startByte = new byte[4];
                System.arraycopy(temp, 0, startByte, 0, 4);
                byte[] endByte = new byte[4];
                System.arraycopy(temp, 4, endByte, 0, 4);
                int startPoint = LHtoInt(startByte);
                int endPoint = LHtoInt(endByte);
                set.add(startPoint);
                System.out.println(startPoint);
            }
            long time_start = System.currentTimeMillis();
            int cnt = 0;
            try{
                PrintWriter out1 = new PrintWriter("./output_sketch.txt");
                for(Integer s : set){
                    //System.out.println("startP " + s.a);
                    //System.out.println("endP " + s.b);
                    int a = s;              
                    long startTime = System.nanoTime();
                    int ans = 0;
                    for (int i = 0; i < 3; ++i) {
                        int src_index = hash(String.valueOf(s), i) % 203;
                        for (int j = 0; j < 200; ++j) {
                            ans += src_index + j;
                        }
                    }
                    long endTime = System.nanoTime();
                    long duration = endTime - startTime;                       
                    System.out.println(duration);
                    out1.println(duration);
                }
                tx.commit();
                in.close();
            } catch (FileNotFoundException e) {
                System.out.println("无法创建文件，检查文件路径是否正确或磁盘是否可写");
                e.printStackTrace();
            }

        } catch(Exception e){
            e.printStackTrace();
        }

        try{
            PrintWriter out2 = new PrintWriter("./output_neo4j.txt");
            try (Transaction tx = db.beginTx()) {
                System.out.println("in the tx");
                File file2 = new File(dataset);
                InputStream in2 = new FileInputStream(file2);
                byte[] temp = new byte[26];
                Set<Integer> set = new HashSet<>();
                //int threshold = 1000000;
                int cont = 0;
                while(in2.read(temp) != -1){
                    if(++cont == threshold){
                        break;
                    }
                    byte[] startByte = new byte[4];
                    System.arraycopy(temp, 0, startByte, 0, 4);
                    byte[] endByte = new byte[4];
                    System.arraycopy(temp, 4, endByte, 0, 4);
                    int startPoint = LHtoInt(startByte);
                    int endPoint = LHtoInt(endByte);
                    set.add(startPoint);                
                    // System.out.println(startPoint);
                }
                long time_start = System.currentTimeMillis();
                int cnt = 0;
                for(Integer s : set){
                    long startTime = System.nanoTime();
                    Node node = tx.findNode(MyLabels.PERSON, "NodeID", s);
                    Iterable<Relationship> re = node.getRelationships(MyRelationshipTypes.HAVE_DEALT_WITH);
                    for(Relationship relationship : re){
                        Integer sp = (Integer) relationship.getProperties("StartPoint").get("StartPoint");
                        if(sp.equals(s))
                            cnt++;
                    }
                    long endTime = System.nanoTime();
                    long duration = endTime - startTime;                
                    // out2.println(duration);                    
                    // System.out.println(duration);
                }
                tx.commit();
                in2.close();
                System.out.println("transaction success");
            } catch(Exception e){
                e.printStackTrace();
            }
        } catch (FileNotFoundException e) {
            System.out.println("无法创建文件，检查文件路径是否正确或磁盘是否可写");
            e.printStackTrace();
        }


    }

    public static int LHtoInt(byte[] b){
        int res = 0;
        for(int i = 0; i < b.length; ++i){
            res += (b[i] & 0xff) << (8 * i);
        }
        return res;
    }

    enum MyLabels implements Label {
        STUDENTS, GAYS, MOVIES, PERSON
    }

    enum MyRelationshipTypes implements RelationshipType{
        IS_GAYED_WITH, PROPOSE, AM, HAVE_DEALT_WITH
    }
}
