package Impl;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dao.Basedao;
import dao.Itopic;
import entity.Topic;

public class TopicImpl extends Basedao implements Itopic {

	/**
	 * ������ͼ���
	 * 
	 * @return
	 */
	public List<Topic> getTops() {
		List<Topic> tops = new ArrayList<Topic>();
		ResultSet rs = executeQuery("select * from topic", null);
		try {
			while (rs.next()) {
				Topic top=new Topic(rs.getInt("tid"),rs.getString("tname"));
				tops.add(top);
			}
			return tops;	
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			
		}
		return null;
	}


	/**
	 * �ж������Ƿ����
	 * @return
	 */
	public boolean isTop(String name) {
		ResultSet rs=null;
		try {
			rs=executeQuery("select * from topic where tname=?", new Object[]{name});
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


	/**
	 * �������
	 * @param top
	 * @return
	 */
	public boolean addTopic(Topic top) {
		try {
			if (executeUpdate("insert into topic values(null,?)",new Object[]{top.getTname()})==1) {
				return true;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}	
		return false;
	}


	/**
	 * �޸�����
	 * @param top
	 * @return
	 */
	public boolean updateTopic(Topic top) {
		try {
			if (executeUpdate("update topic set  tname=? where tid=?",new Object[]{top.getTname(),top.getTid()})==1) {
				return true;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}	

		return false;
	}


	/**
	 * ɾ������
	 * @param tid
	 * @return
	 */
	public boolean deleteTopic(int tid) {
		try {
			if (executeUpdate("delete from topic where tid=?",new Object[]{tid})==1) {
				return true;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}	
		return false;
	}

	
	
	
	
	
	
	
	
	
}
