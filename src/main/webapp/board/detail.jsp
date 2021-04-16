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
			<a href="board-edit.do" style="width:70%;font-weight:700;background-color:#818181;color:#fff;" >수정</a>
		</td>
		<td style="border:none;">
			<a style="width:70%;font-weight:700;background-color:red;color:#fff;">삭제</a>
		</td>
		</tr>
	</table>
</body>
</html>