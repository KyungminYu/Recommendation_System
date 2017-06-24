<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "dbHandling.*"%>
<% 
	String id = request.getParameter("ID"); 
	String password = request.getParameter("PASSWORD"); 
	String name = request.getParameter("NAME"); 
	String birth = request.getParameter("BIRTH"); 
	System.out.println(id+";"+password+";"+name+";"+birth);
	DBHandler dbHandler = new  DBHandler();
	dbHandler.updateUser(id, password, name, birth);

	RequestDispatcher dispatcher = request.getRequestDispatcher("HomeContentView.jsp");
	dispatcher.forward(request, response);
%>
    