package edu.uis.csc478.timemanagement;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class SQLTest {

    public static void main(String[] args) throws SQLException {

        // Connect to database
        String hostName = "jma46.database.windows.net"; // update me
        String dbName = "timemanagement"; // update me
        String user = "jma46"; // update me
        String password = "x^RGM0wc@v7l$&Yd"; // update me
        String url = String.format("jdbc:sqlserver://%s:1433;database=%s;user=%s;password=%s;encrypt=true;"
            + "hostNameInCertificate=*.database.windows.net;loginTimeout=30;", hostName, dbName, user, password);
        Connection connection = null;

        try {
            connection = DriverManager.getConnection(url);
            
            DatabaseMetaData meta = connection.getMetaData();
            ResultSet res = meta.getTables(null, null, null, new String[] {"TABLE"});
            System.out.println("List of tables: "); 
            while (res.next()) {
               System.out.println(
                  "   "+res.getString("TABLE_CAT") 
                 + ", "+res.getString("TABLE_SCHEM")
                 + ", "+res.getString("TABLE_NAME")
                 + ", "+res.getString("TABLE_TYPE")
                 + ", "+res.getString("REMARKS")); 
            }
            res.close();
            
            queryEmployee(connection);
            
//            String sql = "insert into Employee(id, name, password) values (100, 'Jack Ma', 'jack123')";
//            Statement stmt = connection.createStatement();
//            stmt.executeUpdate(sql);
//            stmt.close();
//            
//            queryEmployee(connection);
        } finally {
        	connection.close();
        }
    }
    
    private static void queryEmployee(Connection connection) throws SQLException {
    	Statement stmt = connection.createStatement();
        
        String sql = "SELECT * FROM Employee";
        ResultSet rs = stmt.executeQuery(sql);
        
        ResultSetMetaData rsmd = rs.getMetaData();
        List<String> columnNames = new ArrayList<>();
        for (int i = 1; i <= rsmd.getColumnCount(); i++) {
        	String name = rsmd.getColumnName(i);
        	columnNames.add(name);
        }
        System.out.println();
        for (String c : columnNames) {
        	System.out.print(c + "    ");
        }
        System.out.println();
        
        while(rs.next()) {
        	for (String c : columnNames) {
            	System.out.print(rs.getObject(c) + "    ");
            }
        	System.out.println();
        }
        stmt.close();
    }
}