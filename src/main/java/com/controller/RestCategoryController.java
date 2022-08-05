package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.bean.CategorySubBean;
import com.bean.SubCategoryBean;
import com.dao.CategoryDao;
import com.dao.SubCategoryDao;

@RestController
public class RestCategoryController {
	@Autowired
	SubCategoryDao subcategoryDao;
	
	
	  @GetMapping("/subcategory/{categoryId}") 
	  public List<CategorySubBean>subcategory(@PathVariable("categoryId") int categoryid){
	  
	  return subcategoryDao.listSubCategories(categoryid);
			  }
	 
}
