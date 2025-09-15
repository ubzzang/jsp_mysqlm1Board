package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class MysqlConnect {
	public Connection con;
	public Statement stmt;
	public PreparedStatement ps;
	public ResultSet rs;
	
	public MysqlConnect() {
		String url="jdbc:mysql://localhost:3306/jspdb";
		String id="lyb";
		String pw="1234";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection(url,id,pw);
			System.out.println("Mysql DB 연결 성공");
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			if(rs!=null) rs.close();
			if(stmt!=null)stmt.close();
			if(ps!=null)ps.close();
			if(con!=null)con.close();
			System.out.println("mysql db 자원 해제");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
