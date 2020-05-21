<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%@ include file="../header.jsp" %>
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>


</head>
<body class="body-set">
<div class="container col-lg-12">

	<div class="jumbotron">
	<form id="frm">
		<h3 style="text-align: center;"> 회원 가입 </h3>
		<div class="form-group">
			<label>약관동의</label>
			<textarea style="text-align:center"cols="40" rows="5" readonly="readonly">캡스톤 여러분,
한 학기 동안 수고 많으셨습니다.
남은 2019년도 잘 마무리하시고
항상 좋은 일만 함께하길 바랍니다.
			</textarea>
			<div style="text-align:right; margin-top:10px">
				<input type="checkbox" id="agree_checkbox" >
				<label>동의함</label>		
			</div>	
		</div>		
		<div class="form-group">
			<div>
				<input type="text" id="user_id" name="ID" class="form-control" placeholder="아이디">
			</div>		
			<div style="text-align:right; margin-top:10px">
				<button type="button" id="user_id_checkBtn" class="btn btn-success">ID 중복 확인</button>		
			</div>
		</div>	
		<div class="form-group">
			<input type="password" id="user_pwd" name="PASSWORD" class="form-control" placeholder="비밀번호">
		</div>
		<div class="form-group">
			<input type="text" id="user_name" name="NAME" class="form-control" placeholder="닉네임">
		</div>
		<div class="form-group">
			<input type="text" id="user_tel" name="TEL" class="form-control" placeholder="이메일">
		</div>
		<div class="form-group">
			<input type="button" id="signUpBtn2" class="btn btn-primary form-control" value="회원 가입">
		</div>
		<div class="form-group">
			<input type="reset" id="homeBtn" class="btn btn-danger form-control" value="취소">
		</div>
		
		</form>
	</div>

</div>

<script type="text/javascript">

	$(document).ready(function() {
	 $("#user_id_checkBtn").unbind("click").click(function(e) {
	  e.preventDefault();
	  fn_userIDCheck();
	 });
	});
	 
	function fn_userIDCheck() {
	 var userId = $("#user_id").val();
	 var userData = {"ID": userId}
	 
	 if (userId.length < 1)
	 {
	  alert("아이디를 입력해주시기 바랍니다.");
	 }
	 else
	 {
	  $.ajax({
	   async:false,
	   type : "POST", 
	   url : "${pageContext.request.contextPath}/user/checkUserID.do", 
	   data : userData,
	   dataType : "json",
	   error : function(error) {
		    alert("서버가 응답하지 않습니다. \n다시 시도해주시기 바랍니다.");
		   },
	   success : function(result) {
	
	    if (result == 0)
	    {
	     $("#user_id").attr("disabled", true);
	     alert("사용이 가능한 아이디입니다.");
	    }
	    else if (result == 1)
	    {
	     alert("이미 존재하는 아이디입니다. \n다른 아이디를 사용해주세요.");
	    }
	    else
	    {
	     alert("에러가 발생하였습니다.");
	    }
	   }
	  });
	 }
	}
	$(document).ready(function() {
		 $("#signUpBtn2").unbind("click").click(function(e) {
		  e.preventDefault();
		  fn_signUp();
		 });
		});
		 
		function fn_signUp() {
		 if ($("#agree_checkbox").prop("checked") == false)
		 {
		  alert("약관에 동의해주시기 바랍니다.");
		 }
		 else if ($("#user_name").val().length < 1)
		 {
		  alert("이름을 작성해주세요.");
		 }
		 else if ($("#user_tel").val().length < 1)
		 {
		  alert("전화번호를 작성해주세요.");
		 }
		 else if ($("#user_id").val().length < 1)
		 {
		  alert("사용하실 아이디를 작성해주세요.");
		 }
		 else if ($("#user_pwd").val().length < 1)
		 {
		  alert("사용하실 비밀번호를 작성해주세요.");
		 }
		 else if (!$("#user_id").attr("disabled"))
		 {
		  alert("아이디 중복체크를 해주세요.");
		 }
		 else
		 {
		  if (window.confirm("회원가입을 하시겠습니까?"))
		  {
		   // ※user_id의 disabled 속성을 풀어주는 이유
		   // submit()메소드가 실행될 때, disabled 속성이 있는 엘리먼트의 값을 서버로 전달하지 못한다.
		   // 이를 해결하기 위해서 disabled 속성을 false로 풀어주거나
		   // comSubmit.addParam("ID", 값)을 통해서 파라미터를 넘겨준다.
		   // disabled 속성을 풀어줬을 때 네트워크 통신 지연으로인해 수정하는 행위를 방지하기 위해 addParam() 메소드를 사용했다. 
		   var comSubmit = new ComSubmit("frm");
		   comSubmit.setUrl("<c:url value='/user/signUp.do' />");
		   comSubmit.addParam("ID", $("#user_id").val());
		   comSubmit.addParam("PASSWORD", $("#user_pwd").val());
		   comSubmit.addParam("NAME", $("#user_name").val());
		   comSubmit.addParam("TEL", $("#user_tel").val());
		   comSubmit.submit();
		  }
		 }
		}
		$(document).ready(function() {
			$("#homeBtn").unbind("click").click(function(e) {
				e.preventDefault();
			  	fn_home();
			});
		});
		function fn_home() {
			window.location.href="<c:url value='/home.do' />";
		}	
</script>
</body>
</html>