package entity;

public class News {

	public News() {
		super();
	}

	public News(int nid, int ntid, String ntitle, String nauthor,
			String ncreateDate, String npicPath, String ncontent,
			String nsummary) {
		super();
		this.nid = nid;
		this.ntid = ntid;
		this.ntitle = ntitle;
		this.nauthor = nauthor;
		this.ncreateDate = ncreateDate;
		this.npicPath = npicPath;
		this.ncontent = ncontent;
		this.nsummary = nsummary;
	}

	private int nid;
	private int ntid;
	private String ntitle;
	private String nauthor;
	private String ncreateDate;
	private String npicPath;
	private String ncontent;
	private String nsummary;

	public int getNid() {
		return nid;
	}

	public void setNid(int nid) {
		this.nid = nid;
	}

	public int getNtid() {
		return ntid;
	}

	public void setNtid(int ntid) {
		this.ntid = ntid;
	}

	public String getNtitle() {
		return ntitle;
	}

	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}

	public String getNauthor() {
		return nauthor;
	}

	public void setNauthor(String nauthor) {
		this.nauthor = nauthor;
	}

	public String getNcreateDate() {
		return ncreateDate;
	}

	public void setNcreateDate(String ncreateDate) {
		this.ncreateDate = ncreateDate;
	}

	public String getNpicPath() {
		return npicPath;
	}

	public void setNpicPath(String npicPath) {
		this.npicPath = npicPath;
	}

	public String getNcontent() {
		return ncontent;
	}

	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}

	public String getNsummary() {
		return nsummary;
	}

	public void setNsummary(String nsummary) {
		this.nsummary = nsummary;
	}
}
