<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
</head>
<body>
<h2> 게시글 작성 </h2>
<form action="board-insert-process.do" name="board" method="post">
	<input type="hidden" name="a_group" value="${board.a_group}">
	<input type="hidden" name="a_order" value="${board.a_order}">
	<input type="hidden" name="a_depth" value="${board.a_depth}">
	<input type="hidden" name="u_idx" value="${sessionScope.u_idx}">
	<p> 작성자 : ${sessionScope.u_name}</p>
	<p> 제목 : <input type="text" name="title"></p>
	<p> 내용 : <input type="text" style="width:500px; height:500px;" name="content"></p>
	<p> <input type="submit" value="작성하기"></p>
</form>
</body>
</html>