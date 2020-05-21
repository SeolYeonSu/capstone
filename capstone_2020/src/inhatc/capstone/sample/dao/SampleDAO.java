package inhatc.capstone.sample.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import inhatc.capstone.common.dao.AbstractDAO;

@Repository("sampleDAO")
public class SampleDAO extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectList("sample.selectBoardList", map);
	}
	
	public void insertBoard(Map<String, Object> map) throws Exception{
	    insert("sample.insertBoard", map);
	}
	
	public void updateHitCnt(Map<String, Object> map) throws Exception{
	    update("sample.updateHitCnt", map);
	}
	 
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception{
	    return (Map<String, Object>) selectOne("sample.selectBoardDetail", map);
	}
	
	public void updateBoard(Map<String, Object> map) throws Exception{
	    update("sample.updateBoard", map);
	}

	public void deleteBoard(Map<String, Object> map) throws Exception{
	    update("sample.deleteBoard", map);
	}
	
	public void reportBoard(Map<String, Object> map) throws Exception{
	    insert("sample.reportBoard", map);
	}
	
	@SuppressWarnings("unchecked")
	public int selectReportCheck(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = (Map<String, Object>)selectOne("sample.reportCheck", map);
	  
	    int result = Integer.valueOf(String.valueOf(resultMap.get("RESULT")));
	  
	  return result;
	 }


}
