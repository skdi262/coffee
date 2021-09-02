package human.com.app;

public class RoomType {
	public RoomType() {
	}
	
	private int typecode;
	
	private String name;	
	
	
	public int getTypecode() {
		return typecode;
	}
	public void setTypecode(int typecode) {
		this.typecode = typecode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public RoomType(int typecode, String name) {	
		
		this.typecode = typecode;
		this.name = name;
	}
	
}
