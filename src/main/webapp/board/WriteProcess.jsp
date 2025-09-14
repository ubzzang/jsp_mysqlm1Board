<%@page import="utils.JSFunction"%>
<%@page import="dto.Board"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	BoardDAO dao=new BoardDAO();
	Board board=new Board();
	board.setTitle(request.getParameter("title"));
	board.setContent(request.getParameter("content"));
	board.setId(request.getParameter("id"));

	int result=dao.insertBoard(board);
	dao.close();
	if(result==1){
		JSFunction.alertLocation("글작성에 성공했습니다.", "List.jsp", out); 
	}else{
		JSFunction.alertBack("글작성에 실패했습니다.", out);  
	}
%>
