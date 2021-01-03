<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<%
	String searchCondition="all";
	String startDate = "";
	String endDate = "";
	if(session.getAttribute("searchCondition") != null){
		searchCondition = session.getAttribute("searchCondition").toString();
		startDate = session.getAttribute("startDate").toString();
		endDate = session.getAttribute("endDate").toString();	
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


</head>

<body id="page-top">


<!-- include nav -->
<%@include file ="common/nav.jsp" %>


	<header class="bg-primary text-white">
		<div class="container text-center">
			<h1>관리자 페이지</h1>
			<p class="lead">전체 접수내역 조회 페이지</p>
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
								<td>${board.place_detail}
								${board.problem_detail}</td>
								<td><c:if test="${board.flag eq 0}" >처리 중</c:if> <c:if test="${board.flag eq 1}" >처리완료</c:if></td>
								<td>${board.clearTime}</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					<input type="button" value="문의처리하기" class="btn btn-primary" onclick="deleteValue();">
					<!-- 페이지 번호 -->	
					<div class="text-center">
						<nav aria-label="pagination">
							<ul class="pagination">
							
								<!-- prev 버튼 -->
								<li id="page-prev">
									<a href="getBoardList.do${pageMaker.makeQuery(pageMaker.startPage-1)}&searchCondition=<%=searchCondition %>&startDate=<%=startDate %>&endDate=<%=endDate %>" aria-label="Prev">
										<span aria-hidden="true">«</span>
									</a>
								</li>
								
								<!-- 페이지 번호 (시작 페이지 번호부터 끝 페이지 번호까지) -->
								<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
								    <li id="page${idx}">
									    <a href="getBoardList.do${pageMaker.makeQuery(idx)}&searchCondition=<%=searchCondition %>&startDate=<%=startDate %>&endDate=<%=endDate %>">
									    	<!-- 시각 장애인을 위한 추가 -->
									      	<span>${idx}<span class="sr-only">(current)</span></span>
									    </a>
								    </li>
								</c:forEach>
								
								<!-- next 버튼 -->
								<li id="page-next">
								    <a href="getBoardList.do${pageMaker.makeQuery(pageMaker.endPage + 1)}&searchCondition=<%=searchCondition %>&startDate=<%=startDate %>&endDate=<%=endDate %>" aria-label="Next">
								    	<span aria-hidden="true">»</span>
								    </a>
								</li>
								
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</section>

  <section id="services" class="bg-light">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 mx-auto">
          <h2>Services we offer</h2>
          <p class="lead">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut optio velit inventore, expedita quo laboriosam possimus ea consequatur vitae, doloribus consequuntur ex. Nemo assumenda laborum vel, labore ut velit dignissimos.</p>
        </div>
      </div>
    </div>
  </section>

  <section id="contact">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 mx-auto">
          <h2>Contact us</h2>
          <p class="lead">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vero odio fugiat voluptatem dolor, provident officiis, id iusto! Obcaecati incidunt, qui nihil beatae magnam et repudiandae ipsa exercitationem, in, quo totam.</p>
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

