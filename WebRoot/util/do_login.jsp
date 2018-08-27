<%@page import="entity.User"%>
<%@page import="Impl.UserImpl"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	UserImpl ui = new UserImpl();
	User user = ui.login(request.getParameter("uname"));
	String upwd = request.getParameter("upwd");
	String url="../index.jsp";
	if (user != null) {
		if (user.getUpwd().equals(upwd)) {
			session.setAttribute("user", user);
			url="../newspages/admin.jsp";
		}
	}
	response.sendRedirect(url);
%>

