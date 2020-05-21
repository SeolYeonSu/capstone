<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../header.jsp" %>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="body-set">
<div class="container col-xs-12">
	<table class="table table-striped"
		style="text-align: left; border: 1px solid #dddddd">
		<thead>
			<tr>
				<th style="background-color: #eeeeee; text-align: left; width:50%;">
					${map.TITLE }
				</th>			
				<td style="background-color: #eeeeee; text-align: right; width:50%;">
					${map.CREA_ID } | ${map.CREA_DTM }
				</td>
			</tr>
		</thead>				
		<tbody>
			<tr>
				<td colspan ="10" style="min-height: 50px; text-align: left;">
					${map.CONTENTS }
				</td>
			</tr>					
		</tbody>
	</table>
	<a href = "#" id="list" class="btn btn-primary pull-right">목록</a>
	<c:choose>
		 <c:when test="${loginInfo.ID == map.CREA_ID }">
		 	<a href = "#" id="delete" class="btn btn-danger pull-right" style="margin-right: 5px;">삭제</a>
		 	<input type="hidden" id="IDX" name="IDX" value="${map.IDX}">
		 </c:when>
	 </c:choose>    	

</div>


<script>
 $(document).ready(function() {
  
  $("#list").unbind("click").click(function(e) {
   e.preventDefault();
   fn_openBoardList();
  });
  
  $("#update").unbind("click").click(function(e) {
   e.preventDefault();
   fn_updateBoard();
  });
  
  $("#delete").unbind("click").click(function(e) {
   e.preventDefault();
   fn_deleteBoard();
  });
  
 });
 
 function fn_openBoardList() {
  var comSubmit = new ComSubmit();
  comSubmit.setUrl("<c:url value='/sample/openBoardList.do' />");
  comSubmit.submit();
 }
 
 function fn_updateBoard() {
  var comSubmit = new ComSubmit("frm");
  comSubmit.setUrl("<c:url value='/bbs/updateBoard.do' />");
  comSubmit.submit();
 }
 
 function fn_deleteBoard() {
  var comSubmit = new ComSubmit();
  comSubmit.setUrl("<c:url value='/bbs/deleteBoard.do' />");
  comSubmit.addParam("IDX", $("#IDX").val());
  comSubmit.submit();
 }
</script>
</body>
</html>