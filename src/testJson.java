import net.sf.json.JSONArray;

import java.util.ArrayList;
import java.util.List;

public class testJson {
    private static List<String> testDatas = new ArrayList<>();

    public static void main(String[] args){
        testDatas.add("ajax");
        testDatas.add("php");
        testDatas.add("java");
        testDatas.add("mysql");

        System.out.println(JSONArray.fromObject(testDatas));

    }
}
