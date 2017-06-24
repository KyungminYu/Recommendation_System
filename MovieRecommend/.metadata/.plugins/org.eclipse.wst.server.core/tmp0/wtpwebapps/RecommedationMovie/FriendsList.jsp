﻿<%@page import="java.util.ArrayList"%>
<%@page import="dbHandling.DBHandler, recommend.MovieInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String id = (String)session.getAttribute("ID");

	String strPage = (String)request.getParameter("page");
	int PAGE = Integer.parseInt(strPage);
	
	DBHandler dbHandler = new DBHandler();
	ArrayList<String> list = dbHandler.getFriends(id);
	
    %>
    <!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js">
    </script>
<script>
var tmp;
function setMovieCd(str){
	tmp = str;
}
function Rating(){
	//여기에 DB로 평점 보내는 쿼리 작성
	var rate = document.getElementById("RATE").value;
	//alert(rate)
	location.replace("Rating.jsp?movieCd="+tmp+"&rate="+rate+"&dest=getFriendsMovie.jsp?Friend="); 
}
function Texting(){
	var text = document.getElementById("TEXT").value;
	//여기에 DB로 평점 보내는 쿼리 작성
	location.replace("Texting.jsp?movieCd="+tmp+"&text="+text+"&dest=getFriendsMovie.jsp?Friend="); 
}
</script>
</head>
<body>

    <div class="container">
        <div class="navbar nav-stacked"  style="width:20%; height: 300px; float:left">
        <form action="CheckFriendID.jsp">
        새 친구 ID 추가  <input type="text" name=FRIENDID> <input class="btn btn-primary" type="submit" value="추가">
        </form>
            <ul class="nav">
            <%
            for(int i=0;i<list.size();i++){
            	out.println("<li><a href='getFriendsMovie.jsp?Friend="+list.get(i)+"'>"+list.get(i)+"</a></li>");
            }
            %>
            </ul>
        </div>
        <div style="width:80%">
            
            <%

            if(list.size()!=0)
        		out.println("<H1>"+(String)(session.getAttribute("FRIEND"))+"의 추천 영화</H1>");
            else
        		out.println("<H1>친구가 없습니다</H1>");
            %>
            <div class="row">
            <%
            	
            for(int i = PAGE*6; i<(PAGE+1)*6 && session.getAttribute("friendRecommend_"+i)!=null;i++){
                String movieCd = (String)session.getAttribute("friendRecommend_"+i);
                MovieInfo info = dbHandler.getData(movieCd);
            	System.out.println(movieCd);
        		out.println("<div class='col-sm-6 col-md-4'>");
        		out.println("<div class='thumbnail'>");
        		out.println("<img src='"+info.getURL()+"' alt='포스터 없음' style='max-width: auto; height: 400px;'>");
        		out.println("<div class='caption'>");
        		out.println("<h3 class='text'>"+info.getMovieName()+"</h3>");
        		out.println("<h4 class='text'>-"+info.getMovieNameEn()+"</h4>");
        		out.println("<p>장르: "+info.getGenre()+"</p>");
        		out.println("<p>국가: "+info.getNation()+"</p>");
        		out.println("<p>개봉일: "+info.getOpenYr()+"</p>");
        		out.println("<p><button type='button' class='btn btn-primary' data-toggle='modal' data-target='#RateModal2' onclick='setMovieCd("+movieCd+")'>평점</button>"+
                        "<button type='button' class='btn' data-toggle='modal' data-target='#ReviewModal2'  onclick='setMovieCd("+movieCd+")'>후기	</button></p>");
        		out.println("</div></div></div>");
        	}
            %>
            </div>
            <ul class="pager">
            <%
            	if(1<=PAGE)
	        		out.println("<li class='previous'><a href='FriendsList.jsp?page="+(PAGE-1)+"'><span aria-hidden='true'>&larr;</span> Older</a></li>");
            	if(session.getAttribute("friendRecommend_"+(PAGE+1)*6)!=null)
            		out.println("<li class='next'><a href='FriendsList.jsp?page="+(PAGE+1)+"'>Newer <span aria-hidden='true'>&rarr;</span></a></li>");
            	%> 
            </ul>

        </div>
    </div><!-- 평점 -->
	<div class="modal fade bs-example-modal-sm" id="RateModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  <div class="modal-dialog modal-sm">
	    <div class="modal-content">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×종료</span><span class="sr-only">Close</span></button>
		<h4 class="modal-title" id="myModalLabel">평점</h4>
	      </div>
	      <div class="modal-body">
			<input type="number" id=RATE style="width: 30px"> / 5.0
	      </div>
	      <div class="modal-footer">
		<a type="button" class="btn btn-default" data-dismiss="modal">종료</a>
		<button onclick = 'Rating()'  type="button" class="btn btn-primary">저장</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 후기남기기 -->
	<div class="modal fade" id="ReviewModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×종료</span><span class="sr-only">Close</span></button>
		<h4 class="modal-title" id="myModalLabel">후기</h4>
	      </div>
	      <div class="modal-body">
			<textarea rows="5" cols="70" id=TEXT></textarea>
	      </div>
	      <div class="modal-footer">
		<a type="button" class="btn btn-default" data-dismiss="modal">종료</a>
		<button onclick = 'Texting()'  type="button" class="btn btn-primary">저장</button>
	      </div>
	    </div>
	  </div>
	</div>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script><!-- ie10-viewport-bug-workaround.js -->
<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script><!-- holder.js -->
</body>
</html>
