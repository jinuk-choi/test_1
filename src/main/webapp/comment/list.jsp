<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 모음</title>
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
	<p> 작성자 : ${comment.b_name } &emsp;&emsp;&emsp;&emsp;&emsp;제목 : ${comment.b_title }&emsp;&emsp;&emsp;&emsp;&emsp; 내용 : ${comment.b_content }&emsp;&emsp;&emsp;&emsp;&emsp; 날짜 : ${comment.b_redate }</p>
</body>
</html>