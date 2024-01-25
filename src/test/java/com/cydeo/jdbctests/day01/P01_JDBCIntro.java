package com.cydeo.jdbctests.day01;

import org.junit.jupiter.api.Test;

import java.sql.*;

public class P01_JDBCIntro {

    // connection String
    String dbURL = "jdbc:oracle:thin:@3.85.47.176:1521:XE";
    String dbUsername = "hr";
    String dbPassword = "hr";

    @Test
    public void Task1() throws SQLException {

        // Create connection
        // DriverManger class getConnection Method will help to connect database
        Connection conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

        // it will help us to execute queries
        Statement statement = conn.createStatement();

        //ResultSet will store data after execution.
        // It stores data (there is no table info)
        ResultSet rs = statement.executeQuery("select * from DEPARTMENTS where manager_id is not null");

        // 10- Administration-200-1700

        while (rs.next()){
            System.out.println(rs.getString(1)+" - "+rs.getString(2)+" - "+rs.getString(3)+" - "+rs.getString(4));
        }
        System.out.println("----------------------------------------");

        // Can we run multiple query in same connection?  YES!
        rs = statement.executeQuery("select * from LOCATIONS");
        // 1297 Via Cola di Rei - Roma
        while (rs.next()){
            System.out.println(rs.getString(2)+" - "+rs.getString(4));
        }





        //close connection
        rs.close();
        statement.close();
        conn.close();

    }
}
