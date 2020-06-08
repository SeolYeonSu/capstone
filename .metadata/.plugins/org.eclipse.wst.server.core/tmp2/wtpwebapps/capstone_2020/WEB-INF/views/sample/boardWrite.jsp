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
<div class="container">
<div class="row">
	<form id=frm2>
		<table class="table table-striped"
			style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th colspan="2"
						style="background-color: #eeeeee; text-align: center;">게시판 글 쓰기 </th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="text" class="form-control" id="TITLE" name="TITLE" maxlength="100" placeholder="글 제목"></td>
					<!--  -->
				</tr>
				<tr>
					<td><textarea class="form-control" placeholder="글 내용" id="CONTENTS" name="CONTENTS" maxlength="2048" style="height: 350px;"></textarea></td>
				</tr>
			</tbody>
		</table>
		<input type="hidden" name="CREA_ID" value="${loginInfo.ID}" /> 
		<a href="#" id="write" class="btn btn-primary pull-right">글쓰기</a>
	</form>
</div>
</div>     
    
    <script type="text/javascript">

    $(document).ready(function() {
        $("#list").unbind("click").click(function(e) {
            e.preventDefault();
            fn_openBoardList();
        });
        $("#write").unbind("click").click(function(e) {
            e.preventDefault();
            fn_insertBoard();
        });
    });
     
    function fn_openBoardList() {
        var comSubmit = new ComSubmit();
        comSubmit.setUrl("<c:url value='/sample/openBoardList.do' />");
        comSubmit.submit();
    }

    function fn_insertBoard() {
        var comSubmit = new ComSubmit("frm2");
        comSubmit.setUrl("<c:url value='/bbs/insertBoard.do' />");
        comSubmit.submit();
    }
        
        
    </script>
</body>
</html>