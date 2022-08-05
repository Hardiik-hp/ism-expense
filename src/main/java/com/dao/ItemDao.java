package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.ItemBean;

@Repository
public class ItemDao {
	@Autowired
	JdbcTemplate stmt;

	public void addItem(ItemBean item) {
		stmt.update(
				"insert into expense (exp_name,exp_description,exp_amount,exp_date,exp_time,payment_type,userid,category_id,subcategory_id) values (?,?,?,?,?,?,?,?,?)",
				item.getExpName(), item.getExpDescription(), item.getExpAmount(), item.getExpDate(), item.getExpTime(),
				item.getPaymentType(), item.getUserId(),item.getCategoryId(),item.getSubCategoryId());
	}

	public List<ItemBean> listAllItems(int userId) {
		List<ItemBean> items=  stmt.query("select * from expense where userid = ?", new BeanPropertyRowMapper<ItemBean>(ItemBean.class),
				new Object[] { userId });
		System.out.println(items);
		return items;
	}
}
