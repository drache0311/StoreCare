<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  
  <!-- Bootstrap core CSS -->
  <link href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<title>등록 확인</title>





<%

String category_code = request.getParameter("problem_category_code");
String problem_code = request.getParameter("problem_problem_code");
String category_detail = request.getParameter("category_detail");
String problem_detail = request.getParameter("problem_detail");
String seq = (String) request.getParameter("seq");
String id = (String) session.getAttribute("login");
/* String department_code = request.getParameter("department_department_code"); */
String flag = request.getParameter("flag");
String place_place_code = request.getParameter("place_place_code");

Timestamp now = new Timestamp(System.currentTimeMillis());

%>

</head>
<body>

 <!-- include nav -->
<%@include file ="common/nav.jsp" %>

  
    <!-- Page Content -->
<c:set var="seq" value="<%=seq%>" />    
<c:set var="id" value="<%=id%>" />    
<c:set var="flag" value="<%=flag%>" />

<!--  지금은 null이 String이라서 'null'로 비교하는데  -->
<!-- 앞에서 POST로 던져주고 진짜 null로 비교하는식으로 변경  -->
<!-- GET은 버리고 POST로 다 변경하장  -->

out.println(${board});

<c:choose>
	<c:when test="${seq eq '0'}" >
		<form action="insertBoard.do" method="get">
	</c:when>
	<c:otherwise>
		<form action="updateUserBoard.do" method="get">
	</c:otherwise>
</c:choose>
 	<div class = "container-fluid" >
			<div class = "card mt-4">
			    <div class ="card-body">
			    <c:if test="${seq ne 'null'}">
			  	  <input name="seq" type="hidden" value="<%=seq%>" />
			    </c:if>
			    <input name="datetime" type="hidden" value="<%=now%>" />
			    <input name="place_place_code" type="hidden" value="<%=place_place_code%>" />
			    <input name="users_id" type="hidden" value="<%=id%>" />
			    	<h5 class="card-header">현재 방문 백화점</h5>
<%-- 			    	<input name="department_department_code" type="hidden" value="<%=department_code %>" /> --%>
      				<select name="department_department_name" id="department_department_code" onchange="departmentChange(this)">
						<c:forEach items="${departmentList}" var="department">
							<option value="${department.department_name}">${department.department_name}</option>
						</c:forEach>
					</select>
					<h1 class = "card-title">  ${board.department_name}  </h1>
				</div>
				<div class ="card-body">
			    	<h5 class="card-header">요청내용</h5>
			    	<input name="problem_category_code" type="hidden" value="<%=category_code %>" />
					<span class='text-primary'> <%=category_detail %> </span>
					<input name="problem_problem_code" type="hidden" value="<%=problem_code %>" />			
					<h1 class = "card-title"> <%=problem_detail %> </h1>
				</div>
				<div class ="card-body">
			    	<h5 class="card-header">백화점 층 수</h5>
			    	
			    		<select name="floor" id="floor">
							<option>선택해주세요.</option>
						</select>
				</div>
   			</div>
   			<c:choose>
	   			<c:when test="${seq eq 0}">
					<button class="btn btn-primary" type="submit" >등록하기</button>
				</c:when>
				<c:when test="${flag eq 0}">
					<button class="btn btn-primary" type="submit" >수정하기</button>
				</c:when>
			</c:choose>
	</div>
		</form>
  
  
  
  
  
  
  
  
  
  
  
  	
<!-- Bootstrap core JavaScript -->
  <script src="<%=request.getContextPath()%>/resources/vendor/jquery/jquery.slim.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  
<!-- Custom JavaScript for this theme -->
  <script src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/checkBoard.js"></script>
  
  
</body>
</html>