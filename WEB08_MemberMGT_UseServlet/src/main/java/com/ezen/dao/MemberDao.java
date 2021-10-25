package com.ezen.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDao {
	// 싱글턴 설정
	private MemberDao() {}
	private static MemberDao ist = new MemberDao();
	public static MemberDao getInstance() {return ist;}
	
	// 연결 객체 준비
	Connection con = null;
	PreparedStatement pstmt= null;
	ResultSet rs = null;
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	
	private Connection getConnection() {
		Connection con = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, "scott", "tiger");
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
	
	private void close() {
		try {
			if(rs!=null)
				rs.close();
			if(pstmt!=null)
				pstmt.close();
			if(con!=null)
				con.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
}
