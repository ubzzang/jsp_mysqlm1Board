package dao;

import common.MysqlConnect;
import dto.Member;

public class MemberDAO extends MysqlConnect{
	public MemberDAO() {};
	
	//회원가입
	public int insertMamber(Member member) {
		String sql="insert into member(id,pass,name) values(?,?,?)";
		int result=0;
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, member.getId());
			ps.setString(2, member.getPass());
			ps.setString(3, member.getName());
			
			result=ps.executeUpdate();
			if(result==1) {
				System.out.println("회원가입 성공");
			}
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return result;
	}
}
