package dcule.user.vo;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

public class Authenticate {
	
	@NotEmpty(message="아이디를 입력해주세요.")
	@Size(min=4, max=12, message="아이디를 4~12자리 입력해주세요.")
	private String userId;
	
	@NotEmpty(message="비밀번호를 입력해주세요.")
	@Size(min=4, max=12, message="비밀번호를 4~12자리 입력해주세요.")
	private String userPassword1;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPassword1() {
		return userPassword1;
	}
	public void setUserPassword1(String userPassword1) {
		this.userPassword1 = userPassword1;
	}
	
	
}
