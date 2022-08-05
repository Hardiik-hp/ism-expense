package com.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.bean.CategoryBean;
import com.bean.CategorySubBean;
import com.bean.SubCategoryBean;
import com.bean.UserBean;
import com.dao.CategoryDao;
import com.dao.SubCategoryDao;

@Controller
public class SubCategoryController {
	@Autowired
	SubCategoryDao subcategoryDao;
	@Autowired
	CategoryDao categoryDao;
	
	@GetMapping("/addSubCategory")
	public String addsubCategory(Model model,SubCategoryBean subcategoryBean, HttpSession session) {
		UserBean user =(UserBean) session.getAttribute("user");
		int userId = user.getUserId();
		model.addAttribute("subcategory",subcategoryBean);
		
		List<CategoryBean> category = categoryDao.listCategory(userId);
		model.addAttribute("categories",category);
		
		return "AddSubCategory";
	}
	@PostMapping("/savesubcategory")
	public String savesubCategory(@ModelAttribute("subcategory") SubCategoryBean subcategoryBean,BindingResult result, Model model,HttpSession session) {
		if(result.hasErrors()) {
			model.addAttribute(subcategoryBean);
			return "AddSubCategory";
		}else {
			subcategoryDao.addSubcategory(subcategoryBean);
			model.addAttribute(subcategoryBean);
			model.addAttribute("mgs","subcategory added");
			
			return "Home";
		}
	}
	
	@GetMapping("/listsubCategory")
	public String listSubCategory(CategorySubBean categorysubBean, Model model, HttpSession session) {
		UserBean user =(UserBean) session.getAttribute("user");
		int userId = user.getUserId();
		List<CategorySubBean> sub = subcategoryDao.listSubCategoriess(userId);
		model.addAttribute("subcategory",sub);
		return "ViewSubCategory";
	}
	 
	
}
