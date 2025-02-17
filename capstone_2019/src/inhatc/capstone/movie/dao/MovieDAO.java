package inhatc.capstone.movie.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import inhatc.capstone.common.dao.AbstractDAO;
import inhatc.capstone.movie.dto.recoMovieDTO;

@Repository("movieDAO")
public class MovieDAO extends AbstractDAO{
	/*
	public ArrayList<recoMovieDTO> selectData(String DOCID) {
		// TODO Auto-generated method stub
		ArrayList<recoMovieDTO> list = (ArrayList<recoMovieDTO>) selectOne("movie.selectRecoMovie",DOCID); 
		return list;
	}
	*/
	 
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectRecoMovie(Map<String, Object> map) throws Exception{
	    return (Map<String, Object>) selectOne("movie.selectRecoMovie", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCommentMovie(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectList("movie.selectCommentMovie", map);
	}
	
	//유저가 체크를 햇는지 안했는지 확인 1이면 한거 0이면 안한거
	@SuppressWarnings("unchecked")
	public int selectCommentLikeCheck(Map<String, Object> map) {
		// TODO Auto-generated method stub
		Map<String, Object> resultMap = (Map<String, Object>)selectOne("movie.selectCommentLikeCheck", map);
		  
		  int result = Integer.valueOf(String.valueOf(resultMap.get("RESULT")));
		return result;
	}
	

	public void deleteCommentLike(Map<String, Object> map) {
		// TODO Auto-generated method stub
		delete("movie.deleteCommentLike",map);
	}

	public void updateCommentLikeMinus(Map<String, Object> map) {
		// TODO Auto-generated method stub
		update("movie.updateCommentLikeMinus",map);
	}

	public void insertCommentLike(Map<String, Object> map) {
		// TODO Auto-generated method stub
		insert("movie.insertCommentLike",map);
	}

	public void updateCommentLikePlus(Map<String, Object> map) {
		// TODO Auto-generated method stub
		update("movie.updateCommentLikePlus",map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectCommentLike(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("movie.selectCommentLike", map);
	}
	
	public void insertComment(Map<String, Object> map) {
		// TODO Auto-generated method stub
		insert("movie.insertComment",map);
	}
	@SuppressWarnings("unchecked")
	public int selectMovieRating(Map<String, Object> map) {
		// TODO Auto-generated method stub
		Map<String, Object> resultMap = (Map<String, Object>)selectOne("movie.selectMovieRating", map);
		int result = Integer.valueOf(String.valueOf(resultMap.get("RESULT")));
		return result;
	}

	public void updateMovieRating(Map<String, Object> map) {
		// TODO Auto-generated method stub
		update("movie.updateMovieRating",map);
	}

	public void insertMovieRating(Map<String, Object> map) {
		// TODO Auto-generated method stub
		insert("movie.insertMovieRating",map);
	}

	@SuppressWarnings("unchecked")
	public double selectRatingAVG(Map<String, Object> map) {
		// TODO Auto-generated method stub
		Map<String, Object> resultMap = (Map<String, Object>)selectOne("movie.selectRatingAVG",map);
		double result = Double.valueOf(String.valueOf(resultMap.get("RESULT")));
		return result;
	}

	@SuppressWarnings("unchecked")
	public int selectRatingTotal(Map<String, Object> map) {
		// TODO Auto-generated method stub
		Map<String, Object> resultMap = (Map<String, Object>)selectOne("movie.selectRatingTotal",map);
		int result = Integer.valueOf(String.valueOf(resultMap.get("RESULT")));
		return result;
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectRatingEach(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectList("movie.selectRatingEach", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectRatingUser(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("movie.selectRatingUser", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectUserRating(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectList("movie.selectUserRating", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectUserRating2(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("movie.selectUserRating2", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectUserBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectList("movie.selectUserBoard", map);
	}
	
}
