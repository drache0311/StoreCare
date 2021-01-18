<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<%
	String searchCondition="all";
	String startDate = "";
	String endDate = "";
	String searchId = "all";
	String department_code = "";
	
	if(session.getAttribute("searchCondition") != null){
		searchCondition = session.getAttribute("searchCondition").toString();
		startDate = session.getAttribute("startDate").toString();
		endDate = session.getAttribute("endDate").toString();	
		searchId = session.getAttribute("searchId").toString();
		department_code = session.getAttribute("department_code").toString();
	}
	
%>
<head>
	<c:set var="searchCondition" value="<%=searchCondition %>"/>
	<c:set var="startDate" value="<%=startDate %>"/>
	<c:set var="endDate" value="<%=endDate %>"/>
	<c:set var="searchId" value="<%=searchId %>"/>
	<fmt:parseNumber var = "department_code" type = "number" value = "<%=department_code %>" />


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
<body id="page-top">

<!-- include nav -->
<%@include file ="common/nav.jsp" %>

<!-- 페이지 설명 헤더 -->
<header class="text-white" style="background-size: 100%; background-repeat:no-repeat; background-image: url(<%=request.getContextPath()%>/resources/icon/lotte-department.png)">
	<div class="container text-center">
		<h1>관리자님 안녕하세요</h1>
		<hr style="border: solid 1px #fff; width:46%"  >
		<p class="lead">전체 백화점의 문의 접수내역 <font size="5px" style="font-weight:600">조회</font> 페이지입니다</p>
	</div>
</header>

<!--  여기서부터 foreach를 써서 section마다 각 점별 막대그래프 출력 -->
	<section id="about">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 mx-auto">
					<h2 style="font-weight:bold">전체 내역</h2>
					
					<!--  검색 FORM -->
					<div style="text-align-last: center">
						<form name="searchDepBoard"  autocomplete="off" method="post" action="getBoardList.do">
							<!-- 백화점별 검색 SELECT -->
							<div style="padding:10px; float:left; margin-left:25%">
								<font style="font-size:large">백화점명 </font>
								<select name="searchDepartment" style="width:90px">
									<option value="0">전체</option>
									<c:forEach items="${departmentList}" var="department">
											<option  value="${department.department_code}" <c:out value = "${department_code eq department.department_code ? 'selected' : '' }" />>${department.department_name}</option>
									</c:forEach>
								</select>
							</div>
							<!-- 처리현황별 검색 SELECT -->
							<div  style="padding:10px; margin-right:20%">
								<font style="font-size:large">처리현황</font>
								<select name="searchCondition" style="width:100px">
									<option value="all" <c:out value = "${searchCondition eq 'all' ? 'selected' : '' }" />>전체</option>
									<option value="doing" <c:out value = "${searchCondition eq 'doing' ? 'selected' : '' }" />>처리중</option>
									<option value="done" <c:out value = "${searchCondition eq 'done' ? 'selected' : '' }" />>처리완료</option>
								</select>
							</div>
							<hr style="margin-left:10%">
							<div  style="padding:10px">
								<font style="font-size:large">From </font><input type="text" id="startDate" name="startDate" placeholder="전체" value='<c:out value="${startDate}" />' style="width: 115px">
								<font class="ml-2" style="font-size:large">To </font><input type="text" id="endDate" name="endDate"  placeholder="전체" value='<c:out value="${endDate}" />' style="width: 115px">
								<font class="ml-2" style="font-size:large">문의자</font> <input type="text" id="searchId" name="searchId"  placeholder="01012345678" value='<c:out value="${searchId eq 'all' ? '' : searchId}" />' style="width: 115px" onKeyUp="isNumber(this)">
								<button type="submit" id="btnSearch" class="btn btn-info" style="float:right">검색</button>
							</div>
						</form>
					</div>	
					<table class="table table-striped table-hover" style="text-align:center; inline-size:max-content">
						<thead>
							<tr>
								<th>백화점 명</th>
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
								<td>${board.department_name }</td>
								<td>${board.datetime}</td>
								<td>
									${board.category_detail}
									${board.problem_detail}
									${board.place_detail }
									${board.floor }
								</td>
								<td><c:if test="${board.flag eq 0}" >처리 중</c:if> <c:if test="${board.flag eq 1}" >처리완료</c:if></td>
								<td>${board.clearTime}</td>
								<td>${board.users_id }</td>
							</tr>
						</c:forEach>
						<c:if test="${boardList eq '[]' }">
							<tr>
								<td></td>
								<td></td>
								<td style="width:400px">문의가 없어요!</td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</c:if>
						</tbody>
					</table>
					<!-- (페이지번호) -->
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
									      	<span>${idx}</span>
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

<!-- Bootstrap core JavaScript -->
	<script src="<%=request.getContextPath()%>/resources/vendor/jquery/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Plugin JavaScript -->
	<script src="<%=request.getContextPath()%>/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
<!-- JQuery JavaScript -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/jquery-ui.css" type="text/css" />  
	<script src="<%=request.getContextPath()%>/resources/vendor/jquery/jquery.min.js"></script>  
	<script src="<%=request.getContextPath()%>/resources/vendor/jquery/jquery-ui.min.js"></script>
<!-- Google Chart Loader -->
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<!-- Custom JavaScript for this theme -->
	<script src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/scrolling-nav.js"></script>
	<script src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/datepicker.js"></script>
	<script src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/board-paging.js"></script>
 	<script src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/id-check.js"></script>
<!-- SCRIPT ---------------------------------------------------------- -->
</body>
</html>

