<%@page import="java.util.ArrayList"%>
<%@page import="dto.Board"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
BoardDAO dao = new BoardDAO();
ArrayList<Board> list = dao.boardList();
dao.close();
%>
<jsp:include page="../common/header.jsp"></jsp:include>
<main>
	<div class="tit">
		<h2>게시판 목록 페이지</h2>
		<%
		if (session.getAttribute("UserId") != null) {
		%>
		<a href="../board/WriteForm.jsp">글작성</a>
		<%
}
%>
	</div>
	<table style="width: 100%; text-align: center;" class="table">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<%
		for (int i = 0; i < list.size(); i++) {
			Board board = list.get(i);
		%>
		<tr>
			<td><%=board.getNum()%></td>
			<td><a href="View.jsp?num=<%=board.getNum()%>"><%=board.getTitle()%></a></td>
			<td><%=board.getId()%></td>
			<td><%=board.getPostdate()%></td>
			<td><%=board.getVisitcount()%></td>
		</tr>
		<%
		}
		%>

	</table>
</main>
</body>
</html>