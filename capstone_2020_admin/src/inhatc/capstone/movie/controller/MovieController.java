package inhatc.capstone.movie.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.NodeList;

import inhatc.capstone.common.map.CommandMap;
import inhatc.capstone.movie.dao.MovieDAO;
import inhatc.capstone.movie.dto.Jamong;
import inhatc.capstone.movie.dto.JamongDTO;
import inhatc.capstone.movie.dto.MovieDTO;
import inhatc.capstone.movie.dto.commentDTO;
import inhatc.capstone.movie.dto.recoDTO;
import inhatc.capstone.movie.dto.recoMovieDTO;
import inhatc.capstone.movie.service.MovieService;
import inhatc.capstone.movie.service.MovieServiceImpl;
import inhatc.capstone.user.dto.UserDTO;

@Controller
public class MovieController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="movieService")
	MovieService movieService;
	
	@RequestMapping(value="/movie/openSearchResult.do")
    public ModelAndView openMovieSearchResult(CommandMap commandMap) throws Exception{
        String title = commandMap.get("searchMovie").toString();// 매핑된 객체의 title을 가지고오기
        System.out.println(title);
        
        MovieServiceImpl MS = new MovieServiceImpl();
        
        NodeList nl = MS.getDOC(title).getElementsByTagName("Result");
        ArrayList<MovieDTO> list= MS.getLodeList(nl);
        
        
		ModelAndView mv = new ModelAndView("movie/searchResult"); 
		//mv.addObject("movieName",commandMap.get("searchMovie"));
		mv.addObject("list",list);
        return mv;
    }
	

	@RequestMapping(value="/movie/openDetailResult.do")
    public ModelAndView openMovieDetailResult(CommandMap commandMap,HttpServletRequest request) throws Exception{
        String movieId = commandMap.get("movieId").toString();// 매핑된 객체의 title을 가지고오기
        String movieSeq = commandMap.get("movieSeq").toString();
        String DOCID = movieId.trim() + movieSeq.trim();
        
        System.out.println(DOCID);
        
        
        
        MovieServiceImpl MS = new MovieServiceImpl();//movieservice로 받을수있나 확인해보기
        
        
        /*============================================================================
         * 외부 API를 통해 영화 데이터를 가지고 옴
         ============================================================================*/
        NodeList nl = MS.getDOC(movieId,movieSeq).getElementsByTagName("Result");
        ArrayList<MovieDTO> list = MS.getLodeList(nl); //최종 결과를 list에 넣음
        
        
        /*============================================================================
         * 추천 기능 : 파이썬을 통해 상관 관계가 높은 5개의 영화를 불러옴
         ============================================================================*/
        commandMap.clear(); //commandMap 내부에 있는 데이터 지우기
        
        String command = MS.inputCommand(DOCID);
        ArrayList<recoDTO> recoList = MS.execCommand(command); //파이썬을 통해 cmd에 명령
        
        ArrayList<recoMovieDTO> recoMovieList = new ArrayList<recoMovieDTO>(); //돌리면서 받아올 list
        
        for(int i = 0; i < recoList.size(); i++) {
        	recoMovieDTO rmd = new recoMovieDTO();
        	String tempDOCID = recoList.get(i).getDOCID();
 
        	commandMap.put("DOCID", tempDOCID);
        	
        	//Map<String,Object> map = MS.selectRecoMovie(commandMap.getMap());
        	Map<String,Object> map = movieService.selectRecoMovie(commandMap.getMap());
        	/*
        	for(String key : map.keySet()) {
        		System.out.println(key + map.get(key));
        	}
        	*/
        	rmd.setMovieId(map.get("MOVIEID").toString());
        	
        	rmd.setMovieSeq(map.get("MOVIESEQ").toString());
        	System.out.println(map.get("MOVIESEQ").toString());
        	rmd.setMovieName(map.get("MOVIE_NAME").toString());
        	rmd.setImg(map.get("IMG").toString());
        	
        	/*
        	System.out.println(map.get("MOVIEID").toString());
        	System.out.println(map.get("MOVIESEQ").toString());
        	System.out.println(map.get("MOVIE_NAME").toString());
        	System.out.println(map.get("IMG").toString());
        	*/
        	recoMovieList.add(rmd);
        	//rmd = null;
        	commandMap.clear();
        }
        
        
        /*============================================================================
         * 별점 표현 : DOCID를 통해 영화의 평점 및 각각의 별점을 보여줄 수 있게 함
         ============================================================================*/
        //commandMap clear()
        commandMap.clear();
        commandMap.put("DOCID", DOCID);
        
        //이 영화의 평균 점수 select
        double dbRatingAVG = 0;
        String ratingAVG = "";
        if(movieService.selectRatingAVG(commandMap.getMap()) == 0) {
        	//이영화에 대해 아무도 추천하지 않았음
        	ratingAVG = "평점 수집중..";
        }else {
        	dbRatingAVG = movieService.selectRatingAVG(commandMap.getMap());
        	ratingAVG = String.format("%.1f",dbRatingAVG);
        }
  
        //이 영화의 총 추천 개수
        int ratingAll = movieService.selectRatingTotal(commandMap.getMap());
        
        //이 영화의 각각의 별점 개수 (뷰로 보내는건 퍼센트만 보냄) 만약 ratings에 값이 없다면 0으로 하는 것도 생각해보기
		String five_CNT = "0";	double five_AVG = 0;
        String four_CNT = "0";	double four_AVG = 0;
        String three_CNT = "0";	double three_AVG = 0;
        String two_CNT = "0";	double two_AVG = 0;
        String one_CNT = "0";	double one_AVG = 0;
        
        List<Map<String,Object>> ratingList = movieService.selectRatingEach(commandMap.getMap());
        for (int i = 0; i < ratingList.size(); i++) {
        	if(ratingList.get(i).get("RATINGS").toString().equals("5")) {
        		five_CNT = ratingList.get(i).get("RT_CNT").toString();
        	}else if(ratingList.get(i).get("RATINGS").toString().equals("4")) {
        		four_CNT = ratingList.get(i).get("RT_CNT").toString();
        	}else if(ratingList.get(i).get("RATINGS").toString().equals("3")) {
        		three_CNT = ratingList.get(i).get("RT_CNT").toString();
        	}else if(ratingList.get(i).get("RATINGS").toString().equals("2")) {
        		two_CNT = ratingList.get(i).get("RT_CNT").toString();
        	}else if(ratingList.get(i).get("RATINGS").toString().equals("1")) {
        		one_CNT = ratingList.get(i).get("RT_CNT").toString();
        	}
		}
        //String 형식인 %_CNT를 double 형식으로 바꿔주고 각각 평균을 구한다. 여기서 CNT가 0일 경우는 바꾸지 않는다.
        if(!five_CNT.equals("0")) {
        	five_AVG = (Double.valueOf(String.valueOf(five_CNT))/ratingAll)*100;
        }
        if(!four_CNT.equals("0")) {
        	four_AVG = (Double.valueOf(String.valueOf(four_CNT))/ratingAll)*100;
        }
        if(!three_CNT.equals("0")) {
        	three_AVG = (Double.valueOf(String.valueOf(three_CNT))/ratingAll)*100;
        }
        if(!two_CNT.equals("0")) {
        	two_AVG = (Double.valueOf(String.valueOf(two_CNT))/ratingAll)*100;
        }
        if(!one_CNT.equals("0")) {
        	one_AVG = (Double.valueOf(String.valueOf(one_CNT))/ratingAll)*100;
        }
        //빈 객체 넘길거 만들기
        HashMap<String,Object> ratingAVGList = new HashMap<String,Object>();
        ratingAVGList.put("five_AVG", String.format("%.1f",five_AVG));
        ratingAVGList.put("four_AVG", String.format("%.1f",four_AVG));
        ratingAVGList.put("three_AVG", String.format("%.1f",three_AVG));
        ratingAVGList.put("two_AVG", String.format("%.1f",two_AVG));
        ratingAVGList.put("one_AVG", String.format("%.1f",one_AVG));
        
        
        
        /*============================================================================
         * 유저와 비회원의 구분 만약 회원이라면 이 영화에 추천 기록을 확인 없다면 String 아직 추천을 하지 않았습니다. 전송
         ============================================================================*/
        commandMap.clear();
        
        String UserRatingStar = "";
        Map<String, Object> MV_UserRating ;
        if((Map<String, Object>) request.getSession().getAttribute("loginInfo")==null) {
        	System.out.println("non-Member");
        	UserRatingStar = "로그인 해주세요!";
        }else {
        	Map<String, Object> user_id = (Map<String, Object>) request.getSession().getAttribute("loginInfo");
        	System.out.println(user_id.get("ID"));
        	String USER = user_id.get("ID").toString();
        	commandMap.put("DOCID", DOCID);
        	commandMap.put("ID", USER);
        	
        	/*
        	MV_UserRating = movieService.selectRatingUser(commandMap.getMap());
        	if(MV_UserRating.get("RATINGS") == null){
        		UserRatingStar = "추천해주시기바랍니다.";
        	}else {
        		UserRatingStar = MV_UserRating.get("RATINGS").toString();
        	}
        	System.out.println(UserRatingStar);
        	*/
        	if(movieService.selectRatingUser(commandMap.getMap())==null) {
        		UserRatingStar = "평점을 주세요!";
        	}else {
        		MV_UserRating = movieService.selectRatingUser(commandMap.getMap());
        		UserRatingStar = MV_UserRating.get("RATINGS").toString();
        	}
        	System.out.println(UserRatingStar);
        }
        
        //
        
        /*============================================================================
         * 댓글 기능 : DOCID를 통해 댓글을 가지고 옴
         ============================================================================*/
        //commandMap 클리어
        //commandMap에다가 객체 넣어줌
        commandMap.clear();
        commandMap.put("DOCID", DOCID);
        List<Map<String, Object>> commentList = movieService.selectCommentMovie(commandMap.getMap());
        
        
        
        /*============================================================================
         * 최종 : 뷰에다가 필요한 객체들을 넣어줌
         ============================================================================*/
		ModelAndView mv = new ModelAndView("movie/detailResult"); 
		mv.addObject("list",list);
		mv.addObject("recoList",recoMovieList);
		mv.addObject("commentList",commentList);
		mv.addObject("ratingAVG",ratingAVG);
		mv.addObject("ratingAll",ratingAll);
		mv.addObject("ratingAVGList",ratingAVGList);
		mv.addObject("UserRatingStar",UserRatingStar);
        return mv;
    }
	
	
	/*
	 * 여긴 테스트하는 페이지
	 */
	@RequestMapping(value="/movie/openRecommendResult.do")
	public ModelAndView openMovieRecommendResult(CommandMap commandMap, HttpServletRequest request) throws Exception{
		
		
		Map<String, Object> testmap = (Map<String, Object>) request.getSession().getAttribute("loginInfo");
		
		System.out.println(testmap.get("ID"));
		ModelAndView mv = new ModelAndView("movie/recommendResult"); 
		

		
        return mv;
        
	}
	
	
	/*
	 * AJAX TEST
	 * 
	 */ 
	@RequestMapping(value="/movie/CommentLike.do")
	@ResponseBody
	public Object checkComment(HttpServletRequest request, commentDTO CDTO) throws Exception {
		System.out.println("in");
		System.out.println(CDTO.getPARENT_IDX());
		@SuppressWarnings("unchecked")
		Map<String, Object> user_id = (Map<String, Object>) request.getSession().getAttribute("loginInfo");
		System.out.println(user_id.get("ID"));
		String USER = user_id.get("ID").toString();
		String PIDX = CDTO.getPARENT_IDX();
		//db select
		//alert(IDX);
				//컨트롤러에 IDX를 보내고
				//우선 ID세션을 가지고 오는데 있는지 없는지확인하고
				//없으면
				//그냥 바로 리턴해서 결과값 -1 주고 alert("로그인 부탁명령") 
				//있으면
				//컨트롤러에서 IDX와 ID를 이용해 COMMENT_LIKE에서 select count를 해서 값을 받고
				//그 값이 1이면 이미 카운트를 한 것이니까 
				// (1)<delete?>MV_COMMENT_LIKE 에서 해당 IDX에 아이디 행을 삭제
				// (2)<update>MV_COMMENT 테이블에서 해당 IDX에 있는 COMMENTS_LIKE 속성에서 -1 하기
				// (3)return 으로 <select> MV_COMMENT 테이블에서 해당 IDX에 있는 COMMENTS_LIKE를 받아와서 보냄
				//그 값이 0이면 아직 카운트를 안 한 것이니까
				// (1)<insert>MV_COMMENT_LIKE 에서 해당 IDX에 아이디 삽입
				// (2)<update>MV_COMMENT 테이블에서 해당 IDX에 있는 COMMENTS_LIKE 속성에 +1 하기
				// (3)return 으로 <select> MV_COMMENT 테이블에서 해당 IDX에 있는 COMMENTS_LIKE를 받아와서 보냄
		CommandMap commandMap = new CommandMap();
		commandMap.put("PARENT_IDX", PIDX);
		commandMap.put("CLICK_ID", USER);
		
		//1이면 추천한거 0이면 추천 안한거
		int checkLike = movieService.selectCommentLikeCheck(commandMap.getMap()); //여기서 추천했는지 안했는지 확인
		System.out.println("checktLike : "+checkLike);
		
		if(checkLike == 1) {
			//좋아요를 이미 누른 상태
			// 좋아요 삭제
			movieService.deleteCommentLike(commandMap.getMap());
			// 해당 IDX에서 좋아요 -1
			movieService.updateCommentLikeMinus(commandMap.getMap());
			
		}else {
			//좋아요를 처음으로 누른 상태
			//좋아요 등록
			movieService.insertCommentLike(commandMap.getMap());
			//해당 IDX에서 좋아요 +1
			movieService.updateCommentLikePlus(commandMap.getMap());
		}
		
		Map<String,Object> commentLike = movieService.selectCommentLike(commandMap.getMap());
		String LIKE_CNT = commentLike.get("COMMENTS_LIKE").toString();
		System.out.println(LIKE_CNT);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("LIKE_CNT", LIKE_CNT);
		map.put("IDX", PIDX);
		
		return map;
		
	}
	
	
	
	/*============================================================================
     * 댓글 등록
     ============================================================================*/
	@RequestMapping(value="/bbs/insertComment.do")
	public ModelAndView insertComment(CommandMap commandMap, HttpServletRequest request) throws Exception{
		System.out.println("in");
		//로그인 아이디
		@SuppressWarnings("unchecked")
		Map<String, Object> user_id = (Map<String, Object>) request.getSession().getAttribute("loginInfo");
		System.out.println(user_id.get("ID"));
		String USER = user_id.get("ID").toString();
		
		//MovieID 랑 MovieSEQ 받아서 DOCID 만들기
		String movieId = commandMap.get("movieId").toString();
        String movieSeq = commandMap.get("movieSeq").toString();
        String DOCID = movieId.trim() + movieSeq.trim();
        
		//COMMENTS 받은거 
		String COMMENTS = commandMap.get("COMMENTS").toString();
		
		//CommandMap 초기화 하고 저 위에 3가지 다 넣어놓고
		commandMap.clear();
		commandMap.put("CREA_ID", USER);
		commandMap.put("DOCID", DOCID);
		commandMap.put("COMMENTS", COMMENTS);
		
		//DB문 실행 (insert)
		movieService.insertComment(commandMap.getMap());
		
		
		//Map 생성 하는데 redirect : movie detail로 가게끔 
		ModelAndView mv = new ModelAndView("redirect:/movie/openDetailResult.do");
		
		//근데 여기서 다시 열릴려면 movieId 랑 movieSeq를 map에 함께 동봉해서 보내줘야할듯 
		mv.addObject("movieId", movieId);
		mv.addObject("movieSeq", movieSeq);
		
		return mv;

	}
	
	
	/*============================================================================
     * 평점 등록 or 평점 수정
     ============================================================================*/
	@RequestMapping(value="bbs/movie/movieReco.do")
	public ModelAndView movieReco(CommandMap commandMap, HttpServletRequest request) throws Exception{
		System.out.println("in");
		
		//id 값
		@SuppressWarnings("unchecked")
		Map<String, Object> user_id = (Map<String, Object>) request.getSession().getAttribute("loginInfo");
		System.out.println(user_id.get("ID"));
		String USER = user_id.get("ID").toString();
		
		//DOCID 값 (movieId, movieSeq)
		String movieId = commandMap.get("MOVIEID").toString();
        String movieSeq = commandMap.get("MOVIESEQ").toString();
        movieId = movieId.trim();
        movieSeq = movieSeq.trim();
        commandMap.remove("MOVIEID");
        commandMap.remove("MOVIESEQ");
        commandMap.put("MOVIEID", movieId);
        commandMap.put("MOVIESEQ", movieSeq);
        String DOCID = movieId + movieSeq;
        
		//나머지 movieId, movieSeq, ratings, movie_name, movie_genres, img 는 commandMap 안에 있음
        //movie_name이랑 img trim 작업
        String MOVIE_NAME = commandMap.get("MOVIE_NAME").toString();
        String IMG = commandMap.get("IMG").toString();
        commandMap.remove("MOVIE_NAME");
        commandMap.remove("IMG");
        MOVIE_NAME = MOVIE_NAME.trim();
        IMG = IMG.trim();
        commandMap.put("MOVIE_NAME", MOVIE_NAME);
        commandMap.put("IMG", IMG);
        
		//여기서 장르는 코미디,액션,로맨스  이걸 코미디 액션 로맨스 이런 형식으로 바꿔줘야함
        String genres = commandMap.get("MOVIE_GENRES").toString();
        
        genres = genres.replace(",", " ");
        genres = genres.trim();
        //장르 현재 있는 걸 없애고
        commandMap.remove("MOVIE_GENRES");
        //새로운 장르를 추가해줌
        commandMap.put("MOVIE_GENRES", genres);
        
        //추가로 넣어줌 
		commandMap.put("ID", USER);
		commandMap.put("DOCID", DOCID);
		
		//db 실행 select 문 (이 아이디로 이 영화를 추천했는지 확인) 
		int checkReco = movieService.selectMovieRating(commandMap.getMap());
		//했다면 1 안했다면 0 count로 값 가져오기
		//if문 실행 
		if(checkReco == 1) {
			//1이면 추천을 한 거니까 update
			movieService.updateMovieRating(commandMap.getMap());
		}else {
			//0이면 처음 한 거니까 insert
			movieService.insertMovieRating(commandMap.getMap());
		}

		//Map 생성하는데 redirect : movie detail로 가게끔
		ModelAndView mv = new ModelAndView("redirect:/movie/openDetailResult.do");
		
		//ID, SEQ 동봉
		mv.addObject("movieId", movieId);
		mv.addObject("movieSeq", movieSeq);
		return mv;
	}
	
	/*
	 * 내활동
	 */
	@RequestMapping(value="/user/activity.do")
	 public ModelAndView activity(Map<String,Object> commandMap, HttpServletRequest request) throws Exception {
	  Map<String, Object> user_id = (Map<String, Object>) request.getSession().getAttribute("loginInfo");
	  String USER = user_id.get("ID").toString();
	  commandMap.put("ID", USER);
	  
	  List<Map<String,Object>> list = movieService.selectUserRating(commandMap);
	  Map<String,Object> info = movieService.selectUserRating2(commandMap);
	  List<Map<String,Object>> userBoardList = movieService.selectUserBoard(commandMap);
	  
	  
	  ModelAndView mv = new ModelAndView("/user/activity");
	  mv.addObject("list", list);
	  mv.addObject("info", info);
	  mv.addObject("userBoardList",userBoardList);
	  return mv;
	 }
}
