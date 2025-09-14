<%@page import="dto.Board"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
int num = Integer.parseInt(request.getParameter("num"));
BoardDAO dao = new BoardDAO();
Board board = dao.getBoard(num);
dao.close();
%>
<jsp:include page="../common/header.jsp"></jsp:include>
<main>
	<div class="tit">
		<h2>글수정</h2>
	</div>
	<form action="ModifyProcess.jsp" method="post" class="boardForm">
		<div>
			<input type="hidden" name="num" value="<%=board.getNum()%>">
		</div>
		<div>
			<span>제목</span> <input type="text" name="title"
				value="<%=board.getTitle()%>">
		</div>
		<div>
			<span>작성자</span> <input type="text" name="id"
				value="<%=session.getAttribute("UserId")%>" readonly>
		</div>
		<div>
			<span>내용</span>
			<textarea name="content">
			<%=board.getContent()%>
		</textarea>
		</div>
		<div class="btnBox">
			<input type="submit" value="글수정">
		</div>

	</form>
</main>
</body>
</html>