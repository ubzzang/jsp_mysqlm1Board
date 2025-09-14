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
	public Member getMember(String id, String pass) {
		Member member=null;
		String sql="select * from member where id=? and pass=?";
		
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pass);
			rs=ps.executeQuery();
			if(rs.next()) {
				member=new Member();
				member.setId(rs.getString("id"));
				member.setPass(rs.getString("pass"));
				member.setName(rs.getString("name"));
				member.setRegidate(rs.getDate("regidate"));
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return member;
	}
	
	public Member getMemberById(String id) {
        Member member = null;
        String sql = "SELECT * FROM member WHERE id=?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                member = new Member();
                member.setId(rs.getString("id"));
                member.setName(rs.getString("name"));
                member.setRegidate(rs.getDate("regidate"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return member;
    }
	
	public int updatePassword(String id, String newPass) {
	    int result = 0;
	    String sql = "UPDATE member SET pass=? WHERE id=?";
	    try {
	        ps = con.prepareStatement(sql);
	        ps.setString(1, newPass);
	        ps.setString(2, id);
	        result = ps.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return result;
	}

}
