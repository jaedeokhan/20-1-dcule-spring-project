package dcule.user.vo;

import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

import org.junit.BeforeClass;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class UserTest2 {
	private static final Logger log = LoggerFactory.getLogger(UserTest2.class);
	
	private static Validator validator;
	
	@BeforeClass
	public static void setUp() {
		ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
		validator = factory.getValidator();
	}
	
	@Test(expected = IllegalArgumentException.class)
	public void updateWhenMisMatchUserId() throws Exception{
		// 사용자 아이디가 맞지 않은 경우 
		User user = new User("userId", "password", "name", "java@test.com");
		User updateUser = new User("user", "password", "name2", "java2@test.com");
		User updatedUser = user.update(updateUser);
	}
}
