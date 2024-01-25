package com.cydeo.jdbctests.day01;

import org.junit.jupiter.api.Test;

import java.sql.*;

public class P03_MetaData {

    String dbURL = "jdbc:oracle:thin:@3.85.47.176:1521:XE";
    String dbUsername = "hr";
    String dbPassword = "hr";

    @Test
    public void Task1() throws SQLException {
        Connection conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

        Statement statement = conn.createStatement
                (ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        // ResultSet.TYPE_SCROLL_INSENSITIVE --> to do flexible navigation between rows
        // ResultSet.CONCUR_READ_ONLY) --> do not update anything from database, only read

        ResultSet rs = statement.executeQuery
                ("select FIRST_NAME, LAST_NAME, SALARY from EMPLOYEES where rownum < 6");

        // DatabaseMetaData
        DatabaseMetaData dbMetaData = conn.getMetaData();

        System.out.println(dbMetaData.getUserName());  // hr
        System.out.println(dbMetaData.getDatabaseProductName());
        System.out.println(dbMetaData.getDatabaseProductVersion());
        System.out.println(dbMetaData.getDriverName());

        //ResultSetMetaData
        ResultSetMetaData rsmd = rs.getMetaData();

        // how many columns we have
        int columnCount = rsmd.getColumnCount();
        System.out.println("columnCount = " + columnCount);

        // get me column name for index 2
        System.out.println("rsmd.getColumnName(2) = " + rsmd.getColumnName(2));

        System.out.println("-----------------COLUMN NAMES-------------------------");

        // print all column names dynamically
        for (int i = 1; i <= columnCount; i++) {
            System.out.println("ColumnName = " + rsmd.getColumnName(i));

        }


        /*
         ResultSet --> it holds table data
            rs.next() --> it iterate each row dynamically (with while loop)
                rs.getString(columnIndex) --> to retrieve data itself
                rs.getString(columnName)
        ResultSetMetaData --> it holds table info (columnNames - columnCount)
                rsmd.getColumnCount() --> how many column we have
                rsmd.getColumnName(index nr) --> it will give specific column name

         */


        // write a code that prints whole table info wor every query.
        // columnName - columnValue
        // EMPLOYEE_ID - 100 or FIRST_NAME - Steven

        System.out.println("-----------PRINT ALL DATA DYNAMICALLY--------------");

        // iterate through each row
        while (rs.next()) {
//            // whatever we do, we will do for each row
//            // REGION_ID - 1 REGION_Name - Europe
//            // REGION_ID 2 REGION_NAME - Americas
//            System.out.println(rsmd.getColumnName(1) + " - " + rs.getString(1));
//            System.out.println(rsmd.getColumnName(2) + " - " + rs.getString(2));

            for (int i = 1; i <= columnCount; i++) {
                System.out.print(rsmd.getColumnName(i) + " - " + rs.getString(i)+ " ");

            }
            System.out.println();

        }






        //close connection
        rs.close();
        statement.close();
        conn.close();


    }
}
