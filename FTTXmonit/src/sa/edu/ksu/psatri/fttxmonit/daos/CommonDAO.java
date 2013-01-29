package sa.edu.ksu.psatri.fttxmonit.daos;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class CommonDAO {
	static Connection currentCon = null; 
	static ResultSet result = null; 
	static Statement stmt = null;
	protected static void executeQuery(String sqlString) throws SQLException {
		init(); 
		result = stmt.executeQuery(sqlString);
	} 
	
	protected static void executeInsertAutoGenKeys(String sqlString) throws SQLException {
		init(); 
	    stmt.executeUpdate(sqlString,Statement.RETURN_GENERATED_KEYS); 
		result = stmt.getGeneratedKeys();
	} 
	
	protected static int executeDelete(String sqlString) throws SQLException {
		init();
		result = null;
		return stmt.executeUpdate(sqlString);
	}

	protected static int executeUpdate(String sqlString) throws SQLException {
		init();
		result = null;
		return stmt.executeUpdate(sqlString);
	}

	private static void init() throws SQLException {
		currentCon = ConnectionManager.getConnection();  
		stmt = currentCon.createStatement();
	} 
}
