<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<!DOCTYPE html>
<%
	String searchCondition="all";
	String startDate = "";
	String endDate = "";

	if(session.getAttribute("searchCondition") != null){
		searchCondition = session.getAttribute("searchCondition").toString();
		startDate = session.getAttribute("startDate").toString();
		endDate = session.getAttribute("endDate").toString();	
	}
	
%>
<head>

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<title>나의 StoreCare</title>
	
	<!-- JQuery JavaScript -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/jquery-ui.css" type="text/css" />  
	<script src="<%=request.getContextPath()%>/resources/vendor/jquery/jquery.min.js"></script>  
	<script src="<%=request.getContextPath()%>/resources/vendor/jquery/jquery-ui.min.js"></script>
	
	<!-- Bootstrap core CSS -->
	<link href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	

</head>

<body>

<!-- include nav -->
<%@include file ="common/nav.jsp" %>

  <!-- Page Content -->



<!--  검색 FORM -->
<div>
	<form name="searchUserBoard"  autocomplete="off" method="post" action="getBoardUserList.do" style="padding:10px">
		<!-- 처리현황별 검색 SELECT -->
		<div style="padding:10px; text-align-last: center">
		<p>처리현황</p>
		<select name="searchCondition">
			<option value="all">전체</option>
			<option value="doing">처리중</option>
			<option value="done">처리완료</option>
		</select>
		</div>
		<div style="padding:10px; text-align-last: center">
		From
		<input type="text" id="startDate" name="startDate" placeholder="전체" style="width: 115px">
		To 
		<input type="text" id="endDate" name="endDate"  placeholder="전체" style="width: 115px">
		<button type="submit" id="btnSearch" class="btn btn-info" style="float:right">검색</button>
		</div>

	</form>
</div>

  

  <!-- 여기도 null이 아니라 [] 빈 리스트인데 이거 나중에 생각해보자  -->
<c:choose>
<c:when test="${boardUserList ne '[]'}">
 	<div class = "container-fluid" >
		<c:forEach items="${boardUserList}" var="board">
			<div class = "card mt-2">
			    <div class ="card-body">
					<span class='text-primary'> 문의시간 ${board.datetime}</span>
					<c:if test="${board.flag eq 1 }">
						<br/><span class='text-primary'> 처리시간 ${board.clearTime}</span>
					</c:if>
					<h1 class = "card-title"> ${board.category_detail}</h1>
					<div class = "card-subtitle text-muted mb-2">
						${board.problem_detail}<br/>${board.place_detail} 
					</div>
					<div class ="card-text mb-2">
						${board.department_name } ${board.floor }
					</div>
					<c:if test="${board.flag eq 1 }">
						<div class ="card-text mb-2">
							<span class= "text-muted">
								처리 완료
							</span>
						</div>
					</c:if>
					<c:if test="${board.flag eq 0 }">
						<div class ="card-text mb-2"><span class= "text-muted">   처리 중	</span></div>
						<a href="insertBoard?seq=${board.seq}&department_department_code=${board.department_department_code}&flag=${board.flag}&depth=1" class="btn btn-secondary">수정하기</a>
					</c:if>
					<a href="deleteUserBoard.do?seq=${board.seq}" class="btn btn-secondary">삭제하기</a>
				</div>
				</div>
		</c:forEach>
   			
	</div>

						<!-- 페이지 번호 -->	
								<div class="btn-toolbar mb-3" role="toolbar" aria-label="Toolbar with button groups" style="place-content: center">
								  <div class="btn-group me-2" role="group" aria-label="First group">
								<!-- prev 버튼 -->
								<div id="page-prev">
									<a class="btn btn-outline-secondary" href="getBoardUserList.do${pageMaker.makeQuery(pageMaker.startPage)}&searchCondition=<%=searchCondition %>&startDate=<%=startDate %>&endDate=<%=endDate %>" aria-label="Prev">
										<span aria-hidden="true">«</span>
									</a>
								</div>
								
								<!-- 페이지 번호 (시작 페이지 번호부터 끝 페이지 번호까지) -->
								<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
								    <div id="page${idx}">
									    <a class="btn btn-outline-secondary" href="getBoardUserList.do${pageMaker.makeQuery(idx)}&searchCondition=<%=searchCondition %>&startDate=<%=startDate %>&endDate=<%=endDate %>">
									    	<!-- 시각 장애인을 위한 추가 -->
									      	<span>${idx}<span class="sr-only">(current)</span></span>
									    </a>
								    </div>
								</c:forEach>
								
								<!-- next 버튼 -->
								<div id="page-next">
								    <a class="btn btn-outline-secondary" href="getBoardUserList.do${pageMaker.makeQuery(pageMaker.endPage)}&searchCondition=<%=searchCondition %>&startDate=<%=startDate %>&endDate=<%=endDate %>" aria-label="Next">
								    	<span aria-hidden="true">»</span>
								    </a>
								</div>	
								  </div>
								</div>
	
	
</c:when>
<c:otherwise>
<div class = "container-fluid" >
			<div class = "card mt-4">
			    <div class ="card-body">
					<h1 class = "card-title"> 문의가 없네요 !! </h1>
					 <a href="selectDepartment" class="btn btn-primary">문의 하러가기 </a>
				</div>
			</div>
</div>
</c:otherwise>
</c:choose>
  
  
  

  <!-- Bootstrap core JavaScript -->
 
  <script src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  
  <!-- Custom JavaScript for this theme -->
  <script src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/datepicker.js"></script>
  <script src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/board-paging.js"></script>

</body>

</html>
