package jung.spring.svc;

import java.util.ArrayList;
import java.util.List;

import jung.spring.vo.Member;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import jung.spring.dao.MemberDAO;
@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public ArrayList<Member> getMembers() {
		// TODO Auto-generated method stub
		ArrayList<Member> memberList = memberDAO.getMembers();
		return memberList;
	}

	@Override
	public void addMember(Member member) {
		// TODO Auto-generated method stub
		memberDAO.insertMember(member);
	}

    public void removeMember(int id) {
    	memberDAO.deleteMember(id);
    }
    
    public Member getModifyMember(int id){
    	Member member = memberDAO.selectUpdateMember(id);
    	return member;
    }
    public void modifyMember(Member member) {
        memberDAO.updateMember(member);
    }
}
