package neo4jAPI;

import org.neo4j.graphdb.*;
import org.neo4j.dbms.api.DatabaseManagementService;
import org.neo4j.dbms.api.DatabaseManagementServiceBuilder;
import org.neo4j.kernel.extension.ExtensionFactory;
import org.neo4j.service.Services;

import java.io.*;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import java.io.FileNotFoundException;
import java.io.PrintWriter;

public class InsertingByJava {
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
            long time_start = System.currentTimeMillis();
            InsertingNode(file, tx);
            long time_end = System.currentTimeMillis();
            long time_start1 = System.currentTimeMillis();
            InsertingRelationship(file, tx);
            long time_end1 = System.currentTimeMillis();
            System.out.println("node time " + (time_end - time_start));
            System.out.println("relationship time " + (time_end1 - time_start1));
            tx.commit();
            System.out.println("transaction success");
        } catch(Exception e){
            e.printStackTrace();
        } finally {
            dms.shutdown();
        }
    }

    public static void InsertingNode(File file, Transaction tx){
        try {
            InputStream in = new FileInputStream(file);
            byte[] temp = new byte[26];
            Set<Integer> set = new HashSet<>();
            //int threshold = 1000000;
            int cnt = 0;
            while(in.read(temp) != -1){
                if(++cnt == threshold){
                    break;
                }
                byte[] startByte = new byte[4];
                System.arraycopy(temp, 0, startByte, 0, 4);
                byte[] endByte = new byte[4];
                System.arraycopy(temp, 4, endByte, 0, 4);
                int startPoint = LHtoInt(startByte);
                int endPoint = LHtoInt(endByte);
                set.add(startPoint);
                set.add(endPoint);
            }
            for(int s : set){
                Node node = tx.createNode(MyLabels.PERSON);
                node.setProperty("NodeID", s);
            }
            in.close();
            System.out.println("reading node complete");
        } catch (Exception e){
            e.printStackTrace();
        }

    }

    public static void InsertingRelationship(File file, Transaction tx){
        try {
            
            PrintWriter out = new PrintWriter("./output.txt");
            InputStream in = new FileInputStream(file);
            byte[] temp = new byte[26];
            Set<Integer> set = new HashSet<>();
            long relID = 0;
            //int threshold = 1000000;
            int cnt = 0;
            while(in.read(temp) != -1){
                if(++cnt == threshold){
                    break;
                }
                if(cnt % 10000 == 0) {
                    System.out.print(".");
                }
                long startTime = System.nanoTime();
                byte[] startByte = new byte[4];
                System.arraycopy(temp, 0, startByte, 0, 4);
                byte[] endByte = new byte[4];
                System.arraycopy(temp, 4, endByte, 0, 4);
                int startPoint = LHtoInt(startByte);
                int endPoint = LHtoInt(endByte);
                Node start = tx.findNode(MyLabels.PERSON, "NodeID", startPoint);
                Node end = tx.findNode(MyLabels.PERSON, "NodeID", endPoint);
                Relationship relationship = start.createRelationshipTo(end, MyRelationshipTypes.HAVE_DEALT_WITH);
                relationship.setProperty("RelID", relID);
                relationship.setProperty("StartPoint", startPoint);
                relationship.setProperty("EndPoint", endPoint);
                relID++;
                long endTime = System.nanoTime();
                long duration = endTime - startTime;
                out.println(duration);
            }
            in.close();
        } catch (Exception e){
            e.printStackTrace();
        }
        System.out.println("reading relation complete");
    }

    public static int LHtoInt(byte[] b){
        int res = 0;
        for(int i = 0; i < b.length; ++i){
            res += (b[i] & 0xff) << (8 * i);
        }
        return res;
    }

    enum MyLabels implements Label{
        STUDENTS, GAYS, MOVIES, PERSON
    }

    enum MyRelationshipTypes implements RelationshipType{
        IS_GAYED_WITH, PROPOSE, AM, HAVE_DEALT_WITH
    }
}
