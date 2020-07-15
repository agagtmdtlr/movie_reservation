package time;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.SuperDAO;
import movie.MovieBean;
import reservation.ReservationBean;
import review.ReviewBean;

public class TimeDAO extends SuperDAO {

	public List<String> DateToMovie(String screen_date) {

		List<String> lists = new ArrayList<String>();
		String title;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select distinct title " + "from movies m join times t " + "on m.movie_no = t.movie_no "
				+ "where t.screen_date=?";

		try {
			conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);
			String temp = "2020/02/" + screen_date;
			pstmt.setString(1, temp);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				title = rs.getString("title");
				lists.add(title);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return lists;

	}

	public List<String> MovieToTheater(String screen_date, String title) {

		List<String> lists = new ArrayList<String>();
		String theater;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select distinct th.address " + " from theaters th join ( screens s join ( times t join movies m "
				+ " on t.movie_no=m.movie_no and t.screen_date = ? ) "
				+ " on s.screen_no = t.screen_no and m.title = ?) " + " on th.theater_no = s.theater_no";

		try {
			conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);
			String temp = "2020/02/" + screen_date;
			pstmt.setString(1, temp);
			pstmt.setString(2, title);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				theater = rs.getString("address");
				lists.add(theater);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return lists;

	}

	// 극장에서 시간
	public List<String[]> TheaterToTime(String screen_date, String title, String theater) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String[]> times = new ArrayList<String[]>();

		String sql = "select distinct to_char(start_time,'hh24:mi') as start_time , to_char(t.start_time + (s_time/(24*60)), 'hh24:mi') as end_time "
				+ " from theaters th join ( screens s join ( times t join movies m "
				+ " on t.movie_no=m.movie_no and t.screen_date = ? ) "
				+ " on s.screen_no = t.screen_no and m.title = ? )  "
				+ " on th.theater_no = s.theater_no and th.address = ? ";

		try {
			conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);
			String temp = "2020/02/" + screen_date;
			pstmt.setString(1, temp);
			pstmt.setString(2, title);
			pstmt.setString(3, theater);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				String[] time = new String[2];
				time[0] = rs.getString("start_time");
				time[1] = rs.getString("end_time");
				times.add(time);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		if (times.isEmpty())
			return null;
		return times;

	}

	// 시간에서 상영관
	public List<Integer> TimeToScreen(String screen_date, String title, String theater, String start_time) {

		List<Integer> lists = new ArrayList<Integer>();
		int room;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = " select distinct s.room " 
				+ " from theaters th join ( screens s join ( times t join movies m "
				+ " on t.movie_no=m.movie_no and t.screen_date=? ) " + " on s.screen_no = t.screen_no and m.title=? ) "
				+ " on th.theater_no = s.theater_no and th.address=? " + " and t.start_time = to_date(?,'hh24:mi') ";

		try {
			conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);
			String temp = "2020/02/" + screen_date;
			pstmt.setString(1, temp);
			pstmt.setString(2, title);
			pstmt.setString(3, theater);
			pstmt.setString(4, start_time);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				room = rs.getInt("room");
				lists.add(room);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return lists;

	}

	// 시간번호 가져오기
	public int GetTime_no(String screen_date, String title, String theater, String start_time, int room) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int time_no = 0;

		String sql = " select distinct t.time_no " + " from theaters th join ( screens s join ( times t join movies m "
				+ " on t.movie_no=m.movie_no and t.screen_date=? ) " + " on s.screen_no = t.screen_no and m.title=? ) "
				+ " on th.theater_no = s.theater_no and th.address=? "
				+ " and t.start_time = to_date(?,'hh24:mi') and s.room = ? ";

		try {
			conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);
			String temp = "2020/02/" + screen_date;
			pstmt.setString(1, temp);
			pstmt.setString(2, title);
			pstmt.setString(3, theater);
			pstmt.setString(4, start_time);
			pstmt.setInt(5, room);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				time_no = rs.getInt("time_no");
			} else {
				time_no = -1;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return time_no;
	}

	// 시간 번호로 영화번호, 상영번호, 상영일, 상영시간 가져오기
	public TimeBean SelectByTime_no(int time_no) {
		
		TimeBean time = null;
		
		
		Connection conn = null ;
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		String sql = "select distinct m.title as title, th.address as address, s.room as room, t.screen_date as screen_date , " + 
				"to_char(start_time, 'HH24:MI') as start_time, to_char(t.start_time + (m.s_time/(24*60)), 'hh24:mi') as end_time " + 
				"from theaters th join (screens s join (times t join movies m " + 
				"on t.movie_no = m.movie_no and time_no= ? ) " + 
				"on s.screen_no = t.screen_no) " + 
				"on s.theater_no = th.theater_no"; 
		
		try {
			conn = super.getConnection() ;
			pstmt = conn.prepareStatement(sql) ;
			pstmt.setInt(1, time_no);
			rs = pstmt.executeQuery() ;
			
			if (rs.next()) {
				time = new TimeBean();
				time.setTitle(rs.getString("title"));
				time.setAddress(rs.getString("address"));
				time.setRoom(rs.getInt("room"));
				time.setScreen_date(rs.getString("screen_date"));
				time.setStart_time(rs.getString("start_time"));
				time.setEnd_time(rs.getString("end_time"));	
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
		
		return time;
	}

	
	
	// 잔여 좌석 가져오기
	public int GetSeat_state(String screen_date, String title, String theater, String start_time, int room) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int rest = 0;

		String sql = " select s.seat - re.seat_state as rest " + 
				"from re_statement re join ( theaters th join ( screens s join ( times t join movies m " + 
				"on t.movie_no=m.movie_no and t.screen_date= ? ) " + 
				"on s.screen_no = t.screen_no and m.title= ? )  " + 
				"on th.theater_no = s.theater_no and th.address=? and t.start_time = to_date( ? ,'hh24:mi') and s.room = ? ) " + 
				"on t.time_no=re.time_no  ";

		try {
			conn = super.getConnection();
			pstmt = conn.prepareStatement(sql);
			String temp = "2020/02/" + screen_date;
			pstmt.setString(1, temp);
			pstmt.setString(2, title);
			pstmt.setString(3, theater);
			pstmt.setString(4, start_time);
			pstmt.setInt(5, room);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				rest = rs.getInt("rest");
			} else {
				rest = -1;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return rest;
	}
	
}
