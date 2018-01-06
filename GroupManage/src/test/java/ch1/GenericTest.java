package ch1;
import java.util.ArrayList;
import java.util.List;

public class GenericTest {

    public static void main(String[] args) {
        List<String> list = new ArrayList<String>();
        list.add("CUIT");
        list.add("网络空间安全");
        list.add("100");

        for (int i = 0; i < list.size(); i++) {
            String name = (String) list.get(i); // 1
            System.out.println("name:" + name);
        }
    }
}
