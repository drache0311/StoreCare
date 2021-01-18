<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error Page</title>
</head>
<body> 
	<div> 
		<c:out value="${error.STATUS_CODE }"> </c:out>
	</div>
	<div class="details">
		<h3>${error.MESSAGE }</h3>
	</div>
</body>
</html>