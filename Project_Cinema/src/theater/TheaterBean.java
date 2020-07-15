package theater;

public class TheaterBean {
	private int theater_no;
	private String address;
	private String tel;
	
	public TheaterBean() {
		// TODO Auto-generated constructor stub
	}
	
	public TheaterBean(int theater_no, String address, String tel) {
		super();
		this.theater_no = theater_no;
		this.address = address;
		this.tel = tel;
	}

	public int getTheater_no() {
		return theater_no;
	}

	public void setTheater_no(int theater_no) {
		this.theater_no = theater_no;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}
	
	
	
}
