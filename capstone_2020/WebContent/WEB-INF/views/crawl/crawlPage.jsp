<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="../header.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/list.css'/>" /> 
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.3.0/Chart.min.js"></script>
<!-- chart용 css -->
<style type="text/css">
.hidden_data {
  display: none;
}
.chart-container { 
  
  height: 600px;
  border: 1px solid #ddd;
  padding: 10px;
  border-radius: 4px;
}
</style>
</head>
<body class="body-set">

<div class="container">
<div class="jumbotron col-lg-12 col-xs-12 text-center" style="background-color:#F8F9FA">
<div class="row" style="text-align: center">
	<div class="thumbnails list-unstyled">

			
				<div class="col-lg-4">
		          <div class="thumbnail" style="padding: 0; height:auto">
		          
		          	<div style="text-align: center">
		          		
		          		<img src="https://platum.kr/wp-content/uploads/2016/01/naver2-1024x277.png"
		          		 width=50% height=50px>
		          	</div>
		          	

		            <div style="padding:4px; text-align: left">
		              <ul>
		              
<c:choose>
<c:when test="${fn:length(naverCrawl) > 0 }">
<c:forEach items="${naverCrawl}" var="row">
	<li>
		<span>
			${row.rank}:
		</span>
		<span>
			${row.title}
		</span>
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
		            <div style="text-align: center">
		            	<p style="font-size:15px;">출처 : 네이버 </p>
		            </div>
		            
		          </div>
		        </div>
		    	
		    	<div class="col-lg-4">
		          <div class="thumbnail" style="padding: 0; height:auto">
		          	
		          	<div style="text-align: center">
		          		
		          		<img src="https://t1.daumcdn.net/cfile/tistory/195B1B1C4C6F52B633"
		          		 width=50% height=50px>
		          	</div>
		          	
		            <div style="padding:4px; text-align: left">
		              
		              <ul>
<c:choose>
<c:when test="${fn:length(daumCrawl) > 0 }">
<c:forEach items="${daumCrawl}" var="row">
	<li>
		<span>
			${row.rank}:
		</span>
		<span>
			${row.title}
		</span>
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
		            <div style="text-align: center">
		            	<p style="font-size:15px;">출처 : 다음 </p>
		            </div>
		          </div>
		        </div>
		        
		        <div class="col-lg-4">
		          <div class="thumbnail" style="padding: 0; height:auto">
		          	<div style="text-align: center">
		          		
		          		<img src="https://mblogthumb-phinf.pstatic.net/20090721_96/shootar_1248176657138HNrSE_gif/090719_new_nate_01_shootar.gif?type=w210"
		          		 width=50% height=50px>
		          		
		          	</div>
		            <div style="padding:4px; text-align: left">
		              
		              <ul>
<c:choose>
<c:when test="${fn:length(nateCrawl) > 0 }">
<c:forEach items="${nateCrawl}" var="row">
	<li>
		<span>
			${row.rank}:
		</span>
		<span>
			${row.title}
		</span>
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
		            <div style="text-align: center">
		            	<p style="font-size:15px;">출처 : 네이트 </p>
		            </div>
		          </div>
		        </div>
				
				<div class="col-lg-12">
					<div class= "thumbnail">
					<h3>박스오피스 - 일별 영화 관람객 추이</h3>
					<div class="chart-container">
			  			<canvas id="line-chart"></canvas>
					</div>
					</div>
				</div>
				
			 
 
    </div>

</div>
</div> 
</div>


<div id="hidden_date" class="hidden_data">
  <ul class="date">
  
  	<c:forEach items="${boxoffice}" var="list" varStatus="status">
	<c:if test = "${status.index != 0}">
	
	<c:forEach items="${list}" var="in" varStatus="status">
		<c:if test = "${status.index eq 0}">
			<li>${in}</li>	
		</c:if>
		
	</c:forEach>
	</c:if>
	</c:forEach>

  </ul>
</div>



<div id="hidden_data" class="hidden_data">
 	
  <c:forEach items="${boxoffice}" var="list" varStatus="status">
  <c:if test = "${status.index == 0}">
	<c:forEach items="${list}" var="in" varStatus="status">
		<c:if test = "${status.index != 0}">
			<h4 class="data_label${status.index}">${in}</h4>	
		</c:if>
	</c:forEach>
  </c:if>
</c:forEach>
  

<ul class="data1">
 	<c:forEach items="${attendance}" var="list" varStatus="status">
		<c:forEach items="${list}" var="in" varStatus="status2">		
	<li>${in}</li>
  		</c:forEach>
  		<c:if test = "${!status.last}">
</ul>
<ul class="data${status.count+1}">
  		</c:if>
 	</c:forEach>
	</ul>
</div>



</body>

<script type="text/javascript">
var datelen = document.getElementById("hidden_date").getElementsByTagName("li").length
var mvlen = document.getElementById("hidden_data").getElementsByTagName("ul").length;

for (var i=1; i<= mvlen; i++){
	eval("var dataLabel"+i+"= $('.data_label"+i+"').text()");
	eval("var mydata"+i+"=[]");
	eval("var mydataList"+i+"=$('.data"+i+" li')");
	eval("mydataList"+i+".each(function(){mydata"+i+".push($(this).text());})");
}

var date = [];
var dateList = $('.date li');
dateList.each(function(){
	date.push($(this).text());//리스트마다의 값을 date에 저장
	});
	
var ctx = $("#line-chart");

var datalen=document.getElementById("hidden_data").getElementsByTagName("ul");

var coloR = [];

var dynamicColors = function() {
            var r = Math.floor(Math.random() * 255);
            var g = Math.floor(Math.random() * 255);
            var b = Math.floor(Math.random() * 255);
            return "rgb("+r+","+g+","+b+")";
         };

for (var i in datalen) {
            coloR.push(dynamicColors());
         };


for (var i=1; i<= mvlen; i++){
	eval(
			"var data"+i+" = {"+
					"label: dataLabel"+i+","+
					"data: mydata"+i+","+
					"fill: false,"+
					"backgroundColor: coloR["+i+"],"+
					"borderColor: coloR["+i+"],"+
					"borderWidth: 2}"
			);
};

var datas = [];

for (var i=1; i<= mvlen; i++){
	eval("datas.push(data"+i+")"); 
};

var hidden = new Array();

var config = {
		type: 'bar',
		  data: {
		    labels: date,
		    datasets: 
		    	datas
		  },
		  options: {
			spanGaps: true,
			
		    tooltips: {
		        callbacks: {
		            label: function(tooltipItem, data) {
		                return String(data.datasets[tooltipItem.datasetIndex].label)
		                  +"-관객수: " + Number(tooltipItem.yLabel)+"명";
		            }
		        }
		        
	        
		    },

		    legend:{
		    	position:'right',
		    	onHover: function(event, legendItem) {
		            document.getElementById("line-chart").style.cursor = 'pointer';
		        },
		    	onClick: function(e, legendItem) {
		    	    var index = legendItem.datasetIndex; 
		    	    var ci = mvChart;	
		    	    var alreadyHidden = (ci.getDatasetMeta(index).hidden === null) ? false : ci.getDatasetMeta(index).hidden;
		    	    var anyOthersAlreadyHidden = false;
		  			var allOthersHidden = true;

		  			ci.data.datasets.forEach(function(e, i) {
		  			    var meta = ci.getDatasetMeta(i); 

		  			    if (i !== index) {
		  			      if (meta.hidden) {
		  			        anyOthersAlreadyHidden = true;
		  			      } else {
		  			        allOthersHidden = false;
		  			      }
		  			    }
		  			});

		  			if (alreadyHidden) {
		  			    ci.getDatasetMeta(index).hidden = null;
		  			    
		  			} else { 
		  				ci.data.datasets.forEach(function(e, i) {
			  			    var meta = ci.getDatasetMeta(i);
		
			  			    if (i !== index) {
			  			    	
			  			    	if (anyOthersAlreadyHidden && !allOthersHidden) {
			  			        	meta.hidden = true;
			  			        } else {
			  			        	meta.hidden = meta.hidden === null ? !meta.hidden : null;
			  			        }
			  			    	
			  			    } else {
			  			    	meta.hidden = null;
			  			    }
		  				});
		  			}
		  			hidden=[];
		  			var hiddenCnt = 0;
		  			ci.data.datasets.forEach(function(e, i){
		  				var tf = ci.getDatasetMeta(i).hidden;
		    	    	hidden.push(tf);
		    	    	if(!tf){hiddenCnt++;}
		    	    }); 

		  			if (hiddenCnt < 6){
			  			if(temp.type=='bar')change('line');else mvChart.update();
		  			}else{
			  			if(temp.type=='line')change('bar');else mvChart.update();
		  			}
 
		    	}, //onclick
		    },//legend
		    maintainAspectRatio: false,
		    
		    scales: {
		      xAxes: [{ stacked: false }],
		      yAxes: [{ stacked: false }]
		    }
		  }
		
}

var mvChart = new Chart(ctx, config);

$("#line").click(function() {
  change('line')
});

$("#bar").click(function() {
  change('bar');
});


var temp = jQuery.extend(true, {}, config);

function change(newType) {
	if (mvChart) {
		mvChart.destroy();
	}
	
	temp.type = newType;
	mvChart = new Chart(ctx, temp);
	mvChart.data.datasets.forEach(function(e, i){
		mvChart.getDatasetMeta(i).hidden = hidden[i];
	}); 
	mvChart.update();
};
</script>



</html>