package dao;

import java.util.List;

import entity.Topic;

public interface Itopic {
	
	/**
	 * 获得类型集合
	 * @return
	 */
	List<Topic> getTops();
	
	
	/**
	 * 判断主题是否存在
	 * @return
	 */
	boolean isTop(String name);
	
	
	/**
	 * 添加主题
	 * @param top
	 * @return
	 */
	boolean addTopic(Topic top);
	
	/**
	 * 修改主题
	 * @param top
	 * @return
	 */
	boolean updateTopic(Topic top);
	
	/**
	 * 删除主题
	 * @param tid
	 * @return
	 */
	boolean deleteTopic(int tid);
	
}
