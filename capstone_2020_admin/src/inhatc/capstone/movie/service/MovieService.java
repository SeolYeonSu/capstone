package inhatc.capstone.movie.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.w3c.dom.Document;
import org.w3c.dom.NodeList;

import inhatc.capstone.movie.dto.MovieDTO;
import inhatc.capstone.movie.dto.recoDTO;
import inhatc.capstone.movie.dto.recoMovieDTO;

public interface MovieService {
	
	Document getDOC(String title);//영화 검색
	
	ArrayList<MovieDTO> getLodeList(NodeList nl); //노드 리스트 받아오기

	Document getDOC(String movieId, String movieSeq);
	
	//영화 추천기능
	String inputCommand(String DOCID);
	
	ArrayList<recoDTO> execCommand(String command) throws InterruptedException;
	
	//db
	Map<String, Object> selectRecoMovie(Map<String, Object> map) throws Exception;
	
	//db (comments 댓글)
	List<Map<String, Object>> selectCommentMovie(Map<String, Object> map) throws Exception;
	
	//좋아요 눌럿는지 확인하는 것
	int selectCommentLikeCheck(Map<String, Object> map);
	
	//좋아요 삭제
	void deleteCommentLike(Map<String, Object> map);
	
	//좋아요 -1
	void updateCommentLikeMinus(Map<String, Object> map);

	//좋아요  등록
	void insertCommentLike(Map<String, Object> map);
	
	//좋아요 +1
	void updateCommentLikePlus(Map<String, Object> map);
	
	//좋아요 갯수
	Map<String, Object> selectCommentLike(Map<String, Object> map);
	
	//댓글 등록
	void insertComment(Map<String, Object> map);
	
	//별점 등록 확인
	int selectMovieRating(Map<String, Object> map);
	
	//별점 등록 수정
	void updateMovieRating(Map<String, Object> map);
	
	//별점 등록
	void insertMovieRating(Map<String, Object> map);
	
	//이 영화의 평균 점수
	double selectRatingAVG(Map<String, Object> map);
	
	//이 영화의 총 추천 개수
	int selectRatingTotal(Map<String, Object> map);
	
	//각각의 별점개수 가져오기
	List<Map<String, Object>> selectRatingEach(Map<String, Object> map);
	
	//유저가 검색한 영화에 대해  추천한 기록이 있는지 가져오기 (추천점수)
	Map<String, Object> selectRatingUser(Map<String, Object> map);

	List<Map<String, Object>> selectUserRating(Map<String, Object> commandMap);

	Map<String, Object> selectUserRating2(Map<String, Object> commandMap);

	List<Map<String, Object>> selectUserBoard(Map<String, Object> commandMap);
	

	
	//새로운 db
	//ArrayList<recoMovieDTO> selectData(String sql);
}
