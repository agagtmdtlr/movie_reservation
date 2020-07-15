package screen;

public class ScreenBean {
	private int screen_no;
	private int theater_no;
	private int seat;
	private int room;

	
	public ScreenBean() {
		// TODO Auto-generated constructor stub
	}

	
	public ScreenBean(int screen_no, int theater_no, int seat, int room) {
		super();
		this.screen_no = screen_no;
		this.theater_no = theater_no;
		this.seat = seat;
		this.room = room;
	}
	

	public int getScreen_no() {
		return screen_no;
	}


	public void setScreen_no(int screen_no) {
		this.screen_no = screen_no;
	}


	public int getTheater_no() {
		return theater_no;
	}


	public void setTheater_no(int theater_no) {
		this.theater_no = theater_no;
	}


	public int getSeat() {
		return seat;
	}


	public void setSeat(int seat) {
		this.seat = seat;
	}


	public int getRoom() {
		return room;
	}


	public void setRoom(int room) {
		this.room = room;
	}
	
	
	
	
}
