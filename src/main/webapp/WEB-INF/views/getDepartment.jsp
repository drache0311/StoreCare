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
String department_code = request.getParameter("department_code");
String department_name = request.getParameter("department_name");
String id = request.getParameter("id");
%>

</head>
<body>

 <!-- include nav -->
<%@include file ="common/nav.jsp" %>

  
<!-- Page Content -->
<c:set var="department_code" value="<%=department_code%>" />    
<c:set var="department_name" value="<%=department_name%>" />    
<c:set var="id" value="<%=id%>" />    

<!--  지금은 null이 String이라서 'null'로 비교하는데  -->
<!-- 앞에서 POST로 던져주고 진짜 null로 비교하는식으로 변경  -->
<!-- GET은 버리고 POST로 다 변경하장  -->

<form method="get">
 	<div class = "container-fluid" >
			<div class = "card mt-4">
			    <div class ="card-body">
			  	  <input name="department_name" type="hidden" value="${department_name }" />
			    	<h5 class="card-header">백화점 명</h5>
 			    	<input name="department_code" type="hidden" value="${department_code }" />
					<h1 class = "card-title">  ${department_name }  </h1>
				</div>
				<div class ="card-body">
			    	<h5 class="card-header">관리자 아이디</h5>
			    	<input name="id" type="hidden" value="${id }" />
					<span class='text-primary'> ${id } </span>
				</div>
   			</div>
<!-- 		<button formaction="updateDepartment.do" class="btn btn-primary" type="submit" >수정하기</button>	-->
			<button formaction="deleteDepartment.do" class="btn btn-primary" type="submit" >삭제하기</button>
	</div>
</form>
	<!-- include prevButton -->
	<%@include file ="common/prevButton.jsp" %>
  
  
  
  
  
  
  
  
  
  
  	
<!-- Bootstrap core JavaScript -->
  <script src="<%=request.getContextPath()%>/resources/vendor/jquery/jquery.slim.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  
<!-- Custom JavaScript for this theme -->

  
  
</body>
</html>