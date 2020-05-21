package inhatc.capstone.common.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

public class AbstractDAO {
	protected Logger log = LoggerFactory.getLogger(this.getClass());
    
    @Autowired
    private SqlSessionTemplate sqlSession;
 
    
    protected void printQueryId(String queryId) {
        if (log.isDebugEnabled())
        {
            log.debug("\t Query ID \t: " + queryId);
        }
    }
    
    public Object insert(String queryId, Object params){
        printQueryId(queryId);
        return sqlSession.insert(queryId, params);
    }
 
    public Object update(String queryId, Object params){
        printQueryId(queryId);
        return sqlSession.update(queryId, params);
    }
 
    public Object delete(String queryId, Object params){
        printQueryId(queryId);
        return sqlSession.delete(queryId, params);
    }

    public Object selectOne(String queryId){
        printQueryId(queryId);
        return sqlSession.selectOne(queryId); 
        //누가만든거냐 그 블로그에서 만든거지
        
        //여기서 가지고 오는게 저기 xml 파일이랑 이게 연결이 어던식으로 되어있는지 모르겠어
        
    }
 
    public Object selectOne(String queryId, Object params){
        printQueryId(queryId);
        return sqlSession.selectOne(queryId, params);
    }
 
    @SuppressWarnings("rawtypes")
    public List selectList(String queryId){
        printQueryId(queryId);
        return sqlSession.selectList(queryId);
    }
 
    @SuppressWarnings("rawtypes")
    public List selectList(String queryId, Object params){
        printQueryId(queryId);
        return sqlSession.selectList(queryId,params);
    }
}
