<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../header.jsp" %>

</head>
<body>
<div class="container">
<div class="col-md-4"></div>
<div class="col-md-4">
<div class="jumbotron">
	<form id="frm">
		<h3 style="text-align: center;"> Login </h3>
		<div class="form-group">
			<input type="text" id="user_id" name="ID" class="form-control" placeholder="아이디">
		</div>
		<div class="form-group">
			<input type="password" id="user_pwd" name="PASSWORD" class="form-control" placeholder="비밀번호">
		</div>
		<input id="login_btn" class="btn btn-primary form-control" value="로그인">
	</form>
</div>
</div>
</div>

<script>
$(document).ready(function() {
 $("#login_btn").unbind("click").click(function(e) {
  e.preventDefault();
  fn_login();
 }); 
});
 
function fn_login() {
 if($("#user_id").val().length < 1)
 {
  alert("아이디를 입력해주세요.");
 }
 else if($("#user_pwd").val().length < 1)
 {
  alert("비밀번호를 입력해주세요.");
 }
 else
 {
  var comSubmit = new ComSubmit("frm");
  comSubmit.setUrl("<c:url value='/user/loginTry.do' />");
  comSubmit.addParam("ID", $("#user_id").val());
  comSubmit.addParam("PASSWORD", $("#user_pwd").val());
  comSubmit.submit();
 }
}
</script>

</body>
</html>

