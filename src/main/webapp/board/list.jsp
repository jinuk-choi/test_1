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
		width:300px;
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
	
	.tdAlign {
		text-align:left; 
		padding-left:10px;
	}
	
	#box1 {
		text-align: left;
		padding-left:200px;
	}
	
	#search {
		display: inline-block;
		text-align: center;
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
			<td class="tdAlign"><c:if test="${board.a_depth > 1 }">
						<c:forEach begin="2" end="${board.a_depth}">
							&nbsp;&nbsp;
						</c:forEach>
						<c:forEach begin="2" end="${board.a_depth}">
							┕
						</c:forEach>
					</c:if>
				<a href="board-detail.do?a_idx=${board.a_idx}">${board.a_title}</a>
			</td>
			<td>${board.user.u_name}</td>
			<td>${board.a_date}</td>
			<td>${board.a_count}</td>
		<tr>
	</c:forEach>
</table>
<div>
	<ul>
		 <c:choose>
			<c:when test="${ pagination.prevPage >= 5}">
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
							<a href="board-list.do?page=${i}&type=${pagination.search.type}&keyword=${pagination.search.keyword}">${i}</a>
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
	<div id="box1"><a href="board-insert.do?a_group=0&a_order=0&a_depth=0">게시글 작성하기</a>
</div>
<p></p>
<div id="search">
        <form action="board-list.do" name="search" method="get">
        	<input type="hidden" name="page" value="${pagination.page}">
            <select name="type">
            	<option value="0" selected>- 선택- </option>
                <option value="1">제목</option>
                <option value="2">내용</option>
                <option value="3">제목+내용</option>
                <option value="4">글쓴이</option>
            </select>
            <input type="text" size="20" name="keyword"/>&nbsp;
            <input type="submit" value="검색"/>
        </form>    
</div>
</body>
</html>