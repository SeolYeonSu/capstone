<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../header.jsp" %>

<!-- css comments -->
<link rel="stylesheet" type="text/css" href="<c:url value='/css/comments.css'/>" /> 



<title>Insert title here</title>

<style>
	.starR{
	  	background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
	  	background-size: auto 100%;
	  	width: 30px;
	  	height: 30px;
	  	display: inline-block;
	  	text-indent: -9999px;
	  	cursor: pointer;
	}
	.starR.on{background-position:0 0;}
	
	.box{
	  border: 1px solid #d6d6d6;
	  border-radius: 4px;
	  background-color: #fff;
	  overflow: hidden;
	}
    .box-container, .box-container2{
      margin: 15px;
    }
    .center{
      text-align: center;
    }
    .right{
      text-align: right;
    }
    .left {
      text-align: left;
    }
    .img-auto{
      width: auto; height: auto;
      max-width: 100%;
      max-height: 350px;
    }
  </style>
</head>
<body class="body-set">



<!-- 여기서 부터 시작 -->
<div class="container">
    <!-- 영화 정보 출력 -->
<c:choose>
<c:when test="${fn:length(list) > 0 }">
<c:forEach items="${list }" var="row">
    <div class="jumbotron col-lg-12 col-xs-12 box">
    
  	  
  	    <h3 class="my-4">
  	      Movie Result
  	    </h3>
  	  
  	    <div class="col-lg-2 col-xs-12 center">
  	      <a href="#"><img class="img-auto" src="${row.img}" alt=""></a>
  	    </div>
  	    <div class="col-lg-5 col-xs-12">
  	      <h2 class="card-title">
  	        ${row.title}
  	      </h2>
  	      <h4 class="card-title">
  	        <small>${row.repRlsDate} ・ ${row.runtime} ・ ${row.age}</small>
  	      </h4>
  	      <h3 class="card-title">
  	        <a href="#"></a>
  	      </h3>
  	      <h4 class="card-title">
  	      	<c:choose>
  	      	<c:when test="${fn:length(ratingAVG) > 0 }">
  	      		영화 평균 점수 : <span class="glyphicon glyphicon-star"></span>${ratingAVG}
  	      	</c:when>
  	      	<c:otherwise>
  	      		영화 평균 점수 : 영추사에서 이 영화의 최초 추천인이 되어 보세요!
  	      	</c:otherwise>
  	      	</c:choose>
  	      </h4>
  	      <h4 class="card-title">
  	             내가 준 점수 : <span class="glyphicon glyphicon-star"></span>${UserRatingStar}
  	      </h4>
  	      <div class="recoBTN col-xs-4" >
  	      	<a class="btn btn-warning btn-circle text-uppercase" data-toggle="collapse" href="#starRev"><span class="glyphicon glyphicon-star"></span>추천하기</a>
  	      </div>
  	      <div class="collapse col-xs-8" id="starRev">
  	      	<span class="starR" value="1">1</span>
			  <span class="starR" value="2">2</span>
			  <span class="starR" value="3">3</span>
			  <span class="starR" value="4">4</span>
			  <span class="starR" value="5">5</span>
			  
			  <input class="hidden" id="movieId" value="${row.movieId}">
              <input class="hidden" id="movieSeq" value="${row.movieSeq}">
              <input class="hidden" id="movieTitle" value="${row.title}">
              <input class="hidden" id="movieGenre" value="${row.genre}">
              <input class="hidden" id="movieImg" value="${row.img}">
  	      </div>
  	      <!-- 
  	      <div id="starRev">
			  <span class="starR" value="1">1</span>
			  <span class="starR" value="2">2</span>
			  <span class="starR" value="3">3</span>
			  <span class="starR" value="4">4</span>
			  <span class="starR" value="5">5</span>
			  
			  <input class="hidden" id="movieId" value="${row.movieId}">
              <input class="hidden" id="movieSeq" value="${row.movieSeq}">
              <input class="hidden" id="movieTitle" value="${row.title}">
              <input class="hidden" id="movieGenre" value="${row.genre}">
              <input class="hidden" id="movieImg" value="${row.img}">

		  </div>
  	       -->
  	    </div>
  	    <!-- div 끝 -->


  	    <div class="row col-lg-5 col-xs-12">
                    <div class="text-center">
                        
                        <div style="padding-top:5px; padding-bottom:5px">
                            <span class="glyphicon glyphicon-user"></span>${ratingAll} total
                        </div>
                    </div>
                    <div class="rating-list">
                        <div class="row rating-desc">
                            <div class="col-xs-3 col-md-3 text-right">
                                <span class="glyphicon glyphicon-star"></span>5
                            </div>
                            <div class="col-xs-8 col-md-9">
                                <div class="progress progress-striped">
                                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20"
                                        aria-valuemin="0" aria-valuemax="100" style= width:${ratingAVGList.five_AVG}%>
                                        ${ratingAVGList.five_AVG}%
                                    </div>
                                </div>
                            </div>
                            <!-- end 5 -->
                            <div class="col-xs-3 col-md-3 text-right">
                                <span class="glyphicon glyphicon-star"></span>4
                            </div>
                            <div class="col-xs-8 col-md-9">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20"
                                        aria-valuemin="0" aria-valuemax="100" style= width:${ratingAVGList.four_AVG}%>
                                        ${ratingAVGList.four_AVG}%
                                    </div>
                                </div>
                            </div>
                            <!-- end 4 -->
                            <div class="col-xs-3 col-md-3 text-right">
                                <span class="glyphicon glyphicon-star"></span>3
                            </div>
                            <div class="col-xs-8 col-md-9">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20"
                                        aria-valuemin="0" aria-valuemax="100" style= width:${ratingAVGList.three_AVG}%>
                                        ${ratingAVGList.three_AVG}%
                                    </div>
                                </div>
                            </div>
                            <!-- end 3 -->
                            <div class="col-xs-3 col-md-3 text-right">
                                <span class="glyphicon glyphicon-star"></span>2
                            </div>
                            <div class="col-xs-8 col-md-9">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="20"
                                        aria-valuemin="0" aria-valuemax="100" style=width:${ratingAVGList.two_AVG}%>
                                        ${ratingAVGList.two_AVG}%
                                    </div>
                                </div>
                            </div>
                            <!-- end 2 -->
                            <div class="col-xs-3 col-md-3 text-right">
                                <span class="glyphicon glyphicon-star"></span>1
                            </div>
                            <div class="col-xs-8 col-md-9">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80"
                                        aria-valuemin="0" aria-valuemax="100" style=width:${ratingAVGList.one_AVG}%>
                                        ${ratingAVGList.one_AVG}%
                                    </div>
                                </div>
                            </div>
                            <!-- end 1 -->
                        </div>
                        <!-- end row -->
                       </div>
                  </div>


                  <!-- div 끝 -->
  	  </div>
  	  
  	  <!-- 영화 상세 정보 -->
  	  <div class="jumbotron col-lg-12 col-xs-12 box">
  	    <h3 class="movieDetail">
  	      Detail
  	    </h3>
  	    <h2>${row.title}<small>${row.titleEng}</small></h2>
  	    
  	    <!-- 왼쪽 정보 -->
  	    <div class="col-lg-6">
  	      <h4>개봉 : ${row.repRlsDate}</h4>
  	      <h4>장르 : ${row.genre}</h4>
  	    </div>
  	    <!-- 오른쪽 정보 -->
  	    <div class="col-lg-6">
  	      <h4>시청연령 : ${row.age}</h4>
  	      <h4>영화길이 : ${row.runtime}</h4>
  	    </div>
  	    
  	    <div class="col-lg-12">
  	      <h4>줄거리 : </h4>
  	      <h4>${row.plot}</h4>
  	    </div>
  	  </div>
  	  
  	  <!-- 주연/감독 정보 -->
  	  <div class="jumbotron col-lg-12 col-xs-12 box">
  	    <h3 class="movieDetail">Cast/Director</h3>
  	    <div class="col-lg-12">
  	      <h4>감독 : ${row.directorNm}</h4>
  	      <h4>주연 : </h4>
  	      <h4>
  	      ${row.actors}
  	      <!--<c:forEach items="${row.actors }" var="actors">
						<c:out value="${actors}"></c:out>
			</c:forEach>  -->
  	        
  	      </h4>
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
		<!-- 영화 정보 끝 -->
		

  	  <!-- reco 시작 -->
<div class="jumbotron col-lg-12  col-xs-12 box">

                <h3>Movie Reco
                  	<small>
  	                 	영추사 회원들의 추천 영화
  	      			</small>
                </h3>

        <div class="row">
            
            <div class="col-lg-12">
                <!-- Controls -->
                <div class="controls pull-right">
                    <a class="left fa fa-chevron-left btn btn-success" href="#carousel-example"
                        data-slide="prev"></a>
                    <a class="right fa fa-chevron-right btn btn-success" href="#carousel-example"
                        data-slide="next"></a>
                </div>
            </div>
        </div>
        <div id="carousel-example" class="carousel slide" data-ride="carousel"> <!-- hidden-xs -->
            <!-- Wrapper for slides -->
            <div class="carousel-inner">
            <!-- 여기서부터 로테이션 처음에는 item에 active가 있어야함 active를 item마다 돌려가며 출력하게끔 함-->
            <!-- if 여기서 list가 4보다 작으면 ${active}를 item 옆에 만든다-->
  
                <div class="item active">
                    <div class="row">
                    	<c:forEach items="${recoList}" var="row" varStatus="status">
                    	<!-- 여기서 리스트를 4번 돌린다 -->
                    	<c:choose>
		                  <c:when test="${status.count < 4}">
		            	     
		            	     <div class="col-lg-3 col-xs-4">
                            <div class="thumbnail" style="padding: 0">
                                <div style="padding:4px">
                                    
                                    <img alt="img" style="width: 100%; height: 150px" src="${row.img}">
                                </div>
                                <div class="info text-center">
                                    
                                    
									<div>
									<c:choose>
									<c:when test="${fn:length(row.movieName) > 5}">
										<h4>${fn:substring(row.movieName,0,5)}..</h4>
									</c:when>
									<c:otherwise>
										<h4>${row.movieName}</h4>
									</c:otherwise>
									</c:choose>
										
									</div>
									<hr/>
                                    <div class="separator clear-left">
                                       <a href="#" class="hidden-sm" name="SearchBtn">
                                       	<input class="hidden" id="movieId" value="${row.movieId}">
                                       	<input class="hidden" id="movieSeq" value="${row.movieSeq}">
                                       More details
                                       </a>
                                    </div>
                                    <div class="clearfix">
                                    </div>
                                </div>
                            </div>
                        </div>
		            	  </c:when>
		            	  <c:otherwise>
		            	     <!-- 아무것도 안함 -->
		            	  </c:otherwise>
                       </c:choose>                        
                        </c:forEach>

                        <!-- 로테이션  -->
                    </div>
                </div>
                
                <!-- 두번째 지금 있는 item이 나중에 active 클래스를 받음 -->
                <!-- 모바일 버전으로  -->
                
                <div class="item">
                    <div class="row">
                      <c:forEach items="${recoList}" var="row" varStatus="status">
                    	<!-- 여기서 리스트를 4번 돌린다 -->
                    	<c:choose>
		                  <c:when test="${status.count > 3 && status.count < 7}">
                    	<!-- 다시 로테이션 -->
                        <div class="col-lg-3 col-xs-4">
                            <div class="thumbnail" style="padding: 0">
                                <div style="padding:4px">
                                    
                                    <img alt="img" style="width: 100%; height: 150px" src="${row.img}">
                                </div>
                                <div class="info text-center">
                                    
									<div>
										<c:choose>
									<c:when test="${fn:length(row.movieName) > 5}">
										<h4>${fn:substring(row.movieName,0,5)}..</h4>
									</c:when>
									<c:otherwise>
										<h4>${row.movieName}</h4>
									</c:otherwise>
									</c:choose>
									</div>
									<hr/>
                                    <div class="separator clear-left">
                                       <a href="#" class="hidden-sm" name="SearchBtn">
                                       	<input class="hidden" id="movieId" value="${row.movieId}">
                                       	<input class="hidden" id="movieSeq" value="${row.movieSeq}">
                                       More details
                                       </a>
                                    </div>
                                    <div class="clearfix">
                                    </div>
                                </div>
                            </div>
                        </div>
                        </c:when>
		            	  <c:otherwise>
		            	     <!-- 아무것도 안함 -->
		            	  </c:otherwise>
                       </c:choose>                        
                        </c:forEach>
                        <!-- 로테이션 종료 -->
                        
                    </div>
                </div>
				
                
            </div>
        </div>
    </div>

     <!-- 추천 끝 -->  
     
     

    <!-- 댓글 정보 -->
  	  <div class="jumbotron col-lg-12 col-xs-12 box">
  	    <h3 class="movieDetail">
  	      Comment
  	    </h3>
  	    
  	   
  	    
  	    <div class="comment-tabs">
            <ul class="nav nav-tabs" role="tablist">
                <li class="active"><a href="#comments-logout" role="tab" data-toggle="tab"><h4 class="reviews text-capitalize">Comments</h4></a></li>
                <li><a href="#add-comment" role="tab" data-toggle="tab"><h4 class="reviews text-capitalize">Add comment</h4></a></li>
            </ul>            
            <div class="tab-content">
                <div class="tab-pane active" id="comments-logout">                
                    <ul class="media-list">
                    
                    
                    <c:choose>
						<c:when test="${fn:length(commentList) > 0 }">
						<c:forEach items="${commentList }" var="row">
                      <li class="media">
                      	
                        <a class="pull-left" href="">
                          <img style="width:50px"class="media-object img-circle img-auto" src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png" alt="profile">
                        </a>
                        <div class="media-body">
                          <div class="well well-lg">
                              <h4 class="media-heading text-uppercase reviews"> ${row.CREA_ID} </h4>
                              <ul class="media-date text-uppercase reviews list-inline">
                              	<li Style="text-align:right">
                              		${row.CREA_DTM}
                              	</li>
                                
                              </ul>
                              <p class="media-comment">
                                ${row.COMMENTS }
                              </p>
                              
                              <a class="btn btn-warning btn-circle text-uppercase" name="likeBtn" id="ajax${row.IDX}">
                              <input type="hidden" id="IDX" value="${row.IDX}">
                              <span class="glyphicon glyphicon-heart"></span>
                              ${row.COMMENTS_LIKE}
                              </a>
                              
                          </div>              
                        </div>
                        
                      </li>          
                      
                      
                      </c:forEach>
                      </c:when>
                      <c:otherwise>
                      <tr>
						  <td colspan="4">조회된 결과가 없습니다.</td>
					  </tr>
					  </c:otherwise>
                      </c:choose>
                      <!-- 로테이션 종료 -->
                    </ul> 
                </div>
                
                
                <!-- 댓글 입력 -->
                <div class="tab-pane" id="add-comment">
                    <form id="commentForm" method="post" class="form-horizontal" role="form">
                    	<!-- MOVIE DOCID는 컨트롤러에서 만듬 -->
                    	<c:forEach items="${list}" var="row">
                    		<input class="hidden" name="movieId" value="${row.movieId}">
                    		<input class="hidden" name="movieSeq" value="${row.movieSeq}">
                    	</c:forEach> 
                        <div class="form-group">
                            <label for="email" class="col-sm-2 control-label">Comment</label>
                            <div class="col-sm-10">
                              <textarea name="COMMENTS" class="form-control" rows="5"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">                    
                                <button id="submitComment" class="btn btn-success btn-circle text-uppercase" type="submit" ><span class="glyphicon glyphicon-send"></span> Summit comment</button>
                            </div>
                        </div>   
                                 
                    </form>
                </div>
                
            </div>
        </div>
  	    
  	    
  	    
  	    <!-- 댓글 jumbotron col-lg-12 col-xs-12 box 끝 -->
  	  </div>
    
    
    
    
  
   	  
  </div>
  <!-- container -->
  
  <!-- Footer -->
  <footer class="foot">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Inhatc Capstone by YCS. 2019</p>
    </div>
  </footer>




<!-- ajax -->
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	$("a[name='likeBtn']").unbind("click").click(function(e) {
	  e.preventDefault();
	  fn_commentLike($(this));
	 });

	$("#submitComment").unbind("click").click(function(e) {
      e.preventDefault();
      fn_commentInsert();
    });

	$("a[name='SearchBtn']").unbind("click").click(function(e) {
	    e.preventDefault();
	    fn_moveToDetailResult($(this));
	});

	$('#starRev span').click(function(e){
		e.preventDefault();
		fn_movieReco($(this));	  
	});
});

function fn_movieReco(obj){
	obj.parent().children('span').removeClass('on');
	obj.addClass('on').prevAll('span').addClass('on');
	  //console.log($(this).attr("value"));
	
	//추천 점수  
	var reco = obj.attr("value");
	
	var comSubmit = new ComSubmit();
	
	comSubmit.setUrl("<c:url value='/bbs/movie/movieReco.do' />");
	comSubmit.addParam("RATINGS", reco);
	comSubmit.addParam("MOVIEID",obj.parent().find("#movieId").val());
	comSubmit.addParam("MOVIESEQ",obj.parent().find("#movieSeq").val());
	comSubmit.addParam("MOVIE_NAME",obj.parent().find("#movieTitle").val());
	comSubmit.addParam("MOVIE_GENRES",obj.parent().find("#movieGenre").val());
	comSubmit.addParam("IMG",obj.parent().find("#movieImg").val());

	comSubmit.submit();
	
	  //alert(reco);
	//alert(obj.parent().find("#movieId").val()+obj.parent().find("#movieSeq").val());

	
}

function fn_moveToDetailResult(obj) {
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/movie/openDetailResult.do' />");
	comSubmit.addParam("movieId", obj.parent().find("#movieId").val());
	comSubmit.addParam("movieSeq", obj.parent().find("#movieSeq").val());
    comSubmit.submit();
}

function fn_commentInsert(){
	var comSubmit = new ComSubmit("commentForm");
	comSubmit.setUrl("<c:url value='/bbs/insertComment.do' />");
	comSubmit.submit();
}

function fn_commentLike(obj){
	var IDX = obj.parent().find("#IDX").val();
	var IDXdata = {"PARENT_IDX":IDX} 
	
	$.ajax({
		async:false, //비 동기식 
		type : "POST", //post 형식으로 보내겠다 
		url : "${pageContext.request.contextPath}/movie/CommentLike.do", //컨트롤러
		data : IDXdata, //컨트롤러에 보낼 데이터
		dataType : "json", //json 형식으로 받아오겠다
		error : function(error) {
			alert("로그인 후 \n다시 시도해주시기 바랍니다."); 
		},
		success : function(data) {
			//var s = data[IDX];
			//var str = data[USER];
			var LIKE_CNT = data.LIKE_CNT;
			var IDX = data.IDX;
			var ajaxIDX = '#ajax'+IDX
			$(ajaxIDX).html('');
			var change = '<input type="hidden" id="IDX" value='+IDX+'>';
			var change2 = '<span class="glyphicon glyphicon-heart"></span>';
			$(ajaxIDX).html(change+change2+LIKE_CNT);
				//alert("d");
			    //result를
				//$("#status").text('Signed In:' + json.SignedIn + " msg" + json.msg);  (참고)
		}
	}); //ajax 종료
}


</script>	


</body>
</html>