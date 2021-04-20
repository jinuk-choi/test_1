<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 수정</title>
</head>
<body>
<form action="comment-edit-process.do" name="comment" method="post">
	<input type="hidden" name="b_idx" value="${comment.b_idx}">
	<p> 작성자 : <input type="text" name="id" value="${comment.b_name}"></p>
	<p> 내용 : <input type="text" name="content" value="${comment.b_content}"></p>
	<p> 날짜 : <input type="text" name="date" value="${comment.b_redate}"></p>
	<p> <input type="submit" value="수정하기"></p> 
</form>
</body>
</html>