package dao;

import java.util.List;

import entity.News;

public interface INews {
	
	/**
	 * ��ȡ���ż���
	 * @return
	 */
	List<News> getNews(int ntid);
	
	
	/**
	 * �ж��Ƿ�������������
	 * @return
	 */
	boolean isTopic(int tid);
}
