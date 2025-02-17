<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../header.jsp" %>
</head>
<body class="body-set">
<div class="container col-lg-12 col-xs-12">
<div class="row">
	<div role="tabpanel">
	  <!-- Nav tabs -->
	  <ul class="nav nav-tabs" role="tablist">
	    <li role="presentation" class="active"><a href="#rate" aria-controls="rate" role="tab" data-toggle="tab">내 영화 평점</a></li>
	    <li role="presentation"><a href="#post" aria-controls="post" role="tab" data-toggle="tab">내 게시글</a></li>
	  </ul>
	  <!-- Tab panes -->
	  <div class="tab-content">
		  <div role="tabpanel" class="tab-pane fade in active" id="rate">
		  	<h3>내 영화 평점 <small>내가 평가한 영화들의 점수를 모아볼 수 있습니다.</small></h3>		 
		  
	  		<div class="panel panel-default">
			  <div class="panel-body" style="text-align:center;">
			  	<c:choose>
			  		<c:when test="${info.C > 0 }">
			  			<h4> 총 ${info.C }개의 영화를 평가하였습니다. 평균 평점은 ${info.A }점입니다.</h4>				 
				    </c:when>
				    <c:otherwise>
						<h4> 아직 평가한 영화가 없습니다.</h4>	
			    	</c:otherwise>
			   	 </c:choose>
			  </div>
			</div>
			<div class="row" style="border-bottom: 2px solid #ececec; padding: 0 0 15px;">
				<c:choose>
			    <c:when test="${fn:length(list) > 0 }">
		    	<c:forEach items="${list}" var="row">
					<div class="col-lg-2 col-xs-4">
					<div class="card" style="width:100%; height:230px; margin-top:10px; margin-bottom:20px">
						<a href="#" name="mv_info">
						  	<img class="card-img-top" src="${row.IMG}" alt="img" style="width:100%; height:100%; margin:0">				 
			            	<input type="hidden" id="movieId" value="${row.MOVIEID}">
							<input type="hidden" id="movieSeq" value="${row.MOVIESEQ}">	
		            	</a>
					</div>
					</div>					 
		     	</c:forEach>
			    </c:when>
			   	</c:choose>
			</div>

			<h3>추천 영화 <small>회원님과 취향이 비슷한 다른 회원들에게 높은 평점을 받은 영화입니다.</small></h3>
			<div class="row">
			</div>
		</div>
		
		  <div role="tabpanel" class="tab-pane fade" id="post">
		  	<h3>내 게시글 <small>내가 작성한 게시글들을 모아볼 수 있습니다.</small></h3>
		  	<table class="table table-hover" style="text-align:left; border:1px solid #dddddd; margin-top:20px;"> 
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center; width: 13%;">번호</th>
						<th style="background-color: #eeeeee; text-align: left; width: *;">제목</th>
						<th style="background-color: #eeeeee; text-align: center; width: 15%;">조회수</th>
						<th style="background-color: #eeeeee; text-align: center; width: 15%;">작성일</th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
			    <c:when test="${fn:length(userBoardList) > 0 }">
			    	<c:forEach items="${userBoardList}" var="row">
						<tr>
							<td style="text-align: center;">
								<c:out value="${row.IDX }"></c:out>
							</td>
							<td>
								<a href="#" name="title"><c:out value="${row.TITLE}"></c:out></a>
								<input type="hidden" id="IDX" value="${row.IDX }">
							</td>
							<td style="text-align: center;">
							 	<c:out value="${row.HIT_CNT }"></c:out>
							</td>
							<td style="text-align: center;">
							 	<c:out value="${row.CREA_DTM }"></c:out>
							</td>
						</tr>
					</c:forEach>
				</c:when>
				
				<c:otherwise>
					<tr>
						<td colspan="6" style="text-align: center;">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
				</c:choose>
				</tbody>
			</table>
		  </div>
		</div>
	</div>
</div>
</div>

<script type="text/javascript">
$(document).ready(function() {
	$("a[name='mv_info']").unbind("click").click(function(e) {
	    e.preventDefault();
	    fn_moveToDetailResult($(this));
	});
	$("a[name='title']").unbind("click").click(function(e) {
	    e.preventDefault();
	    fn_openBoardDetail($(this));
	   });
});

function fn_moveToDetailResult(obj) {
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/movie/openDetailResult.do' />");
	comSubmit.addParam("movieId", obj.parent().find("#movieId").val());
	comSubmit.addParam("movieSeq", obj.parent().find("#movieSeq").val());
    comSubmit.submit();
}
function fn_openBoardDetail(obj) {
	   var comSubmit = new ComSubmit();
	   comSubmit.setUrl("<c:url value='/bbs/openBoardDetail.do' />");
	   comSubmit.addParam("IDX", obj.parent().find("#IDX").val());
	   comSubmit.submit();
	  }
</script>

</body>
</html>