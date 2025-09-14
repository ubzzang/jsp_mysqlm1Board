<%@page import="dto.Board"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
int num = Integer.parseInt(request.getParameter("num"));
BoardDAO dao = new BoardDAO();
dao.updateVisitcount(num);
Board board = dao.getBoard(num);
dao.close();
%>
<jsp:include page="../common/header.jsp"></jsp:include>
<main>
	<div class="boardForm type02">
		<div>
			<span>번호</span>
			<div><%=board.getNum()%></div>
		</div>
		<div>
			<span>작성자</span>
			<div><%=board.getId()%></div>
		</div>
		<div>
			<span>작성일</span>
			<div><%=board.getPostdate()%></div>
		</div>
		<div style="border-right:none;">
			<span>조회수</span>
			<div><%=board.getVisitcount()%></div>
		</div>
		<div class="w100">
			<span>제목</span>
			<div><%=board.getTitle()%></div>
		</div>
		<div class="w100">
			<span>내용</span>
			<div><%=board.getContent()%></div>
		</div>
		<div class="btnBox w100">
			<%
			if (session.getAttribute("UserId") != null && session.getAttribute("UserId").toString().equals(board.getId())) {
			%>
			<button type="button"
				onclick="location.href='Modify.jsp?num=<%=board.getNum()%>';"
				class="type01">수정</button>
			<button type="button"
				onclick="location.href='Remove.jsp?num=<%=board.getNum()%>';"
				class="type02">삭제</button>
			<%
			}
			%>
			<button type="button" onclick="location.href='List.jsp'">목록보기</button>
		</div>
	</div>
</main>
</body>
</html>