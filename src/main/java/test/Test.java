package test;

import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 * Created by Administrator on 16-5-18.
 */
public class Test {
    public static void main(String[] args) throws ParseException {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String s = "2016-5-11";
        System.out.println(simpleDateFormat.parse(s));
    }
}
