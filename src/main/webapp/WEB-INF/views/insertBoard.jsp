<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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

<title>문의 선택</title>
</head>
<body>

<!-- include nav -->
<%@include file ="common/nav.jsp" %>



<%
	String code = request.getParameter("searchCondition");
	if(code == null)
		code = request.getParameter("department_department_code");
	
	String seq = (String) request.getParameter("seq");
	if(seq==null){
		seq = "0";
	}
	
	String flag = request.getParameter("flag");
	if(flag==null){
		flag = "0";
	}
%>
<!-- 내 문의보기  ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ  -->
<div class="card w-75">
	<div class="card-body">
	    <h5 class="card-title">이전</h5>
	    <a href="getBoardUserList.do" class="btn btn-primary">내 문의 목록 보기</a>
	</div>
</div>
<!-- 내문의 보기 여기까지   ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ          -->


<c:set var="seq" value="<%=seq %>" />
<c:set var="temp" value="0" />
<c:set var="count" value="0" />



<c:forEach items="${problemList}" var="problem" varStatus="status">
<c:choose>


<c:when test="${problem.category_category_code != temp}">

<c:if test="${problem.category_category_code>1}">
			</div>
	</div>
</c:if>
	
	<c:set var="temp" value="${problem.category_category_code}" />
	
	<div class="card w-75">
		<div class="card-body">
		<h5 class="card-title">${problem.category_detail}</h5>
</c:when>
</c:choose>
		    <a href="checkBoard.do?problem_problem_code=${problem.problem_code}&department_department_code=<%=code%>&problem_category_code=${problem.category_category_code}&problem_detail=${problem.problem_detail}&category_detail=${problem.category_detail}&seq=<%=seq%>&flag=<%=flag %>" class="btn btn-primary">${problem.problem_detail}</a>
</c:forEach>
			</div>
	</div>
		


	
	
	
	
	
	
	
	
	
	  <!-- Bootstrap core JavaScript -->
  <script src="<%=request.getContextPath()%>/resources/vendor/jquery/jquery.slim.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>