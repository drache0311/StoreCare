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
	
	<!-- JQuery JavaScript -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/jquery-ui.css" type="text/css" />  
	<script src="<%=request.getContextPath()%>/resources/vendor/jquery/jquery.min.js"></script>  
	<script src="<%=request.getContextPath()%>/resources/vendor/jquery/jquery-ui.min.js"></script>
	
	<!-- Bootstrap core CSS -->
	<link href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	

</head>

<body>

<!-- include nav -->
<%@include file ="common/nav.jsp" %>

  <!-- Page Content -->



<!--  검색 FORM -->
<div align="center">
	<form name="searchUserBoard"  method="post" action="getBoardUserList.do">
		<!-- 처리현황별 검색 SELECT -->
		<select name="searchCondition">
			<option value="all">전체</option>
			<option value="doing">처리중</option>
			<option value="done">처리완료</option>
		</select>
		<br/><br/> 
		From: <input type="text" id="startDate" name="startDate" placeholder="시작날짜" >&nbsp;
		
		To: <input type="text" id="endDate" name="endDate"  placeholder="끝날짜" >
		
		<button type="submit" id="btnSearch">검색</button>
	</form>
</div>

  

  <!-- 여기도 null이 아니라 [] 빈 리스트인데 이거 나중에 생각해보자  -->
<c:choose>
<c:when test="${boardUserList ne '[]'}">
 	<div class = "container-fluid" >
		<c:forEach items="${boardUserList}" var="board">
			<div class = "card mt-4">
			    <div class ="card-body">
					<span class='text-primary'> 문의시간 ${board.datetime}</span>
					<c:if test="${board.flag eq 1 }">
						<span class='text-primary'> 처리시간 ${board.clearTime}</span>
					</c:if>
					<h1 class = "card-title"> ${board.category_detail}</h1>
					<div class = "card-subtitle text-muted mb-2">
					  ${board.problem_detail}
					</div>
					<div class ="card-text mb-2">	${board.department_name } ${board.floor }F   </div>
					<c:if test="${board.flag eq 1 }">
						<div class ="card-text mb-2"><span class= "text-muted">   처리 완료	</span></div>
					</c:if>
					<c:if test="${board.flag eq 0 }">
						<div class ="card-text mb-2"><span class= "text-muted">   처리 중	</span></div>
						<a href="getProblemList.do?seq=${board.seq}&department_department_code=${board.department_department_code}&flag=${board.flag}" class="btn btn-primary">수정하기</a>
					</c:if>
					<a href="deleteUserBoard.do?seq=${board.seq}" class="btn btn-primary">삭제하기</a>
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
 
  <script src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  
  <!-- Custom JavaScript for this theme -->
  <script src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/datepicker.js"></script>

</body>

</html>
