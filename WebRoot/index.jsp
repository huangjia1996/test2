<%@page import="Impl.NewsImpl"%>
<%@page import="Impl.TopicImpl"%>
<%@page import="entity.Topic"%>
<%@page import="entity.News"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新闻中国</title>
<link href="css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript">
	function checkNull() {
		if ($("#uname").val().trim() == "") {
			alert("用户名不能为空");
			return false;
		} else if ($("#upwd").val().trim() == "") {
			alert("密码不能为空");
			return false;
		}
		return true;
	}
</script>
</head>

<body onload="focusOnLogin()">
	<div id="header">
		<div id="top_login">
			<form action="util/do_login.jsp" method="post">
				<label> <br />登录名 </label> <input id="uname" type="text"
					name="uname" value="" class="login_input" /> <label>
					密&#160;&#160;码 </label> <input type="password" id="upwd" name="upwd"
					value="" class="login_input" /> <input type="submit" id="sub"
					class="login_sub" value="登录" onclick="checkNull()" /> <label
					id="error"> </label> <img src="images/friend_logo.gif" alt="Google"
					id="friend_logo" />
			</form>
		</div>
		<div id="nav">
			<div id="logo">
				<img src="images/logo.jpg" alt="新闻中国" />
			</div>
			<div id="a_b01">
				<img src="images/a_b01.gif" alt="" />
			</div>
			<!--mainnav end-->
		</div>
	</div>
	<div id="container">
		<!-- 边栏 -->
		<div class="sidebar">
			<h1>
				<img src="images/title_1.gif" alt="国内新闻" />
			</h1>
			<div class="side_list">
				<ul>
					<%
						NewsImpl ni = new NewsImpl();
						for (News item : ni.getNews(1)) {
							out.print("<li><a href='news_read.jsp?nid=" + item.getNid()
									+ "'><b>" + item.getNtitle() + "</b> </a></li>");

						}
					%>
				</ul>
			</div>
			<h1>
				<img src="images/title_2.gif" alt="国际新闻" />
			</h1>
			<div class="side_list">
				<ul>
					<%
						for (News item : ni.getNews(2)) {
							out.print("<li><a href='news_read.jsp?nid=" + item.getNid()
									+ "'><b>" + item.getNtitle() + "</b> </a></li>");
						}
					%>
				</ul>
			</div>
			<h1>
				<img src="images/title_3.gif" alt="娱乐新闻" />
			</h1>
			<div class="side_list">
				<ul>
					<%
						for (News item : ni.getNews(5)) {
							out.print("<li><a href='news_read.jsp?nid=" + item.getNid()
									+ "'><b>" + item.getNtitle() + "</b> </a></li>");
						}
					%>
				</ul>
			</div>
		</div>




		<div class="main">
			<div class="class_type">
				<img src="images/class_type.gif" alt="新闻中心" />
			</div>
			<div class="content">
				<ul class="class_date">
					<a href=index.jsp?ntid=-1><b>全部</b> </a>
					<%
						TopicImpl ti = new TopicImpl();
						for (Topic item : ti.getTops()) {
							out.print("<a href=index.jsp?ntid=" + item.getTid() + "><b>"
									+ item.getTname() + "</b> </a>");
						}
					%>
				</ul>
				<ul class="classlist">


					<%
						//获取指定新闻类型的集合
						//	NewsImpl ni = new NewsImpl();
						List<News> newsList = null;
						if (request.getParameter("ntid") != null) {
							if (request.getParameter("ntid").equals("-1")) {
								newsList = ni.getNews(-1);
								session.removeAttribute("ntid");
							} else {
								newsList = ni.getNews(Integer.parseInt(request
										.getParameter("ntid")));
								session.setAttribute("ntid", request.getParameter("ntid"));
							}
							session.removeAttribute("indexYe");
						} else if (session.getAttribute("ntid") != null) {
							newsList = ni.getNews(Integer.parseInt(session.getAttribute(
									"ntid").toString()));
							session.removeAttribute("indexYe");
						} else {
							newsList = ni.getNews(-1);
						}
						int max = 0;
						if (newsList.size() % 20 == 0 && newsList.size() != 0) {
							max = newsList.size() / 20 - 1;
						} else {
							max = newsList.size() / 20;
						}
						//设置最大页数
						session.setAttribute("maxIndex", max);
						//当前页数
						int count = 0;

						//获取当前页数
						if (session.getAttribute("indexYe") != null) {
							count = Integer.parseInt(session.getAttribute("indexYe")
									.toString());
						} else {
							session.setAttribute("indexYe", count);
						}

						//判断是否是换页
						if (request.getParameter("type") != null) {
							String type = request.getParameter("type");
							if (type.equals("up")) {
								if (count != 0) {
									count--;
									session.setAttribute("indexYe", count);
								}
							} else if (type.equals("down")) {
								if (count < Integer.parseInt(session.getAttribute(
										"maxIndex").toString())) {
									count++;
									session.setAttribute("indexYe", count);
								}
							} else if (type.equals("max")) {
								count = Integer.parseInt(session.getAttribute("maxIndex")
										.toString());
								session.setAttribute("indexYe", count);
							} else if (type.equals("first")) {
								count = 0;
								session.setAttribute("indexYe", count);
							}
						}
						//添加新闻
						for (int i = count * 20; i < newsList.size(); i++) {
							if (i == (count + 1) * 20) {
								break;
							}
							out.print("<li><a href='#'>" + newsList.get(i).getNtitle()
									+ "</a><span>"
									+ newsList.get(i).getNcreateDate().substring(0, 19)
									+ " </span></li>");
						}
					%>







					<p align="right">
						当前页数:[<%=Integer.parseInt(session.getAttribute("indexYe")
					.toString()) + 1%>/<%=Integer.parseInt(session.getAttribute("maxIndex")
					.toString()) + 1%>]&nbsp; <a href="index.jsp?type=up">上一页</a> <a
							href="index.jsp?type=down">下一页</a> <a href="index.jsp?type=max">末页</a>&nbsp;<a
							href="index.jsp?type=first">首页</a> <br />
						<p style="float:right"></p>

					</p>
				</ul>
			</div>
			<div class="picnews">
				<ul>
					<li><a href="#"><img src="images/Picture1.jpg" width="249"
							alt="" /> </a><a href="#">幻想中穿越时空</a></li>
					<li><a href="#"><img src="images/Picture2.jpg" width="249"
							alt="" /> </a><a href="#">国庆多变的发型</a></li>
					<li><a href="#"><img src="images/Picture3.jpg" width="249"
							alt="" /> </a><a href="#">新技术照亮都市</a></li>
					<li><a href="#"><img src="images/Picture4.jpg" width="249"
							alt="" /> </a><a href="#">群星闪耀红地毯</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div id="friend">
		<h1 class="friend_t">
			<img src="images/friend_ico.gif" alt="合作伙伴" />
		</h1>
		<div class="friend_list">
			<ul>
				<li><a href="#">百度</a></li>
				<li><a href="#">谷歌</a></li>
				<li><a href="#">新浪</a></li>
				<li><a href="#">网易</a></li>
				<li><a href="#">搜狐</a></li>
				<li><a href="#">人人</a></li>
				<li><a href="#">中国政府网</a></li>
			</ul>
		</div>
	</div>
	<div id="footer">
		<p class="">
			24小时客户服务热线：010-68988888 &#160;&#160;&#160;&#160; <a href="#">常见问题解答</a>
			&#160;&#160;&#160;&#160; 新闻热线：010-627488888 <br />
			文明办网文明上网举报电话：010-627488888 &#160;&#160;&#160;&#160; 举报邮箱： <a href="#">jubao@jb-aptech.com.cn</a>
		</p>
		<p class="copyright">
			Copyright &copy; 1999-2009 News China gov, All Right Reserver <br />
			新闻中国 版权所有
		</p>
	</div>
</body>
</html>

