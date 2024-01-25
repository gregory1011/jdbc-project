package com.cydeo.jdbctests;

import java.sql.*;

public class TestOracleConnection {


    public static void main(String[] args) throws SQLException {
        // connection String
        String dbURL = "jdbc:oracle:thin:@3.85.47.176:1521:XE";
        String dbUsername = "hr";
        String dbPassword = "hr";


        // Create connection
        // DriverManger class getConnection Method will help to connect database
        Connection conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

        // it will help us to execute queries
        Statement statement = conn.createStatement();

        //ResultSet will store data after execution.
        // It stores data (there is no table info)
        ResultSet rs = statement.executeQuery("select * from EMPLOYEES");

        // getting data
//        rs.next();
//        System.out.println("----------------FIRST ROW------------------");
//
//        // right now pointer is in the first row.
//
//        // how to get data from first row
//        System.out.println(rs.getInt(1));
//        // this method returns integer. Index start from 1 in SQL. It refers to the column position
//
//        // get the Europe -region name
//        System.out.println(rs.getString(2));
//
//        // same information we can get with columnLabel not column index
//        System.out.println(rs.getInt("REGION_ID"));
//        System.out.println(rs.getString("REGION_NAME"));
//
//        // GET me second row result in fallowing format: 2 - Americas
//        System.out.println("----------------SECOND ROW------------------");
//        System.out.println(rs.next());
//
//        System.out.println(rs.getInt(1) + " - " + rs.getString("REGION_NAME"));
//
//
//        System.out.println("----------------THIRD ROW------------------");
//        System.out.println(rs.next());
//        System.out.println(rs.getInt("REGION_ID")+ " - "+ rs.getString(2));
//
//        System.out.println("----------------4TH ROW------------------");
//        System.out.println(rs.next());
//        System.out.println(rs.getInt("REGION_ID")+ " - "+ rs.getString(2));

        System.out.println("NEW------------------------------------------------NEW");
        // what if we have 100 rows, we want to print first and second column

        while( rs.next() ) {
            System.out.println(rs.getString(1)+ " - "+ rs.getString(2));

        }

        //close connection
        rs.close();
        statement.close();
        conn.close();





    }
}
