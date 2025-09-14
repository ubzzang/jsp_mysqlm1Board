<%@page import="utils.JSFunction"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
int num=Integer.parseInt(request.getParameter("num"));
BoardDAO dao=new BoardDAO();
int result=dao.deleteBoard(num);
dao.close();
if(result==1){
	JSFunction.alertLocation("글삭제 성공했습니다.", "List.jsp", out); 
}else{
	response.sendRedirect("View.jsp?num="+num);
}
%>