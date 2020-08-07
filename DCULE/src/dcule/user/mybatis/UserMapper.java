package dcule.user.mybatis;

import javax.validation.Valid;

import dcule.user.vo.Authenticate;
import dcule.user.vo.User;

public interface UserMapper {
	void insertUser(User user);    //  회원가입
	int selectUserIdCount(String users); //  회원가입 아이디 중복 체크
	Authenticate selectLoginUserName(@Valid Authenticate authe); // 로그인 
	User selectUser(String userId); // 회원정보수정 데이터 출력 
	void updateUser(@Valid User user); // 회원정보수정
	
	
}
