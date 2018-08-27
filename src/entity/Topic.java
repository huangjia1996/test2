package entity;

/**
 * 新闻类型类
 * @author Administrator
 *
 */
public class Topic {
	
	public Topic() {
		super();
	}
	public Topic(int tid, String tname) {
		super();
		this.tid = tid;
		this.tname = tname;
	}
	private int tid;
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	private String tname;
}
