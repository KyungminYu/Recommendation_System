<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "dbHandling.*, recommend.PersonInfo, java.sql.ResultSet" %>
<%
	DBHandler dbHandler = new DBHandler();
	String id = (String)session.getAttribute("ID");
	PersonInfo info = dbHandler.getUser(id);
%>
<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js">
    </script>
</head>
<body>
    <form action = UserUpdate.jsp>
        <div class="form-group">
            <label for="exampleInputEmail1">아이디</label>
            <input type="email" class="form-control" name="ID" value=<%=info.getID() %> placeholder="이메일을 입력하세요" readonly>
        </div>
        <div class="form-group">
            <label for="exampleInputPassword1">암호</label>
            <input type="password" class="form-control" name="PASSWORD" value=<%=info.getPASSWORD() %>  placeholder="암호">
        </div>
        <div class="form-group">
            <label for="exampleInputName">이름</label>
            <input type="text" class="form-control" name="NAME" value=<%=info.getNAME() %>  placeholder="이름을 입력하세요">
        </div>
        <div class="form-group">
            <label for="exampleInputDate">생년월일</label>
            <input type="date" class="form-control" name="BIRTH" value=<%=info.getBIRTH() %>  placeholder="태어난 생년월일을 입력하세요">
        </div>
        <button type="submit" class="btn btn-default">수정</button>
    </form>
</body>
</html>