<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.text.SimpleDateFormat" %>

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
 
	<!-- Custom styles for this template -->
	<link href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/button-dark.css" rel="stylesheet">
	<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
<title>등록 확인</title>





<%

String category_code = request.getParameter("problem_category_code");
String problem_code = request.getParameter("problem_problem_code");
String category_detail = request.getParameter("category_detail");
String problem_detail = request.getParameter("problem_detail");
String seq = (String) request.getParameter("seq");
String id = (String) session.getAttribute("login");
String department_code = request.getParameter("department_department_code");
String flag = request.getParameter("flag");
String place_place_code = request.getParameter("place_place_code");
String place_detail = request.getParameter("place_place_detail");



if(place_place_code == null){
	System.out.println("pl_code를 null로 변경함");
	place_place_code = "0";
}

System.out.println("pro_detail"+problem_detail);
Timestamp now = new Timestamp(System.currentTimeMillis());

%>

</head>
<body style="font-family:Spoqa Han Sans Neo, sans-serif">

 <!-- include nav -->
<%@include file ="common/nav.jsp" %>
<p class="p-3 text-white bg-secondary">
    <img src="<%=request.getContextPath()%>/resources/icon/shop.png" class="img-thumbnail" alt="" width="30" height="30">
    현재 방문 백화점 - ${board.department_name}
</p>
  <!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
<ul class="list-inline" style="text-align:center">
	<li class="list-inline-item">
		<img src="<%=request.getContextPath()%>/resources/icon/message-circular.png" alt="" width="100" height="100">
	</li>
	<li class="list-inline-item">
		<img src="<%=request.getContextPath()%>/resources/icon/right-arrow.png" alt="" width="50" height="50">
	</li>
	<li class="list-inline-item">
		<img src="<%=request.getContextPath()%>/resources/icon/contract-red.png" alt="" width="100" height="100">
	</li>
</ul>
<font style="margin-left:21%">요청사항</font>
<font class="text-danger" style="margin-left:23%; font-weight:bold">문의등록</font>
  <!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
  
    <!-- Page Content -->
<c:set var="seq" value="<%=seq%>" />    
<c:set var="id" value="<%=id%>" />    
<c:set var="flag" value="<%=flag%>" />
<c:set var="place_detail" value="<%=place_detail %>"/>
<!--  지금은 null이 String이라서 'null'로 비교하는데  -->
<!-- 앞에서 POST로 던져주고 진짜 null로 비교하는식으로 변경  -->
<!-- GET은 버리고 POST로 다 변경하장  -->



<form method="get">
 	<div class = "container-fluid" >
		<div class = "card mt-4">
		    <h5 class="card-header">요청하신 내용</h5>
		    <div class ="card-body">
			    <c:if test="${seq ne 'null'}">
			  	  <input name="seq" type="hidden" value="<%=seq%>" />
			    </c:if>
			    <input name="datetime" type="hidden" value="<%=now%>" />
			    <input name="place_place_code" type="hidden" value="<%=place_place_code%>" />
			    <input name="users_id" type="hidden" value="<%=id%>" />
		    	<input name="problem_category_code" type="hidden" value="<%=category_code %>" />
				<input name="problem_problem_code" type="hidden" value="<%=problem_code %>" />	
		    	<input name="department_department_name" type="hidden" value="${board.department_name}" />				
				<input id="${board.department_name}" type="hidden" name="changeDepartment" />	
				<!-- 입력된 문의 1,2,3뎁스 표시 -->
				<div class="card card-header">
	    				<%=category_detail %> 
	    				&#xE001; <%=problem_detail %> 
	    				<c:if test="${place_detail ne null }">
	    					&#xE001; <%=place_detail %>
	    				</c:if>
	    		</div>	
			</div>
		    <h5 class="card-header">층 수</h5>
			<div class ="card-body">
		    		<select class="ml-4 mt-1 btn btn-info dropdown-toggle" style="width:80%" name="floor" id="floor">
						<option>선택해주세요.</option>
					</select>
			</div>
		    <h5 class="card-header">확인사항</h5>
			<div class ="card-body">
					<div class="card card-header">
						요청하신 문의가 내용과 맞으시다면
						<br/>
						층 수를 선택 후 등록을 눌러주세요.
					</div>
			</div>
  		</div>
	</div>
   			<c:choose>
	   			<c:when test="${seq eq 0}">
					<button formaction="insertBoard.do" class="btn btn-dark mt-4" type="submit" style="float:right; width:50%">등록</button>
				</c:when>
				<c:when test="${flag eq 0}">
					<button formaction="updateUserBoard.do" class="btn btn-dark mt-4" type="submit" style="float:right; width:50%">수정</button>
				</c:when>
			</c:choose>
</form>
<button onclick="history.back()" class="btn btn-secondary mt-4" style="float:left; width:50%" >이전</button>
  
  
  
  
  
  
  
  
  
  
  	
<!-- Bootstrap core JavaScript -->
  <script src="<%=request.getContextPath()%>/resources/vendor/jquery/jquery.slim.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  
<!-- Custom JavaScript for this theme -->
  <script src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/checkBoard.js?ver=3"></script>
  
  
</body>
</html>