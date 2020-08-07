package dcule.user.dao;

import javax.validation.Valid;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dcule.user.mybatis.UserMapper;
import dcule.user.vo.Authenticate;
import dcule.user.vo.User;

@Repository
public class UserDAOImpl implements UserDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertUser(User user) {
		UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
		userMapper.insertUser(user);
	}

	@Override
	public int idCheck(String users) {
		
		UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
		return userMapper.selectUserIdCount(users);
	}

	@Override
	public Authenticate loginCheck(@Valid Authenticate auth) {
		
		UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
		return userMapper.selectLoginUserName(auth);
	}

	@Override
	public User findById(String userId) {
		UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
		return userMapper.selectUser(userId);
	}

	@Override
	public void modifyUser(@Valid User user) {
		UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
		userMapper.updateUser(user);
	}
	
	

	
	
}
