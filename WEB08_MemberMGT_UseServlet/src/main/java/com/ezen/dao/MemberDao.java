package com.ezen.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ezen.dto.MemberDto;

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

	public MemberDto getMember(String id) {
		MemberDto mdto = null;
		
		con = getConnection();
		String sql = "select * from member where userid= ?";
		try {
			 pstmt = con.prepareStatement(sql);
			 pstmt.setString(1, id);
			 rs = pstmt.executeQuery();
			 if(rs.next()) {
				 mdto = new MemberDto();
				 mdto.setName(rs.getString("name"));
				 mdto.setUserid(rs.getString("userid"));
				 mdto.setUserpwd(rs.getString("userpwd"));
				 mdto.setEmail(rs.getString("email"));
				 mdto.setPhone(rs.getString("phone"));
				 mdto.setAdmin(rs.getString("admin"));
			 }
		}catch(SQLException e) {
			e.printStackTrace();
		}
		close();
		return mdto;
	}

	public int confirmID(String userid){
		int result = 0;
		con = getConnection();
		
		String sql = "select * from member where userid= ?";
		try {
			 pstmt = con.prepareStatement(sql);
			 pstmt.setString(1, userid);
			 rs = pstmt.executeQuery();
			 if(rs.next()) { // 사용 중
				 result = 1;
			 }else { // 사용가능
				 result = -1;
			 }
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		close();
		return result;
	}

	public int insertMember(MemberDto mdto) {
		int result = 0;
		
		con = getConnection();
		
		String sql = "";
		try {
			 pstmt = con.prepareStatement(sql);
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		close();
		return result;
	}
}
