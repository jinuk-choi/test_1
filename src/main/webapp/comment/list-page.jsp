<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="commentListPage">
	<ul>
		 <c:choose>
			<c:when test="${ pagination.prevPage >= 5}">
				<li>
					<a class="page">◀</a>		
				</li>
			</c:when>
		</c:choose> 
		<c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
				<c:choose>
					<c:when test="${ pagination.page == i }">
						<li style="background-color:#ededed;">
							<span class="page">${i}</span>
						</li>
					</c:when>
					<c:when test="${ pagination.page != i }">
						<li>
							<span style="cursor: pointer;" class="page">${i}</span>
						</li>
					</c:when>
				</c:choose>
		</c:forEach>
		 <c:choose>
			<c:when test="${ pagination.nextPage <= pagination.lastPage }">
				<li style="">
					<a class="page">▶</a>
				</li>
			</c:when>	
		</c:choose> 
	</ul>
</div>