<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.79.0">
    
    <title>총괄 관리자</title>
    
	
	<!-- Bootstrap core CSS -->
	<link href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

	<!-- Custom styles for this template -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/scrolling-nav.css">
</head>

<%
	String depth = request.getParameter("depth");
	String category_code = request.getParameter("category_code");
	String problem_code = request.getParameter("problem_code");
%>
<c:set var="depth" value="<%=depth %>" />

<%
	if(depth == null){
%>
	<c:set var="depth" value="${problemList[0].depth }" />
<%
	}
%>
<body id="page-top">
<!-- include nav -->
<%@include file ="common/nav.jsp" %>

<!--  여기서부터 foreach를 써서 section마다 각 점별 막대그래프 출력 -->
  <section id="about"> 
    <div class="container">
      <div class="row">
        <div class="col-lg-8 mx-auto">
        <!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
        <form  method="GET">
        	<c:choose>
        		<c:when test="${depth eq 1}">
	        		<c:forEach items="${problemList }" var="problem">
	        			<a href="updateProblem.do?category_code=${problem.category_code }&depth=2" class="btn btn-primary">${problem.category_detail}</a>
	        			<!--  -->
	        			<!-- 여기서 category_code의 값을 넘겨줘야 뎁스2가 정해진다 -->
	        			<!--  -->
	        		</c:forEach>
        		</c:when>
         		<c:when test="${depth eq 2}">
	         		${problemList[0].category_detail } >>>>>>${problemList[0].category_code }
	        		<c:forEach items="${problemList }" var="problem">
	        			<a href="updateProblem.do?category_code=${problem.category_code }&problem_code=${problem.problem_code }&depth=3" class="btn btn-primary">${problem.problem_detail}</a>
	        			<!--  -->
	        			<!-- 여기서 category_code와 problem_code의 값을 넘겨줘야 뎁스3가 정해진다 -->
	        			<!--  -->
	        		</c:forEach>
        		</c:when> 
         		<c:when test="${depth eq 3}">
	         		${problemList[0].category_detail } === ${problemList[0].problem_detail }
	        		<c:forEach items="${problemList }" var="problem">
	        			<a href="#" class="btn btn-primary">${problem.place_detail}</a>
	        		</c:forEach>
        		</c:when>
        	</c:choose>
        	</form>
         <!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
          <h2>예시용</h2>
          <!-- category.category_code가 널이면 category_detail 출력 -> 선택하면 null이 아니니까 problem_detail 출력(2뎁스)   -->
          <!-- 2뎁스도 널이 아니면 3뎁스의 place_detail 출력 -->
          <p class="lead">예시용</p>
          <ul>
            <li>예시용</li>
          </ul>
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

