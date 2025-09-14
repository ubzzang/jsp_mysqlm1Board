<%@page import="dao.MemberDAO"%>
<%@page import="dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp"></jsp:include>
<%
    // 세션에서 로그인된 아이디 가져오기
    String userId = (String) session.getAttribute("UserId");
    Member member = null;

    if (userId != null) {
        MemberDAO dao = new MemberDAO();
        member = dao.getMemberById(userId); // DAO 인스턴스 메소드 호출
    }
%>

<div class="formBox">
	<form action="updatePass.jsp" method="post">
		<h1>내 정보</h1>
		<div>
			<span>아이디</span> <input type="text" name="id" value="<%=member.getId() %>" readonly/>
		</div>
		<div>
			<span>패스워드</span> <input type="password" name="newPass" />
		</div>
		<div>
			<span>이름</span> <input type="text" name="name" value="<%=member.getName() %>" readonly/>
		</div>
		<input type="submit" value="비밀번호 변경">
	</form>
</div>
</body>
</html>