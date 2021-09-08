package human.com.app;

public class ReservInfo {
	
	public ReservInfo() {}
	public int reservcode;
	public String rname;
	public String checkin;
	public String checkout;
	public String name;
	public int type;
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getreservcode() {
		return reservcode;
	}
	public void setreservcode(int reservcode) {
		this.reservcode = reservcode;
	}
	
	
	public String getCheckin() {
		return checkin;
	}
	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getCheckout() {
		return checkout;
	}
	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public ReservInfo(String rname,String checkin,String checkout, String name,int type, int reservcode) {
		this.rname = rname;
		this.type = type;
		this.reservcode = reservcode;
		this.checkin = checkin;
		this.checkout = checkout;
		this.name = name;
}
}
