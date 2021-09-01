package human.com.app;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
			jo.put("typecode", roominfo.get(i).getTypename());
			jo.put("howmany", roominfo.get(i).getHowmany());
			jo.put("howmuch", roominfo.get(i).getHowmuch());
			ja.add(jo);
		}
		System.out.println(ja.toString());
		return ja.toString();
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

	
	@RequestMapping(value="/ksj2", method=RequestMethod.GET)
	public String ksj2(ParamList pl,Model model) {	
		return "ksj2";
	}
}
