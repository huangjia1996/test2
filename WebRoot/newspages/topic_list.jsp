<%@page import="Impl.TopicImpl"%>
<%@page import="entity.Topic"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("user") == null) {
		response.sendRedirect("../index.jsp");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加主题--管理后台</title>
<link href="../css/admin.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div id="header">
		<div id="welcome">欢迎使用新闻管理系统！</div>
		<div id="nav">
			<div id="logo">
				<img src="../images/logo.jpg" alt="新闻中国" />
			</div>
			<div id="a_b01">
				<img src="../images/a_b01.gif" alt="" />
			</div>
		</div>
	</div>
	<div id="admin_bar">
		<div id="status">
			管理员： 登录 &#160;&#160;&#160;&#160; <a
				href="newspage/login.jsp?action=loginout">login out</a>
		</div>
		<div id="channel"></div>
	</div>
	<div id="main">
		<div id="opt_list">
			<ul>
				<li><a href="news_add.jsp">添加新闻</a></li>
				<li><a href="../util/news_control.jsp?opr=list">编辑新闻</a></li>
				<li><a href="topic_add.jsp">添加主题</a></li>
				<li><a href="../util/topic_ control.jsp?opr=list">编辑主题</a></li>
			</ul>
		</div>

		<div id="opt_area">
			<ul class="classlist">
				<%
					for (Topic item : new TopicImpl().getTops()) {
					//	out.print("<li>&#160;&#160;&#160;&#160; "+item.getTname()+" &#160;&#160;&#160;&#160; <ahref='topic_modify.jsp?tid="+item.getTid()+"&tname="+item.getTname()+"'>修改</a>&#160;&#160;&#160;&#160; <ahref='../util/topic_ control.jsp?opr=del&tid="+item.getTid()+"'>删除</a></li>");
					
					
				%>
				<li>&#160;&#160;&#160;&#160; <%=item.getTname() %> &#160;&#160;&#160;&#160; <a
					href='topic_modify.jsp?tid=<%=item.getTid() %>&tname=<%=item.getTname() %>'>修改</a>
					&#160;&#160;&#160;&#160; <a
					href='../util/topic_ control.jsp?opr=del&tid=<%=item.getTid() %>'>删除</a>
				</li>
				<% }%>
					<%
		if (session.getAttribute("topicTishi") != null) {
	%>
	<script type="text/javascript">
			alert("<%=session.getAttribute("topicTishi")%>");
		</script>
	<%
		session.removeAttribute("topicTishi");
		}
	%>
			</ul>
		</div>
	</div>
	<div id="footer">
		<div id="site_link">
			<a href="#">关于我们</a><span>|</span> <a href="#">Aboue Us</a><span>|</span>
			<a href="#">联系我们</a><span>|</span> <a href="#">广告服务</a><span>|</span>
			<a href="#">供稿服务</a><span>|</span> <a href="#">法律声明</a><span>|</span>
			<a href="#">招聘信息</a><span>|</span> <a href="#">网站地图</a><span>|</span>
			<a href="#">留言反馈</a>
		</div>
		<div id="footer">
			<p class="">
				24小时客户服务热线：010-68988888 &#160;&#160;&#160;&#160; <a href="#">常见问题解答</a>
				&#160;&#160;&#160;&#160; 新闻热线：010-627488888<br />
				文明办网文明上网举报电话：010-627488888 &#160;&#160;&#160;&#160; 举报邮箱：<a href="#">jubao@jb-aptech.com.cn</a>
			</p>
			<p class="copyright">
				Copyright &copy; 1999-2009 News China gov, All Right Reserver<br />
				新闻中国 版权所有
			</p>
		</div>
</body>
</html>
</div>
</body>
</html>
