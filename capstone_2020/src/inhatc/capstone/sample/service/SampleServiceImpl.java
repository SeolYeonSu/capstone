package inhatc.capstone.sample.service;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import inhatc.capstone.sample.dao.SampleDAO;

@Service("sampleService")
public class SampleServiceImpl implements SampleService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="sampleDAO")
	private SampleDAO sampleDAO; //bean을 수동으로 작성한 예
	
	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return sampleDAO.selectBoardList(map);
	}
	
	@Override
	public void insertBoard(Map<String, Object> map) throws Exception {
	    sampleDAO.insertBoard(map);
	}
	
	@Override
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception {
	    sampleDAO.updateHitCnt(map);
	    Map<String, Object> resultMap = sampleDAO.selectBoardDetail(map);
	    return resultMap;
	}

	@Override
	public void updateBoard(Map<String, Object> map) throws Exception{
	    sampleDAO.updateBoard(map);
	}

	@Override
	public void deleteBoard(Map<String, Object> map) throws Exception {
	    sampleDAO.deleteBoard(map);
	}

	@Override
	public void reportBoard(Map<String, Object> map) throws Exception {
		sampleDAO.reportBoard(map);
		
	}
	
	@Override
	public int selectReportCheck(Map<String, Object> map) throws Exception {
		return sampleDAO.selectReportCheck(map);
	}

	@Override
	public Map<String, Object> selectUserStop(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = sampleDAO.selectUserStop(map);
	    return resultMap;
	}

	@Override
	public void insertAdminLog(Map<String, Object> map) throws Exception {
		sampleDAO.insertAdminLog(map);
		
	}

}
