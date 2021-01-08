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

</head>

<body>

<!-- include nav -->
<%@include file ="common/nav.jsp" %>

  <!-- Page Content -->
  <div class="container">
    <div class="row">
      <div class="col-lg-12 text-center">
      
      <!--  벨 아이콘 시작-->
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bell" viewBox="0 0 16 16">
  			<path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2z"/>
  			<path fill-rule="evenodd" d="M8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z"/>
		</svg>
      <!--  벨 아이콘 끝 -->
      
      
        <h1 class="mt-5">StoreCare</h1>
        <p class="lead">방문중인 백화점의 불편사항을 등록하시면 직원이 직접 확인 후 개선하는 고객 서비스 입니다.</p>
        <ul class="list-unstyled">
          <li>문의하실 백화점을 선택하세요</li>
          <li>		
          <!-- 문의할 백화점 선택 FORM -->
				<form method="post">
				<table align="center">
					<tr>
						<td align="center">
						<input name="depth" type="hidden" value="1" />
							<c:forEach items="${departmentList}" var="department">
									<button class="btn btn-primary" type="submit" formaction="insertBoard?depth=1&department_department_code=${department.department_code }">${department.department_name}</button>
							</c:forEach>
						</td>
					</tr>
				</table>
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
