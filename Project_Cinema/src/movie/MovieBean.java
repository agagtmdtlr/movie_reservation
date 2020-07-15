package movie;

public class MovieBean {
	private int movie_no;
	private String title;
	private String supervision;
	private String actor;
	private String relese_date;
	private String genre1;
	private String genre2;
	private String image;
	private String video;
	private String intro;
	private int s_time;
	
	
	public int getMovie_no() {
		return movie_no;
	}
	public void setMovie_no(int movie_no) {
		this.movie_no = movie_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSupervision() {
		return supervision;
	}
	public void setSupervision(String supervision) {
		this.supervision = supervision;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	public String getRelese_date() {
		return relese_date;
	}
	public void setRelese_date(String relese_date) {
		this.relese_date = relese_date;
	}
	public String getGenre1() {
		return genre1;
	}
	public void setGenre1(String genre1) {
		this.genre1 = genre1;
	}
	public String getGenre2() {
		return genre2;
	}
	public void setGenre2(String genre2) {
		this.genre2 = genre2;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getVideo() {
		return video;
	}
	public void setVideo(String video) {
		this.video = video;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public int getS_time() {
		return s_time;
	}
	public void setS_time(int s_time) {
		this.s_time = s_time;
	}
	
	
	@Override
	public String toString() {
		return "Movie [movie_no=" + movie_no + ", title=" + title + ", supervision=" + supervision 
				+ ", actor=" + actor + ", relese_date=" + relese_date + ", genre1= " + genre1 
				+ ", genre2= " + genre2 + ", image= " + image + ", video= " + video 
				+ ", intro= " + intro + ", s_time= " + s_time + "]";
	}
	
	public MovieBean() {
		// TODO Auto-generated constructor stub
	}
	
	public MovieBean(int movie_no, String title, String supervision, String actor, String relese_date, String genre1,
			String genre2, String image, String video, String intro, int s_time) {
		super();
		this.movie_no = movie_no;
		this.title = title;
		this.supervision = supervision;
		this.actor = actor;
		this.relese_date = relese_date;
		this.genre1 = genre1;
		this.genre2 = genre2;
		this.image = image;
		this.video = video;
		this.intro = intro;
		this.s_time = s_time;
	}
	
	
	
	
}
