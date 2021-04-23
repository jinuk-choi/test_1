<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
<style>


	h1 {
			text-align:center;
	}
	
	h2 {
			text-align:center;
	}
	
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
	
	ul {
		width:600px;
		height:50px;
		margin:10px auto;
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
</head>
<body>
	
<h1>게시글 목록</h1>
<table >
	<tr>
		<td colspan="5">전체 게시글 수 : ${pagination.count }</td>
	</tr>
	<tr>
	    <th>NO</th>
		<th>제목</th>
		<th>이름</th>
		<th>작성일시</th>
		<th>조회수</th>
	</tr>
	<c:forEach items="${list}" var="board" varStatus="status">
		<tr>	 
			<td>${board.rownum}</td>
			<td><a href="board-detail.do?a_idx=${board.a_idx}">${board.a_title}</a></td>
			<td>${board.a_writer}</td>
			<td>${board.a_date}</td>
			<td>${board.a_count}</td>
		<tr>
	</c:forEach>
</table>
<div>
	<ul>
		 <c:choose>
			<c:when test="${ pagination.prevPage >= 3}">
				<li>
					<a href="board-list.do?page=${pagination.prevPage}">◀</a>		
				</li>
			</c:when>
		</c:choose> 
		<c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
			
				<c:choose>
					<c:when test="${ pagination.page == i }">
						
						<li style="background-color:#ededed;">
							<span>${i}</span>
						</li>
					</c:when>
					<c:when test="${ pagination.page != i }">
						<li>
							<a href="board-list.do?page=${i}">${i}</a>
						</li>
					</c:when>
				</c:choose>
		</c:forEach>
		 <c:choose>
			<c:when test="${ pagination.nextPage <= pagination.lastPage }">
				<li style="">
					<a href="board-list.do?page=${pagination.nextPage}">▶</a>
				</li>
			</c:when>	
		</c:choose> 
	</ul>
</div>
<div>
<h2><a href="board-insert.do">게시글 작성하기</a></h2>
</div>

</body>
</html>