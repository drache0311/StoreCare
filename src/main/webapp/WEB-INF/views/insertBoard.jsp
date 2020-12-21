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

<title>새글등록</title>
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
	out.println(code);
	out.println("dep_code");
%>
<!-- 예시 템플릿 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ  -->
<div class="card w-75">
	<div class="card-body">
	    <h5 class="card-title">기계  고장</h5>
	    <a href="#" class="btn btn-primary">엘리베이터가 고장났어요</p></a>
	    <a href="#" class="btn btn-primary">에스컬레이터가 고장났어요</a>
	</div>
</div>
<div class="card w-75">
	<div class="card-body">
	    <h5 class="card-title">플로어(매장환경)</h5>
	    <a href="#" class="btn btn-primary">너무 더워요</p></a>
	    <a href="#" class="btn btn-primary">미끄러워요</a>
	</div>
</div> 		
<!-- 예시 템플릿 여기까지   ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ          -->
<c:forEach items="${problemList}" var="problem" varStatus="status">
<c:if test="${problem.code==1}" var="result1">
	<div class="card w-75">
		<div class="card-body">
		    <h5 class="card-title">${problem.place_detail}</h5>
</c:if>
		    <a href="insert이후?place_code=${problem.place_code}&code=${problem.code}" class="btn btn-primary">${problem.problem_detail}</a>
<c:if test="${problem.code}==${status.end}" var="result1">
		</div>
	</div>
</c:if>
</c:forEach>


		
<a href="getBoardList.do">글 목록 가기</a>

	
	
	
	
	
	
	
	
	
	  <!-- Bootstrap core JavaScript -->
  <script src="<%=request.getContextPath()%>/resources/vendor/jquery/jquery.slim.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>