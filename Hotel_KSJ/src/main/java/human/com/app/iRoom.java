package human.com.app;


import java.util.ArrayList;

public interface iRoom {
	ArrayList<RoominfoA> getRoomList();
	ArrayList<RoomType> getRoomType();	
	void doDeleteRoom(int roomcode);
	void doAddRoom(String roomname,int roomtype,int howmany,int howmuch);
	void doUpdateRoom(int roomcode,String roomname,int roomtype,int howmany,int howmuch);
}

