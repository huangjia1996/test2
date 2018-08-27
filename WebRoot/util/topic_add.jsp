<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
		String url="../newspages/topic_add.jsp";
		if(session.getAttribute("user")==null){
			url="../index.jsp";
		}
		response.sendRedirect(url);
 %>
