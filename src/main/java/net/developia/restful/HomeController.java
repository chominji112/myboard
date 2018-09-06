package net.developia.restful;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.developia.restful.user.UserVO;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) {
		
		UserVO userInfo = new UserVO();
		userInfo.setUsr_no(1);
		userInfo.setUsr_name("신해철");
		userInfo.setUsr_id("next");
		userInfo.setUsr_level(1);
		userInfo.setUsr_status(0);
		session.setAttribute("userInfo", userInfo);
		
		return "redirect:board/100/1/";
		//return "redirect:user/";
		//return "redirect:jqueryui/autocomplete/";
	}
	
}
