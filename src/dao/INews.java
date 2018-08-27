package dao;

import java.util.List;

import entity.News;

public interface INews {
	
	/**
	 * 获取新闻集合
	 * @return
	 */
	List<News> getNews(int ntid);
	
	
	/**
	 * 判断是否存在主题的新闻
	 * @return
	 */
	boolean isTopic(int tid);
}
