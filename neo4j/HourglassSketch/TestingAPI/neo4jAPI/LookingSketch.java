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

public class LookingSketch {
    public static void main(String[] args){
        File sketchFile = new File("./WCSketch/neo4j");
        WCSketch wcSketch = WCSketch.loadFromFile(sketchFile);
        System.out.println("length: " + wcSketch.length);
        System.out.println("relNum: " + wcSketch.relationNum);
        System.out.println("recNum: " + wcSketch.recordNum);
        int cntRel = 0;
        int lenRel = 0;
        int maxRel = 0;
        for(int i = 0; i < wcSketch.length; ++i){
            for(int j = 0; j < wcSketch.length; ++j){
                if(wcSketch.buckets[i][j].pointer_h != -1){
                    cntRel++;
                    lenRel += wcSketch.buckets[i][j].counter;
                    if(wcSketch.buckets[i][j].counter > maxRel){
                        maxRel = wcSketch.buckets[i][j].counter;
                    }

                }
            }
        }
        System.out.println("bucket cnt:" + cntRel);
        System.out.println("average length of hanging linked list：" + ((double) lenRel) / cntRel);
        System.out.println("longest length of hanging linked list" + maxRel);
        System.out.println("average length of edge linked list" + ((double) wcSketch.recordNum) / wcSketch.relationNum);
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

