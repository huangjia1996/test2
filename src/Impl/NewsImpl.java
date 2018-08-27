package Impl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dao.Basedao;
import dao.INews;
import entity.News;

public class NewsImpl extends Basedao implements INews {

	/**
	 * 获取新闻集合
	 * 
	 * @return
	 */
	public List<News> getNews(int ntid) {
		List<News> newsList = new ArrayList<News>();
		ResultSet rs = null;
		try {
			 Object[] objs;
			String sql = ntid == -1 ? "select * from news"
					: "select * from news where ntid=?";
			objs=ntid != -1?new Object[]{ntid}:null;
			rs = executeQuery(sql,objs);
			while (rs.next()) {
				News news=new News(rs.getInt("nid"),rs.getInt("ntid"),rs.getString("ntitle"),rs.getString("nauthor"),rs.getString("ncreateDate"),rs.getString("npicPath"),rs.getString("ncontent"),rs.getString("nsummary")); 												
				newsList.add(news);
			}
			return newsList;
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			close(rs);
		}
		return null;
	}

	/**
	 * 判断是否存在主题的新闻
	 * @return
	 */
	public boolean isTopic(int tid) {
		ResultSet rs=null;
		try {	
			rs=executeQuery("select * from news where ntid=?", new Object[]{tid});
			if (rs.next()) {
				return true;
			}		
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			close(rs);
		}
		return false;
	}

}
