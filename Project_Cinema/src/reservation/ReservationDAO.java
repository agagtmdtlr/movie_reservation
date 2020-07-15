package reservation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.SuperDAO;
import movie.MovieBean;
import review.ReviewBean;

public class ReservationDAO extends SuperDAO {

	public int InsertReservation(ReservationBean bean, Re_StatementBean rebean) {
		Connection conn = null ;
		PreparedStatement pstmt1 = null ;
		PreparedStatement pstmt2 = null ;
		
		String sql1 = "insert into reservations values(reservations_seq.nextval, ?, ?, ?)" ;
		String sql2 = " update re_statement set seat_state = seat_state + ? where time_no = ? ";
		int cnt = -1 ;
		
		try {
			conn = super.getConnection() ;
			conn.setAutoCommit(false);
			pstmt1 = conn.prepareStatement(sql1) ;
			
			//치환 작업은 실행 전에 해야 한다.
			pstmt1.setString(1, bean.getId());
			pstmt1.setInt(2, bean.getTime_no());
			pstmt1.setInt(3, bean.getCount());
		
			cnt = pstmt1.executeUpdate() ;
			
			
			
			pstmt2 = conn.prepareStatement(sql2) ;
			pstmt2.setInt(1, rebean.getSeat_state());
			pstmt2.setInt(2, rebean.getTime_no());
			
			cnt = pstmt2.executeUpdate() ;
			
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
				if (pstmt1 != null) {
					pstmt1.close();
				}
				if (pstmt2 != null) {
					pstmt2.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return cnt ;
	}
	
	
	// 아이디로 예매내역 가져오기(예매번호, 시간번호, 예매한 좌석 수)
	public List<ReservationBean> SelectById(String id) {
		
		List<ReservationBean> lists = new ArrayList<ReservationBean>();
		
		Connection conn = null ;
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		String sql = "select * from reservations where id=?" ; 
		
		try {
			conn = super.getConnection() ;
			pstmt = conn.prepareStatement(sql) ;
			pstmt.setString(1, id);
			rs = pstmt.executeQuery() ;
			
			while(rs.next()) {
				ReservationBean reservation = new ReservationBean();
				reservation.setReservation_no(rs.getInt("reservation_no"));
				reservation.setTime_no(rs.getInt("time_no"));
				reservation.setCount(rs.getInt("count"));
				lists.add(reservation) ;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if( rs != null ){rs.close();}
				if( pstmt != null ){pstmt.close();}
				if( conn != null ){conn.close();}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return lists;
	}
	
	
	// 예매 취소
	public int DeleteReservation(int reservation_no, int time_no, int count) {
		Connection conn = null ;
		PreparedStatement pstmt1 = null ;
		PreparedStatement pstmt2 = null ;
		
		String sql1 = "delete from reservations where reservation_no=?" ; 
		String sql2 = " update re_statement set seat_state = seat_state - ? where time_no = ? ";
		int cnt = -1;
		
		try {
			conn = super.getConnection() ;
			conn.setAutoCommit(false);
			pstmt1 = conn.prepareStatement(sql1) ;
			
			pstmt1.setInt(1, reservation_no);
			cnt = pstmt1.executeUpdate() ;
			
			pstmt2 = conn.prepareStatement(sql2) ;
			pstmt2.setInt(1, count);
			pstmt2.setInt(2, time_no);
			
			cnt = pstmt2.executeUpdate() ;
			
			conn.commit();
		} catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}finally {
			try {
				if(pstmt1 != null) {pstmt1.close();}
				if(pstmt2 != null) {pstmt2.close();}
				if(conn != null) {conn.close();}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return cnt ;
	}
		
}
