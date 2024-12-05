package neo4jAPI;

import org.neo4j.dbms.api.DatabaseManagementService;
import org.neo4j.dbms.api.DatabaseManagementServiceBuilder;
import org.neo4j.graphdb.*;
import org.parboiled.common.Tuple2;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.HashSet;
import java.util.Set;

public class Triangle {
    public static int threshold = 700000;
    public static int threshold_t = 10000;
    public static void main(String[] args) {
        String pathName = "";
        String dataset = "";
        String dbName = "";
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
            while (in.read(temp) != -1) {
                if (++cont == threshold) {
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
            in.close();
            //WCSketch speed
            int time_cnt = 0;
            int cnt1 = 0;
            long time_start_s = System.currentTimeMillis();
            for(int s1 : set){
                for(int s2 : set){
                    for(int s3: set){
                        time_cnt++;
                        if(time_cnt == threshold_t) break;
                        if(s1 == s2 || s2 == s3 || s1 == s3)
                            continue;
                        cnt1 += findTri(s1, s2, s3, tx);
                    }
                }
            }
            long time_end_s = System.currentTimeMillis();
            long time_s = time_end_s - time_start_s;
            System.out.println("WCSketch:");
            System.out.println("cnt_s: " + cnt1);
            System.out.println("take time: " + time_s);
            //Neo4j JavaAPI speed
            int cnt2 = 0;
            time_cnt = 0;
            int cnt3 = 0;
            long time_start_n = System.currentTimeMillis();
            for(int s1 : set){
                for(int s2 : set){
                    for(int s3: set){
                        time_cnt++;
                        if(time_cnt == threshold_t) break;
                        if(s1 == s2 || s2 == s3 || s1 == s3)
                            continue;
                        cnt2 += findTriN(s1, s2, s3, tx);
                        cnt3++;
                    }
                }
            }
            long time_end_n = System.currentTimeMillis();
            long time_n = time_end_n - time_start_n;
            System.out.println("Neo4j:");
            System.out.println("cnt_n: " + cnt2);
            System.out.println("take time: " + time_n);
            tx.commit();
        } catch (Exception e){
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

    public static int findTri(int s1, int s2, int s3, Transaction tx){
        if(tx.getRelationships(s1, s2).hasNext() && tx.getRelationships(s2, s3).hasNext()
                && tx.getRelationships(s3, s1).hasNext())
            return 1;
        return 0;
    }

    public static int findTriN(int s1, int s2, int s3, Transaction tx){
        boolean flag1 = false;
        boolean flag2 = false;
        boolean flag3 = false;
        Node node1 = tx.findNode(MyLabels.PERSON, "NodeID", s1);
        Iterable<Relationship> re1 = node1.getRelationships(MyRelationshipTypes.HAVE_DEALT_WITH);
        for(Relationship relationship : re1){
            Integer sp = (Integer) relationship.getProperties("StartPoint").get("StartPoint");
            Integer ep = (Integer) relationship.getProperties("EndPoint").get("EndPoint");
            if(sp.equals(s1) && ep.equals(s2))
                flag1 = true;
        }
        Node node2 = tx.findNode(MyLabels.PERSON, "NodeID", s2);
        Iterable<Relationship> re2 = node2.getRelationships(MyRelationshipTypes.HAVE_DEALT_WITH);
        for(Relationship relationship : re2){
            Integer sp = (Integer) relationship.getProperties("StartPoint").get("StartPoint");
            Integer ep = (Integer) relationship.getProperties("EndPoint").get("EndPoint");
            if(sp.equals(s2) && ep.equals(s3))
                flag2 = true;
        }
        Node node3 = tx.findNode(MyLabels.PERSON, "NodeID", s3);
        Iterable<Relationship> re3 = node3.getRelationships(MyRelationshipTypes.HAVE_DEALT_WITH);
        for(Relationship relationship : re3){
            Integer sp = (Integer) relationship.getProperties("StartPoint").get("StartPoint");
            Integer ep = (Integer) relationship.getProperties("EndPoint").get("EndPoint");
            if(sp.equals(s3) && ep.equals(s1))
                flag3 = true;
        }
        if(flag1 && flag2 && flag3)
            return 1;
        return 0;
    }
    enum MyLabels implements Label {
        STUDENTS, GAYS, MOVIES, PERSON
    }

    enum MyRelationshipTypes implements RelationshipType{
        IS_GAYED_WITH, PROPOSE, AM, HAVE_DEALT_WITH
    }
}
