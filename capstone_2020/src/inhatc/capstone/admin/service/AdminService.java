package inhatc.capstone.admin.service;

import java.util.List;
import java.util.Map;

public interface AdminService {

	List<Map<String, Object>> selectReportList(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> selectRpComList(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> selectLogList(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> selectUserList(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> selectReportBoard(Map<String, Object> map) throws Exception;
	void deleteBoard(Map<String, Object> map) throws Exception;
	void updateReport(Map<String, Object> map) throws Exception;
	void insertRpCompleted(Map<String, Object> map) throws Exception;
	void updateRpcom(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectUserStop(Map<String, Object> map) throws Exception;
	void insertUserStop(Map<String, Object> map) throws Exception;
	void updateUsDay(Map<String, Object> map) throws Exception;
	void updateUsEnd(Map<String, Object> map) throws Exception;
	
}
