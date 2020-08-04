package jung.spring.svc;

import java.util.ArrayList;

import jung.spring.vo.Member;

public interface MemberService {
	public ArrayList<Member> getMembers();
	public void addMember(Member member);
	public void removeMember(int id);
	public Member getModifyMember(int id);
	public void modifyMember(Member member);
}
