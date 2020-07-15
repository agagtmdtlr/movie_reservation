package movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.SuperDAO;

public class MovieDAO extends SuperDAO {
	
	public MovieBean SelectByPk(int movie_no) {
		
		MovieBean movie = null;
		
		Connection conn = null ;
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		String sql = "select movie_no, title, supervision, actor, "
				+ " to_char(relese_date, 'yyyy-mm-dd') as relese_date,"
				+ " genre1, genre2, image, video, intro, s_time "
				+ " from movies where movie_no = ?" ; 
		
		try {
			conn = super.getConnection() ;
			pstmt = conn.prepareStatement(sql) ;
			pstmt.setInt(1, movie_no);
			rs = pstmt.executeQuery() ;
			
			if (rs.next()) {
				movie = new MovieBean();
				movie.setMovie_no(rs.getInt("movie_no"));
				movie.setTitle((rs.getString("title")));
				movie.setSupervision((rs.getString("supervision")));
				movie.setActor(rs.getString("actor"));
				movie.setRelese_date((rs.getString("relese_date")));
				movie.setGenre1((rs.getString("genre1")));
				movie.setGenre2((rs.getString("genre2")));
				movie.setImage((rs.getString("image")));
				movie.setVideo((rs.getString("video")));
				movie.setIntro((rs.getString("intro")));
				movie.setS_time(rs.getInt("s_time"));
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
		
		return movie;
	}
	
	
	public List<MovieBean> SelectAll() {
		Connection conn = null ;
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		String sql = " select * from movies " ;
		List<MovieBean> lists = new ArrayList<MovieBean>();
		
		try {
			conn = super.getConnection() ;
			pstmt = conn.prepareStatement(sql) ;
			rs = pstmt.executeQuery() ;
			
			while(rs.next()) {
				MovieBean movie = new MovieBean();
				movie.setMovie_no(rs.getInt("movie_no"));
				movie.setTitle(rs.getString("title"));
				movie.setSupervision(rs.getString("supervision"));
				movie.setActor(rs.getString("actor"));
				movie.setRelese_date(String.valueOf( rs.getDate("relese_date")));
				movie.setGenre1(rs.getString("genre1"));
				movie.setGenre2(rs.getString("genre2"));
				movie.setImage(rs.getString("image"));
				movie.setVideo(rs.getString("video"));
				movie.setIntro(rs.getString("intro"));
				movie.setS_time(rs.getInt("s_time"));
				lists.add(movie) ;
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
	
	public int GetCount() {
		Connection conn = null ;
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		int cnt = -1; 
		String sql = " select count(*) as cnt from movies " ;
		
		try {
			conn = super.getConnection() ;
			pstmt = conn.prepareStatement(sql) ;
			rs = pstmt.executeQuery() ;
			
			if(rs.next()){ //데이터가 있으면
				cnt = rs.getInt("cnt") ;
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
		return cnt;
	}
	
	
	//제목 검색
	public List<MovieBean> SelectByTitle(String title) {
		
		MovieBean movie = null;
		
		Connection conn = null ;
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;

		List<MovieBean> lists = new ArrayList<MovieBean>();
		
		String sql = "select * from movies where title like ?" ; 
		
		try {
			conn = super.getConnection() ;
			pstmt = conn.prepareStatement(sql) ;
			String temp = "%" + title + "%";
			pstmt.setString(1, temp);
			rs = pstmt.executeQuery() ;
			
			while (rs.next()) {
				movie = new MovieBean();
				movie.setMovie_no((rs.getInt("movie_no")));
				movie.setTitle(rs.getString("title"));
				movie.setSupervision((rs.getString("supervision")));
				movie.setActor(rs.getString("actor"));
				movie.setRelese_date((rs.getString("relese_date")));
				movie.setGenre1((rs.getString("genre1")));
				movie.setGenre2((rs.getString("genre2")));
				movie.setImage((rs.getString("image")));
				movie.setVideo((rs.getString("video")));
				movie.setIntro((rs.getString("intro")));
				movie.setS_time(rs.getInt("s_time"));
				lists.add(movie) ;
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
		
		return lists;
	}

	// 장르별 검색
	public List<MovieBean> SelectByGenre(String[] search) {
		MovieBean movie = null;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		List<MovieBean> lists = new ArrayList<MovieBean>();
		
		String sql = " select movie_no, title, genre1, genre2, image from movies where ";
		
		for(int i=0; i<search.length; i++) {
			if(i == search.length - 1) {
				sql += " (genre1 = '" + search[i] + "' ) or (genre2 = '" + search[i] + "' ) " ;
			} else {
				sql += " (genre1 = '" + search[i] + "' ) or (genre2 = '" + search[i] + "' ) or ";
			}
		}

		try {
			conn = super.getConnection() ;
			pstmt = conn.prepareStatement(sql) ;
			rs = pstmt.executeQuery() ;
			
			while(rs.next()) {
				movie = new MovieBean();
				movie.setMovie_no((rs.getInt("movie_no")));
				movie.setTitle(rs.getString("title"));
				movie.setGenre1((rs.getString("genre1")));
				movie.setGenre2((rs.getString("genre2")));
				movie.setImage((rs.getString("image")));	
				lists.add(movie) ;
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
	

}
