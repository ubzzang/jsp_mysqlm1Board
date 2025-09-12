<%@page import="dao.MemberDAO"%>
<%@page import="dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Member member = new Member();
member.setId(request.getParameter("id"));
member.setPass(request.getParameter("pass"));
member.setName(request.getParameter("name"));
MemberDAO dao=new MemberDAO();
int result=dao.insertMamber(member);

if(result==1){
	response.sendRedirect("login.jsp");
}else{
	request.getRequestDispatcher("JoinForm.jsp").forward(request, response);
}
%>