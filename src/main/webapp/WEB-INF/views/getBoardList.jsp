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

	문의가 없으면 문의 하시겠어요? 버튼 만들어서 selectProcess로 ㄱㄱ
  <!-- Page Content -->
 	<div class = "container-fluid" >
		<c:forEach items="${boardList}" var="board">
			<div class = "card mt-4">
			    <div class ="card-body">
					<span class='text-primary'> ${board.datetime} </span>
					<h1 class = "card-title"> ${board.problem_place_code}  // 기계가 고장났어요로 교체 -> place테이블의 place_detail </h1>
					<div class = "card-subtitle text-muted mb-2">
					  ${board.problem_code}	// 엘리베이터가 고장났어요로 교체 -> problem테이블의 problem_detail 
					</div>
					<div class ="card-text mb-2">   ${board.floor }   </div>
					<div class ="card-text mb-2">  <span class= "text-muted">${board.department_code }	// 백화점이름 으로 교체 -> department테이블의 dep_name </span></div>
					<a href="getBoard.do?seq=${board.seq}" class="btn btn-primary">자세히보기</a>
				</div>
		</c:forEach>
   			</div>
	</div>
  
  
  
  

  <!-- Bootstrap core JavaScript -->
  <script src="<%=request.getContextPath()%>/resources/vendor/jquery/jquery.slim.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
