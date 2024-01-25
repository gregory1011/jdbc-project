package com.cydeo.jdbctests.day02;

import org.junit.jupiter.api.Test;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class P01_ListOfMaps {

    String dbURL = "jdbc:oracle:thin:@3.85.47.176:1521:XE";
    String dbUsername = "hr";
    String dbPassword = "hr";


    @Test
    public void task1() {

        System.out.println("------------ROW MAP 1-------------");
        Map<String, Object> rowMap1 = new HashMap<>();

        rowMap1.put("FIRST_NAME ", "Steven");
        rowMap1.put("LAST_NAME", "King");
        rowMap1.put("Salary", 24000);
        System.out.println(rowMap1);

        System.out.println("------------ROW MAP 2-------------");
        Map<String, Object> rowMap2 = new HashMap<>();

        rowMap2.put("FIRST_NAME ", "Neena");
        rowMap2.put("LAST_NAME", "Kochhar");
        rowMap2.put("Salary", 17000);
        System.out.println(rowMap2);

        List<Map<String, Object>> dataList = new ArrayList<>();
        // we will put each of the wor map of the list
        dataList.add(rowMap1);
        dataList.add(rowMap2);

        System.out.println(dataList);

        System.out.println(dataList.get(0).get("LAST_NAME"));  // King
        System.out.println(dataList.get(1).get("LAST_NAME"));  // Kochhar


    }


    @Test
    public void task2() throws SQLException {

        Connection conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

        Statement statement = conn.createStatement
                (ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        // ResultSet.TYPE_SCROLL_INSENSITIVE --> to do flexible navigation between rows
        // ResultSet.CONCUR_READ_ONLY) --> do not update anything from database, only read

        ResultSet rs = statement.executeQuery
                ("select FIRST_NAME, LAST_NAME, SALARY from EMPLOYEES where rownum < 6");


        // create rsmd to get column name and count

        ResultSetMetaData rsmd = rs.getMetaData();


        System.out.println("------------ROW MAP 1-------------");
        Map<String, Object> rowMap1 = new HashMap<>();

        rs.next(); // we need to move first row to fill rowMap1
        rowMap1.put(rsmd.getColumnName(1), rs.getString(1));
        rowMap1.put(rsmd.getColumnName(2), rs.getString(2));
        rowMap1.put(rsmd.getColumnName(3), rs.getInt(3));
        System.out.println(rowMap1);

        System.out.println("------------ROW MAP 2-------------");
        Map<String, Object> rowMap2 = new HashMap<>();

        rs.next();  // move pointer to 2nd row
        rowMap2.put(rsmd.getColumnName(1), rs.getString(1));
        rowMap2.put(rsmd.getColumnName(2), rs.getString(2));
        rowMap2.put(rsmd.getColumnName(3), rs.getInt(3));
        System.out.println(rowMap2);

        System.out.println("------------ROW MAP 3-------------");
        System.out.println("-------------------------");

        Map<String, Object> rowMap3 = new HashMap<>();

        rs.next();  // move pointer to 2nd row
        rowMap3.put(rsmd.getColumnName(1), rs.getString(1));
        rowMap3.put(rsmd.getColumnName(2), rs.getString(2));
        rowMap3.put(rsmd.getColumnName(3), rs.getInt(3));
        System.out.println(rowMap3);

        List<Map<String, Object>> dataList = new ArrayList<>();
        // we will put each of the wor map of the list
        dataList.add(rowMap1);
        dataList.add(rowMap2);
        dataList.add(rowMap3);

        System.out.println(dataList);
        System.out.println(dataList.get(0).get("LAST_NAME"));  // King
        System.out.println(dataList.get(1).get("SALARY"));  // Kochhar


        //close connection
        rs.close();
        statement.close();
        conn.close();

    }


    @Test
    public void task3() throws SQLException {

        Connection conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

        Statement statement = conn.createStatement
                (ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        // ResultSet.TYPE_SCROLL_INSENSITIVE --> to do flexible navigation between rows
        // ResultSet.CONCUR_READ_ONLY) --> do not update anything from database, only read

        ResultSet rs = statement.executeQuery
                ("select FIRST_NAME, LAST_NAME, SALARY from EMPLOYEES where rownum < 6");


        // create rsmd to get column name and count
        ResultSetMetaData rsmd = rs.getMetaData();

        // Create your list of map to keep info
        List<Map<String, Object>> dataList = new ArrayList<>();

        // how many columns we have
        int columnCount = rsmd.getColumnCount();

        // iterate to each row
        while (rs.next()) {

            // create an empty map to hold row of info
            Map<String, Object> rowMap = new HashMap<>();

            // iterate each column dynamically to fill the map
            for (int i = 1; i <= columnCount; i++) {
                //MAP: key =columnName, value =columnValue;
                rowMap.put(rsmd.getColumnName(i), rs.getString(i));
            }
            // System.out.println();
            // add the one row info to the list
            dataList.add(rowMap);


        }


        for (Map<String, Object> row : dataList) {
            System.out.println(row);

        }


        //close connection
        rs.close();
        statement.close();
        conn.close();

    }

}
