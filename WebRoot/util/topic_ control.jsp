<%@page import="sun.security.krb5.internal.SeqNumber"%>
<%@page import="Impl.NewsImpl"%>
<%@page import="Impl.TopicImpl"%>
<%@page import="entity.Topic"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String type = request.getParameter("opr");
	TopicImpl ti = new TopicImpl();
	if (type.equals("list")) {
		String url = "../newspages/topic_list.jsp";
		if (session.getAttribute("user") == null) {
			url = "../index.jsp";
		}
		out.print(request.getParameter("opr"));
		response.sendRedirect(url);
	} else if (type.equals("add")) {

		Topic top = new Topic();
		String name = new String(request.getParameter("tname")
				.getBytes("ISO-8859-1"), "UTF-8");
		top.setTname(name);
		//存在主题	
		if (ti.isTop(top.getTname())) {
			session.setAttribute("topicTishi", "该主题已存在");
		} else if (ti.addTopic(top)) {
			session.setAttribute("topicTishi", "添加成功");
		} else {
			session.setAttribute("topicTishi", "添加失败");
		}
		//	session.setAttribute("topicTishi", top.getTname());
		response.sendRedirect("../newspages/topic_add.jsp");
	} else if (type.equals("update")) {
		Topic top = new Topic();
		request.setCharacterEncoding("UTF-8");
		String name = new String(request.getParameter("tname")
				.getBytes("ISO-8859-1"), "UTF-8");
		top.setTname(name);
		top.setTid(Integer.parseInt(request.getParameter("tid")));
		//存在主题	
		if (ti.isTop(top.getTname())) {
			session.setAttribute("topicTishi", "该主题已存在");
		} else if (ti.updateTopic(top)) {
			session.setAttribute("topicTishi", "修改成功");
		} else {
			session.setAttribute("topicTishi", "修改失败");
		}
		response.sendRedirect("../newspages/topic_list.jsp");
	} else if (type.equals("del")) {
		int tid=Integer.parseInt(new String(request.getParameter("tid").getBytes(),"UTF-8"));
		NewsImpl ni=new NewsImpl();
		if(ni.isTopic(tid)){
		session.setAttribute("topicTishi", "存在该类型的新闻，无法删除此主题");
		}else if(ti.deleteTopic(tid)){
		session.setAttribute("topicTishi", "删除成功");
		}else{
		session.setAttribute("topicTishi", "删除失败");
		}
		response.sendRedirect("../newspages/topic_list.jsp");
	}
%>
