<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="dbHandling.*" %>
    <%
    DBHandler handler= new DBHandler();
    String ID= (String)session.getAttribute("ID");
    String friendID= request.getParameter("FRIENDID");
    if(friendID.equals(null)||friendID.equals("")){
    	out.println("존재하지 않는 ID입니다");
    }
    else if(friendID.equals(ID))
    	out.println("본인을 추가할 수 없습니다!");
    if(handler.checkID(friendID)){
    	//존재
    	handler.addFriend(ID, friendID);
	    out.println("<script type='text/javascript'>");
	    out.println("alert('"+friendID+"님이 친구로 추가됬습니다')");
	    out.println("</script>");
    }
    else{
	    out.println("<script type='text/javascript'>");
	    out.println("alert('존재하지 않는 ID입니다')");
	    out.println("</script>");
    }
	RequestDispatcher dispatcher = request.getRequestDispatcher("getFriendsMovie.jsp?Friend="+friendID);
	dispatcher.forward(request, response);
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>