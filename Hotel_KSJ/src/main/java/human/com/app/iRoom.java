package human.com.app;


import java.util.ArrayList;

public interface iRoom {
	ArrayList<RoominfoA> getRoomList();
	ArrayList<RoomType> getRoomType();
	ArrayList<ReservInfo> getReservInfo(); 
	void doDeleteRoom(int roomcode);
	void doAddRoom(String roomname,int roomtype,int howmany,int howmuch);
	void doUpdateRoom(int roomcode,String roomname,int roomtype,int howmany,int howmuch);
	void doSignin(String signid, String signName, String signPass);
	int doCheckUser(String userid,String passcode);
	void doReserv(String checkin,String checkout,int roomcode);
	void deleteReserv(int roomcode);
	void updateReserv(String checkin,String checkout,int reservcode);
	
}


