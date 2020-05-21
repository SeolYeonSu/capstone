<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../header.jsp" %>

<title>Insert title here</title>
<style>
	
</style>
</head>
<body class="body-set">

<div class="jumbotron col-lg-12 col-xs-12 text-center" style="background-color:#F8F9FA">
<div class="row" style="text-align: center">
<ul class="thumbnails list-unstyled">
<c:choose>
    <c:when test="${fn:length(list) > 0 }">
    	<c:forEach items="${list }" var="row">
			
				<li class="col-lg-3">
		          <div class="thumbnail" style="padding: 0; height:auto">
		            <div style="padding:4px">
		              <img alt="img" style="width: 100%; height: 300px" src="${row.img }">
		            </div>
		            <div class="caption text-center">
		            <a href="#" name="title">
		            	<input type="hidden" id="movieId" value="${row.movieId }">
						<input type="hidden" id="movieSeq" value="${row.movieSeq }">
		            	<h3>${row.title }</h3>
		            </a>
		              
		            </div>
		            <div class="modal-footer" style="text-align: left">
		              <div>
		                             연령 : ${row.age }
		              </div>
		              <div>
		                             장르 : ${row.genre }
		              </div>
		              
		            </div>
		          </div>
		        </li>
		    
				
			 
     </c:forEach>
    </c:when>
    <c:otherwise>
     <tr>
      <td colspan="4">조회된 결과가 없습니다.</td>
     </tr>
    </c:otherwise>
   </c:choose>
    </ul>
</div>
</div> 

<script type="text/javascript">
$(document).ready(function() {
	$('#searchMovie').keypress(function (event) {
	    if (event.keyCode === 10 || event.keyCode === 13) {
	        event.preventDefault();
	        fn_moveToSearchResult();
	    }
	});
	
	$("a[name='title']").unbind("click").click(function(e) {
	    e.preventDefault();
	    fn_moveToDetailResult($(this));
	});
	
});

function fn_moveToSearchResult() {
	var comSubmit = new ComSubmit("frm");
	comSubmit.setUrl("<c:url value='/movie/openSearchResult.do' />");
    comSubmit.submit();
}
function fn_moveToDetailResult(obj) {
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/movie/openDetailResult.do' />");
	comSubmit.addParam("movieId", obj.parent().find("#movieId").val());
	comSubmit.addParam("movieSeq", obj.parent().find("#movieSeq").val());
    comSubmit.submit();
}
</script>
</body>
</html>