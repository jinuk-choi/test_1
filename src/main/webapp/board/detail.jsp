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
		text-align:left;
		margin:0 5px;
		border-radius:5px;
	}
</style>	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
	<h2> 게시글 상세보기 </h2>
		<p> 작성자 : ${board.user.u_name}  &emsp;&emsp;&emsp;&emsp;&emsp;조회수 : ${board.a_count } </p>
		<br>
		<p> 제목 : ${board.a_title }</p>
		<br>
		<p> 내용 : ${board.a_content }</p>
		
	<table>
		<tr style="height:50px;">
			<c:choose>
				<c:when test="${sessionScope.u_name == board.user.u_name }">
					<td style="border:none; display:show;">
						<a href="board-edit.do?a_idx=${board.a_idx}" style="width:70%;font-weight:700;background-color:#818181;color:#fff;" >수정</a>
					</td>
				</c:when>
				<c:otherwise>
					<td style="border:none; display:none;">
						<a href="board-edit.do?a_idx=${board.a_idx}" style="width:70%;font-weight:700;background-color:#818181;color:#fff;" >수정</a>
					</td>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${sessionScope.u_name == board.user.u_name }">
					<td style="border:none; display:show;" id="delete" >
						<a href="board-delete.do?a_idx=${board.a_idx}" style ="width:70%;font-weight:700;background-color:red;color:#fff;">삭제</a>		
					</td>
				</c:when>
				<c:when test="${sessionScope.u_auth > 0}">
					<td style="border:none; display:show;" id="delete" >
						<a href="board-delete.do?a_idx=${board.a_idx}" style ="width:70%;font-weight:700;background-color:red;color:#fff;">삭제</a>		
					</td>
				</c:when>	
				<c:otherwise>
					<td style="border:none; display:none;" id="delete" >
						<a href="board-delete.do?a_idx=${board.a_idx}" style ="width:70%;font-weight:700;background-color:red;color:#fff;">삭제</a>		
					</td>
				</c:otherwise>
			</c:choose>
			
			<td style="border:none;">
				 <a href="board-insert.do?a_group=${board.a_group}&a_order=${board.a_order}&a_depth=${board.a_depth}" style="width:80%;font-weight:700;background-color:#818181;color:#fff;" >답글쓰기</a>
			</td>
			<td style="border:none;">
				 <a href="board-list.do" style="width:80%;font-weight:700;background-color:#818181;color:#fff;" >목록보기</a>
			</td>
		</tr>
	</table>
<h2> 댓글 작성 </h2> 
<div>
	<input type="hidden" name="a_idx" value="${board.a_idx}">
	<p> 작성자 : ${sessionScope.u_name}</p>
	<p> 내용 : <input type="text" style="width:500px; height:50px;" name="content" id="content" >&emsp; 
		<input type="button" value="작성하기" id="btnReg" b_order="0" b_depth="0" b_group="0">
	</p>
</div>
<h2> 댓글 보기 </h2>
	
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

<script>
$(document).on('click', '#btnReg', function () {
	let id = '${sessionScope.u_idx}';
	let content = $('#content').val();
	let a_idx = '${board.a_idx}';
	let count = '${pagination.count }';
	let b_depth = $(this).attr('b_depth');
	let b_order = $(this).attr('b_order');
	let b_group = $(this).attr('b_group');
	
	
	$.ajax({
		 method: "POST",
		 url: "/lcomputerstudy/aj-comment-insert.do",
		 data: { 
			 id: id, 
			 content: content,
			 a_idx: a_idx,
			 count: count,
			 b_group: b_group,
			 b_depth: b_depth,
			 b_order: b_order
			 
		 }
	})
	.done(function( data ) {
	 	 console.log(data);
	 	 $('#commentList').html(data);
	});
});

$(document).on('click', '.btnUpdateForm', function () {
	let viewDiv = $(this).parent().parent();
	viewDiv.next().show();
	viewDiv.hide();
});

$(document).on('click', '.btnInsertForm', function () {
	let viewDiv = $(this).parent().parent();
	viewDiv.next().next().show();
	viewDiv.hide();
});

$(document).on('click', '.btnEditForm', function () {
	let editcon = $(this).parent().prev().find('.editcon').val();
	let b_idx = $(this).attr('b_idx');
	let a_idx = '${board.a_idx}';
	let count = '${pagination.count }';

	$.ajax({
		 method: "POST",
		 url: "/lcomputerstudy/aj-comment-edit.do",
		 data: { 
	
			 editcon: editcon,
			 b_idx: b_idx,
			 a_idx: a_idx,
			 count: count

		 }
	})
	.done(function( data ) {
	 	 console.log(data);
	 	 $('#commentList').html(data);
	});
});

$(document).on('click', '.btnInForm', function () {
	let insertcon = $(this).parent().prev().find('.insertcon').val();
	let id = '${sessionScope.u_idx}';
	let a_idx = '${board.a_idx}';
	let count = '${pagination.count }';
	let b_group = $(this).attr('b_group');
	let b_depth = $(this).attr('b_depth');
	let b_order = $(this).attr('b_order');

	$.ajax({
		 method: "POST",
		 url: "/lcomputerstudy/aj-comment-insert.do",
		 data: { 
	
			 content: insertcon,
			 id: id,
			 a_idx: a_idx,
			 count: count,
			 b_group: b_group,
			 b_depth: b_depth,
			 b_order: b_order
			 

		 }
	})
	.done(function( data ) {
	 	 console.log(data);
	 	 $('#commentList').html(data);
	});
});

$(document).on('click', '.btnDeletForm', function () {
	let b_idx = $(this).attr('b_idx');
	let a_idx = '${board.a_idx}';
	let count = '${pagination.count }';

	$.ajax({
		 method: "POST",
		 url: "/lcomputerstudy/aj-comment-delete.do",
		 data: { 	
			 b_idx: b_idx,
			 a_idx: a_idx,
			 count: count

		 }
	})
	.done(function( data ) {
	 	 console.log(data);
	 	 $('#commentList').html(data);
	});
});

$(document).on('click', '.page', function () {
	let a_idx = '${board.a_idx}';
	//let page = $(this).text();
	let page = $(this).attr("page");
	
	$.ajax({
		 method: "GET",
		 url: "/lcomputerstudy/aj-comment-list.do",
		 data: { 	
			 a_idx: a_idx,
			 page: page
		 }
	})
	.done(function( data ) {
	 	 console.log(data);
	 	 $('#commentList').html(data);
	});
});
</script>
</body>
</html>