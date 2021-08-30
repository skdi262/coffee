package human.com.app;

import java.text.DateFormat;
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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller

public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private SqlSession sqlSession;
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
		
	}
	@RequestMapping(value="/ksj", method=RequestMethod.POST)
	public String ksj(HttpServletRequest hsr,Model model) {
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
