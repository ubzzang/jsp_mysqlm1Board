<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../resources/css/reset.css" rel="stylesheet">
<link href="../resources/css/common.css" rel="stylesheet">
<link href="../resources/css/board.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<header>
		<h1>MysqlM1</h1>
		<div class="right-box">
			<div class="bd-util">
				<a href="../board/List.jsp">게시판 목록보기</a>
			</div>
			<div class="lg-util">
				<%
				if (session.getAttribute("UserId") == null) {
				%>
				<a href="../member/join.jsp">회원가입</a> <a href="../member/login.jsp">로그인</a>
				<%
				} else {
				%>
				<p>
					반갑습니다.
					<strong><%=session.getAttribute("UserId")%></strong>
					님!
				</p>
				<a href="../member/myPage.jsp">내정보수정</a> <a href="../member/logout.jsp">로그아웃</a>
				<%
				}
				%>
			</div>

		</div>
	</header>