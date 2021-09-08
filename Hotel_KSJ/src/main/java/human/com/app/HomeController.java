package human.com.app;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;



import org.json.simple.*;

@Controller

public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private SqlSession sqlSession;
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	
	
	@RequestMapping(value="/reservRoom",method=RequestMethod.POST)
	@ResponseBody
	public String reservRoom(HttpServletRequest hsr,Model model) {
	iRoom room=sqlSession.getMapper(iRoom.class);
		String checkin=hsr.getParameter("checkin");
		String checkout=hsr.getParameter("checkout");
		int roomcode=Integer.parseInt(hsr.getParameter("roomcode"));
		room.doReserv(checkin, checkout, roomcode);
		System.out.println(checkin+"||"+checkout+"||"+roomcode);
		
		return "ok";
		
	}
	
	@RequestMapping(value="/getReservList",method=RequestMethod.POST,
			produces="application/text; charset=utf8")
	@ResponseBody
	public String getReservList(HttpServletRequest hsr) {
		iRoom room=sqlSession.getMapper(iRoom.class);
		ArrayList<ReservInfo> reserv=room.getReservInfo();
		ArrayList<RoominfoA> roominfo=room.getRoomList();
		JSONArray ja = new JSONArray();
		for(int i =0; i<reserv.size();i++) {
			JSONObject jo=new JSONObject();
			jo.put("checkin", reserv.get(i).getCheckin());
			jo.put("checkout", reserv.get(i).getCheckout());
			jo.put("rName", reserv.get(i).getName());
			jo.put("newName", reserv.get(i).getRname());
			jo.put("reservcode", reserv.get(i).getreservcode());
			jo.put("roomcode", roominfo.get(i).getRoomcode());
			jo.put("roomname", roominfo.get(i).getRoomname());
			jo.put("howmany", roominfo.get(i).getHowmany());
			jo.put("howmuch", roominfo.get(i).getHowmuch());
			jo.put("typecode", roominfo.get(i).getTypecode());
			jo.put("typename", roominfo.get(i).getTypename());
			ja.add(jo);
			}		
		return ja.toString();
	}
	
	@RequestMapping(value="/getRoomList",method=RequestMethod.POST,
			produces="application/text; charset=utf8")
	@ResponseBody
	public String getRoomList(HttpServletRequest hsr) {
		iRoom room=sqlSession.getMapper(iRoom.class);
		ArrayList<RoominfoA> roominfo=room.getRoomList();
		JSONArray ja = new JSONArray();
		for(int i =0; i<roominfo.size();i++) {
			JSONObject jo=new JSONObject();
			jo.put("roomcode", roominfo.get(i).getRoomcode());
			jo.put("roomname", roominfo.get(i).getRoomname());
			jo.put("typename", roominfo.get(i).getTypename());
			jo.put("howmany", roominfo.get(i).getHowmany());
			jo.put("howmuch", roominfo.get(i).getHowmuch());
			jo.put("typecode", roominfo.get(i).getTypecode());
			ja.add(jo);
		}
		System.out.println(ja.toString());
		return ja.toString();
	}
	@RequestMapping(value="/check_user",method=RequestMethod.POST)
	public String check_user(HttpServletRequest hsr,Model model) {
		String userid=hsr.getParameter("homeId");
		String passcode=hsr.getParameter("passcode");
		iRoom room=sqlSession.getMapper(iRoom.class);
		ArrayList<RoominfoA> roominfo=room.getRoomList();
		model.addAttribute("list",roominfo);
		
		int n=room.doCheckUser(userid,passcode);
		System.out.println(userid+""+passcode);
		System.out.println(n);
		if(n>0) {			
			HttpSession session=hsr.getSession();
			session.setAttribute("homeId", userid);			
			return "ksj";			
		}
		return "redirect:/";
	}
	
	@RequestMapping(value="/addRoom",method=RequestMethod.POST,
			produces="application/text; charset=utf8")
	@ResponseBody
	public String addRoom(HttpServletRequest hsr) {
		String rname=hsr.getParameter("roomname");
		int rtype=Integer.parseInt(hsr.getParameter("roomtype"));
		int howmany=Integer.parseInt(hsr.getParameter("howmany"));
		int howmuch=Integer.parseInt(hsr.getParameter("howmuch"));
		iRoom room=sqlSession.getMapper(iRoom.class);
		room.doAddRoom(rname, rtype, howmany, howmuch);
		return "ok";
	}
	@RequestMapping(value="/updateRoom",method=RequestMethod.POST,
			produces="application/text; charset=utf8")
	@ResponseBody
	public String updateRoom(HttpServletRequest hsr) {
		iRoom room=sqlSession.getMapper(iRoom.class);
		room.doUpdateRoom(
				Integer.parseInt(hsr.getParameter("roomcode")),
				hsr.getParameter("roomname"),
				Integer.parseInt(hsr.getParameter("roomtype")),
				Integer.parseInt(hsr.getParameter("howmany")),
				Integer.parseInt(hsr.getParameter("howmuch")));
		System.out.println("roomcode");
		return "ok";
	}
	@RequestMapping(value ="/ssss",method = RequestMethod.POST)
	@ResponseBody
	public String doSignin(HttpServletRequest hsr) {
		//insert into member ~~		
		String signid=hsr.getParameter("signid");
		String signName=hsr.getParameter("signName");
		String signPass=hsr.getParameter("signPass");
		System.out.println(signName);
		System.out.println(signid);
		System.out.println(signPass);
		iRoom room=sqlSession.getMapper(iRoom.class);
		
		room.doSignin(signid, signName, signPass);
		
		return "ok";
	}
	
	@RequestMapping(value="/deleteRoom",method=RequestMethod.POST,
			produces="application/text; charset=utf8")
	@ResponseBody
	public String deleteRoom(HttpServletRequest hsr) {
		
		int roomcode = Integer.parseInt(hsr.getParameter("roomcode"));
		iRoom room=sqlSession.getMapper(iRoom.class);
		room.doDeleteRoom(roomcode);
		return "ok";
	}
	
	
	@RequestMapping(value="/ksj", method=RequestMethod.POST)
	public String ksj(HttpServletRequest hsr,Model model) {

		iRoom room=sqlSession.getMapper(iRoom.class);
		
		ArrayList<RoominfoA> roominfo=room.getRoomList();
		model.addAttribute("list",roominfo);
		
		
		ArrayList<RoomType> roomtype=room.getRoomType();
		model.addAttribute("type",roomtype);
		
		String id = hsr.getParameter("homeId");
		if(!id.equals("")||!id.isEmpty()) {
			return "ksj";
		}
		else {
			return "redirect:/";
		}		
	}
	@RequestMapping(value="/viewinfo", method=RequestMethod.GET)
	public String viewinfo(HttpServletRequest hsr,ParamList pl,Model model) {
		
		model.addAttribute("userId",pl.getId());
		model.addAttribute("userPass",pl.getPassword());
		HttpSession session = hsr.getSession();
		String loginid=(String)session.getAttribute(pl.id);
		if(loginid=="skdi262") {
			return "ksj";
		} else {
			return "redirect:/viewinfo";
		}
		
	}
	@RequestMapping(value="/newbie", method=RequestMethod.GET)
	public String newbie(ParamList pl,Model model) {	
		return "newbie";
	}
	@RequestMapping(value="/newinfo", method=RequestMethod.GET)
	public String newinfo(ParamList pl,Model model) {	
		model.addAttribute("A",pl.getNew_id());
		model.addAttribute("B",pl.getNew_password());
		model.addAttribute("C",pl.getNew_passcheck());
		model.addAttribute("D",pl.getMob());
		return "newinfo";
	}
	@RequestMapping(value="/updateReserve",method=RequestMethod.POST,
			produces="application/text; charset=utf8")
	@ResponseBody
	public String updateReserve(HttpServletRequest hsr) {
		iRoom room=sqlSession.getMapper(iRoom.class);
		String checkin=hsr.getParameter("checkin");
		String checkout=hsr.getParameter("checkout");
		int reservcode=Integer.parseInt(hsr.getParameter("reservcode"));
		System.out.println(checkin+"|"+checkout+"|"+reservcode);
		room.updateReserv(checkin, checkout, reservcode);
		return "ok";
	}
	
	
	@RequestMapping(value="/deleteReserve",method=RequestMethod.POST,
			produces="application/text; charset=utf8")
	@ResponseBody
	public String deleteReserve(HttpServletRequest hsr) {
		
		int reservcode = Integer.parseInt(hsr.getParameter("reservcode"));
		iRoom room=sqlSession.getMapper(iRoom.class);
		room.deleteReserv(reservcode);
		return "ok";
	}

	
	@RequestMapping(value="/ksj2", method=RequestMethod.POST)
	public String ksj2(HttpServletRequest hsr,Model model) {	
		iRoom room=sqlSession.getMapper(iRoom.class);
		
//		ArrayList<ReservInfo> reservinfo=room.getReservInfo();
//		model.addAttribute("reserv_room",reservinfo);
		ArrayList<ReservInfo> reservinfo=room.getReservInfo();
		model.addAttribute("rList", reservinfo);
		
		
		ArrayList<RoominfoA> roominfo=room.getRoomList();
		model.addAttribute("list",roominfo);
		
		
		ArrayList<RoomType> roomtype=room.getRoomType();
		model.addAttribute("type",roomtype);
		return "ksj2";
	}
}
