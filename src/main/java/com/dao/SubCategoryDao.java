package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.CategorySubBean;
import com.bean.SubCategoryBean;

@Repository
public class SubCategoryDao {

	@Autowired
	JdbcTemplate stmt;

	public void addSubcategory(SubCategoryBean subcategory) {
		stmt.update("insert into subcategories (subcategory_name,category_id) values(?,?)",
				subcategory.getSubCategoryName(), subcategory.getCategoryId());
	}

	
	  public List<CategorySubBean> listSubCategoriess(int userId) { return
	  stmt.query(
	  "select c.category , s.subcategory_name, s.subcategory_id from categories c join subcategories s on c.category_id = s.category_id where userid = ?"
	  , new BeanPropertyRowMapper<CategorySubBean>(CategorySubBean.class), new
	  Object[] {userId}); }
	 

	/*
	 * public List<CategorySubBean> listSubCategories(int categoryId) { return
	 * stmt.query("select * from subcategories where category_id = ?", new
	 * BeanPropertyRowMapper<CategorySubBean>(CategorySubBean.class), new Object[] {
	 * categoryId }); }
	 */
}
