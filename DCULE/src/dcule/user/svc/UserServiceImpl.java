package dcule.user.svc;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dcule.user.dao.UserDAO;
import dcule.user.vo.Authenticate;
import dcule.user.vo.User;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDAO userDAO;
	
	@Override
	public void addUser(User user) {
		userDAO.insertUser(user);
	}

	@Override
	public int idCheck(String users) {
		return userDAO.idCheck(users);
	}

	@Override
	public Authenticate loginCheck(@Valid Authenticate auth) {
		return userDAO.loginCheck(auth);
	}

	@Override
	public User findById(String userId) {
		return userDAO.findById(userId);
	}

	@Override
	public void modifyUser(@Valid User user) {
		userDAO.modifyUser(user);
		
	}



}
