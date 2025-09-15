<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Board"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
BoardDAO dao = new BoardDAO();
Map<String, Object> param = new HashMap<String, Object>();
String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");
if (searchWord != null) {
	param.put("searchField", searchField);
	param.put("searchWord", searchWord);
}
ArrayList<Board> list = dao.boardList(param);
dao.close();
%>
<jsp:include page="../common/header.jsp"></jsp:include>
<main>
	<div class="tit">
		<h2>게시판 목록 페이지</h2>
		<div class="searchBox">
			<form method="get">
				<select name="searchField">
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select>
				<div class="area">
					<input type="text" name="searchWord" value="${param.searchWord}"
						placeholder="검색어를 입력하세요"> <button type="submit"></button>
				</div>
			</form>
		</div>
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