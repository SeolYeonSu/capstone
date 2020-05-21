<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<title>Insert title here</title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!-- <link rel="stylesheet" type="text/css" href="<c:url value='/css/ui.css'/>" /> -->

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/common.js' />" charset="utf-8"></script>

<!-- Bootstrap-->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body>
<!-- 네비게이션  -->
   <nav class="navbar navbar-default">
      <div class="navbar-header">
         <button type="button" class="navbar-toggle collapsed"
            data-toggle="collapse" data-target="bs-example-navbar-collapse-1"
            aria-expaned="false">
            <span class="icon-bar"></span> <span class="icon-bar"></span> <span
               class="icon-bar"></span>
         </button>
         <a class="navbar-brand" href="#" id="home">영추사</a>
      </div>
      
      <div class="collapse navbar-collapse"
         id="#bs-example-navbar-collapse-1">
         <ul class="nav navbar-nav">
            <li><a href="#" id="bbsBtn">영화 뉴스</a></li>
            <li><a href="#" id="bbsBtn">자유 게시판</a></li>   
         </ul>

         <ul class="nav navbar-nav navbar-right">
         <p class="navbar-text navbar-left">
              <a href="#" class="navbar-link">
               <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
            </a>
         </p>
         <li class="dropdown">
         <a href="" class="dropdown-toggle"
	           	 data-toggle="dropdown" role="button" aria-haspopup="true"
	             aria-expanded="false">        	
         <c:choose>
			 <c:when test="${loginInfo.size() > 0 }">
			 	<span>${loginInfo.ID}님</span>
			  	<ul class="dropdown-menu">					
					<li><a href="#">회원정보</a></li>
					<li><a href="#">내 활동</a></li>
					<li role="presentation" class="divider"></li>
					<li><a href="#" id="logoutBtn">로그아웃</a></li>
			  	</ul>
			 </c:when>
			 <c:otherwise>
			 	<span class="glyphicon glyphicon-user"></span>
	            <ul class="dropdown-menu">          
	               <li><a href="#" id="loginBtn">로그인</a></li>
	               <li><a href="#" id="signUpBtn">회원가입</a></li>    
           		</ul>
			 </c:otherwise>
		 </c:choose>    
		 </a>        
         </li>
      </ul>
      </div>
   </nav>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
<script type="text/javascript">
$(document).ready(function() {
 
 $("#signUpBtn").unbind("click").click(function(e) {
  e.preventDefault();
  fn_moveToSignUp();
 });
 
 $("#loginBtn").unbind("click").click(function(e) {
  e.preventDefault();
  fn_moveToLogin();
 });
 
 $("#logoutBtn").unbind("click").click(function(e) {
  e.preventDefault();
  fn_logout();
 });
 
 $("#bbsBtn").unbind("click").click(function(e) {
  e.preventDefault();
  fn_moveToBBS();
 });

 $("#home").unbind("click").click(function(e) {
  e.preventDefault();
  fn_home();
 });
 
});
 
function fn_moveToSignUp() {
	window.location.href="<c:url value='/user/openSignUp.do' />";
	
 //window.location.href="/user/openSignUp.do";
}
 
function fn_moveToLogin() {
	window.location.href="<c:url value='/user/openLogin.do' />";
// window.location.href="/user/openLogin.do";
}
 
function fn_logout() {
 if (window.confirm("로그아웃 하시겠습니까?"))
 {
	 window.location.href="<c:url value='/user/logoutTry.do' />";
  //window.location.href="/user/logoutTry.do";
 }
}
 
function fn_moveToBBS() {
	window.location.href="<c:url value='/sample/openBoardList.do' />";
 //window.location.href = "/bbs/openBoardList.do";로그인 안해도 게시판은 볼수잇게 인터셉터 취소
}

function fn_home() {
	window.location.href="<c:url value='/home.do' />";
}
</script>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>
</html>