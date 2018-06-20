package demo.util;

import com.mysql.jdbc.Driver;
import demo.model.IP;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * 2016/5/21.
 */

// TODO: 16-5-26 JDBC > MyBatis
public class DumpIp {
    private static final String FILE = "data/ip.txt";
    private static final java.lang.String URL = "jdbc:mysql:///db_examination?user=root&password=system";
    private static final java.lang.String SQL = "INSERT INTO db_examination.ip VALUES(NULL, inet_aton(?), inet_aton(?), ?)";
    private static List<IP> ips;

    private static void parse() {
        ips = new ArrayList<>();
        try (BufferedReader bufferedReader = new BufferedReader(new FileReader(FILE))) {
            String line, start, end, address;
            while ((line = bufferedReader.readLine()) != null) {
                start = line.split("\\s+")[0];
                end = line.split("\\s+")[1];
                address = line.replaceAll(start + "\\s+" + end, "").trim();
                IP ip = new IP(null, start, end, address);
                ips.add(ip);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static void dump() {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            new Driver();
            connection = DriverManager.getConnection(URL);
            connection.setAutoCommit(false);
            preparedStatement = connection.prepareStatement(SQL);
            for (IP ip : ips) {
                preparedStatement.setString(1, ip.getStart());
                preparedStatement.setString(2, ip.getEnd());
                preparedStatement.setString(3, ip.getAddress());
                preparedStatement.addBatch();
            }
            preparedStatement.executeBatch();
            connection.commit();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (preparedStatement != null) {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public static void main(String[] args) {
        parse();
        long start = System.currentTimeMillis();
        dump();
        System.out.println((System.currentTimeMillis() - start) / 1000 + " seconds.");
    }
}
