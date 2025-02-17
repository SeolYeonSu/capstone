package inhatc.capstone.user.service;

import java.util.Map;

import inhatc.capstone.user.dto.UserDTO;

public interface UserService {

	void insertUserData(Map<String, Object> map) throws Exception;

	int selectUserID(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectUserInfo(Map<String, Object> map) throws Exception;
}
