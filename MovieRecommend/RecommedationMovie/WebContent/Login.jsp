<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String status = request.getParameter("STATUS"); 
	if(status.equals("FAIL")){
	    out.println("<script type='text/javascript'>");
	    out.println("alert('아이디 또는 비밀번호가 일치하지 않습니다.')");
	    out.println("</script>");
	}
	else if(status.equals("UNKNOWN")){
	    out.println("<script type='text/javascript'>");
	    out.println("alert('로그인후 이용 가능합니다.')");
	    out.println("</script>");
	}
	
%>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <script type="text/javascript">
        
    </script>
</head>
<body >
    <form action="LoginCheck.jsp">
        <div style="width:300px;margin:0 auto;padding-top:10%">
            <div class="form-group">
                <label for="exampleInputEmail1">아이디</label>
                <input type="text" class="form-control" name = ID placeholder="아이디를 입력하세요">
            </div>
            
            <div class="form-group">
                <label for="exampleInputPassword1">암호</label>
                <input type="password" class="form-control" name = PASSWORD placeholder="암호">
            </div>
            
            <div class="checkbox" style="float:left;margin-right:5px;">
                <label>
                    <input type="checkbox"> 입력을 기억합니다  
                </label>
            </div>
            <input type="button" class="btn btn-default" onclick="location.href='Informations.jsp'" value="회원가입" />
            <input type="submit"  class="btn btn-default" style="margin-left:5px"  value = "로그인"/>
        </div>
    </form>
</body>
</html>