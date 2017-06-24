<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "dbHandling.*"%>
<% 
	String id = request.getParameter("ID"); 
	String password = request.getParameter("PASSWORD"); 
	String name = request.getParameter("NAME"); 
	String birth = request.getParameter("BIRTH"); 
	
	DBHandler dbHandler = new  DBHandler();
	dbHandler.addUser(id, password, name, birth);
	
	response.sendRedirect("Login.jsp?STATUS=");
%>
    