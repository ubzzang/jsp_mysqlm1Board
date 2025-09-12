<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp"></jsp:include>

<div class="formBox">
	<form action="joinProcess.jsp" method="post">
		<h1>회원가입</h1>
		<div>
			<span>아이디</span> <input type="text" name="id" />
		</div>
		<div>
			<span>패스워드</span> <input type="password" name="pass" />
		</div>
		<div>
			<span>이름</span> <input type="text" name="name" />
		</div>
		<input type="submit" value="회원가입">
	</form>
</div>
</body>
</html>