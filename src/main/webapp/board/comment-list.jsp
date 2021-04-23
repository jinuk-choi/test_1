<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="commentList">
	<c:forEach items="${list}" var="comment" varStatus="status">
		<div class="myFlex">
			<div>작성자 : ${comment.user.u_name}</div>&emsp;&emsp;
			<div>내용 : ${comment.b_content}</div>&emsp;&emsp;
			<div><button type="button" class="btnUpdateForm">수정</button></div>&emsp;
			<div><button type="button" class="btnDeletForm" b_idx="${comment.b_idx}">삭제</button></div>
		</div>
		<div class="myFlex" style="display: none;">
			<div>작성자 : ${comment.user.u_name}</div>&emsp;&emsp;
			<div>내용 : <textarea rows="1" cols="50"  class="editcon">${comment.b_content}</textarea></div>&emsp;&emsp;
			<div><button type="button" class="btnEditForm" b_idx="${comment.b_idx}" >등록</button></div>
			<div><a href="">취소</a></div>
		</div>
	</c:forEach>
</div>