<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<%
	String searchCondition="all";
	String startDate = "";
	String endDate = "";
	String searchId = "all";
	String department_name = session.getAttribute("department_name").toString();
	
	if(session.getAttribute("searchCondition") != null){
		searchCondition = session.getAttribute("searchCondition").toString();
		startDate = session.getAttribute("startDate").toString();
		endDate = session.getAttribute("endDate").toString();
		searchId = session.getAttribute("searchId").toString();
	}
	
%>
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
    <link href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/button-dark.css" rel="stylesheet">

</head>

<body id="page-top">


<!-- include nav -->
<%@include file ="common/nav.jsp" %>


	<header class="bg-primary text-white">
		<div class="container text-center">
			<h1><%=department_name %> 관리자님 안녕하세요</h1>
			<p class="lead"><%=department_name %> 접수내역 조회 페이지입니다</p>
		</div>
	</header>

	<section id="about">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 mx-auto">
					<h2>전체 내역</h2>
					
					<!--  검색 FORM -->
					<div style="text-align-last: center">
						<form name="searchDepBoard"  autocomplete="off" method="post" action="getBoardList.do">
							<!-- 처리현황별 검색 SELECT -->
							처리현황 
							<select name="searchCondition">
								<option value="all">전체</option>
								<option value="doing">처리중</option>
								<option value="done">처리완료</option>
							</select>
							<br/><br/> 
							From <input type="text" id="startDate" name="startDate" placeholder="전체" style="width: 115px">
							&nbsp;
							To <input type="text" id="endDate" name="endDate"  placeholder="전체" style="width: 115px">
							&nbsp;
							문의자 <input type="text" id="searchId" name="searchId"  placeholder="01012345678" style="width: 115px">
							
							<button type="submit" id="btnSearch" class="btn btn-info" style="float:right">검색</button>
						</form>
					</div>	
					<table class="table table-striped table-hover" style="text-align:center; inline-size:max-content">
						<thead>
							<tr>
								<th><input id="allCheck" type="checkbox" name="allCheck" style="zoom:1.5"/></th>
								<th>접수일자</th>
								<th>접수내용</th>
								<th>처리현황</th>
								<th>처리시간</th>
								<th>문의자</th>
							</tr>
						</thead>
						<tbody>

						<c:forEach items="${boardList}" var="board">
							<tr>
								<td><input name="RowCheck" type="checkbox" value="${board.seq }" style="zoom:1.5"/></td>
								<td>${board.datetime}</td>
								<td>${board.category_detail}
								${board.problem_detail}
								${board.place_detail }</td>
								<td><c:if test="${board.flag eq 0}" >처리 중</c:if> <c:if test="${board.flag eq 1}" >처리완료</c:if></td>
								<td>${board.clearTime}</td>
								<td>${board.users_id}</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					<input type="button" value="문의처리하기" class="btn btn-dark" onclick="deleteValue();">
					<!-- 페이지 번호 -->	
								<div class="btn-toolbar mb-3" role="toolbar" aria-label="Toolbar with button groups" style="place-content: center">
								  <div class="btn-group me-2" role="group" aria-label="First group">
							
								<!-- prev 버튼 -->
								<div id="page-prev">
									<a class="btn btn-outline-secondary" href="getBoardList.do${pageMaker.makeQuery(pageMaker.startPage)}&searchCondition=<%=searchCondition %>&startDate=<%=startDate %>&endDate=<%=endDate %>&searchId=<%=searchId %>" aria-label="Prev">
										<span aria-hidden="true">«</span>
									</a>
								</div>
								
								<!-- 페이지 번호 (시작 페이지 번호부터 끝 페이지 번호까지) -->
								<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
								    <div id="page${idx}">
									    <a class="btn btn-outline-secondary" href="getBoardList.do${pageMaker.makeQuery(idx)}&searchCondition=<%=searchCondition %>&startDate=<%=startDate %>&endDate=<%=endDate %>&searchId=<%=searchId %>">
									    	<!-- 시각 장애인을 위한 추가 -->
									      	<span>${idx}<span class="sr-only">(current)</span></span>
									    </a>
								    </div>
								</c:forEach>
								
								<!-- next 버튼 -->
								<div id="page-next">
								    <a class="btn btn-outline-secondary" href="getBoardList.do${pageMaker.makeQuery(pageMaker.endPage)}&searchCondition=<%=searchCondition %>&startDate=<%=startDate %>&endDate=<%=endDate %>&searchId=<%=searchId %>" aria-label="Next">
								    	<span aria-hidden="true">»</span>
								    </a>
								</div>	
						</div>
					</div>
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
	<script src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/admin.js"></script>
	<script src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/datepicker.js"></script>
	<script src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/check-board-delete.js"></script>
	<script src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/board-paging.js"></script>
<!-- SCRIPT ---------------------------------------------------------- -->
</body>
</html>

