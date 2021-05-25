<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
</head>
<body>
<form action="board-edit-process.do" name="board" method="post">
	<input type="hidden" name="a_idx" value="${board.a_idx}">
	<input type="hidden" name="id" value="${board.user.u_idx}">
	<p> 작성자 : ${board.user.u_name}</p>
	<p> 제목 : <input type="text" name="title" value="${board.a_title}"></p>
	<p> 내용 : <input type="text" style="width:500px; height:500px;" name="content" value="${board.a_content}"></p>
	<p> <input type="submit" value="수정하기"></p> 
</form>
</body>
</html>