<%@page import="recommend.EvalInfo"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="dbHandling.*, recommend.EvalInfo" %>
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
String movieCd = request.getParameter("movieCd");
String rate = request.getParameter("rate");
String dest = request.getParameter("dest");
String text = "";


DBHandler dbHandler = new DBHandler();
EvalInfo info= dbHandler.getEval(id, movieCd);
System.out.println(id);
System.out.println(movieCd);
System.out.println(rate);
if(info!=null)
	text = info.getText();
System.out.println(text);
dbHandler.addEval(id, movieCd, rate, text);

response.sendRedirect(dest);
%>
