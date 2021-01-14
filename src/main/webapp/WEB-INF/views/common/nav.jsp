<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String role = session.getAttribute("role").toString();
	String department_department_code = null;
	if(session.getAttribute("department_code") != null){
		department_department_code = session.getAttribute("department_code").toString();
	}else{
		department_department_code = request.getParameter("department_department_code");
	}
	
%>

  <!-- Navigation            ----------------------------------------------------------- -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
    <div class="container">
      <img  src="<%=request.getContextPath()%>/resources/icon/StoreCare-logo.png" alt="" width="50" height="100%">
      <a class="navbar-brand" href="#" style="margin-left:5%;font-weight:500;font-size:xx-large">StoreCare</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
          <c:if test="${role eq '0'}">
            <a class="nav-link" href="getBoardList.do">Home
              <span class="sr-only">(current)</span>
            </a>
          <!-- 백화점 및 관리자를 배정,추가,수정,삭제 하는 페이지 -->
          <li class="nav-item">
            <a class="nav-link" href="getDepartmentList">백화점 관리</a>
          </li>
	        <!-- 전체 문의 뎁스별 추가,수정,삭제 페이지 -->
	        <li class="nav-item">
	          <a class="nav-link" href="updateProblem.do?depth=1&department_department_code=<%=department_department_code%>">전체 문의 관리</a>
	        </li>
          </c:if>
          <c:if test="${role eq '1'}">
			<a class="nav-link" href="getBoardList.do">Home
			  <span class="sr-only">(current)</span>
			</a>
	        <!-- 원하는 문의를 각 점에 추가하는 페이지 -->
	        <li class="nav-item">
	          <a class="nav-link" href="sendProblem.do?depth=1&department_department_code=<%=department_department_code%>">문의 추가</a>
	        </li>
	        <!-- 각 점별 뎁스별 문의 검색,삭제 페이지 -->
	        <li class="nav-item">
	          <a class="nav-link" href="departmentProblem.do?depth=1&department_department_code=<%=department_department_code%>">내 백화점 문의관리</a>
	        </li>
          </c:if>
          <c:if test="${role eq '2'}">
          	<!-- 문의 내역 페이지 -->
            <a class="nav-link" href="getBoardUserList.do">문의 내역
              <span class="sr-only">(current)</span>
            </a>
          <!-- 문의 추가 페이지 -->
          <li class="nav-item">
            <a class="nav-link" href="selectDepartment">문의 등록</a>
          </li>

          </c:if>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="logout.do">Log-out</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <!-- Navigation  DONE   ----------------------------------------------------------------------------  -->
 

