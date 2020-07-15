package reservation;

public class ReservationBean {
	private int reservation_no;
	private String id;
	private int time_no;
	private int count;
	
	public ReservationBean() {
		// TODO Auto-generated constructor stub
	}
	
	public ReservationBean(int reservation_no, String id, int time_no, int count) {
		super();
		this.reservation_no = reservation_no;
		this.id = id;
		this.time_no = time_no;
		this.count = count;
	}

	public int getReservation_no() {
		return reservation_no;
	}

	public void setReservation_no(int reservation_no) {
		this.reservation_no = reservation_no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getTime_no() {
		return time_no;
	}

	public void setTime_no(int time_no) {
		this.time_no = time_no;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
	
}
