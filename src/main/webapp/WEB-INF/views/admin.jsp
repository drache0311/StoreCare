<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
								<th>접수일자</th>
								<th>접수내용</th>
								<th>처리현황</th>
								<th>처리시간</th>
							</tr>
						</thead>
						<tbody>

						<c:forEach items="${boardList}" var="board">
							<tr>
								<td>${board.datetime}</td>
								<td>${board.place_detail}
								${board.problem_detail}</td>
								<td><c:if test="${board.flag eq 0}" >처리 중</c:if> <c:if test="${board.flag eq 1}" >처리완료</c:if></td>
								<td>${board.clearTime}</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					<div class="text-center">
						<ul class="pagination">
							<!-- li태그의 클래스에 disabled를 넣으면 마우스를 위에 올렸을 때 클릭 금지 마크가 나오고 클릭도 되지 않는다.-->
							<!-- disabled의 의미는 앞의 페이지가 존재하지 않다는 뜻이다. -->
							<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
							<li class="page-item active"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">4</a></li>
							<li class="page-item"><a class="page-link" href="#">5</a></li>
							<li class="page-item"><a class="page-link" href="#">Next</a></li>
						</ul>
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
<!-- SCRIPT ---------------------------------------------------------- -->
</body>
</html>

