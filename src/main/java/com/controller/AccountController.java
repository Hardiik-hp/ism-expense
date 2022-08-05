package com.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.bean.AccountBean;
import com.bean.UserBean;
import com.dao.AccountDao;

@Controller
public class AccountController {
	@Autowired
	AccountDao accountDao;
	
	@GetMapping("/addAccount")
	public String addaccount(AccountBean accountBean, Model model) {
		model.addAttribute("accounts", accountBean);
		return "AddAccount";
	}
	
	@PostMapping("/saveaccount")
	public String saveaccount(@ModelAttribute("accounts") @Valid AccountBean accountBean, BindingResult result, Model model,HttpSession session) {
		if(result.hasErrors()) {
			model.addAttribute(accountBean);
			return "AddAccount";
		}else {
			UserBean user = (UserBean) session.getAttribute("user");
			int userId = user.getUserId();
			accountBean.setUserId(userId);
			System.out.println(userId+"AccountController");
			accountDao.addAccount(accountBean);
			model.addAttribute(accountBean);
			model.addAttribute("mgs","Account Added..");
			return "ViewAccount";
		}
	}
	@GetMapping("/listAccount")
	public String listAccounts(HttpSession session, Model model) {
		UserBean user = (UserBean) session.getAttribute("user");
		int userId = user.getUserId();
		List<AccountBean> account = accountDao.listAccount(userId);
		model.addAttribute("accounts",account);
		return "ViewAccount";
	}
}
