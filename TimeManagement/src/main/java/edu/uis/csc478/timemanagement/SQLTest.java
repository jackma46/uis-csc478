package edu.uis.csc478.timemanagement;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

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
        } finally {
        	connection.close();
        }
    }
}