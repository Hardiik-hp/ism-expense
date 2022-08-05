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

import com.bean.CategoryBean;
import com.bean.UserBean;
import com.dao.CategoryDao;

@Controller
public class CategoryController {
	
	@Autowired
	CategoryDao categoryDao;
	
	@GetMapping("/addCategory")
	public String addcategory(Model model,CategoryBean categoryBean) {
		model.addAttribute("category",categoryBean);
		return "AddCategory";
	}
	@PostMapping("/saveCategory")
	public String saveCategory(@ModelAttribute("category") @Valid CategoryBean categoryBean, BindingResult result, Model model, HttpSession session){
		if(result.hasErrors()) {
			model.addAttribute(categoryBean);
			return "AddCategory";
		}else {
			UserBean user = (UserBean) session.getAttribute("user");
			int userId = user.getUserId();
			categoryBean.setUserId(userId);
			System.out.println(userId+"AccountController");
			categoryDao.addCategory(categoryBean);
			model.addAttribute(categoryBean);
			model.addAttribute("mgs","Category Added..");
			return "Home";
		}
	}
	@GetMapping("/listCategory")
	public String listCategory(HttpSession session , Model model){
		UserBean user = (UserBean) session.getAttribute("user");
		int userId = user.getUserId();
		List<CategoryBean> listCategorys = categoryDao.listCategory(userId);
		model.addAttribute("listCategory",listCategorys);
		return "ViewCategory";
	}
	
}
