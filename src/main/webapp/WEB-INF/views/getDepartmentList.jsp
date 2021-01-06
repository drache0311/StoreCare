<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.79.0">
    <title>headAdmin</title>

	<!-- JQuery JavaScript -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/jquery-ui.css" type="text/css" />  
	<script src="<%=request.getContextPath()%>/resources/vendor/jquery/jquery.min.js"></script>  
	<script src="<%=request.getContextPath()%>/resources/vendor/jquery/jquery-ui.min.js"></script>

	<!-- Bootstrap core CSS -->
	<link href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

	<!-- Custom styles for this template -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/scrolling-nav.css">


</head>

<body id="page-top">


<!-- include nav -->
<%@include file ="common/nav.jsp" %>


	<header class="bg-primary text-white">
		<div class="container text-center">
			<h1>관리자 페이지</h1>
			<p class="lead">백화점 조회 페이지</p>
		</div>
	</header>

	<section id="about">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 mx-auto">
					<h2>전체 내역</h2>
					
					<!--  검색 FORM -->
					<div align="center">
						<form name="searchDepBoard"  method="post" action="getBoardList.do">
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
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th><input id="allCheck" type="checkbox" name="allCheck"/></th>
								<th>접수일자</th>
								<th>접수내용</th>
								<th>처리현황</th>
								<th>처리시간</th>
							</tr>
						</thead>
						<tbody>

						<c:forEach items="${boardList}" var="board">
							<tr>
								<td><input name="RowCheck" type="checkbox" value="${board.seq }"/></td>
								<td>${board.datetime}</td>
								<td>${board.category_detail}
								${board.problem_detail}</td>
								<td><c:if test="${board.flag eq 0}" >처리 중</c:if> <c:if test="${board.flag eq 1}" >처리완료</c:if></td>
								<td>${board.clearTime}</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					<input type="button" value="문의처리하기" class="btn btn-primary" onclick="deleteValue();">
				</div>
			</div>
		</div>
	</section>

  
<!-- SCRIPT ---------------------------------------------------------- -->
<!-- Bootstrap core JavaScript -->
	<script src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Plugin JavaScript -->
	<script src="<%=request.getContextPath()%>/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom JavaScript for this theme -->
	<script src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/check-board-delete.js"></script>
<!-- SCRIPT ---------------------------------------------------------- -->
</body>
</html>

