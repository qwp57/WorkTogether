package com.uni.wt.employee.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.uni.wt.employee.model.dto.Employee;
import com.uni.wt.employee.model.service.EmployeeService;

/**
 * Handles requests for the application home page.
 */
@SessionAttributes("loginUser")
@Controller
public class EmployeeController {
	
	private static final Logger log = LoggerFactory.getLogger(EmployeeController.class);
	
	@Autowired
	private BCryptPasswordEncoder bPwdEncoder;
	
	@Autowired
	private EmployeeService empService;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		log.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "common/main";

	}



	
	
	
	@RequestMapping(value="/enrollForm.do")
	public String enrollForm() {
		
		return "employee/register";
		
	}
	
	@RequestMapping("/login.do")
	public String login() {
		return "employee/login";
	}
	
	@RequestMapping(value="/enrollEmp.do")
	public String enrollEmp(@RequestBody @Valid Employee emp, HttpSession session, Errors errors) throws Exception {
		
		System.out.println("야 되냐 ");
		if(errors.hasErrors()) {
			
			log.info("===getFieldErrors===" + errors.getFieldErrors());
			
			  for(FieldError value : errors.getFieldErrors()) {
		            System.out.println("===defaultMessage===" + value.getDefaultMessage());
		        }
		}
		
		log.info(emp.toString());
		log.info("암호화 전 : "+emp.getPassword());
		String encPwd = bPwdEncoder.encode(emp.getPassword());
		log.info("암호화 후 : "+encPwd);
		
		emp.setPassword(encPwd);
		
		
	//	empService.insertEmp(emp);
		session.setAttribute("msg", "회원가입에 성공했습니다.");
		
		
		
		
		return "redirect:/login.do";
	}
	
	@ResponseBody//데이터 그대로 가져가야 한다. 
	@RequestMapping("/idCheck.do")//숫자를 가져가기 때문에 굳이 인코딩해줄 필요가 없다. 
	public String idCheck(String userId) throws Exception {
		
		int count = empService.idCheck(userId);//중복된 아이디의 개수를 가져온다. 
		log.info("중복된 아이디 개수 : "+count);
		return String.valueOf(count);//파싱문제가 있기때문에 String으로 반환한다. 
	}
		


	
	
}