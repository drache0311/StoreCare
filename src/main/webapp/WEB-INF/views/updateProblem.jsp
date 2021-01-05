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
    
    <title>총괄 관리자</title>
    
	
	<!-- Bootstrap core CSS -->
	<link href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

	<!-- Custom styles for this template -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/scrolling-nav.css">
</head>

<%
	String depth = request.getParameter("depth");
%>
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




<!--  여기서부터 foreach를 써서 section마다 각 점별 막대그래프 출력 -->
  <section id="about"> 
    <div class="container">
      <div class="row">
        <div class="col-lg-8 mx-auto">
        <!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
        <!-- method ===> GET이나 POST로 정해서 하자 -->
        <form  method="GET">
        	<c:choose>
        		<c:when test="${depth eq 1}">
	        		<c:forEach items="${problemList }" var="problem">
	        			<a href="updateProblem.do?category_code=${problem.category_code }" class="btn btn-primary">${problem.category_detail}</a>
	        			<!--  -->
	        			<!-- 여기서 category_code의 값을 넘겨줘야 뎁스2가 정해진다 -->
	        			<!--  -->
	        		</c:forEach>
	        		<!-- 문의 추가 버튼 -->	
	        		<!-- depth를 추가로 보내서 해당 depth에 input값을 추가하는 식으로 ??? -->
	        		<input name="depth" type="hidden" value="${depth }" />
	        		<input name="category_detail" type="text" id="inputProblem" class="form-control" placeholder="여기에 입력하여 추가하세요" >
	        		<button class="btn btn-primary" type="submit" formaction="insertProblem.do" >추가하기</button>
        		</c:when>
         		<c:when test="${depth eq 2}">
	         		${problemList[0].category_detail } >>>>>>${problemList[0].category_code }
	        		<c:forEach items="${problemList }" var="problem">
	        			<a href="updateProblem.do?category_code=${problem.category_code }&problem_code=${problem.problem_code }" class="btn btn-primary">${problem.problem_detail}</a>
	        			<!--  -->
	        			<!-- 여기서 category_code와 problem_code의 값을 넘겨줘야 뎁스3가 정해진다 -->
	        			<!--  -->
	        		</c:forEach>
	        		<!-- 문의 추가 버튼 -->	
	        		<input name="depth" type="hidden" value="${depth }" />
	        		<input name="category_code" type="hidden" value="${problemList[0].category_code }" />
	        		<input name="problem_detail" type="text" id="inputProblem"  class="form-control" placeholder="여기에 입력하여 추가하세요" >
	        		<button class="btn btn-primary" type="submit" formaction="insertProblem.do" >추가하기</button>
        		</c:when> 
         		<c:when test="${depth eq 3}">
	         		${problemList[0].category_detail } === ${problemList[0].problem_detail }
	        		<c:forEach items="${problemList }" var="problem">
	        			<a href="#" class="btn btn-primary">${problem.place_detail}</a>
	        		</c:forEach>
	        		<!-- 문의 추가 버튼 -->	
	        		<input name="depth" type="hidden" value="${depth }" />
	        		<input name="category_code" type="hidden" value="${problemList[0].category_code }" />
	        		<input name="problem_code" type="hidden" value="${problemList[0].problem_code }" />
	        		<input name="place_detail" type="text" id="inputProblem"  class="form-control" placeholder="여기에 입력하여 추가하세요" >
	        		<button class="btn btn-primary" type="submit" formaction="insertProblem.do" >추가하기</button>
        		</c:when>
        	</c:choose>
        	<!-- 추가 / 수정 / 삭제 버튼 -->
        	

        	</form>
        	
        	<button class="btn btn-primary" type="submit" >수정하기</button>
        	<button class="btn btn-primary" type="submit" >삭제하기</button>
         <!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
          <h2>문의 1뎁스 choose -> when 으로 1뎁스면 여기섹션 출력 ==> href=updateProblem.jsp 계속 돌리면서 뎁스 수정하게하기</h2>
          <!-- category.category_code가 널이면 category_detail 출력 -> 선택하면 null이 아니니까 problem_detail 출력(2뎁스)   -->
          <!-- 2뎁스도 널이 아니면 3뎁스의 place_detail 출력 -->
          <p class="lead">This is a great place to talk about your webpage. This template is purposefully unstyled so you can use it as a boilerplate or starting point for you own landing page designs! This template features:</p>
          <ul>
            <li>Clickable nav links that smooth scroll to page sections</li>
            <li>Responsive behavior when clicking nav links perfect for a one page website</li>
            <li>Bootstrap's scrollspy feature which highlights which section of the page you're on in the navbar</li>
            <li>Minimal custom CSS so you are free to explore your own unique design options</li>
          </ul>
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

<!-- Bootstrap core JavaScript -->
<script src="<%=request.getContextPath()%>/resources/vendor/jquery/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Plugin JavaScript -->
<script src="<%=request.getContextPath()%>/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
<!-- JQuery JavaScript -->
<script src="<%=request.getContextPath()%>/resources/vendor/jquery/jquery-3.5.1.min.js"></script>

<!-- Custom JavaScript for this theme -->

<!-- SCRIPT ---------------------------------------------------------- -->
</body>
</html>

