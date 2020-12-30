<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String role = session.getAttribute("role").toString();
%>

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
          <c:if test="${role eq '0'}">
            <a class="nav-link" href="adminHead">Home
              <span class="sr-only">(current)</span>
            </a>
          </c:if>
          <c:if test="${role eq '1'}">
            <a class="nav-link" href="getBoardList.do">Home
              <span class="sr-only">(current)</span>
            </a>
          </c:if>
          <c:if test="${role eq '2'}">
            <a class="nav-link" href="getDepartmentList.do">Home
              <span class="sr-only">(current)</span>
            </a>
          </c:if>
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
 

