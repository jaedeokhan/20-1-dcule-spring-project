package jung.spring.mybatis;

import java.util.ArrayList;

import jung.spring.vo.Member;

public interface MemberMapper {
	ArrayList<Member> getMembers();
	void insertMember(Member member);
	void updateMember(Member member);
	void deleteMember(int id);
	Member getUpdateMember(int id);
}
