<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../header.jsp" %>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Insert title here</title>
</head>
<body>

<div class="w3-container w3-brown">
	<h1>Movie List</h1> 
	<p>검색 결과</p> 
	<form id="frm" >
			<div class="form-group" >
              	<input type="text" class="form-control" id="searchMovie" name="searchMovie" placeholder="search for movie">
            </div>	
	</form>
</div>
<div class="w3-row-padding" style="margin-top:30px;" ></div>
<div class="container">
		<div class="row" style="border-bottom: 2px solid #ececec; padding: 0 0 15px;">
<c:choose>
    <c:when test="${fn:length(list) > 0 }">
    	<c:forEach items="${list }" var="row">	
			<!-- profile start-->		
			<div class="col-md-8"> 
				<h2> <c:out value="${row.title}"></c:out>  </h2> <!-- title -->
				<div style="border-bottom: 1px solid #ececec; padding: 0 0 15px; color:gray;">${row.titleEng}</div>
				<div style="margin:10px 0 -5px;"> 개요 : <c:out value="${row.age}"></c:out> · <c:out value="${row.runtime}"></c:out> · <c:out value="${row.repRlsDate}"></c:out> </div>
				<div style="margin:10px 0 -5px;"> 장르 : <c:out value="${row.genre}"></c:out></div>
				<div style="margin:10px 0 -5px;"> 감독 : <c:out value="${row.directorNm}"></c:out> </div>
				<div style="margin:10px 0 -5px;"> 주연 :			
					<c:forEach items="${row.actors }" var="actors">
						<c:out value="${actors}"></c:out>
					</c:forEach>
				</div>
				<div style="margin:10px 0 -5px;"> 줄거리 : <c:out value="${row.plot}"></c:out></div>
			</div>
			<div class="col-md-4"> <!-- image -->
				<img src= <c:out value="${row.img}"></c:out> alt="Card image" style="width:350px; height:450px;">
				<form method="post" action="../sql/sql_movie_rate_insert.jsp">
					<input type="hidden" value="movieId" name="movie_id" >
					<input type="hidden" value="movieSeq" name="movie_seq">
					<input type="hidden" value="user_id" name="user_id" >
					<input type="hidden" value="title" name="title" >
					<input type="hidden" value="img" name="img" >
					
					<!-- <input type="submit" class="btn btn-primary pull-right" value="점수 등록"> -->
				</form>
			</div>
			<!-- profile end-->
			</c:forEach>
    </c:when>
    <c:otherwise>
     <tr>
      <td colspan="4">조회된 결과가 없습니다.</td>
     </tr>
    </c:otherwise>
   </c:choose>
		</div>
	
<div class="nice">
	<div>
	<c:choose>
		<c:when test="${fn:length(recoList) > 0 }">
			<c:forEach items="${recoList }" var="row">
			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<a href="#"><img class="card-img-top" src="${row.img}" alt=""></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#">${row.movieName}</a>
						</h4>
					</div>
				</div>
			</div>
			</c:forEach>
		</c:when>
		<c:otherwise>
		     <tr>
		      <td colspan="4">조회된 결과가 없습니다.</td>
		     </tr>
    	</c:otherwise>
	</c:choose>
	</div>
</div>


<div class="col-lg-12">
  	
  	  <div class="row">
  	  
  	    <div class="col-lg-3 col-md-6 mb-4">
  	    
  	      <div class="card h-100">
  	        <a href="#"><img class="card-img-top" src="http://placehold.it/250x400" alt=""></a>
  	        <div class="card-body">
  	          <h4 class="card-title">
  	            <a href="#">영화이름</a>
  	          </h4>
  	          
  	        </div>
  	      </div>
  	      
  	      
  	    </div>
  	    <!-- col-lg-3 col-md-6 mb-4 -->
  	    
  	    <div class="col-lg-3 col-md-6 mb-4">
  	    
  	      <div class="card h-100">
  	        <a href="#"><img class="card-img-top" src="http://placehold.it/250x400" alt=""></a>
  	        <div class="card-body">
  	          <h4 class="card-title">
  	            <a href="#">영화이름</a>
  	          </h4>
  	          
  	        </div>
  	      </div>
  	      
  	      
  	    </div>
  	    <!-- col-lg-3 col-md-6 mb-4 -->
  	    
  	    <div class="col-lg-3 col-md-6 mb-4">
  	    
  	      <div class="card h-100">
  	        <a href="#"><img class="card-img-top" src="http://placehold.it/250x400" alt=""></a>
  	        <div class="card-body">
  	          <h4 class="card-title">
  	            <a href="#">영화이름</a>
  	          </h4>
  	          
  	        </div>
  	      </div>
  	      
  	      
  	    </div>
  	    <!-- col-lg-3 col-md-6 mb-4 -->
  	    
  	    <div class="col-lg-3 col-md-6 mb-4">
  	    
  	      <div class="card h-100">
  	        <a href="#"><img class="card-img-top" src="http://placehold.it/250x400" alt=""></a>
  	        <div class="card-body">
  	          <h4 class="card-title">
  	            <a href="#">영화이름</a>
  	          </h4>
  	          
  	        </div>
  	      </div>
  	      
  	      
  	    </div>
  	    <!-- col-lg-3 col-md-6 mb-4 -->
  	    
  	  </div>
  	  <!-- row -->
  	  
    </div>
    <!-- col-lg-12 -->
    
</div>
<!-- container -->

<script type="text/javascript">
$(document).ready(function() {
	$('#searchMovie').keypress(function (event) {
	    if (event.keyCode === 10 || event.keyCode === 13) {
	        event.preventDefault();
	        fn_moveToSearchResult();
	    }
	});
});

function fn_moveToSearchResult() {
	var comSubmit = new ComSubmit("frm");
	comSubmit.setUrl("<c:url value='/movie/openSearchResult.do' />");
    comSubmit.submit();
}

</script>	


</body>
</html>