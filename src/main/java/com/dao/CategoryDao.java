package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.CategoryBean;
import com.bean.CategoryReportBean;

@Repository
public class CategoryDao {

	@Autowired
	JdbcTemplate stmt;

	public void addCategory(CategoryBean category) {
		stmt.update("insert into categories(category,userid) values(?,?)", category.getCategory(),
				category.getUserId());
	}

	public List<CategoryBean> listCategory(int userId) {
		List<CategoryBean> categories = stmt.query("select * from categories where userid = ?",
				new BeanPropertyRowMapper<CategoryBean>(CategoryBean.class), new Object[] { userId });
		return categories;
	}

	public List<CategoryReportBean> getCategoryByPrice() {
		return stmt.query(
				"select sum(exp_amount) as totalprice,category from expense e join categories c on e.category_id = c.category_id group by category",
				new BeanPropertyRowMapper<CategoryReportBean>(CategoryReportBean.class));
	}
}
