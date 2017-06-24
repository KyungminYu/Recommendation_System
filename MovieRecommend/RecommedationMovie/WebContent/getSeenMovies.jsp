<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList, java.util.List, recommend.*, dbHandling.*" %>
<% 

	String id;
	if((String)session.getAttribute("ID")==null){
		id = "";
		RequestDispatcher dispatcher = request.getRequestDispatcher("Login.jsp?STATUS=UNKNOWN");
		dispatcher.forward(request, response);
	}
	else{
		id = (String)session.getAttribute("ID");
	}
	DBHandler dbHandler = new DBHandler();
	ArrayList<EvalInfo> list = dbHandler.getEvals(id);
	for(int i=0;i<list.size();i++)
		session.setAttribute("seen_"+i, list.get(i).getMovieCd());
	

	response.sendRedirect("SeenMovieList.jsp?page=0");
%>