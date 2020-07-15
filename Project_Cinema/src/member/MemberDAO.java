package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.SuperDAO;

public class MemberDAO extends SuperDAO {
	public MemberBean LoginCheck(String id, String password) {
		Connection conn = null ;
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		String sql = " select * from members " ; 
		sql += " where id = ? and password = ? " ; 
		MemberBean member = null ;
		try {
			conn = super.getConnection() ;
			pstmt = conn.prepareStatement(sql) ;
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery() ;
			
			if (rs.next()) { // 아이디와 비번이 일치하면
				member = new MemberBean();
				member.setId( rs.getString("id") );
				member.setName( rs.getString("name") );
				member.setPassword( rs.getString("password") );
				member.setPhone(rs.getString("phone") );
				member.setEmail(rs.getString("email"));
				member.setAddress(rs.getString("address"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null){rs.close();}
				if(pstmt != null){pstmt.close();}
				if(conn != null){conn.close();}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return member;
	}	
	
	// 회원 가입
	public int InsertData(MemberBean bean) {
		Connection conn = null ;
		PreparedStatement pstmt = null ;
		
		String sql = " insert into members(id, name, password, phone, email, address) values(?, ?, ?, ?, ?, ?) " ;
		int cnt = -1 ;
		try {
			conn = super.getConnection() ;
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql) ;
			//치환 작업은 실행 전에 해야 한다.
			pstmt.setString(1, bean.getId()); 
			pstmt.setString(2, bean.getName());
			pstmt.setString(3, bean.getPassword());
			pstmt.setString(4, bean.getPhone());
			pstmt.setString(5, bean.getEmail());
			pstmt.setString(6, bean.getAddress());
			
			cnt = pstmt.executeUpdate() ;
			
			conn.commit();
		} catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}finally {
			try {
				if(pstmt != null) {pstmt.close();}
				if(conn != null) {conn.close();}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return cnt ;
	}
}
