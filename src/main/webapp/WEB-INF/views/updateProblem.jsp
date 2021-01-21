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
    
    <title>전체 문의 관리</title>
    
	
	<!-- Bootstrap core CSS -->
	<link href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

	<!-- Custom styles for this template -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/scrolling-nav.css">
	<link href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/button-dark.css" rel="stylesheet">
	<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
</head>

<%
	String depth = request.getParameter("depth");
	String category_code = request.getParameter("category_code");
	String problem_code = request.getParameter("problem_code");
%>
<c:set var="depth" value="<%=depth %>" />

<%
	if(depth == null){
%>
	<c:set var="depth" value="${problemList[0].depth }" />
<%
	}
%>
<body id="page-top" style="font-family:Spoqa Han Sans Neo, sans-serif">
<!-- include nav -->
<%@include file ="common/nav.jsp" %>

<header class="text-white" style="background-size: 100%; background-repeat:no-repeat; background-image: url(<%=request.getContextPath()%>/resources/icon/lotte-department.png)">
	<div class="container text-center">
		<h1>본사 관리자님 안녕하세요</h1>
		<hr style="border: solid 1px #fff; width:46%"  >
		<p class="lead">백화점이 사용할 문의를 <font size="5px" style="font-weight:600">관리</font>하는 페이지입니다</p>
	</div>
</header>

<!--  여기서부터 foreach를 써서 section마다 각 점별 막대그래프 출력 -->
  <section id="about"> 
    <div class="container">
      <div class="row">
        <div class="col-lg-8 mx-auto">
		<!-- 이전 버튼 -->
        <c:if test="${depth ne 1 }">
	    	<button onclick="history.back()" class="btn btn-secondary" style="float:right; width: 10%" >이전</button>
	    </c:if>
	    
	    <!-- 전체 선택 체크박스 -->
        <div class="form-check ml-4 mb-3" style="width:max-content">
        	<input class="form-check-input" id="allCheck" type="checkbox" name="allCheck" style="zoom:1.5"/>
        	<label class="form-check-label mt-2" for="allCheck" style="font-weight:bold">
        		전체선택
        	</label>
        </div>
<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->    
        <form  method="GET">
        	<input id="department_code" name="department_code" type="hidden" value="<%=department_department_code %>" />
        	<c:choose>
        		<c:when test="${depth eq 1 }">
        			<input name="category_detail" type="text" id="detail" class="form-control" placeholder="여기에 입력하세요" onkeyup='getDetail()'>
        		</c:when>
        		<c:when test="${depth eq 2 }">
        			<input name="problem_detail" type="text" id="detail" class="form-control" placeholder="여기에 입력하세요" onkeyup='getDetail()'>
        		</c:when>
        		<c:when test="${depth eq 3 }">
        			<input name="place_detail" type="text" id="detail" class="form-control" placeholder="여기에 입력하세요" onkeyup='getDetail()'>
        		</c:when>
        	</c:choose>
        	<!--  추가 / 수정 / 삭제 버튼 -->
	        	<button class="btn btn-dark mt-2"  type="submit" formaction="insertProblem.do?#about" >추가하기</button>
				<input type="button" value="수정하기" class="btn btn-dark mt-2" style=" margin-left:2%" onclick="fixValue();">
	        	<input type="button" value="삭제하기" class="btn btn-dark mt-2" style=" margin-left:2%" onclick="deleteValue();">
			<hr><br/><br/><br/>
			

			
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
	        					체크박스를 선택하고 수정/삭제하거나 문의를 클릭하여 <br/>
	        					2단계 문의를 볼 수 있습니다.
							</h2>
							<font class="text-danger">* <span >1단계</span> 문의목록입니다.</font>
						</div>
					</c:if>
	        		<c:forEach items="${problemList }" var="problem">
	        			<div class="col border">
		        			<!-- 문의 삭제 체크박스 -->
		        			<h2 class="mt-1">
		        				<input name="RowCheck" type="checkbox" value="${problem.category_code }" style="zoom:1.5"/>
		        				<a href="updateProblem.do?category_code=${problem.category_code }&depth=2&#about" class="btn btn-secondary">
		        					${problem.category_detail}
		        				</a>
		        			</h2>
		        		</div>
	        			<!--  -->
	        			<!-- 여기서 category_code의 값을 넘겨줘야 뎁스2가 정해진다 -->
	        			<!--  -->
	        		</c:forEach>
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
		        					체크박스를 선택하고 수정/삭제하거나 문의를 클릭하여 <br/>
		        					3단계 문의를 볼 수 있습니다.
								</h2>
								<font class="text-danger">*	${problemList[0].category_detail }의 2단계 문의입니다.</font>
							</div>
	         			</c:if>
	        		<c:forEach items="${problemList }" var="problem">
	        			<div class="col">
		        			<!-- 문의 삭제 체크박스 -->
		        			<h2>
		        				<input name="RowCheck" type="checkbox" value="${problem.problem_code }" style="zoom:1.5"/>
			        			<a href="updateProblem.do?category_code=${problem.category_code }&problem_code=${problem.problem_code }&depth=3&#about" class="btn btn-secondary">
			        				${problem.problem_detail}
			        			</a>
		        			</h2>
	        			</div>
	        			<!--  -->
	        			<!-- 여기서 category_code와 problem_code의 값을 넘겨줘야 뎁스3가 정해진다 -->
	        			<!--  -->
	        		</c:forEach>
	        		<!-- 문의 추가 요소 -->	
	        		<input name="depth" type="hidden" value="${depth }"/>
	        		<input id="category_code" name="category_code" type="hidden" value="<%=category_code %>" />
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
		        					체크박스를 선택하고 수정/삭제할 수 있습니다.
								</h2>
		        				<font class="text-danger">* ${problemList[0].category_detail } > ${problemList[0].problem_detail }의 3단계 문의입니다.</font>
							</div>
	         			</c:if>
	        		<c:forEach items="${problemList }" var="problem">
	        			<div class="col">
		        			<h2>
		        			<!-- 문의 삭제 체크박스 -->
		        				<input name="RowCheck" type="checkbox" value="${problem.place_code }" style="zoom:1.5"/>
			        			<a class="btn btn-secondary disabled">
			        				${problem.place_detail}
			        			</a>
		        			</h2>
	        			</div>
	        		</c:forEach>
	        		<!-- 문의 추가 요소 -->	
	        		<input name="depth" type="hidden" value="${depth }" />
	        		<input id="category_code" name="category_code" type="hidden" value="<%=category_code %>" />
	        		<input id="problem_code" name="problem_code" type="hidden" value="<%=problem_code %>" />
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
<script src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/check-problem-ud.js?ver=21-01-21"></script>
<!-- SCRIPT ---------------------------------------------------------- -->
</body>
</html>

