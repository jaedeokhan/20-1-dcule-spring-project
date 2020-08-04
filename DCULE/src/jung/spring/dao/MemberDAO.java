package jung.spring.dao;

import java.util.ArrayList;

import jung.spring.vo.Member;

public interface MemberDAO {

	public ArrayList<Member> getMembers();
	public void insertMember(Member member);
	public void updateMember(Member member);
	public void deleteMember(int id);
	public Member selectUpdateMember(int id);

}
