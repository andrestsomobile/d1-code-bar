package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;



public class beanConnectorSLI  extends beanConnector {
Connection cx = null;
Statement query;
 public	beanConnectorSLI() {
	} 

	public ResultSet executeQuery(String cadena) throws SQLException {
		System.out.println(cadena);

		try {
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			String databaseURL =  "jdbc:odbc:sli";
			cx =DriverManager.getConnection(databaseURL, "", "");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		   catch(ClassNotFoundException e) {
				System.err.println("JdbcOdbc Bridge Driver not found!");
				}

		   
			query = cx.createStatement();
			
            ResultSet res =null;
			try {
			 res = query.executeQuery(cadena);
			}
			catch(SQLException EX) {  throw EX; }
		 
			return res;
	} 


	
	
	public static void main(String[] args) {
		beanConnectorSLI bsli = new beanConnectorSLI();
		try {
			bsli.executeQuery("select * from usuario");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	
	
	}
