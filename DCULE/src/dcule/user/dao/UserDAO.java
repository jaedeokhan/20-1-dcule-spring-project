package dcule.user.dao;

import javax.validation.Valid;

import dcule.user.vo.Authenticate;
import dcule.user.vo.User;

public interface UserDAO {
	
	public void insertUser(User user);

	public int idCheck(String users);

	public Authenticate loginCheck(@Valid Authenticate auth);

	public User findById(String userId);

	public void modifyUser(@Valid User user);
	
}
