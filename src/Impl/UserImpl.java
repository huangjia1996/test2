package Impl;

import java.sql.ResultSet;

import dao.Basedao;
import dao.IUser;
import entity.User;

public class UserImpl extends Basedao implements IUser{

	/**
	 * ÓÃ»§µÇÂ¼
	 */
	public User login(String name) {
		User user=null;
		ResultSet rs=null;
		try {
			rs=super.executeQuery("select * from news_users where uname=?",new Object[]{name});
			if (rs.next()) {
				user=new User(rs.getInt("uid"),rs.getString("uname"),rs.getString("upwd"));
			}
			return user;
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			close(rs);
		}
		return user;
	}

}
