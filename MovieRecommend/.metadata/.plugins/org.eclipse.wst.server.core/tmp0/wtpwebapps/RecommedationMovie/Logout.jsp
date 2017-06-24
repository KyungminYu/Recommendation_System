<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	session.removeAttribute("ID");
	session.invalidate();
    out.println("<script type='text/javascript'>");
    out.println("parent.location.reload();");
    out.println("</script>");
%>