package dao;

import java.util.List;

import entity.Topic;

public interface Itopic {
	
	/**
	 * ������ͼ���
	 * @return
	 */
	List<Topic> getTops();
	
	
	/**
	 * �ж������Ƿ����
	 * @return
	 */
	boolean isTop(String name);
	
	
	/**
	 * �������
	 * @param top
	 * @return
	 */
	boolean addTopic(Topic top);
	
	/**
	 * �޸�����
	 * @param top
	 * @return
	 */
	boolean updateTopic(Topic top);
	
	/**
	 * ɾ������
	 * @param tid
	 * @return
	 */
	boolean deleteTopic(int tid);
	
}
