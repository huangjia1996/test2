package dao;

import entity.User;

public interface IUser {
	
	/**
	 * �û���¼
	 * @return
	 */
	User login(String name);
	
}
