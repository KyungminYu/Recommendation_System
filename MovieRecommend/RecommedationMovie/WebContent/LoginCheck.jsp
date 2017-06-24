<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="NONEXISTING.jsp"%>
<%@ page import = "dbHandling.*" %>
<%
	String id = request.getParameter("ID"); 
	String password = request.getParameter("PASSWORD"); 
	System.out.println(id+"\t"+password);
	DBHandler dbHandler = new DBHandler();
	if(dbHandler.isUser(id, password)){
		session.setAttribute("ID", id);
        out.println("<script type='text/javascript'>");
        out.println("parent.location.reload();");
        out.println("</script>");
        
	}
	else{
        response.sendRedirect("Login.jsp?STATUS=FAIL");
	}
//여기에서 검증과정 걸쳐서 맞으면 통과 아니면 에러
%>