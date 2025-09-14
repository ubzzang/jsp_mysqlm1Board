<%@page import="utils.JSFunction"%>
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
	JSFunction.alertLocation("회원가입에 성공했습니다.", "login.jsp", out); 
}else{
	JSFunction.alertBack("회원가입에 실패했습니다.", out);  
}
%>