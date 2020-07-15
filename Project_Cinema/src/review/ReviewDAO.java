package review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.SuperDAO;
import movie.MovieBean;

public class ReviewDAO extends SuperDAO {
	
	public List<ReviewBean> SelectByMovie_no(int movie_no) {
		
		List<ReviewBean> lists = new ArrayList<ReviewBean>();
		
		Connection conn = null ;
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		String sql = "select * from reviews where movie_no=?" ; 
		
		try {
			conn = super.getConnection() ;
			pstmt = conn.prepareStatement(sql) ;
			pstmt.setInt(1, movie_no);
			rs = pstmt.executeQuery() ;
			
			while(rs.next()) {
				ReviewBean review = new ReviewBean();
				review.setId(rs.getString("id"));
				review.setRating(rs.getDouble("rating"));
				review.setContent(rs.getString("content"));
				lists.add(review) ;
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
	
	
	public List<ReviewBean> SelectAll() {
		Connection conn = null ;
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		String sql = " select * from reviews " ;
		List<ReviewBean> lists = new ArrayList<ReviewBean>();
		
		try {
			conn = super.getConnection() ;
			pstmt = conn.prepareStatement(sql) ;
			rs = pstmt.executeQuery() ;
			
			while(rs.next()) {
				ReviewBean review = new ReviewBean();
				review.setReview_no(rs.getInt("review_no"));
				review.setId(rs.getString("id"));
				review.setMovie_no(rs.getInt("movie_no"));
				review.setRating(rs.getDouble("rating"));
				review.setContent(rs.getString("content"));
				lists.add(review) ;
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
	
	
	public List<ReviewBean> SelectAll(int beginRow, int endRow, int movie_no) {
		Connection conn = null ;
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		String sql = "  select id, rating, content " + 
				" from ( select id, rating, content, movie_no, review_no, rank() over(order by review_no desc) as ranking from reviews where movie_no = ? ) " + 
				" where ranking between ? and ? " ; 
		
		List<ReviewBean> lists = new ArrayList<ReviewBean>();
		
		try {
			conn = super.getConnection() ;
			pstmt = conn.prepareStatement(sql) ;
			
			pstmt.setInt(1, movie_no);
			pstmt.setInt(2, beginRow);
			pstmt.setInt(3, endRow);
			
			
			rs = pstmt.executeQuery() ;
			
			while(rs.next()) {
				ReviewBean review = new ReviewBean();
				review.setId(rs.getString("id"));
				review.setRating(rs.getDouble("rating"));
				review.setContent(rs.getString("content"));
				
				lists.add(review) ;
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
	
	
	public int GetCount(int movie_no) {
		Connection conn = null ;
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		int cnt = -1; 
		String sql = " select count(*) as cnt from reviews where movie_no = ?" ;
		
		try {
			conn = super.getConnection() ;
			pstmt = conn.prepareStatement(sql) ;
			pstmt.setInt(1, movie_no);
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
	
	
	//평균 평점
	public double GetAvgRating(int movie_no) {
		
		Connection conn = null ;
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		double rating = -1;
		String sql = " select round(avg(rating),1) as rating, movie_no from reviews "
				+ " where movie_no = ? group by movie_no " ;
		
		
		try {
			conn = super.getConnection() ;
			pstmt = conn.prepareStatement(sql) ;
			pstmt.setInt(1, movie_no);
			rs = pstmt.executeQuery() ;
			
			if (rs.next()) {
				rating = rs.getDouble("rating");
			} else	 {
				rating = 0.0;
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
		
		return rating;
	}
	
	
	public int InsertReview(ReviewBean bean) {
		Connection conn = null ;
		PreparedStatement pstmt = null ;
		
		String sql = "insert into reviews values(reviews_seq.nextval, ?, ?, ?, ?)" ;
		int cnt = -1 ;
		try {
			conn = super.getConnection() ;
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql) ;
			
			pstmt.setString(1, bean.getId());
			pstmt.setInt(2, bean.getMovie_no());
			pstmt.setDouble(3, bean.getRating());
			pstmt.setString(4, bean.getContent());
			
			
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
