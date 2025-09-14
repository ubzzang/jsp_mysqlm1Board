<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp"></jsp:include>
<main>
	<div class="tit">
		<h2>글작성</h2>
	</div>
	<form action="WriteProcess.jsp" method="post" class="boardForm">
		<div>
			<span>제목</span><input type="text" name="title">
		</div>
		<div>
			<span>작성자</span><input type="text" name="id"
				value="<%=session.getAttribute("UserId")%>" readonly>
		</div>
		<div>
			<span>글내용</span>
			<textarea name="content"></textarea>
		</div>
		<div class="btnBox">
			<input type="submit" value="글등록">
		</div>
	</form>
</main>
</body>
</html>