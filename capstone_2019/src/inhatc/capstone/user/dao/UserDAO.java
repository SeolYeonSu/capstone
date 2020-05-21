package inhatc.capstone.user.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import inhatc.capstone.common.dao.AbstractDAO;
import inhatc.capstone.user.dto.UserDTO;

@Repository("userDAO")
public class UserDAO extends AbstractDAO{
	@SuppressWarnings("unchecked")
	 public int selectUserID(Map<String, Object> map) throws Exception {
	  Map<String, Object> resultMap = (Map<String, Object>)selectOne("user.selectUserID", map);
	  
	  int result = Integer.valueOf(String.valueOf(resultMap.get("RESULT")));
	  
	  return result;
	 }

	public void insertUserData(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		insert("user.insertUserData", map);
	}
	
	@SuppressWarnings("unchecked")
	 public Map<String, Object> selectUserInfo(Map<String, Object> map) throws Exception {
	  return (Map<String, Object>)selectOne("user.selectUserInfo", map);
	 }

}
