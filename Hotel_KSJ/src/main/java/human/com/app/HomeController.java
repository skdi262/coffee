package human.com.app;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(ParamList pl, Model model) {
		model.addAttribute("m_name", "jenny,jisoo");
		return "home";
	}
	@RequestMapping(value="/viewinfo", method=RequestMethod.GET)
	public String viewinfo(ParamList pl,Model model) {
		
		model.addAttribute("rrr",pl.getId());
		model.addAttribute("rgr",pl.getPassword());
		return "viewinfo";
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
	
}
