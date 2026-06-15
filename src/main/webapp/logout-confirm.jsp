<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<h1>hello ,${user.getName()}</h1>


	<form action="logout">
		<input type="submit" value="Yes">
	</form>
	<form action="nologout">
		<input type="submit" value="NO">
	</form>


</body>
</html>