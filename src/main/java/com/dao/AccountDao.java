package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.AccountBean;

@Repository
public class AccountDao {

	@Autowired
	JdbcTemplate stmt;

	public void addAccount(AccountBean account) {
		stmt.update("insert into accounts (account_type,balance,card_number,upi_id,userid) values(?,?,?,?,?)",
				account.getAccountType(), account.getBalance(), account.getCardNumber(), account.getUpiId(),
				account.getUserId());
	}

	public List<AccountBean> listAccount(int userId) {
		List<AccountBean> account = stmt.query("select * from accounts where userid=?",
				new BeanPropertyRowMapper<AccountBean>(AccountBean.class), new Object[] { userId });
		return account;
	}

	/*
	 * public void updateAccount(AccountBean account) { stmt.update(
	 * "update account set account_type=? and balance =? and card_number=? and upi_id=? where account_id =?"
	 * , account.getAccountType(), account.getBalance(), account.getCardNumber(),
	 * account.getUpiId());
	 * 
	 * }
	 */
}
