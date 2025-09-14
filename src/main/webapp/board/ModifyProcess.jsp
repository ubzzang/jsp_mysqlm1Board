<%@page import="utils.JSFunction"%>
<%@page import="dao.BoardDAO"%>
<%@page import="dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Board board=new Board();
BoardDAO dao=new BoardDAO();
board.setNum(Integer.parseInt(request.getParameter("num")));
board.setTitle(request.getParameter("title"));
board.setContent(request.getParameter("content"));
int result=dao.updateBoard(board);
dao.close();

if(result==1){
	JSFunction.alertLocation("글수정에 성공했습니다.", "View.jsp?num="+board.getNum(), out);
}else{
	response.sendRedirect("Modify.jsp?num="+board.getNum());
}
%>