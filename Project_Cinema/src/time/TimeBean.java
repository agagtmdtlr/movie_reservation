package time;

public class TimeBean {
	private int time_no;
	private int movie_no;
	private int screen_no;
	private String screen_date;
	private String start_time;
	
	String title, address, end_time;
	int room;
	
	// 예매 현황
	int seat_state;
	
	public TimeBean() {
		// TODO Auto-generated constructor stub
	}
	
	public TimeBean(int time_no, int movie_no, int screen_no, String screen_date, String start_time) {
		super();
		this.time_no = time_no;
		this.movie_no = movie_no;
		this.screen_no = screen_no;
		this.screen_date = screen_date;
		this.start_time = start_time;
	}

	public int getTime_no() {
		return time_no;
	}

	public void setTime_no(int time_no) {
		this.time_no = time_no;
	}

	public int getMovie_no() {
		return movie_no;
	}

	public void setMovie_no(int movie_no) {
		this.movie_no = movie_no;
	}

	public int getScreen_no() {
		return screen_no;
	}

	public void setScreen_no(int screen_no) {
		this.screen_no = screen_no;
	}

	public String getScreen_date() {
		return screen_date;
	}

	public void setScreen_date(String screen_date) {
		this.screen_date = screen_date;
	}

	public String getStart_time() {
		return start_time;
	}

	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}

	
	
	
	// 예매내역 확인하기 위한 getter/setter
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEnd_time() {
		return end_time;
	}

	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}

	public int getRoom() {
		return room;
	}

	public void setRoom(int room) {
		this.room = room;
	}

	
	
	
	//예매 현황
	public int getSeat_state() {
		return seat_state;
	}

	public void setSeat_state(int seat_state) {
		this.seat_state = seat_state;
	}
	
	
	
	
}
