package com.cydeo.jdbctests.day01;

import org.junit.jupiter.api.Test;

import java.sql.*;

public class P02_FlexibleNavigation {
    // connection String
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
                ("select FIRST_NAME, LAST_NAME from EMPLOYEES");

        // first row
        rs.next();
        System.out.println(rs.getString(1) + " - " + rs.getString(2));

        // 2nd row
        rs.next();
        System.out.println(rs.getString(1) + " - " + rs.getString(2));

        // 3rd row
        rs.next();
        System.out.println(rs.getString(1) + " - " + rs.getString(2));

        // what if I want to get the last row data
        rs.last();
        System.out.println(rs.getString(1) + " - " + rs.getString(2));

        // how many rows we have 
        int rowNumbers = rs.getRow(); // the current row number; 0 if there is no current rows
        System.out.println("rowNumbers = " + rowNumbers);

        System.out.println("---------------ABSOLUTE--------------------");
        rs.absolute(46);
        System.out.println(rs.getString(1) + " - " + rs.getString(2));  // Alexander

        System.out.println("---------------PREVIOUS--------------------");

        rs.previous();
        System.out.println(rs.getString(1) + " - " + rs.getString(2));  // Guy HImuro

        // print whole table
        rs.first(); //  jump to first row

        rs.beforeFirst();  // jump into before first row

        System.out.println("------------------PRINTING TABLE-----------------");

        while (rs.next()){
            System.out.println(rs.getString(1) + " - " + rs.getString(2));  // Guy HImuro

        }







        //close connection
        rs.close();
        statement.close();
        conn.close();
    }
}
