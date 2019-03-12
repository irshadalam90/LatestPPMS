package com.ppms.controllers;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ppms.pojo.UserPojo;
import com.ppms.service.HomeService;

@Controller
public class HomeController {
	
	@Autowired
	HomeService homeService;

	public static final String VIEW = "admin";
	
	
	@RequestMapping("/login")
	public String loginPage(){
		
		return "Login";
	}
	
	@RequestMapping("/signup")
	public String signupPage(){
		
		return "SignUp";
	}
	
	/*@RequestMapping("/create_user")
	public String createUser(@ModelAttribute UserPojo user, @ModelAttribute SchoolPojo school){
		homeService.createNewUser(user, school);
		//homeService.saveSchoolInfo(school);
		return "redirect:/";
	}*/
	
	@RequestMapping("/user_login")
	public String userLogin(@RequestParam("email") String email, @RequestParam("password") String password, @RequestParam("role") String role, RedirectAttributes redirectAttributes, HttpServletRequest req, HttpSession session){
		
		session = req.getSession();
		
		UserPojo user = homeService.isValidate(email);
		if(user == null){
			redirectAttributes.addFlashAttribute("errorMessage","User doesn't exist. Please create new account ?");
			return "redirect:/";
		}
		if(!role.equals(user.getRole())){
			redirectAttributes.addFlashAttribute("errorMessage","Please select correct usertype");
			return "redirect:/";
		}
		
		else if(!email.equals(user.getEmail()) || !password.equals(user.getPassword())){
			redirectAttributes.addFlashAttribute("errorMessage","Invalid username or password");
			return "redirect:/";
		}
		else if(role.equals("admin") && email.equals(user.getEmail()) && password.equals(user.getPassword())){
			session.setAttribute("user", user);
			return "redirect:/dashboard";
		}
		/*else if(userType.equals("branchadmin") && username.equals(user.getRole()) && password.equals(user.getPassword())){
			session.setAttribute("user", user);
			return "redirect:/bradm_dashboard";
		}
		else if(userType.equals("teacher") && username.equals(user.getRole()) && password.equals(user.getPassword())){
			session.setAttribute("user", user);
			return "redirect:/teacher_dashboard";
		}*/
		else{
			return "redirect:/";
		}
		
	}
	
	/*@RequestMapping("/dashboard")
	public String dashboard(HttpServletRequest req, HttpSession session){
		
		return "DashBoard";
	}*/
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest req, HttpSession session){
		session = req.getSession();
		session.removeAttribute("user");
		session.invalidate();
		
		return "redirect:/";
	}
	
}


