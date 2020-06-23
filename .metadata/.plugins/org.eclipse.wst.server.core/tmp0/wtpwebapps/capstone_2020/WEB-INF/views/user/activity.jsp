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
	    <li role="presentation"><a href="#delete_stop_list" aria-controls="delete_stop_list" role="tab" data-toggle="tab">제재 내용</a></li>
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
		  
		  <div role="tabpanel" class="tab-pane fade" id="delete_stop_list">
		  	<h3>제재 내용<small> 내 제재 내용을 확인할 수 있습니다.</small></h3>
		  	<div class="panel panel-default">
			  <div class="panel-body" style="text-align:center;">
			  	<c:choose>
			  		<c:when test="${userStop.size() > 0}">
			  			<c:choose>
					  		<c:when test="${userStop.US_DAY == '영구'}">
					  			<h4>회원님은 현재 영구 활동정지 상태입니다.</h4>
						    </c:when>
						    <c:otherwise>
								<h4>회원님은 현재 활동정지 상태입니다.</h4>
				  				<p><c:out value="${userStop.US_START_TIME}"></c:out> 부터 <c:out value="${userStop.US_END_TIME}"></c:out> 까지 총 <c:out value="${userStop.US_DAY}"></c:out></p>	
					    	</c:otherwise>
				    	</c:choose>
				    </c:when>
				   
				    <c:otherwise>
						<h4> 회원님은 현재 활동정지 상태가 아닙니다.</h4>	
			    	</c:otherwise>
			   	 </c:choose>
			  </div>
			</div>
		  	
		  	<table class="table table-hover" style="text-align:left; border:1px solid #dddddd; margin-top:20px;"> 
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center; width: 15%;">게시글 번호</th>
						<th style="background-color: #eeeeee; text-align: center; width: 15%;">처리일</th>
						<th style="background-color: #eeeeee; text-align: center; width: 15%;">사유</th>
						<th style="background-color: #eeeeee; text-align: center; width: 15%;">삭제여부</th>
						<th style="background-color: #eeeeee; text-align: center; width: 15%;">활동정지</th>
						<th style="background-color: #eeeeee; text-align: center; width: 15%;"></th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
			    <c:when test="${fn:length(userReport) > 0 }">
			    	<c:forEach items="${userReport}" var="row">
						<tr>
							<td style="text-align: center;">
								<h5><c:out value="${row.RPC_IDX }"></c:out></h5>
							</td>
							<td style="text-align: center;">
								<h5><c:out value="${row.RPC_DATE}"></c:out></h5>
							</td>
							<td style="text-align: center;">
							 	<h5><c:out value="${row.RPC_REASON }"></c:out></h5>
							</td>
							<td style="text-align: center;">
							 	<h5><c:out value="${row.RPC_DELETE }"></c:out></h5>
							</td>
							<td style="text-align: center;">
							 	<h5><c:out value="${row.RPC_STOP }"></c:out></h5>
							</td>
							<td style="text-align: center;">
								<button type="button" name="RpBoard_btn" class="btn btn-default">게시글 보기</button>
								<input type="hidden" id="RPC_IDX" name="RPC_IDX" value="${row.RPC_IDX}">
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
			
			<!-- 신고 게시글 모달  -->
			<div class="modal fade bs-rpBoard-modal" id="rpBoardModal" tabindex="-1" role="dialog" aria-labelledby="rpBoardModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title">게시글 보기</h4>
			      </div>
			      
			      <div class="modal-body" style="height: 430px;">
			      	<div id="rpBoardCon" style="height: 350px;"></div>
			      <div class="modal-footer">
			       	<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			      </div>
			    </div>
			  </div>
			 </div>
			<!-- 신고 게시글 모달 끝 -->
			
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
	
	$('[name="RpBoard_btn"]').unbind("click").click(function(e) {
		   e.preventDefault();
		   fn_openRpBoard($(this)); 		   
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

//신고 처리완료 게시글 열기
function fn_openRpBoard(obj) {
	var idx = obj.parent().find("#RPC_IDX").val();
	var listData = {"IDX": idx};

	 $.ajax({
	  async:false,
	  type : "POST", 
	  url : "${pageContext.request.contextPath}/admin/openReportBoard.do", 
	  data : listData,
	  dataType : "json",
	  error : function(error) {
		    alert("서버가 응답하지 않습니다. \n다시 시도해주시기 바랍니다.");
		   },
	  success : function(data) {
		  var text ="";
		  $.each(data, function() {
			  var title = "제목 : " + this.TITLE + "<br>";
			  var contents = "내용 : " + this.CONTENTS;
			  text += "<h4>" + title + contents + "</h4>";
			});

		  $("#rpBoardCon").empty();
	  	  $("#rpBoardCon").append(text);  	    
	   	  $('#rpBoardModal').modal('show');	   	  
	  }  
	 });
} 
</script>

</body>
</html>