package inhatc.capstone.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import inhatc.capstone.common.dao.AbstractDAO;

@Repository("adminDAO")
public class AdminDAO extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectReportList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectList("admin.selectReportList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectRpComList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectList("admin.selectRpComList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectLogList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectList("admin.selectLogList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectUserList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectList("admin.selectUserList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectReportBoard(Map<String, Object> map) throws Exception{
	    return (List<Map<String, Object>>) selectList("admin.selectReportBoard", map);
	}
	
	public void deleteBoard(Map<String, Object> map) throws Exception{
	    update("admin.deleteBoard", map);
	}
	
	public void updateReport(Map<String, Object> map) throws Exception{
	    update("admin.updateReport", map);
	}
	
	public void insertRpCompleted(Map<String, Object> map) throws Exception{
	    insert("admin.insertRpCompleted", map);
	}
	
	public void updateRpcom(Map<String, Object> map) throws Exception{
	    update("admin.updateRpcom", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectUserStop(Map<String, Object> map) throws Exception {
		return (Map<String, Object>)selectOne("admin.selectUserStop", map);
	}
	
	public void insertUserStop(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		insert("admin.insertUserStop", map);
	}
	
	public void updateUsDay(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		update("admin.updateUsDay", map);
	}
	
	public void updateUsEnd(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		update("admin.updateUsEnd", map);
	}

}
