package inhatc.capstone.sample.service;

import java.util.List;
import java.util.Map;

public interface SampleService {

	List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception;
	
	void insertBoard(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception;
	
	void updateBoard(Map<String, Object> map) throws Exception;
	
	void deleteBoard(Map<String, Object> map) throws Exception;
	
	void reportBoard(Map<String, Object> map) throws Exception;
	
	int selectReportCheck(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectUserStop(Map<String, Object> map) throws Exception;
	
	void insertAdminLog(Map<String, Object> map) throws Exception;
}
