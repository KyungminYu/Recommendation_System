<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<body>
    <p  style="position:absolute; top:30%; left:30%; font-size:50px;  font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    border:1px solid;background-color:white; opacity:0.5" ><b>어떤 영화 좋아하세요?</b></p>
    <img src="1.jpg" id=mainImage alt="YsjImage" style="width:100%;height:100%;margin:0 auto">
    <script>
var myImage=document.getElementById("mainImage");
var imageArray=["1.jpg","2.jpg","3.jpg","4.jpg"];
var imageIndex=0;

function changeImage(){
	myImage.setAttribute("src",imageArray[imageIndex]);
	imageIndex++;
	if(imageIndex>=imageArray.length){
		imageIndex=0;
	}
}
setInterval(changeImage,5000);
    </script>
</body>
</html>