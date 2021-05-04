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
		<p> 작성자 : ${board.a_writer } &emsp;&emsp;&emsp;&emsp;&emsp;조회수 : ${board.a_count } </p>
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
	<p> 내용 : <input type="text" style="width:500px; height:50px;" name="content" id="content" >&emsp;<input type="button" value="작성하기" id="btnReg"></p>
</div>
<h2> 댓글 보기 </h2>
	<p>전체 댓글 수 : ${pagination.count }</p>
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
<div>
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
							<a class="page">${i}</a>
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

<script>
$(document).on('click', '#btnReg', function () {
	let id = '${sessionScope.u_idx}';
	let content = $('#content').val();
	let a_idx = '${board.a_idx}';
	
	$.ajax({
		 method: "POST",
		 url: "/lcomputerstudy/aj-comment-insert.do",
		 data: { 
			 id: id, 
			 content: content,
			 a_idx: a_idx
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

$(document).on('click', '.btnEditForm', function () {
	let editcon = $(this).parent().prev().find('.editcon').val();
	let b_idx = $(this).attr('b_idx');
	let a_idx = '${board.a_idx}';

	$.ajax({
		 method: "POST",
		 url: "/lcomputerstudy/aj-comment-edit.do",
		 data: { 
	
			 editcon: editcon,
			 b_idx: b_idx,
			 a_idx: a_idx

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

	$.ajax({
		 method: "POST",
		 url: "/lcomputerstudy/aj-comment-delete.do",
		 data: { 	
			 b_idx: b_idx,
			 a_idx: a_idx

		 }
	})
	.done(function( data ) {
	 	 console.log(data);
	 	 $('#commentList').html(data);
	});
});

$(document).on('click', '.page', function () {
	let a_idx = $(this).attr('a_idx');
	let i = $(this).attr('i');
	
	$.ajax({
		 method: "GET",
		 url: "/lcomputerstudy/detail.do",
		 data: { 	
			 a_idx: a_idx

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