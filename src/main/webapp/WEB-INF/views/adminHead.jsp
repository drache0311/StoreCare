<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<%
	String searchCondition="all";
	String startDate = "";
	String endDate = "";
	String searchId = "all";
	
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
<header class="bg-primary text-white">
	<div class="container text-center">
		<h1>관리자님 안녕하세요</h1>
		<p class="lead">전체 백화점의 문의 접수내역 조회 페이지입니다</p>
	</div>
</header>


<!--  여기서부터 foreach를 써서 section마다 각 점별 막대그래프 출력 -->
	<section id="about">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 mx-auto">
					<h2>전체 내역</h2>
					
					<!--  검색 FORM -->
					<div style="text-align-last: center">
						<form name="searchDepBoard"  autocomplete="off" method="post" action="getBoardList.do">
							<!-- 백화점별 검색 SELECT -->
							<div style="padding:10px">
								<font>백화점명 </font>
								<select name="searchDepartment" style="width:90px">
									<option class="btn btn-primary" value="0">전체</option>
									<c:forEach items="${departmentList}" var="department">
											<option  value="${department.department_code}">${department.department_name}</option>
									</c:forEach>
								</select>
							</div>
							<!-- 처리현황별 검색 SELECT -->
							<div style="padding:10px">
								<font>처리현황</font>
								<select name="searchCondition" style="width:100px">
									<option value="all">전체</option>
									<option value="doing">처리중</option>
									<option value="done">처리완료</option>
								</select>
							</div>
							<div style="padding:10px">
								<font>From </font><input type="text" id="startDate" name="startDate" placeholder="전체" style="width: 115px">
								<font>To </font><input type="text" id="endDate" name="endDate"  placeholder="전체" style="width: 115px">
								문의자 <input type="text" id="searchId" name="searchId"  placeholder="01012345678" style="width: 115px">
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
								<td>${board.category_detail}
								${board.problem_detail}
								${board.place_detail }</td>
								<td><c:if test="${board.flag eq 0}" >처리 중</c:if> <c:if test="${board.flag eq 1}" >처리완료</c:if></td>
								<td>${board.clearTime}</td>
								<td>${board.users_id }</td>
							</tr>
						</c:forEach>
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
<!-- SCRIPT ---------------------------------------------------------- -->
</body>
</html>

