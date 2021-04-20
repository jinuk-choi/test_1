<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>게시글 상세보기</title>
	<style>
	a {
		text-decoration:none;
		color:#000;
		font-weight:700;
		border:none;
		cursor:pointer;
		padding:10px;
		display:inline-block;
	}
	
	.myFlex {
		display: flex;
	}
</style>	
</head>
<body>
	<h2> 게시글 상세보기 </h2>
		<p> 작성자 : ${board.a_writer } &emsp;&emsp;&emsp;&emsp;&emsp;조회수 : ${board.a_count }</p>
		<br>
		<p> 제목 : ${board.a_title }</p>
		<br>
		<p> 내용 : ${board.a_content }</p>
		
	<table>
		<tr style="height:50px;">
			<td style="border:none;">
				<a href="board-edit.do?a_idx=${board.a_idx}" style="width:70%;font-weight:700;background-color:#818181;color:#fff;" >수정</a>
			</td>
			<td style="border:none;">
				<a href="board-delete.do?a_idx=${board.a_idx}" style ="width:70%;font-weight:700;background-color:red;color:#fff;">삭제</a>
			</td>
		</tr>
	</table>
<h2> 댓글 작성 </h2>
	<form action="comment-insert.do" name="board" method="post">
		<input type="hidden" name="a_idx" value="${board.a_idx}">
		<p> 작성자 : <input type="text" name="id"></p>
		<p> 제목 : <input type="text" name="title"></p>
		<p> 내용 : <input type="text" style="width:500px; height:50px;" name="content">&emsp;<input type="submit" value="작성하기"></p>
	</form>
<h2> 댓글 보기 </h2>
	<c:forEach items="${list}" var="comment" varStatus="status">
		<div class="myFlex">
			<div>작성자 : ${comment.b_name}</div>&emsp;&emsp;
			<div>내용 : ${comment.b_content}</div>&emsp;&emsp;
			<div>날짜 : ${comment.b_redate}</div>
			<div><a href="comment-edit.do?b_idx=${comment.b_idx}">수정</a></div>
			<div><a href="comment-delete.do?b_idx=${comment.b_idx}">삭제</a></div>
		</div>
	</c:forEach>
	
</body>
</html>