<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Lotte-StoreCare</title>

  <!-- Bootstrap core CSS -->
  <link href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom CSS -->
  <link href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/button-dark.css" rel="stylesheet">

</head>

<body>

<!-- include nav -->
<%@include file ="common/nav.jsp" %>

  <!-- Page Content -->
  <div class="container">
    <div class="row">
      <div class="col-lg-12 text-center">
      
      <!--  벨 아이콘 시작-->
		<img class="mb-4" style="margin-top:20%" src="<%=request.getContextPath()%>/resources/icon/farmer.png" alt="" width="150" height="130">
      <!--  벨 아이콘 끝 -->
      
      
        <h1>StoreCare</h1>
        <ul class="list-unstyled">
        <li><small class="text-muted">방문중인 백화점의 불편사항을 등록하시면</small></li>
        <li><small class="text-muted">직원이 직접 확인 후 개선하는</small></li>
        <li><small class="text-muted">고객 서비스 입니다.</small></li>
        </ul>
        <ul class="list-unstyled">
        <p class="badge bg-secondary text-wrap text-light " style="width: 100%; height:40px; line-height:30px; font-size:1.2rem">
          문의하실 백화점을 선택하세요
		</p>

          <li>		
          <!-- 문의할 백화점 선택 FORM -->
				<form method="post" >
				<div style="float:none">
						<input name="depth" type="hidden" value="1" />
							<c:forEach items="${departmentList}" var="department">
									<button  class="btn btn-dark" style="margin-top:5%" type="submit" formaction="insertBoard?depth=1&department_department_code=${department.department_code }">${department.department_name}</button>
							</c:forEach>
				</div>
			</form>
			<!-- 문의할 백화점 선택 FORM 종료 -->

		</li>
        </ul>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript -->
  <script src="<%=request.getContextPath()%>/resources/vendor/jquery/jquery.slim.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
