<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp"></jsp:include>

</body>
<script>
	function validateForm(form) {
		if (!form.id.value) {
			alert("아이디를 입력하세요.");
			return false;
		}
		if (!form.pass.value) {
			alert("패스워드를 입력하세요.");
			return false;
		}
	}
</script>
<div class="formBox">
	<form action="loginProcess.jsp" method="post" name="LoginFrm">
		<h1>로그인</h1>
		<div>
			<span>아이디</span> <input type="text" name="id" />
		</div>
		<div>
			<span>패스워드</span> <input type="password" name="pass" />
		</div>
		<input type="submit" value="로그인"> <a href="join.jsp"
			class="joinBtn">아이디가 없으신가요?</a>
	</form>
</div>
</html>