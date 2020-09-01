package dcule.user.vo;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class User {
	
	@NotEmpty(message="아이디를 입력해주세요.")
	@Size(min=4, max=12, message="아이디를 4~12자리 입력해주세요.")
	private String userId;
	
	@NotEmpty(message="비밀번호를 입력해주세요.")
	@Size(min=4, max=12, message="비밀번호를 4~12자리 입력해주세요.")
	private String userPassword1;
	
	@NotEmpty(message="별명을 입력해주세요.")
	@Size(min=4, max=12, message="별명을 4~12자리를 입력해주세요.")
	private String userName;
	
	@NotEmpty(message="이메일을 입력해주세요.")
	@Email(message="이메일 형식으로 입력해주세요.")
	@Pattern(regexp = "^[a-zA-Z0-9+-_.]+@(cu|CU)\\.(ac|AC)\\.(kr|KR)$", message="@cu.ac.kr과 같은 대구가톨릭대학교 이메일을 사용해주세요.")
	private String userEmail;
	
	private String userEmailHash;
	private boolean userEmailChecked;
	
	public User(){
		
	}

	public User(
			@NotEmpty(message = "아이디를 입력해주세요.") @Size(min = 4, max = 12, message = "아이디를 4~12자리 입력해주세요.") String userId,
			@NotEmpty(message = "비밀번호를 입력해주세요.") @Size(min = 4, max = 12, message = "비밀번호를 4~12자리 입력해주세요.") String userPassword1,
			@NotEmpty(message = "별명을 입력해주세요.") @Size(min = 4, max = 12, message = "별명을 4~12자리를 입력해주세요.") String userName,
			@NotEmpty(message = "이메일을 입력해주세요.") @Email(message = "이메일 형식으로 입력해주세요.") @Pattern(regexp = "^[a-zA-Z0-9+-_.]+@(cu|CU)\\.(ac|AC)\\.(kr|KR)$", message = "@cu.ac.kr과 같은 대구가톨릭대학교 이메일을 사용해주세요.") String userEmail
			) {

		this.userId = userId;
		this.userPassword1 = userPassword1;
		this.userName = userName;
		this.userEmail = userEmail;
	}

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
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserEmailHash() {
		return userEmailHash;
	}
	public void setUserEmailHash(String userEmailHash) {
		this.userEmailHash = userEmailHash;
	}
	public boolean isUserEmailChecked() {
		return userEmailChecked;
	}
	public void setUserEmailChecked(boolean userEmailChecked) {
		this.userEmailChecked = userEmailChecked;
	}
	@Override
	public String toString() {
		return "User [userId=" + userId + ", userPassword1=" + userPassword1 + ", userName=" + userName + ", userEmail="
				+ userEmail + ", userEmailHash=" + userEmailHash + ", userEmailChecked=" + userEmailChecked + "]";
	}

	/*
	 * public boolean matchPassword(Authenticate authenticate) { if
	 * (this.userPassword1 == null) { return false; }
	 * 
	 * return authenticate.matchPassword(this.userPassword1); }
	 */
	
	public boolean matchUserId(String sessionUserId) {
		if (sessionUserId == null) {
			return false;
		}
		return sessionUserId.equals(this.userId); 
	}
	
	public User update(User updateUser) {
		if (!matchUserId(updateUser.userId)) { // inputUserId가 userId와 매치가 안될때
			throw new IllegalArgumentException();
		}
		return new User(this.userId, updateUser.userPassword1, updateUser.userName, updateUser.userEmail);
	}
	
}
