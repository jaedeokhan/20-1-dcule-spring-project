package dcule.user.domain.user;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

import java.util.Set;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

import org.junit.BeforeClass;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dcule.user.vo.User;
import dcule.user.vo.UserTest2;

public class UserTest {

	private static final Logger log = LoggerFactory.getLogger(UserTest2.class);

	private static Validator validator;

	@BeforeClass
	public static void setUp() {
		ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
		validator = factory.getValidator();
	}

	@Test
	public void UserIdWhenIsEmpty() {
		User user = new User("", "password", "userName", "userEmail@cu.ac.kr");
		Set<ConstraintViolation<User>> constraintViolation = validator.validate(user);
		assertThat(constraintViolation.size(), is(2));
	}

}
