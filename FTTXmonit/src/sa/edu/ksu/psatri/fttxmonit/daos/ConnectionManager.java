package sa.edu.ksu.psatri.fttxmonit.daos;

import java.sql.*; 

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
public class ConnectionManager {
	static Connection myConnection; 
	static String url; 
	public static Connection getConnection() {
		
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource) envCtx.lookup("jdbc/fttxDatasource");
			myConnection = ds.getConnection();	        
		} catch (Exception ex) {
			ex.printStackTrace();
		} 
		return myConnection; 
	} 
}
			
		
	
