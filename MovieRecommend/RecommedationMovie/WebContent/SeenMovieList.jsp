<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dbHandling.*, recommend.MovieInfo" %>
    
<%
	String strPage = request.getParameter("page");
System.out.println(strPage);
	int PAGE = Integer.parseInt(strPage);
	DBHandler dbHandler = new DBHandler();
%>

<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title></title><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

<script>
var tmp;
function setMovieCd(str){
	tmp = str;
}
function Rating(){
	//여기에 DB로 평점 보내는 쿼리 작성
	var rate = document.getElementById("RATE").value;
	//alert(rate)
	location.replace("Rating.jsp?movieCd="+tmp+"&rate="+rate+"&dest=getSeenMovies.jsp"); 
}
function Texting(){
	var text = document.getElementById("TEXT").value;
	//여기에 DB로 평점 보내는 쿼리 작성
	location.replace("Texting.jsp?movieCd="+tmp+"&text="+text+"&dest=getSeenMovies.jsp"); 
}
</script>
</head>
<body>
    <div class="container">
        <div>
            <h1>내가 본 영화 리스트</h1>
	            <div class="row">
	            <%
	        	for(int i = PAGE*6; i<(PAGE+1)*6 && session.getAttribute("seen_"+i)!=null;i++){
	                String movieCd = (String)session.getAttribute("seen_"+i);
	                MovieInfo info = dbHandler.getData(movieCd);
	        		out.println("<div class='col-sm-6 col-md-4'>");
	        		out.println("<div class='thumbnail'>");
	        		out.println("<img src='"+info.getURL()+"' alt='포스터 없음' style='max-width: auto; height: 400px;'>");
	        		out.println("<div class='caption'>");
	        		out.println("<h3 class='text'>"+info.getMovieName()+"</h3>");
	        		out.println("<h4 class='text'>-"+info.getMovieNameEn()+"</h4>");
	        		out.println("<p>장르: "+info.getGenre()+"</p>");
	        		out.println("<p>국가: "+info.getNation()+"</p>");
	        		out.println("<p>개봉일: "+info.getOpenYr()+"</p>");
	        		out.println("<p><button type='button' class='btn btn-primary' data-toggle='modal' data-target='#RateModal2' onclick='setMovieCd("+movieCd+")'>평점</button>" 
	        				+"<button type='button' class='btn' data-toggle='modal' data-target='#ReviewModal2'  onclick='setMovieCd("+movieCd+")'>후기	</button>"
	        				+"<a href='RecommendMovie.jsp?MovieCd="+movieCd+"&page="+PAGE+"' class='btn btn-default' role='button'>추천하기</a></p>");
	        		out.println("</div></div></div>");
	        	}
	            %>
	        	</div>
            <ul class="pager">
            	<%
            	if(1<=PAGE)
	        		out.println("<li class='previous'><a href='SeenMovieList.jsp?page="+(PAGE-1)+"'><span aria-hidden='true'>&larr;</span> Older</a></li>");
            	if(session.getAttribute("seen_"+(PAGE+1)*6)!=null)
            		out.println("<li class='next'><a href='SeenMovieList.jsp?page="+(PAGE+1)+"'>Newer <span aria-hidden='true'>&rarr;</span></a></li>");
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