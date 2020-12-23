<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  
  <!-- Bootstrap core CSS -->
  <link href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<title>등록 확인</title>





<%

String place_code = request.getParameter("place_code");
String problem_code = request.getParameter("problem_code");

String place_detail = request.getParameter("place_detail");
String problem_detail = request.getParameter("problem_detail");
String seq = (String) request.getParameter("seq");
String id = (String) session.getAttribute("login");
String department_code = request.getParameter("department_code");

%>


</head>
<body>

  <!-- Navigation            ----------------------------------------------------------- -->
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
  <!-- Navigation  DONE   ----------------------------------------------------------------------------  -->
 
  
    <!-- Page Content -->
<c:set var="seq" value="<%=seq%>" />    
<c:set var="id" value="<%=id%>" />    

<!--  지금은 null이 String이라서 'null'로 비교하는데  -->
<!-- 앞에서 POST로 던져주고 진짜 null로 비교하는식으로 변경  -->
<!-- GET은 버리고 POST로 다 변경하장  -->


<c:choose>
	<c:when test="${seq eq '0'}" >
		<form action="insertBoard.do" method="get">
	</c:when>
	<c:otherwise>
		<form action="updateBoard.do" method="get">
	</c:otherwise>
</c:choose>
 	<div class = "container-fluid" >
			<div class = "card mt-4">
			    <div class ="card-body">
			    <c:if test="${seq ne 'null'}">
			  	  <input name="seq" type="hidden" value="<%=seq%>" />
			    </c:if>
			    <input name="users_id" type="hidden" value="<%=id%>" />
			    	<h5 class="card-header">현재 방문 백화점</h5>
			    	<input name="department_code" type="hidden" value="<%=department_code %>" />
					<h1 class = "card-title"> ${board.department_name}  </h1>
				</div>
				<div class ="card-body">
			    	<h5 class="card-header">요청내용</h5>
			    	<input name="problem_place_code" type="hidden" value="<%=place_code %>" />
					<span class='text-primary'> <%=place_detail %> </span>
					<input name="problem_code" type="hidden" value="<%=problem_code %>" />			
					<h1 class = "card-title"> <%=problem_detail %> </h1>
				</div>
				<div class ="card-body">
			    	<h5 class="card-header">백화점 층 수</h5>
			    	
			    		<select name="floor">
								<c:forEach var="floor" begin="1" end="${board.floor}">
										<option value="${floor}">${floor}F</option>
								</c:forEach>
						</select>
				</div>
   			</div>
   			<c:choose>
	   			<c:when test="${seq eq '0'}">
					<button class="btn btn-primary" type="submit" >등록하기</button>
				</c:when>
				<c:otherwise>
					<button class="btn btn-primary" type="submit" >수정하기</button>
				</c:otherwise>
			</c:choose>
	</div>
</form>
  
  
  
  
  
  
  
  
  
  
  
  	
	  <!-- Bootstrap core JavaScript -->
  <script src="<%=request.getContextPath()%>/resources/vendor/jquery/jquery.slim.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>