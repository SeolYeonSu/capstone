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
		 <c:when test="${loginInfo.ACC == 'admin'}">
		 	<button type="button" class="btn btn-danger pull-right" style="margin-right: 5px;" 
		 	data-toggle="modal" data-target=".bs-delete-modal-sm">삭제</button>
			
			<div class="modal fade bs-delete-modal-sm" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-sm">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="deleteModalLabel">삭제 사유</h4>
			        <p>복수 사유일 경우 대표 사유 1개 선택</p>
			      </div>
			      
			      <div class="modal-body">
			      	<div>
					  <input type="radio" checked="checked" name="RadioOptions" id="Radio1" value="스팸/광고"> 스팸 / 광고
					</div>
					<div>
					  <input type="radio" name="RadioOptions" id="Radio2" value="음란물"> 음란물
					</div>
					<div>
					  <input type="radio" name="RadioOptions" id="Radio3" value="욕설/비방"> 욕설 / 비방
					</div>
					<div>
					  <input type="radio" name="RadioOptions" id="Radio4" value="명예훼손/사생활침해"> 명예훼손 / 사생활침해
					</div>
			      </div>
			      
			      <div class="modal-footer">
			       	<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			       	<button type="button" id="delete" name = "delete" class="btn btn-danger">삭제하기</button>
			       	<input type="hidden" id="ID" name="ID" value="${loginInfo.ID}">
			       	<input type="hidden" id="CREA_ID" name="CREA_ID" value="${map.CREA_ID}">
			       	<input type="hidden" id="IDX" name="IDX" value="${map.IDX}">
			      </div>
			    </div>
			  </div>
			 </div>
		 </c:when>
		 <c:otherwise>
		 	<button type="button" class="btn btn-warning pull-right" style="margin-right: 5px;" 
		 	data-toggle="modal" data-target=".bs-example-modal-sm">신고</button>
			
			<div class="modal fade bs-example-modal-sm" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-sm">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="myModalLabel">신고 사유</h4>
			        <p>복수 사유일 경우 대표 사유 1개 선택</p>
			      </div>
			      
			      <div class="modal-body">
			      	<div>
					  <input type="radio" checked="checked" name="RadioOptions" id="Radio1" value="스팸/광고"> 스팸 / 광고
					</div>
					<div>
					  <input type="radio" name="RadioOptions" id="Radio2" value="음란물"> 음란물
					</div>
					<div>
					  <input type="radio" name="RadioOptions" id="Radio3" value="욕설/비방"> 욕설 / 비방
					</div>
					<div>
					  <input type="radio" name="RadioOptions" id="Radio4" value="명예훼손/사생활침해"> 명예훼손 / 사생활침해
					</div>
			      </div>
			      
			      <div class="modal-footer">
			       	<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			       	<button type="button" id="report" name = "report" class="btn btn-warning">신고하기</button>
			       	<input type="hidden" id="ID" name="ID" value="${loginInfo.ID}">
			       	<input type="hidden" id="CREA_ID" name="CREA_ID" value="${map.CREA_ID}">
			       	<input type="hidden" id="IDX" name="IDX" value="${map.IDX}">
			      </div>
			    </div>
			  </div>
			 </div>
			
		 </c:otherwise>
	 </c:choose>    	
		<input type="hidden" id="reportReturn" name="reportReturn" value="${msg}">
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
  
  $("#report").unbind("click").click(function(e) {
	   e.preventDefault();
	   fn_reportBoard(); 
  });
  
  var test = $("#reportReturn").val();
  
  if(test == 'OK') {
	  alert("신고되었습니다.");
  }
  else if(test == 'NO') {
	  alert("이미 신고하였습니다.");
  }
  
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
  
  function fn_reportBoard() {
   var comSubmit = new ComSubmit();
   comSubmit.setUrl("<c:url value='/bbs/reportBoard.do' />");
   comSubmit.addParam("ID", $("#ID").val()); 
   comSubmit.addParam("CREA_ID", $("#CREA_ID").val());
   comSubmit.addParam("IDX", $("#IDX").val());
   comSubmit.addParam("TYPE", "free");
   comSubmit.addParam("REASON", $('input[name="RadioOptions"]:checked').val());
   comSubmit.submit();
  }
  
</script>
</body>
</html>