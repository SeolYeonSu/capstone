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
	    <li role="presentation" class="active"><a href="#waiting" aria-controls="waiting" role="tab" data-toggle="tab">신고처리 대기</a></li>
	    <li role="presentation"><a href="#complete" aria-controls="complete" role="tab" data-toggle="tab">신고처리 완료</a></li>
	    <li role="presentation"><a href="#log" aria-controls="log" role="tab" data-toggle="tab">로그 기록</a></li>
	  </ul>
	  
	  <!-- Tab panes -->
	  <div class="tab-content">
		  <div role="tabpanel" class="tab-pane fade in active" id="waiting">
		  	<table class="table table-hover" style="text-align:left; border:1px solid #dddddd; margin-top:20px;"> 
				<!-- <thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center; width: 13%;">번호</th>
						<th style="background-color: #eeeeee; text-align: left; width: *;">제목</th>
						<th style="background-color: #eeeeee; text-align: center; width: 15%;">조회수</th>
						<th style="background-color: #eeeeee; text-align: center; width: 15%;">작성일</th>
					</tr>
				</thead> -->
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
		  
		  <div role="tabpanel" class="tab-pane fade" id="complete">
		  	<table class="table table-hover" style="text-align:left; border:1px solid #dddddd; margin-top:20px;"> 
				<!-- <thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center; width: 13%;">번호</th>
						<th style="background-color: #eeeeee; text-align: left; width: *;">제목</th>
						<th style="background-color: #eeeeee; text-align: center; width: 15%;">조회수</th>
						<th style="background-color: #eeeeee; text-align: center; width: 15%;">작성일</th>
					</tr>
				</thead> -->
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
		  
		  <div role="tabpanel" class="tab-pane fade" id="log">
		  	<table class="table table-hover" style="text-align:left; border:1px solid #dddddd; margin-top:20px;"> 
				<!-- <thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center; width: 13%;">번호</th>
						<th style="background-color: #eeeeee; text-align: left; width: *;">제목</th>
						<th style="background-color: #eeeeee; text-align: center; width: 15%;">조회수</th>
						<th style="background-color: #eeeeee; text-align: center; width: 15%;">작성일</th>
					</tr>
				</thead> -->
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