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
import com.bean.CategoryBean;
import com.bean.CategorySubBean;
import com.bean.ItemBean;
import com.bean.UserBean;
import com.dao.AccountDao;
import com.dao.CategoryDao;
import com.dao.ItemDao;
import com.dao.SubCategoryDao;

@Controller
public class ItemController {
	@Autowired
	ItemDao itemDao;
	@Autowired
	AccountDao accountDao;
	@Autowired
	CategoryDao categoryDao;
	@Autowired
	SubCategoryDao subcategoryDao;

	@GetMapping("/addItem")
	public String additem(ItemBean itemsBean, Model model, HttpSession session) {
		UserBean user =(UserBean) session.getAttribute("user");
		int userId = user.getUserId();
		model.addAttribute("items", itemsBean);
		
		List<AccountBean> accounts = accountDao.listAccount(userId);
		model.addAttribute("account",accounts);
		
		List<CategoryBean> category = categoryDao.listCategory(userId);
		model.addAttribute("categories",category);
		
		
		  List<CategorySubBean> subcategory =
		  subcategoryDao.listSubCategoriess(userId);
		  model.addAttribute("subcategory",subcategory);
		 
			/*
			 * System.out.println(subcategory.get(0).getSubcategory_name()+"items");
			 */
		 
		return "AddItems";
	}

	@PostMapping("/addItem")
	public String addItem(@ModelAttribute("items") @Valid ItemBean itemBean, BindingResult result, Model model, HttpSession session) {
		if(result.hasErrors()) {
			model.addAttribute(itemBean);
			return "AddItems";
		}else {
			UserBean user =(UserBean) session.getAttribute("user");
			int userId = user.getUserId();
			itemBean.setUserId(userId);
			System.out.println(userId+"ItemController");
			itemDao.addItem(itemBean);
			model.addAttribute(itemBean);
			model.addAttribute("mgs","Item added...");
			return "Home";
			
		}
	}
	@GetMapping("/viewItems")
	public String ListAllItem(HttpSession session, Model model) {
		UserBean user =(UserBean) session.getAttribute("user");
		int userId = user.getUserId();
		System.out.println(user.getUserId());
		List<ItemBean> items = itemDao.listAllItems(userId); 
		model.addAttribute("items",items);
		for (ItemBean item : items) {
			System.out.println(item.getExpName());
			
		}
		return "ViewItems";
	}
}
