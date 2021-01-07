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
<body id="page-top">
<!-- include nav -->
<%@include file ="common/nav.jsp" %>

<!--  여기서부터 foreach를 써서 section마다 각 점별 막대그래프 출력 -->
  <section id="about"> 
    <div class="container">
      <div class="row">
        <div class="col-lg-8 mx-auto">
        <!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
        	<c:choose>
        		<c:when test="${depth eq 1}">
	        		<c:forEach items="${problemList }" var="problem">
	        			<h2>
	        				<a href="insertBoard?category_code=${problem.category_code }&<%-- department_department_code=<%=department_department_code %>& --%>seq=<%=seq %>&depth=2" class="btn btn-primary">
	        					${problem.category_detail}
	        				</a>
	        			</h2>
	        			<!--  -->
	        			<!-- 여기서 category_code의 값을 넘겨줘야 뎁스2가 정해진다 -->
	        			<!--  -->
	        		</c:forEach>
        		</c:when>
         		<c:when test="${depth eq 2}">
	         		<h2>${problemList[0].category_detail }</h2>
	        		<c:forEach items="${problemList }" var="problem">
	        			<h2>
		        			<a href="insertBoard?category_code=${problem.category_code }&problem_code=${problem.problem_code }<%-- &department_department_code=<%=department_department_code %> --%>&seq=<%=seq %>&depth=3" class="btn btn-primary">
		        				${problem.problem_detail}
		        			</a>
	        			</h2>
	        			<!--  -->
	        			<!-- 여기서 category_code와 problem_code의 값을 넘겨줘야 뎁스3가 정해진다 -->
	        			<!--  -->
	        		</c:forEach>
        		</c:when> 
         		<c:when test="${depth eq 3}">
	         		<h2>${problemList[0].category_detail } </h2>
	         		<p>${problemList[0].problem_detail }</p>
		        		<c:forEach items="${problemList }" var="problem">
									<h2>
										<a href="checkBoard.do?problem_category_code=${problem.category_code }&problem_problem_code=${problem.problem_code }&problem_detail=${problem.problem_detail }&category_detail=${problem.category_detail }&place_place_code=${problem.place_code }&place_place_detail=${problem.place_detail }&<%-- department_department_code=${department_department_code }& --%>seq=<%=seq %>&flag=<%=flag %>&depth=3" class="btn btn-primary">
											${problem.place_detail}
										</a>
									</h2>	
			       		</c:forEach>
        		</c:when>
        	</c:choose>


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

