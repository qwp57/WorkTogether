package com.uni.wt;

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

/**
 * Handles requests for the application home page.
 */
@Controller
public class EmployeeController {
	
	private static final Logger logger = LoggerFactory.getLogger(EmployeeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "requestwork/rwmain";
		//return "common/login";
	}
	


	@RequestMapping("/allProject")
	public String allProject() {
		return "project/allProject";
	}
	@RequestMapping(value="/ws")
	public String workstate() {
		return "workstate/myWorkState";
		
		
	}
	@RequestMapping(value="/tws")
	public String teamworkstate() {
		return "workstate/teamWorkState";
		
		
	}
	
	@RequestMapping(value="/vws")
	public String myvacation() {
		return "workstate/myvacation";
		
		
	}

	@RequestMapping(value="/enrollForm.do")
	public String enrollForm() {
		
		return "common/register";
		
	}
	
	@RequestMapping(value="/enrollEmp.do")
	public String enrollEmp() {
		
		
	}

	
	
}
