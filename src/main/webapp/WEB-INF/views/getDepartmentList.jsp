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
    <link href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/button-dark.css" rel="stylesheet">
	<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
</head>

<body id="page-top" style="font-family:Spoqa Han Sans Neo, sans-serif">


<!-- include nav -->
<%@include file ="common/nav.jsp" %>

	<header class="text-white" style="background-size: 100%; background-repeat:no-repeat; background-image: url(<%=request.getContextPath()%>/resources/icon/lotte-department.png)">
		<div class="container text-center">
			<h1>본사 관리자님 안녕하세요</h1>
			<hr style="border: solid 1px #fff; width:46%"  >
			<p class="lead">백화점을 <font size="5px" style="font-weight:600">관리</font>하는 페이지입니다</p>
		</div>
	</header>

	<section id="about">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 mx-auto" style="text-align-last: center">
					<h2>백화점/관리자 리스트</h2>
					
					<table class="table table-striped table-hover">
						<thead>
							<tr>
								<th>백화점 명</th>
								<th>관리자 아이디</th>
							</tr>
						</thead>
						<tbody>

						<c:forEach items="${departmentList}" var="list">
							<tr>
								<td><a href="getDepartment?department_code=${list.department_code }&id=${list.id }&department_name=${list.department_name }">${list.department_name}</a></td>
								<td>${list.id}
							</tr>
						</c:forEach>
						</tbody>
					</table>
					<!-- 수정/삭제는 백화점 이름 클릭해서 들어간 후에 한다. -->
					<button class="btn btn-dark" onclick="location.href='insertDepartment'">백화점 추가하기</button>
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

<!-- SCRIPT ---------------------------------------------------------- -->
</body>
</html>

