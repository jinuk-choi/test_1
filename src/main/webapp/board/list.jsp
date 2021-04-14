<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
</head>

<style>
table {
		border-collapse:collapse;
	}
	table tr th {
		font-weight:700;
	}
	table tr td, table tr th {
		border:1px solid #818181;
		width:200px;
		text-align:center;
	}
	a {
		text-decoration:none;
		color:#000;
		font-weight:700;
	}
	
	li {
		list-style:none;
		width:50px;
		line-height:50px;
		border:1px solid #ededed;
		float:left;
		text-align:center;
		margin:0 5px;
		border-radius:5px;
	}
	h1 {
		text-align:center;
	}
	table {
		border-collapse:collapse;
		margin:40px auto;
	}
	

</style>
<body>
	<div>
		
	</div>
<h1>게시글 목록</h1>
	<table >
		<tr>
			<td colspan="4">전체 게시글 수 : ${pagination.count }</td>
		<tr>
		    <th>NO</th>
			<th>제목</th>
			<th>이름</th>
			<th>조회수</th>
		</tr>
		<c:forEach items="${list}" var="board">
			 <tr>	 
			 	<td>${board.a_idx}</td>
				<td>${board.a_title}</td>
				<td>${board.a_writer}</td>
				<td>${board.a_count}</td>
		     <tr>
		</c:forEach>
	</table>

</body>
</html>