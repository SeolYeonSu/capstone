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
	
	@SuppressWarnings("unchecked")
	 public int selectRpcCheck(Map<String, Object> map) throws Exception {
	  Map<String, Object> resultMap = (Map<String, Object>)selectOne("user.selectRpcCheck", map);
	  
	  int result = Integer.valueOf(String.valueOf(resultMap.get("RESULT")));
	  
	  return result;
	 }
	
	public void updateRpcCheck(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		update("user.updateRpcCheck", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectUserStop(Map<String, Object> map) throws Exception {
		return (Map<String, Object>)selectOne("user.selectUserStop", map);
	}
	
	public void updateUsStart(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		update("user.updateUsStart", map);
	}
	
	public void updateUsEnd(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		update("user.updateUsEnd", map);
	}
	
	public void deleteUserStop(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		update("user.deleteUserStop", map);
	}
}
