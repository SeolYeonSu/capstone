<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

  <meta charset="UTF-8">
  <%@ include file="../header.jsp" %>
  <title>영추사-영화상제정보</title>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <!-- css comments -->
  <link rel="stylesheet" type="text/css" href="<c:url value='/css/comments.css'/>" /> 
  
  <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
  
  <style>
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

  <div class="container">
    
    <div class="jumbotron col-lg-12 col-xs-12">
    
  	  
  	    <h3 class="my-4">
  	      Movie Result
  	    </h3>
  	  
  	    <div class="col-lg-2 col-xs-12 center">
  	      <a href="#"><img class="" src="http://placehold.it/160x230" alt=""></a>
  	    </div>
  	    <div class="col-lg-5 col-xs-12">
  	      <h2 class="card-title">
  	        <a href="#">Kingsman: The Secret Service</a>
  	      </h2>
  	      <h4 class="card-title">
  	        <a href="#"><small>2014  ・ Action ・ UK ・ USA</small></a>
  	        <hr>
  	      </h4>
  	      <div class="starlist">
  	      		<h3>평균 점수 : 4.0</h3>    
  	      		       
  	      </div>
  	      		
  	      
  	      <div class="rating">
  	          <h3>내가 준 점수 : 
              <span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star">
              </span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star">
              </span><span class="glyphicon glyphicon-star-empty"></span>
              </h3>
          </div>
  	    </div>
  	    <div class="row col-lg-5">
                    <div class="text-center">
                        
                        <div style="padding-top:5px; padding-bottom:5px">
                            <span class="glyphicon glyphicon-user"></span>1,050,008 total
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
                                        aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                        80%
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
                                        aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                        60%
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
                                        aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                        40%
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
                                        aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                                        20%
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
                                        aria-valuemin="0" aria-valuemax="100" style="width: 15%">
                                        15%
                                    </div>
                                </div>
                            </div>
                            <!-- end 1 -->
                        </div>
                        <!-- end row -->
                       </div>
                  </div>
  	  </div>
  	  
  	  <!-- 영화 상세 정보 -->
  	  <div class="jumbotron col-lg-12 col-xs-12">
  	    <h3 class="movieDetail">
  	      Detail
  	    </h3>
  	    <h2>
  	            킹스맨 : 시크릿 에이전트
  	            <small>
  	      The Secret Service
  	    </small>
  	    </h2>
  	    
  	    <!-- 왼쪽 정보 -->
  	    <div class="col-lg-6">
  	      <h4>
  	              개봉 : 2014
  	      </h4>
  	      <h4>
  	              장르 : 스릴러, 액션
  	      </h4>
  	      
  	    </div>
  	    <!-- 오른쪽 정보 -->
  	    <div class="col-lg-6">
  	      <h4>
  	              시청연령 : 12
  	      </h4>
  	      <h4>
  	              영화길이 : 230
  	      </h4>
  	    </div>
  	    
  	    <div class="col-lg-12">
  	      <h4>
  	            줄거리 : 
  	      </h4>
  	      <h4>
  	       The story of a super-secret spy organization that recruits an 
unrefined but promising street kid into the agency's ultra-competitive
 training program just as a global threat emerges from a twisted tech genius.
  	    </h4>
  	    </div>
  	    
  	    
  	  </div>
  	  
  	  <!-- 주연/감독 정보 -->
  	  <div class="jumbotron col-lg-12 col-xs-12">
  	    <h3 class="movieDetail">
  	      Cast/Director
  	    </h3>
  	    <div class="col-lg-12">
  	      <h4>
  	              감독 : 누구누구
  	      </h4>
  	      <h4>
  	              주연 : 누구, 누구, 누구, 누구 
  	      </h4>
  	    </div>
  	    
  	  </div>

  	  
  	  <div class="jumbotron col-lg-12 col-xs-12">
  	    <h3 class="my-4">
  	      Movie Reco
  	      <small>
  	        '킹스맨:시크릿 에이전트'을(를) 본 영추사 회원들의 추천 영화
  	      </small>
  	    </h3>
  	  
  	  
  	  <div class="row col-lg-12 col-xs-12">
  	  
  	    <div class="col-lg-3 col-xs-3">
  	    
  	      <div class="card h-100">
  	        <a href="#"><img class="card-img-top img-auto" src="http://placehold.it/250x400" alt=""></a>
  	        <div class="card-body">
  	          <h4 class="card-title">
  	            <a href="#">영화이름</a>
  	          </h4>
  	          
  	        </div>
  	      </div>
  	      
  	      
  	    </div>
  	    <!-- col-lg-3 col-md-6 mb-4 -->
  	    
  	    <div class="col-lg-3 col-xs-3">
  	    
  	      <div class="card h-100">
  	        <a href="#"><img class="card-img-top img-auto" src="http://placehold.it/250x400" alt=""></a>
  	        <div class="card-body">
  	          <h4 class="card-title">
  	            <a href="#">영화이름</a>
  	          </h4>
  	          
  	        </div>
  	      </div>
  	      
  	      
  	    </div>
  	    <!-- col-lg-3 col-md-6 mb-4 -->
  	    
  	    <div class="col-lg-3 col-xs-3">
  	    
  	      <div class="card h-100">
  	        <a href="#"><img class="card-img-top img-auto" src="http://placehold.it/250x400" alt=""></a>
  	        <div class="card-body">
  	          <h4 class="card-title">
  	            <a href="#">영화이름</a>
  	          </h4>
  	          
  	        </div>
  	      </div>
  	      
  	      
  	    </div>
  	    <!-- col-lg-3 col-md-6 mb-4 -->
  	    
  	    <div class="col-lg-3 col-xs-3">
  	    
  	      <div class="card h-100">
  	        <a href="#"><img class="card-img-top img-auto" src="http://placehold.it/250x400" alt=""></a>
  	        <div class="card-body">
  	          <h4 class="card-title">
  	            <a href="#">영화이름</a>
  	          </h4>
  	          
  	        </div>
  	      </div>
  	      
  	      
  	    </div>
  	    <!-- col-lg-3 col-md-6 mb-4 -->
  	    
  	    <div class="col-lg-3 col-xs-3">
  	    
  	      <div class="card h-100">
  	        <a href="#"><img class="card-img-top img-auto" src="http://placehold.it/250x400" alt=""></a>
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
        
    <!-- 댓글 정보 -->
  	  <div class="jumbotron col-lg-12 col-xs-12">
  	    <h3 class="movieDetail">
  	      Comment
  	    </h3>
  	  </div>
  
  
  <div class="jumbotron col-lg-12 box">

                <h3>Movie Reco</h3>

        <div class="row">
            
            <div class="col-lg-12">
                <!-- Controls -->
                <div class="controls pull-right hidden-xs">
                    <a class="left fa fa-chevron-left btn btn-success" href="#carousel-example"
                        data-slide="prev"></a>
                    <a class="right fa fa-chevron-right btn btn-success" href="#carousel-example"
                        data-slide="next"></a>
                </div>
            </div>
        </div>
        <div id="carousel-example" class="carousel slide hidden-xs" data-ride="carousel">
            <!-- Wrapper for slides -->
            <div class="carousel-inner">
            <!-- 여기서부터 로테이션 처음에는 item에 active가 있어야함 active를 item마다 돌려가며 출력하게끔 함-->
                <div class="item active">
                    <div class="row">
                    
                        <div class="col-lg-3">
                            <div class="thumbnail" style="padding: 0">
                                <div style="padding:4px">
                                    
                                    <img alt="img" style="width: 100%; height: 300px" src="http://placehold.it/250x400">
                                </div>
                                <div class="info text-center">
                                    
									<div>
										<h4>아이언맨</h4>
									</div>
									<hr/>
                                    <div class="separator clear-left">
                                       <a href="#" class="hidden-sm">More details</a>
                                    </div>
                                    <div class="clearfix">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="thumbnail" style="padding: 0">
                                <div style="padding:4px">
                                    
                                    <img alt="img" style="width: 100%; height: 300px" src="http://placehold.it/250x400">
                                </div>
                                <div class="info text-center">
                                    
									<div>
										<h4>아이언맨</h4>
									</div>
									<hr/>
                                    <div class="separator clear-left">
                                       <a href="#" class="hidden-sm">More details</a>
                                    </div>
                                    <div class="clearfix">
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        
                        
                        <!-- 로테이션  -->
                    </div>
                </div>
                
                <!-- 두번째 지금 있는 item이 나중에 active 클래스를 받음 -->
                <div class="item">
                    <div class="row">
                    	<!-- 다시 로테이션 -->
                        <div class="col-lg-3">
                            <div class="thumbnail" style="padding: 0">
                                <div style="padding:4px">
                                    
                                    <img alt="img" style="width: 100%; height: 300px" src="http://placehold.it/250x400">
                                </div>
                                <div class="info text-center">
                                    
									<div>
										<h4>아이언맨</h4>
									</div>
									<hr/>
                                    <div class="separator clear-left">
                                       <a href="#" class="hidden-sm">More details</a>
                                    </div>
                                    <div class="clearfix">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="thumbnail" style="padding: 0">
                                <div style="padding:4px">
                                    
                                    <img alt="img" style="width: 100%; height: 300px" src="http://placehold.it/250x400">
                                </div>
                                <div class="info text-center">
                                    
									<div>
										<h4>아이언맨</h4>
									</div>
									<hr/>
                                    <div class="separator clear-left">
                                       <a href="#" class="hidden-sm">More details</a>
                                    </div>
                                    <div class="clearfix">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 로테이션 종료 -->
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
    
    
    <!-- 댓글 정보 -->
  	  <div class="jumbotron col-lg-12 col-xs-12 box">
  	    <h3 class="movieDetail">
  	      Comment
  	    </h3>
  	    
  	    <div class="btn" id="btn1">버튼</div>
  	    <div id="result"></div>
  	    
  	    <div class="comment-tabs">
            <ul class="nav nav-tabs" role="tablist">
                <li class="active"><a href="#comments-logout" role="tab" data-toggle="tab"><h4 class="reviews text-capitalize">Comments</h4></a></li>
                <li><a href="#add-comment" role="tab" data-toggle="tab"><h4 class="reviews text-capitalize">Add comment</h4></a></li>
            </ul>            
            <div class="tab-content">
                <div class="tab-pane active" id="comments-logout">                
                    <ul class="media-list">
                      <li class="media">
                        <a class="pull-left" href="#">
                          <img class="media-object img-circle" src="https://s3.amazonaws.com/uifaces/faces/twitter/dancounsell/128.jpg" alt="profile">
                        </a>
                        <div class="media-body">
                          <div class="well well-lg">
                              <h4 class="media-heading text-uppercase reviews">Marco </h4>
                              <ul class="media-date text-uppercase reviews list-inline">
                                <li class="dd">22</li>
                                <li class="mm">09</li>
                                <li class="aaaa">2014</li>
                              </ul>
                              <p class="media-comment">
                                Great snippet! Thanks for sharing.
                              </p>
                              
                              <a class="btn btn-warning btn-circle text-uppercase" data-toggle="collapse" href="#replyOne"><span class="glyphicon glyphicon-comment"></span> 2 comments</a>
                          </div>              
                        </div>
                        <div class="collapse" id="replyOne">
                            <ul class="media-list">
                                <li class="media media-replied">
                                    <a class="pull-left" href="#">
                                      <img class="media-object img-circle" src="https://s3.amazonaws.com/uifaces/faces/twitter/ManikRathee/128.jpg" alt="profile">
                                    </a>
                                    <div class="media-body">
                                      <div class="well well-lg">
                                          <h4 class="media-heading text-uppercase reviews"><span class="glyphicon glyphicon-share-alt"></span> The Hipster</h4>
                                          <ul class="media-date text-uppercase reviews list-inline">
                                            <li class="dd">22</li>
                                            <li class="mm">09</li>
                                            <li class="aaaa">2014</li>
                                          </ul>
                                          <p class="media-comment">
                                            Nice job Maria.
                                          </p>
                                          <a class="btn btn-info btn-circle text-uppercase" href="#" id="reply"><span class="glyphicon glyphicon-share-alt"></span> Reply</a>
                                      </div>              
                                    </div>
                                </li>
                                <li class="media media-replied" id="replied">
                                    <a class="pull-left" href="#">
                                      <img class="media-object img-circle" src="https://pbs.twimg.com/profile_images/442656111636668417/Q_9oP8iZ.jpeg" alt="profile">
                                    </a>
                                    <div class="media-body">
                                      <div class="well well-lg">
                                          <h4 class="media-heading text-uppercase reviews"><span class="glyphicon glyphicon-share-alt"></span> Mary</h4></h4>
                                          <ul class="media-date text-uppercase reviews list-inline">
                                            <li class="dd">22</li>
                                            <li class="mm">09</li>
                                            <li class="aaaa">2014</li>
                                          </ul>
                                          <p class="media-comment">
                                            Thank you Guys!
                                          </p>
                                          <a class="btn btn-info btn-circle text-uppercase" href="#" id="reply"><span class="glyphicon glyphicon-share-alt"></span> Reply</a>
                                      </div>              
                                    </div>
                                </li>
                            </ul>  
                        </div>
                      </li>          
                      <li class="media">
                        <a class="pull-left" href="#">
                          <img class="media-object img-circle" src="https://s3.amazonaws.com/uifaces/faces/twitter/kurafire/128.jpg" alt="profile">
                        </a>
                        <div class="media-body">
                          <div class="well well-lg">
                              <h4 class="media-heading text-uppercase reviews">Nico</h4>
                              <ul class="media-date text-uppercase reviews list-inline">
                                <li class="dd">22</li>
                                <li class="mm">09</li>
                                <li class="aaaa">2014</li>
                              </ul>
                              <p class="media-comment">
                                I'm looking for that. Thanks!
                              </p>
                              
                             
                          </div>              
                        </div>
                      </li>
                      <li class="media">
                        <a class="pull-left" href="#">
                          <img class="media-object img-circle" src="https://s3.amazonaws.com/uifaces/faces/twitter/lady_katherine/128.jpg" alt="profile">
                        </a>
                        <div class="media-body">
                          <div class="well well-lg">
                              <h4 class="media-heading text-uppercase reviews">Kriztine</h4>
                              <ul class="media-date text-uppercase reviews list-inline">
                                <li class="dd">22</li>
                                <li class="mm">09</li>
                                <li class="aaaa">2014</li>
                              </ul>
                              <p class="media-comment">
                                Yehhhh... Thanks for sharing.
                              </p>
                             
                              <a class="btn btn-warning btn-circle text-uppercase" data-toggle="collapse" href="#replyTwo"><span class="glyphicon glyphicon-comment"></span> 1 comment</a>
                          </div>              
                        </div>
                        <div class="collapse" id="replyTwo">
                            <ul class="media-list">
                                <li class="media media-replied">
                                    <a class="pull-left" href="#">
                                      <img class="media-object img-circle" src="https://s3.amazonaws.com/uifaces/faces/twitter/jackiesaik/128.jpg" alt="profile">
                                    </a>
                                    <div class="media-body">
                                      <div class="well well-lg">
                                          <h4 class="media-heading text-uppercase reviews"><span class="glyphicon glyphicon-share-alt"></span> Lizz</h4>
                                          <ul class="media-date text-uppercase reviews list-inline">
                                            <li class="dd">22</li>
                                            <li class="mm">09</li>
                                            <li class="aaaa">2014</li>
                                          </ul>
                                          <p class="media-comment">
                                            Classy!
                                          </p>
                                          <a class="btn btn-info btn-circle text-uppercase" href="#" id="reply"><span class="glyphicon glyphicon-share-alt"></span> Reply</a>
                                      </div>              
                                    </div>
                                </li>
                            </ul>  
                        </div>
                      </li>
                    </ul> 
                </div>
                <div class="tab-pane" id="add-comment">
                    <form action="#" method="post" class="form-horizontal" id="commentForm" role="form"> 
                        <div class="form-group">
                            <label for="email" class="col-sm-2 control-label">Comment</label>
                            <div class="col-sm-10">
                              <textarea class="form-control" name="addComment" id="addComment" rows="5"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">                    
                                <button class="btn btn-success btn-circle text-uppercase" type="submit" id="submitComment"><span class="glyphicon glyphicon-send"></span> Summit comment</button>
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
  
  
<script type="text/javascript">
$(document).ready(function() {
	$('#btn1').on('click', function(){
        var form = {
                name: "jamong",
                age: 23
        }
        $.ajax({
            url: "requestObject",
            type: "POST",
            data: form,
            success: function(data){
                $('#result').text(data);
                alert("d");
            },
            error: function(){
                alert("simpleWithObject err");
            }
        });

	}); 
});



</script>	
</body>

</html>