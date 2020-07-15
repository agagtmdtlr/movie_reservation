package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SuperDAO {
	
	protected String driver = "oracle.jdbc.driver.OracleDriver" ;
	protected String url = "jdbc:oracle:thin:@localhost:1521:xe" ;
	protected String id = "javaproject" ;
	protected String password = "oracle" ;	
	
	
	public SuperDAO() {
		try {
			Class.forName(driver) ;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	
	
	protected Connection getConnection() {
		Connection conn = null ;
		try {
			conn = DriverManager.getConnection(url, id, password);
		} catch (SQLException e) {			
			e.printStackTrace();
		}
		System.out.println( "접속 여부 : " + ( conn != null));
		return conn ;
	}
	
}
