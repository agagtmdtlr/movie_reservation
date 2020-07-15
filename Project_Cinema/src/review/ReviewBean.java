package review;

public class ReviewBean {
	
	private int review_no;
	private String id;
	private int movie_no;
	private double rating;
	private String content;
	
	
	
	public int getReview_no() {
		return review_no;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getMovie_no() {
		return movie_no;
	}

	public void setMovie_no(int movie_no) {
		this.movie_no = movie_no;
	}

	public double getRating() {
		return rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}



	public ReviewBean() {
		// TODO Auto-generated constructor stub
	}

	
	public ReviewBean(int review_no, String id, int movie_no, double rating, String content) {
		super();
		this.review_no = review_no;
		this.id = id;
		this.movie_no = movie_no;
		this.rating = rating;
		this.content = content;
	}
	
	
	@Override
	public String toString() {
		return "Reviews [review_no=" + review_no + ", id=" + id + ", movie_no=" + movie_no 
				+ ", rating=" + rating + ", content=" + content + "]";
	}
	
}
