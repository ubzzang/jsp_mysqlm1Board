<%@page import="utils.JSFunction"%>
<%@ page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");
    String newPass = request.getParameter("newPass");

    MemberDAO dao = new MemberDAO();
    int result = dao.updatePassword(id, newPass);

    if(result == 1) {
    	JSFunction.alertLocation("비밀번호 변경 성공했습니다.", "myPage.jsp", out); 
    } else {
    	JSFunction.alertBack("비밀번호 변경 실패했습니다.", out);  
    }
%>
