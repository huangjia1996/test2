package dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class Basedao {
	private static String driver;
	private static String url;
	private static String uid;
	private static String pwd;
	private static Connection con;
	private PreparedStatement ps;

	public Basedao() {
		initil();
	}

	/**
	 * 初始化con
	 */
	private void initil() {
		Properties per = new Properties();
		try {
			per.load(Basedao.class.getClassLoader().getResourceAsStream(
					"database.properties"));
			driver = per.getProperty("driver");
			url = per.getProperty("url");
			uid = per.getProperty("uid");
			pwd = per.getProperty("pwd");
			Class.forName(driver);
			con = DriverManager.getConnection(url, uid, pwd);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 得到连接对象
	 * 
	 * @return
	 */
	public Connection getCon() {
		if (con == null) {
			initil();
		}
		return con;
	}

	/**
	 * 查询
	 * 
	 * @return
	 */
	public ResultSet executeQuery(String sql, Object[] obs) {
		getCon();
		try {
			ps = con.prepareStatement(sql);
			if (obs != null) {
				for (int i = 0; i < obs.length; i++) {
					ps.setObject(i + 1, obs[i]);
				}
			}
			return ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

		}
		return null;
	}

	/**
	 * 赠删改
	 * 
	 * @return
	 */
	public int executeUpdate(String sql, Object[] obs) {
		getCon();
		try {
			ps = con.prepareStatement(sql);
			if (obs != null) {
				for (int i = 0; i < obs.length; i++) {
					ps.setObject(i + 1, obs[i]);
				}
			}
			return ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(null);
		}
		return -1;
	}

	/**
	 * 事务赠删改
	 * 
	 * @return
	 */
	public int executeUpdateTran(String[] sql, Object[][] objs) {
		getCon();
		try {
			con.setAutoCommit(false);
			for (int i = 0; i < sql.length; i++) {
				ps = con.prepareStatement(sql[i]);
				if (objs[i] != null) {
					for (int j = 0; j < objs[i].length; j++) {
						ps.setObject(j + 1, objs[i][j]);
					}
				}
				ps.executeUpdate();
			}
			con.commit();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			try {
				con.setAutoCommit(true);
				close(null);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return -1;
	}

	/**
	 * 关闭
	 */
	public void close(ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
