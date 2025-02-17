<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../header.jsp" %>
</head>
<body class="body-set">
<div class = "row">
<div class="container col-xs-12">
	<table class="table table-hover" style="text-align:left; border:1px solid #dddddd"> 
	<thead>
		<tr>
			<th style="background-color: #eeeeee; text-align: center; width: 5%;">번호</th>
			<th style="background-color: #eeeeee; text-align: left; width: *;">제목</th>
			<th style="background-color: #eeeeee; text-align: center; width: 5%;">작성자</th>
			<th style="background-color: #eeeeee; text-align: center; width: 5%;">조회수</th>
			<th style="background-color: #eeeeee; text-align: center; width: 5%;">작성일</th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
	    <c:when test="${fn:length(list) > 0 }">
	    	<c:forEach items="${list }" var="row">
				<tr>
					<td style="text-align: center;">
						<c:out value="${row.IDX }"></c:out>
					</td>
					<td>
						<a href="#" name="title"><c:out value="${row.TITLE}"></c:out></a>
						<input type="hidden" id="IDX" value="${row.IDX }">
					</td>
					<td style="text-align: center;">
					 	<c:out value="${row.CREA_ID }"></c:out>
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
	<a href="#" class="btn btn-primary pull-right" id="write2">글쓰기</a>
</div>
</div>

 <script type="text/javascript">
  $(document).ready(function() {
 
   $("#write1, #write2").unbind("click").click(function(e) {
    e.preventDefault();
    fn_openBoardWrite();
   });
 
   $("a[name='title']").unbind("click").click(function(e) {
    e.preventDefault();
    fn_openBoardDetail($(this));
   });
 
  });
 
  function fn_openBoardWrite() {
   var comSubmit = new ComSubmit();
   comSubmit.setUrl("<c:url value='/bbs/openBoardWrite.do' />");
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