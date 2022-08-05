package com.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.bean.LoginBean;
import com.bean.UserBean;
import com.dao.UserDao;

@Controller
public class SessionController {
	@Autowired
	UserDao userDao;
	
	
	@GetMapping("/signup")
	public String signup(UserBean user, Model model) {
//		UserBean user = new UserBean();
		model.addAttribute("user", user);
		return "Signup";
	}
	@PostMapping("/saveuser")
	public String saveUser(@ModelAttribute("user") @Valid UserBean user, BindingResult result,Model model, HttpSession session) {
		System.out.println("login");
		System.out.println(result);
		if(result.hasErrors()) {
			model.addAttribute("User", user);
			return "Signup";
		}else {
			user.setUserType("customer");
			userDao.addUser(user);
			model.addAttribute(user);
			model.addAttribute("mgs","Signup Done");
			return "redirect:/login";
		}
	}
	@GetMapping("/login")
	public String login(LoginBean login,Model model) {
		model.addAttribute("login",login);
		return "Login";
	}
	@PostMapping("/authenticate")
	public String authenticate(@ModelAttribute("login") @Valid LoginBean login,BindingResult result, Model model, HttpSession session) {
		//UserBean user = userDao.authenticate(login);
		
		if(result.hasErrors()) {
			model.addAttribute(login);
			return "Login";
		} else {
			UserBean user = userDao.authenticate(login);
		
		
		if(user ==null) {
			model.addAttribute("msg", "Invalid Credentials");
			return "Login";
		}else if (user.getUserType().contentEquals("customer")) {
			session.setAttribute("user", user);
			System.out.println(session);
			return "Home";
		} else if (user.getUserType().contentEquals("admin")) {
			session.setAttribute("user", user);
			return "Dashboard";
		} else {
			model.addAttribute("msg", "Please Contact Admin");
			return "Login";
		}
		}
		
	}
	@GetMapping("/logout")
	public String logout(Model model, HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}
	
}
