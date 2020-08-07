package dcule.user.svc;

import javax.validation.Valid;

import dcule.user.vo.Authenticate;
import dcule.user.vo.User;

public interface UserService {

	public void addUser(User user); // 회원 가입
	public int idCheck(String users);// 회원 가입 아이디 체크 위한 아이디 가져오기
	public Authenticate loginCheck(@Valid Authenticate authenticate); // 로그인 위해 아이디, 비밀번호 체크
	public User findById(String userId);
	public void modifyUser(@Valid User user);
	
}
