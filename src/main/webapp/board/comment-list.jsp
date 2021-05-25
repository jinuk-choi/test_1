<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="commentList">
<p>전체 댓글 수 : ${pagination.count }</p>
	<c:forEach items="${list}" var="comment" varStatus="status">
		<div class="myFlex">
			<div>
				<c:if test="${comment.b_depth > 1 }">
					<c:forEach begin="2" end="${comment.b_depth}">
						&nbsp;&nbsp;
					</c:forEach>
					<c:forEach begin="2" end="${comment.b_depth}">
						┕
					</c:forEach>
				</c:if> 작성자 : ${comment.user.u_name}
			</div>&emsp;&emsp;
			<div>내용 : ${comment.b_content}</div>&emsp;&emsp;
			<div><button type="button" class="btnInsertForm">답글</button></div>&emsp;						
				<c:choose>
					<c:when test="${sessionScope.u_name == comment.user.u_name }">
						<div><button type="button" style="display:show;" class="btnUpdateForm">수정</button></div>&emsp;
					</c:when>
					<c:otherwise>
						<div><button type="button" style="display:none;" class="btnUpdateForm">수정</button></div>&emsp;
					</c:otherwise>
				</c:choose>	
				<c:choose>	
					<c:when test="${sessionScope.u_name == comment.user.u_name }">
						<div><button type="button" style="display:show;" class="btnDeletForm" b_idx="${comment.b_idx}">삭제</button></div>
					</c:when>
					<c:when test="${sessionScope.u_auth > 0}">
						<div><button type="button" style="display:show;" class="btnDeletForm" b_idx="${comment.b_idx}">삭제</button></div>
					</c:when>
					<c:otherwise>
						<div><button type="button" style="display:none;" class="btnDeletForm" b_idx="${comment.b_idx}">삭제</button></div>
					</c:otherwise>
				</c:choose>
		</div>
			<div class="myFlex" style="display: none;">
				<div>작성자 : ${comment.user.u_name}</div>&emsp;&emsp;
				<div>내용 : <textarea rows="1" cols="50"  class="editcon">${comment.b_content}</textarea></div>&emsp;&emsp;
				<div><button type="button" class="btnEditForm" b_idx="${comment.b_idx}" >등록</button></div>
				<div><a href="">취소</a></div>
			</div>
			<div class="myFlex" style="display: none;">
				<div>작성자 : ${sessionScope.u_name}</div>&emsp;&emsp;
				<div>내용 : <textarea rows="2" cols="50"  class="insertcon"></textarea></div>&emsp;&emsp;
				<div><button type="button" class="btnInForm" b_idx="${comment.b_idx}" b_group="${comment.b_group}" b_order="${comment.b_order}"  b_depth="${comment.b_depth}" >등록</button></div>
				<div><a href="">취소</a></div>
			</div>
	</c:forEach>
<ul>
 <c:choose>
	<c:when test="${ pagination.prevPage >= 5}">
		<li>
			<a class="page" page="${ pagination.prevPage}">◀</a>		
		</li>
	</c:when>
</c:choose> 
<c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}" step="1">
		<c:choose>
			<c:when test="${ pagination.page == i }">
				<li style="background-color:#ededed;">
					<a class="page">${i}</a>
				</li>
			</c:when>
			<c:when test="${ pagination.page != i }">
				<li>
					<a class="page" page="${i}">${i}</a>
				</li>
			</c:when>
		</c:choose>
</c:forEach>
 <c:choose>
	<c:when test="${ pagination.nextPage <= pagination.lastPage }">
		<li style="">
			<a class="page" page="${ pagination.nextPage}">▶</a>
		</li>
	</c:when>	
</c:choose> 
</ul>
</div>