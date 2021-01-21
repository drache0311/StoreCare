<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<%
	String depth = request.getParameter("depth");
	String category_code = request.getParameter("category_code");
	String problem_code = request.getParameter("problem_code");
	String department_name = session.getAttribute("department_name").toString();
%>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.79.0">
    
    <title><%=department_name %> 문의 관리</title>
    
	
	<!-- Bootstrap core CSS -->
	<link href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

	<!-- Custom styles for this template -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/scrolling-nav.css">
	<link href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/button-dark.css" rel="stylesheet">
</head>

<c:set var="depth" value="<%=depth %>" />

<%
	if(depth == null){
%>
	<c:set var="depth" value="${problemList[0].depth }" />
<%
	}
%>
<body id="page-top">
<!-- include nav -->
<%@include file ="common/nav.jsp" %>

<header class="text-white" style="background-size: 100%; background-repeat:no-repeat; background-image: url(<%=request.getContextPath()%>/resources/icon/lotte-department.png)">
	<div class="container text-center">
		<h1><font size="60px" style="font-weight:700"><%=department_name %></font> 관리자님 안녕하세요</h1>
		<hr style="border: solid 1px #fff; width:46%"  >
		<p class="lead"><%=department_name %>의 문의사항을 <font size="5px" style="font-weight:600">삭제</font>하는 페이지입니다</p>
	</div>
</header>

  <section id="about"> 
    <div class="container">
      <div class="row">
        <div class="col-lg-8 mx-auto">
        <!-- 삭제 버튼 -->
        <input type="button" value="내 점에서 삭제하기" class="btn btn-dark " style="float:left" onclick="deleteValue();">
        <br/>
        <br/>
        <!-- 이전 버튼 -->
        <c:if test="${depth ne 1 }">
			<button onclick="history.back()" class="btn btn-secondary" style="float:right; width: 10%" >이전</button>
		</c:if>
		<!-- 전체선택 체크박스 -->
        <div class="form-check ml-4 mb-3" style="width:max-content">
        	<input class="form-check-input" id="allCheck" type="checkbox" name="allCheck" style="zoom:1.5""/>
        	<label class="form-check-label mt-2" for="allCheck"  style="font-weight:bold">
        		전체선택
        	</label>
        </div>
        <!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
        <form  method="GET">
            <!-- 다시 이 페이지로 새로고침하기 위해 dep_code가 필요하다 -->
        	<input id="department_code" type="hidden" value="<%=department_department_code %>" />
        	<div class="row row-cols-2">
	        	<c:choose>
	        		<c:when test="${depth eq 1}">
	         			<c:if test="${problemList eq '[]' }">
							<div class="col-12">
		        				<h2 class="btn disabled bg-info text-white" style="width: 100%; height:70px; line-height:60px; font-size:1.2rem ; text-align: start">
		        					1단계 문의가 없어요. 문의를 추가해주세요.
								</h2>
							</div>
	         			</c:if>
	         			<c:if test="${problemList ne '[]' }">
							<div class="col-12">
		        				<h2 class="btn disabled bg-info text-white" style="width: 100%; font-size:1.2rem ; text-align: start">
		        					체크박스를 선택하고 내 점에서 삭제하거나 문의를 클릭하여 <br/>
		        					2단계 문의를 볼 수 있습니다.
								</h2>
								<font class="text-danger">* 1단계 문의목록입니다.</font>
							</div>
						</c:if>
		        		<c:forEach items="${problemList }" var="problem">
		        			<div class="col">
			        			<!-- 문의 삭제 체크박스 -->
			        			<h2>
			        				<input name="RowCheck" type="checkbox" value="${problem.category_category_code }" style="zoom:1.5"/>
			        				<a href="departmentProblem.do?category_category_code=${problem.category_category_code }&department_department_code=<%=department_department_code %>&depth=2&#about" class="btn btn-secondary">
			        					${problem.category_detail}
			        				</a>
			        			</h2>
			        			<!--  -->
			        			<!-- 여기서 category_code의 값을 넘겨줘야 뎁스2가 정해진다 -->
			        			<!--  -->
		        			</div>
		        		</c:forEach>
		        		<!-- 문의 추가 버튼 -->	
		        		<!-- depth를 추가로 보내서 해당 depth에 input값을 추가하는 식으로 ??? -->
		        		<input name="depth" type="hidden" value="${depth }" />
	        		</c:when>
	         		<c:when test="${depth eq 2}">
	         			<c:if test="${problemList eq '[]' }">
							<div class="col-12">
		        				<h2 class="btn disabled bg-info text-white" style="width: 100%; height:70px; line-height:60px; font-size:1.2rem ; text-align: start">
		        					2단계 문의가 없어요. 문의를 추가해주세요.
								</h2>
							</div>
	         			</c:if>
	         			<c:if test="${problemList ne '[]' }">
							<div class="col-12">
		        				<h2 class="btn disabled bg-info text-white" style="width: 100%;  font-size:1.2rem ; text-align: start">
		        					체크박스를 선택하고 내 점에서 삭제하거나 문의를 클릭하여 <br/>
		        					3단계 문의를 볼 수 있습니다.
								</h2>
								<font class="text-danger">*	${problemList[0].category_detail }의 2단계 문의입니다.</font>
							</div>
	         			</c:if>
		        		<c:forEach items="${problemList }" var="problem">
		        			<div class="col">
			        			<!-- 문의 삭제 체크박스 -->
			        			<h2>
			        				<input name="RowCheck" type="checkbox" value="${problem.problem_problem_code }" style="zoom:1.5"/>
				        			<a href="departmentProblem.do?category_category_code=${problem.category_category_code }&problem_problem_code=${problem.problem_problem_code }&department_department_code=<%=department_department_code %>&depth=3&#about" class="btn btn-secondary">
				        				${problem.problem_detail}
				        			</a>
			        			</h2>
			        			<!--  -->
			        			<!-- 여기서 category_code와 problem_code의 값을 넘겨줘야 뎁스3가 정해진다 -->
			        			<!--  -->
			        		</div>
		        		</c:forEach>
		        		<!-- 문의 추가 버튼 -->	
		        		<input name="depth" type="hidden" value="${depth }" />
		        		<input name="category_code" type="hidden" value="<%=category_code %>" />
	        		</c:when> 
	         		<c:when test="${depth eq 3}">
	         			<c:if test="${problemList eq '[]' }">
							<div class="col-12">
		        				<h2 class="btn disabled bg-info text-white" style="width: 100%; height:70px; line-height:60px; font-size:1.2rem ; text-align: start">
		        					3단계 문의가 없어요. 필요하다면 추가해주세요.
								</h2>
							</div>
	         			</c:if>
	         			<c:if test="${problemList ne '[]' }">
							<div class="col-12">
		        				<h2 class="btn disabled bg-info text-white" style="width: 100%;  font-size:1.2rem ; text-align: start">
		        					체크박스를 선택하고 내 점에서 삭제할 수 있습니다.
								</h2>
		        				<font class="text-danger">* ${problemList[0].category_detail } > ${problemList[0].problem_detail }의 3단계 문의입니다.</font>
							</div>
	         			</c:if>
		        		<c:forEach items="${problemList }" var="problem">
			        		<div class="col">
			        			<h2>
			        			<!-- 문의 삭제 체크박스 -->
			        				<input name="RowCheck" type="checkbox" value="${problem.place_place_code }" style="zoom:1.5"/>
				        			<a href="#" class="btn btn-secondary disabled">
				        				${problem.place_detail}
				        			</a>
			        			</h2>
		        			</div>
		        		</c:forEach>
		        		<!-- 문의 추가 버튼 -->	
		        		<input name="depth" type="hidden" value="${depth }" />
		        		<input name="category_code" type="hidden" value="<%=category_code %>" />
		        		<input name="problem_code" type="hidden" value="<%=problem_code %>" />
	        		</c:when>
	        	</c:choose>
        	</div>
        	</form>
         <!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
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
<script src="<%=request.getContextPath()%>/resources/vendor/jquery/jquery-3.5.1.min.js"></script>

<!-- Custom JavaScript for this theme -->
<script src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/check-problem-delete-depAdmin.js?ver=21-01-21"></script>
<!-- SCRIPT ---------------------------------------------------------- -->
</body>
</html>

