<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLEncoder" %>
<!doctype html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.79.0">
    
    <title>등록하기</title>
    
	
	<!-- Bootstrap core CSS -->
	<link href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

	<!-- Custom styles for this template -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/scrolling-nav.css">
	<link href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/button-dark.css" rel="stylesheet">
	<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
</head>

<%
	String depth = request.getParameter("depth");
	String category_code = request.getParameter("category_category_code");
	String category_detail = null;
	if(request.getParameter("category_detail") != null){
		category_detail = URLEncoder.encode(request.getParameter("category_detail"));
	}
	String problem_code = request.getParameter("problem_problem_code");
	String problem_detail = null;
	if(request.getParameter("problem_detail") != null){
		problem_detail = URLEncoder.encode(request.getParameter("problem_detail"));
	}
	String seq = (String) request.getParameter("seq");
	if(seq==null){
		seq = "0";
	}
	
	String flag = request.getParameter("flag");
	if(flag==null){
		flag = "0";
	}
%>
<c:set var="depth" value="<%=depth %>" />

<%
	if(depth == null){
%>
	<c:set var="depth" value="${problemList[0].depth }" />
<%
	}
%>
<body id="page-top" style="font-family:Spoqa Han Sans Neo, sans-serif">
<!-- include nav -->
<%@include file ="common/nav.jsp" %>
<p class="p-3 text-white bg-secondary">
    <img src="<%=request.getContextPath()%>/resources/icon/shop.png" class="img-thumbnail" alt="" width="30" height="30">
    현재 방문 백화점 - ${departmentName.department_name }
</p>
  <!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
<ul class="list-inline" style="text-align:center">
	<li class="list-inline-item">
		<img src="<%=request.getContextPath()%>/resources/icon/message-circular-red.png" alt="" width="100" height="100">
	</li>
	<li class="list-inline-item">
		<img src="<%=request.getContextPath()%>/resources/icon/right-arrow.png" alt="" width="50" height="50">
	</li>
	<li class="list-inline-item">
		<img src="<%=request.getContextPath()%>/resources/icon/contract.png" alt="" width="100" height="100">
	</li>
</ul>
<font class="text-danger" style="margin-left:21%; font-weight:bold">요청사항</font>
<font style="margin-left:23%">문의등록</font>
  <!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
  <section id="about" style="padding:50px 0"> 
    <div class="container">
      <div class="row">
        <div class="col-lg-8 mx-auto">
        <!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
        	<c:choose>
        		<c:when test="${depth eq 1}">
	        		<c:forEach items="${problemList }" var="problem">
	        			<h2 >
	        				<a class="btn bg-light text-wrap " style="width: 100%; height:70px; line-height:60px; font-size:1.2rem ; text-align: start" href="insertBoard?category_category_code=${problem.category_category_code }&department_department_code=<%=department_department_code %>&depth=2&seq=<%=seq %>" >
	        					${problem.category_detail}
	        				</a>
	        			</h2>
	        			<!--  -->
	        			<!-- 여기서 category_code의 값을 넘겨줘야 뎁스2가 정해진다 -->
	        			<!--  -->
	        		</c:forEach>
        		</c:when>
         		<c:when test="${depth eq 2}">
	         		<h2 class="btn bg-dark text-white" style="width: 100%; height:70px; line-height:60px; font-size:1.2rem ; text-align: start">${problemList[0].category_detail }</h2>
	        		<c:forEach items="${problemList }" var="problem">
	        			<h2>
		        			<a class="btn bg-light text-wrap " style="width: 100%; height:70px; line-height:60px; font-size:1.2rem ; text-align: start" href="insertBoard?category_category_code=${problem.category_category_code }&category_detail=${problem.category_detail }&problem_problem_code=${problem.problem_problem_code }&problem_detail=${problem.problem_detail }&department_department_code=<%=department_department_code %>&depth=3&seq=<%=seq %>" class="btn btn-secondary">
		        				&#xE001; ${problem.problem_detail}
		        			</a>
	        			</h2>
	        			<!--  -->
	        			<!-- 여기서 category_code와 problem_code의 값을 넘겨줘야 뎁스3가 정해진다 -->
	        			<!--  -->
	        		</c:forEach>
        		</c:when> 
         		<c:when test="${depth eq 3}">
	       			<c:if test="${problemList eq '[]' }">
	       			<%
	       				System.out.println("여기 insert이다 !!!! "+problem_detail + " 제발 한글좀 "+ category_detail);
	       				
	       				response.sendRedirect("checkBoard.do?problem_category_code="+category_code+"&problem_problem_code="+problem_code+"&problem_detail="+problem_detail+"&category_detail="+category_detail+"&department_department_code="+department_department_code+"&seq="+seq+"&flag="+flag+"&depth=3");
         			%>
         			</c:if>
	         		<h2 class="btn bg-dark text-white" style="width: 100%; height:70px; line-height:60px; font-size:1.2rem ; text-align: start">${problemList[0].category_detail } </h2>
	         		<p class="btn bg-secondary text-white" style="width: 100%; height:70px; line-height:60px; font-size:1.2rem ; text-align: start">${problemList[0].problem_detail }</p>
		        		<c:forEach items="${problemList }" var="problem">
									<h2>
										<a class="btn bg-light text-wrap " style="width: 100%; height:70px; line-height:60px; font-size:1.2rem ; text-align: start" href="checkBoard.do?problem_category_code=${problem.category_category_code }&problem_problem_code=${problem.problem_problem_code }&problem_detail=${problem.problem_detail }&category_detail=${problem.category_detail }&place_place_code=${problem.place_place_code }&place_place_detail=${problem.place_detail }&department_department_code=<%=department_department_code %>&seq=<%=seq %>&flag=<%=flag %>&depth=3" class="btn btn-secondary">
											&#xE001; ${problem.place_detail}
										</a>
									</h2>	
			       		</c:forEach>
			       		
        		</c:when>
        	</c:choose>
			<button onclick="history.back()" class="btn btn-secondary mt-4" style="float:left; width:100%" >이전</button>
         <!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
        </div>
      </div>
    </div>
  </section>

 
<!-- Bootstrap core JavaScript -->
<script src="<%=request.getContextPath()%>/resources/vendor/jquery/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Plugin JavaScript -->
<script src="<%=request.getContextPath()%>/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
<!-- JQuery JavaScript -->
<script src="<%=request.getContextPath()%>/resources/vendor/jquery/jquery-3.5.1.min.js"></script>

<!-- Custom JavaScript for this theme -->

<!-- SCRIPT ---------------------------------------------------------- -->
</body>
</html>

