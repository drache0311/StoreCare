<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>




<!DOCTYPE html>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>나의 StoreCare</title>

  <!-- Bootstrap core CSS -->
  <link href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

</head>

<body>

<!-- include nav -->
<%@include file ="common/nav.jsp" %>

  <!-- Page Content -->
  <!-- 여기도 null이 아니라 [] 빈 리스트인데 이거 나중에 생각해보자  -->
<c:choose>
<c:when test="${boardList ne '[]'}">
 	<div class = "container-fluid" >
		<c:forEach items="${boardList}" var="board">
			<div class = "card mt-4">
			    <div class ="card-body">
					<span class='text-primary'> ${board.datetime} </span>
					<h1 class = "card-title"> ${board.place_detail}</h1>
					<div class = "card-subtitle text-muted mb-2">
					  ${board.problem_detail}
					</div>
					<div class ="card-text mb-2">   ${board.floor }F   </div>
					<div class ="card-text mb-2">  <span class= "text-muted">${board.department_name } </span></div>
					<a href="getProblemList.do?seq=${board.seq}&dep_code=${board.department_code}" class="btn btn-primary">수정하기</a>
					<a href="deleteBoard.do?seq=${board.seq}" class="btn btn-primary">삭제하기</a>
				</div>
		</c:forEach>
   			</div>
	</div>
</c:when>
<c:otherwise>
<div class = "container-fluid" >
			<div class = "card mt-4">
			    <div class ="card-body">
					<h1 class = "card-title"> 문의가 없네요 !! </h1>
					 <a href="getDepartmentList.do" class="btn btn-primary">문의 하러가기 </a>
				</div>
			</div>
</div>
</c:otherwise>
</c:choose>
  
  
  

  <!-- Bootstrap core JavaScript -->
  <script src="<%=request.getContextPath()%>/resources/vendor/jquery/jquery.slim.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
