package com.cydeo.jdbctests.day02;

import com.cydeo.jdbctests.utility.DB_Util;
import org.junit.jupiter.api.Test;

import java.util.List;
import java.util.Map;

public class P02_DBUtilsPractice {

    @Test
    public void Task1(){
        // create a connection
        DB_Util.createConnection();

        // run query
        DB_Util.runQuery("Select first_name, last_name, salary from Employees");

        // get result
        System.out.println("--------Get me first row first column----------");
        System.out.println(DB_Util.getFirstRowFirstColumn());

        System.out.println("--------Get me all column names----------");
        System.out.println(DB_Util.getAllColumnNamesAsList());

        System.out.println("--------Get me all first names----------");
        System.out.println(DB_Util.getColumnDataAsList("FIRST_name"));

        System.out.println("--------Get me how many rows we have----------");
        System.out.println(DB_Util.getRowCount());

        System.out.println("--------Get me certain row info----------");
        System.out.println(DB_Util.getRowMap(1));

        System.out.println("--------Get me as list----------");
        System.out.println(DB_Util.getRowDataAsList(2));

        List<Map<String, String>> allRowAsListOFMAp =  DB_Util.getAllRowAsListOfMap();

        for (Map<String, String> rowMap : allRowAsListOFMAp) {
            System.out.println(rowMap);
        }






        //close the connection
        DB_Util.destroy();


    }







}
