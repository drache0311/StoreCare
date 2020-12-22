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

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
    <div class="container">
      <a class="navbar-brand" href="#">StoreCare</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="getDepartmentList.do">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">About</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Services</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="logout.do">Log-out</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>



<%
	String code = request.getParameter("searchCondition");
	if(code == null)
		code = request.getParameter("dep_code");
	out.println(code);
	out.println("dep_code");
	String seq = (String) request.getParameter("seq");
	out.println(seq);
%>
<!-- 예시 템플릿 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ  -->
<div class="card w-75">
	<div class="card-body">
	    <h5 class="card-title">이전</h5>
	    <a href="getBoardList.do" class="btn btn-primary">내 문의 목록 보기</a>
	</div>
</div>
<!-- 예시 템플릿 여기까지   ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ          -->

<%=seq %>
<c:set var="seq" value="<%=seq %>" />
<c:set var="temp" value="0" />
<c:set var="count" value="0" />



<c:forEach items="${problemList}" var="problem" varStatus="status">
<c:choose>


<c:when test="${problem.place_code != temp}">

<c:if test="${problem.place_code>1}">
			</div>
	</div>
</c:if>
	
	<c:set var="temp" value="${problem.place_code}" />
	
	<div class="card w-75">
		<div class="card-body">
		<h5 class="card-title">${problem.place_detail}</h5>
</c:when>
</c:choose>
		    <a href="checkBoard?problem_code=${problem.code}&dep_code=<%=code%>&place_code=${problem.place_code}&problem_detail=${problem.problem_detail}&place_detail=${problem.place_detail}&seq=<%=seq%>" class="btn btn-primary">${problem.problem_detail}</a>
</c:forEach>
			</div>
	</div>
		


	
	
	
	
	
	
	
	
	
	  <!-- Bootstrap core JavaScript -->
  <script src="<%=request.getContextPath()%>/resources/vendor/jquery/jquery.slim.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>