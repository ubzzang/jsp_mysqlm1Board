<%@page import="utils.JSFunction"%>
<%@page import="dto.Member"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	MemberDAO dao=new MemberDAO();
	Member member=dao.getMember(id, pass);
	dao.close();
	
	if(member==null){
		JSFunction.alertBack("로그인에 실패했습니다.", out);  

	}else{
		session.setAttribute("UserId", member.getId());
		session.setAttribute("UserName", member.getName());
		JSFunction.alertLocation("로그인에 성공했습니다.", "../board/List.jsp", out); 

	}
%>