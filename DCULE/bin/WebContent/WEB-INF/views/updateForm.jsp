<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form  method="post" action="update">
	<table border="1">
		<tr>
			<td>이름</td>
			<td>이메일</td>
			<td>전화번호</td>
			<td></td>
		</tr>

		<tr>
			<td><input type="hidden" name="id" id="id" value = "${member.id }">
			<input type="text" name="name" id="name" value = "${member.name }"></td>
			<td><input type="text" name="email" id="email" value = "${member.email }"></td>
			<td><input type="text" name="phone" id="phone" value = "${member.phone }"></td>
			<td colspan="2" align="center">
			<input type="submit" value="수정">
			</td>
		</tr>
		</table>
		</form>
</body>
</html>