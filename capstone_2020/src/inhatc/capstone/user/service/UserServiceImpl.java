package inhatc.capstone.user.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import inhatc.capstone.user.dao.UserDAO;
import inhatc.capstone.user.dto.UserDTO;

@Service("userService")
public class UserServiceImpl implements UserService{
	@Resource(name="userDAO")
	private UserDAO userDAO;
	
	@Override
	 public int selectUserID(Map<String, Object> map) throws Exception {
	  return userDAO.selectUserID(map);
	 }

	@Override
	public void insertUserData(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		userDAO.insertUserData(map);
	}
	
	@Override
	 public Map<String, Object> selectUserInfo(Map<String, Object> map) throws Exception {
	  return userDAO.selectUserInfo(map);
	 }

	@Override
	public int selectRpcCheck(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return userDAO.selectRpcCheck(map);
	}

	@Override
	public void updateRpcCheck(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		userDAO.updateRpcCheck(map);
		
	}

	@Override
	public Map<String, Object> selectUserStop(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return userDAO.selectUserStop(map);
	}
	
	@Override
	public void updateUsStart(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		userDAO.updateUsStart(map);
	}

	@Override
	public void updateUsEnd(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		userDAO.updateUsEnd(map);
	}

	@Override
	public void deleteUserStop(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		userDAO.deleteUserStop(map);
		
	}

}
