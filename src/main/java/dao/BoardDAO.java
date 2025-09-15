package dao;

import java.util.ArrayList;
import java.util.Map;

import common.MysqlConnect;
import dto.Board;

public class BoardDAO extends MysqlConnect{
	// 글 저장
	public int insertBoard(Board board) {
		int result=0;
		
		String sql="insert into board(num,title,content,id) values(?,?,?,?)";
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, board.getNum());
			ps.setString(2, board.getTitle());
			ps.setString(3, board.getContent());
			ps.setString(4, board.getId());
			result=ps.executeUpdate();
			if(result==1) {
				System.out.println("데이터 저장 성공");
			}
		}catch (Exception ex) {
			// TODO: handle exception
			ex.printStackTrace();
		}
		return result;
	}
	
	//조회수 증가
	public void updateVisitcount(int num) {
		String sql="update board set visitcount=visitcount+1 where num=?";
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, num);
			int result=ps.executeUpdate();
			if(result==1) {
				System.out.println("조회수 update 처리가 됨");
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	//게시글 상세보기(1개의 게시물 들고오기)
	public Board getBoard(int num) {
		Board board=null;
		String sql="select * from board where num=?";
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, num);
			rs=ps.executeQuery();
			if(rs.next()) {
				board=new Board();
				board.setNum(rs.getInt("num"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setId(rs.getString("id"));
				board.setPostdate(rs.getTimestamp("postdate"));
				board.setVisitcount(rs.getInt("visitcount"));
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return board;
	}
	
	// 글 목록
	 public ArrayList<Board> boardList(Map<String, Object> map){
		 ArrayList<Board> list=new ArrayList<>();
		 String sql="select * from board";
		 if(map.get("searchWord") !=null) {
			 sql+=" where "+map.get("searchField")+" "
					 +" Like '%"+map.get("searchWord")+ "%'";
		 }
		 	 sql+=" order by num desc";
		 	 
			/*
			 * select * from board where title like '%abc%' order by num;
			 */
		 try {
			 ps=con.prepareStatement(sql);
			 rs=ps.executeQuery();
			 while(rs.next()) {
				 Board b=new Board();
				 
				 b.setNum(rs.getInt("num"));
				 b.setTitle(rs.getString("title"));
				 b.setContent(rs.getString("content"));
				 b.setId(rs.getString("id"));
				 b.setPostdate(rs.getTimestamp("postdate"));
				 b.setVisitcount(rs.getInt("visitcount"));
				 
				 list.add(b);
			 }
		 }catch(Exception ex) {
			 ex.printStackTrace();
		 }
		 return list;
	 } 
	 
	 //글 수정하기
	 public int updateBoard(Board board) {
		 int result=0;
		 String sql="update board set title=?, content=? where num=?";
		 try {
			 ps=con.prepareStatement(sql);
			 ps.setString(1,  board.getTitle());
			 ps.setString(2, board.getContent());
			 ps.setInt(3, board.getNum());
			 result=ps.executeUpdate();
			 System.out.println(result + "개의 레코드 수정됨");
			 
		 }catch(Exception ex) {
			 ex.printStackTrace();
		 }
		 return result;
	 }
	 
	 //글 삭제
	 public int deleteBoard(int num) {
		 int result=0;
		 String sql="delete from board where num=?";
		 try {
			 ps=con.prepareStatement(sql);
			 ps.setInt(1, num);
			 result=ps.executeUpdate();
			 System.out.println(result + "개의 레코드 삭제됨");
			 
		 }catch (Exception ex) {
			// TODO: handle exception
			 ex.printStackTrace();
		}
		 
		 return result;
	 }
}
