<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="commentListPage">
	<ul>
		 <c:choose>
			<c:when test="${ pagination.prevPage >= 5}">
				<li>
					<a href="board-detail.do?page=${pagination.prevPage}&a_idx=${board.a_idx}">◀</a>		
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
							<a href="board-detail.do?page=${i}&a_idx=${board.a_idx}" class="page">${i}</a>
						</li>
					</c:when>
				</c:choose>
		</c:forEach>
		 <c:choose>
			<c:when test="${ pagination.nextPage <= pagination.lastPage }">
				<li style="">
					<a href="board-detail.do?page=${pagination.nextPage}&a_idx=${board.a_idx}">▶</a>
				</li>
			</c:when>	
		</c:choose> 
	</ul>
</div>