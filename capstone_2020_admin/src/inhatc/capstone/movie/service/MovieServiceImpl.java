package inhatc.capstone.movie.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import inhatc.capstone.movie.dto.MovieDTO;
import inhatc.capstone.movie.dto.recoDTO;
import inhatc.capstone.movie.dto.recoMovieDTO;
import inhatc.capstone.movie.dao.MovieDAO;

@Service("movieService")
public class MovieServiceImpl implements MovieService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="movieDAO")
	private MovieDAO movieDAO;
	
	private String url = "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_xml.jsp?"+
			"collection=kmdb_new"+
			"&detail=Y"+
			"&ServiceKey=4511V331YQ72SP3M8Q5C"; 
	private String result_urlMV = "&title=";
	private String detail_urlMV1 = "&movieId=";
	private String detail_urlMV2 = "&movieSeq=";
	
	
	private Document runDoc(String url) {
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder;
		try {
			builder = factory.newDocumentBuilder();
			Document doc = builder.parse(url);
			return doc;
			
		} catch (ParserConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
			
		} catch (SAXException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}	
	}
	
	// 정보없을때 표시
	private String str_nullCheck(String str) {
		if(str.length() <3) str = " 정보없음";
		return str;
	}
	
	//내용의 길이가 너무 길때 ...표시
	private String str_sub(String str, int i) {
		if(str.length()>i) str = str.substring(0, i) + "...";
		return str;
	}
	
	
	
	@Override
	public Document getDOC(String title) {
		// TODO Auto-generated method stub
		result_urlMV = result_urlMV + title;
		url = url + result_urlMV;
		return runDoc(url);
	}
	
	@Override
	public Document getDOC(String movieId, String movieSeq) {
		// TODO Auto-generated method stub
		detail_urlMV1 = detail_urlMV1 + movieId;
		detail_urlMV2 = detail_urlMV2 + movieSeq;
		url = url + detail_urlMV1 + detail_urlMV2;
		return runDoc(url);
	}
	
	@Override
	public ArrayList<MovieDTO> getLodeList(NodeList nl) {
		// TODO Auto-generated method stub
		NodeList ResultList = nl;
		Node R = ResultList.item(0);
		Element Result = (Element) R;
		NodeList RowList = Result.getChildNodes();
		ArrayList<MovieDTO> list = new ArrayList<MovieDTO>();
		for (int i = 0; i < RowList.getLength(); i++) {
			Node RL = RowList.item(i);
			if(RL.getNodeType()==Node.ELEMENT_NODE) {
				MovieDTO mv = new MovieDTO();
				Element Row = (Element) RL;			
				
				// 파싱 : 영화 고유 ID
				mv.setMovieId(Row.getElementsByTagName("movieId").item(0).getTextContent());
				
				// 파싱 : 영화 고유 Seq
				mv.setMovieSeq(Row.getElementsByTagName("movieSeq").item(0).getTextContent());
				
				// 파싱 : 제목
				mv.setTitleEtc(Row.getElementsByTagName("titleEtc").item(0).getTextContent());
				String[] title_SP = mv.getTitleEtc().split("\\^");
				mv.setTitle(str_sub(title_SP[0],100)); //40자 이상 ...으로 한글 하나에 2바이트 아니면 3바이트
				
				// 파싱 : 제목 (영문)
				mv.setTitleEng(str_nullCheck(Row.getElementsByTagName("titleEng").item(0).getTextContent()));
				
				// 파싱 : 관람연령
				mv.setAge(str_nullCheck(Row.getElementsByTagName("rating").item(0).getTextContent()));
				
				// 파싱 : 장르
				mv.setGenre(str_nullCheck(Row.getElementsByTagName("genre").item(0).getTextContent()));
				
				// 파싱 : 감독
				mv.setDirectorNm(str_nullCheck(Row.getElementsByTagName("directorNm").item(0).getTextContent()));
				
				// 파싱 : 줄거리
				String plot = str_nullCheck(Row.getElementsByTagName("plot").item(0).getTextContent()); 
				plot = plot.replace(".", ".<br/>");
				plot = plot.replace("!", "!<br/>");
				plot = plot.replace("?", "?<br/>");
				mv.setPlot(plot);
				
				// 파싱 : 포스터
				mv.setPosters(Row.getElementsByTagName("posters").item(0).getTextContent());	//이미지
				if(mv.getPosters().length()<3){
					mv.setImg("../img/image_null.jpg");
				}else{
					String[] posters_SP = mv.getPosters().split("\\|");
					mv.setImg(posters_SP[0]);
				}			
				
				// 파싱 : 배우
				int actorlength = Row.getElementsByTagName("actor").getLength();
				String actors = "";
				for(int j=0;j<actorlength;j++) {
					//actors = actors + Row.getElementsByTagName("actorNm").item(j).getTextContent() + "|";
					actors = actors + Row.getElementsByTagName("actorNm").item(j).getTextContent() + ",";
				}
				actors = actors.substring(0, actors.length()-1);
				//String[] actors_SP = actors.split("\\|");
				//mv.setActors(actors_SP);
				mv.setActors(actors);
				
				// 파싱 : 영상 시간
				String runtime = str_nullCheck(Row.getElementsByTagName("runtime").item(0).getTextContent());
				if(!(runtime.equals(" 정보없음"))) runtime = runtime+"분";					
				mv.setRuntime(runtime);
				
				// 파싱 : 개봉 일
				String repRlsDate = str_nullCheck(Row.getElementsByTagName("repRlsDate").item(0).getTextContent());
				if(!(repRlsDate.equals(" 정보없음"))) {
					String year = repRlsDate.substring(0,5) + "-";
					String month = repRlsDate.substring(5,7) + "-";
					String day = repRlsDate.substring(7,9);					
					repRlsDate = year+month+day+" 개봉";
				}
				mv.setRepRlsDate(repRlsDate);
				
				list.add(mv);
			}
		}
		return list;
	}
	
	@Override
	public String inputCommand(String DOCID) {
		// TODO Auto-generated method stub
		StringBuffer buffer = new StringBuffer();
		buffer.append("C:\\WorkStation\\py_proj\\ycs_reco\\dist\\reco.exe ");
		buffer.append(DOCID);
		return buffer.toString();
	}
	
	public ArrayList<recoDTO> execCommand(String command) throws InterruptedException{
		ArrayList<recoDTO> list = new ArrayList<recoDTO>();
		Process process;
		BufferedReader bufferedReader;
		try {
			process = Runtime.getRuntime().exec(command);
			process.waitFor();
			bufferedReader = new BufferedReader(new InputStreamReader(process.getInputStream()));
			
			String line = null;
			//readBuffer = new StringBuffer(); //이걸 없에고 ArrayList 새로만들어서 저장
			//지금은 영화명, 상관개수, 장르 를 보여주지만 
			//우리 사이트에서 리턴받아올거는 ID랑 SEQ 두개 
			//그걸 구분해서 listArray에 setId setSeq 에 각각 넣고
			//listArray 리턴 (DTO 만들기)
			while((line = bufferedReader.readLine()) != null) {
				recoDTO mv = new recoDTO();
				//readBuffer.append(line); //String 배열에 넣기
				//readBuffer.append("\n");
				//System.out.println(line);
				//여기에 ArrayList로 값 저장
				String reco = line.substring(2, 8);
				mv.setDOCID(reco);
				list.add(mv);
			}
			
			return list;//리턴을 ArrayList로 변경 
		}catch (IOException e) {
			e.printStackTrace();
			System.exit(1);
		}
		
		return null;
	}
	//db 추천
	/*
	@Override
	public Map<String, Object> selectRecoMovie(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> resultMap = movieDAO.selectRecoMovie(map);
	    return resultMap;
	}
	 */
	/*
	@Override
	public ArrayList<recoMovieDTO> selectData(String sql) {
		// TODO Auto-generated method stub
		ArrayList<recoMovieDTO> list = new ArrayList<recoMovieDTO>();
		MovieDAO movieDAO = new MovieDAO();
		list = movieDAO.selectData(sql);
		return list;
	}
	*/
	@Override
	public Map<String, Object> selectRecoMovie(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> resultMap = movieDAO.selectRecoMovie(map);
		return resultMap;
	}
	
	//댓글 select comment
	@Override
	public List<Map<String, Object>> selectCommentMovie(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		List<Map<String, Object>> resultMap = movieDAO.selectCommentMovie(map);
		return resultMap;
	}
	
	//좋아요 체크 select commentLikeCheck
	@Override
	public int selectCommentLikeCheck(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
		return movieDAO.selectCommentLikeCheck(map);
	}
	
	//좋아요 눌른 데이터 삭제
	@Override
	public void deleteCommentLike(Map<String, Object> map) {
		// TODO Auto-generated method stub
		movieDAO.deleteCommentLike(map);
	}
	
	//update minus
	@Override
	public void updateCommentLikeMinus(Map<String, Object> map) {
		// TODO Auto-generated method stub
		movieDAO.updateCommentLikeMinus(map);
	}

	@Override
	public void insertCommentLike(Map<String, Object> map) {
		// TODO Auto-generated method stub
		movieDAO.insertCommentLike(map);
	}

	@Override
	public void updateCommentLikePlus(Map<String, Object> map) {
		// TODO Auto-generated method stub
		movieDAO.updateCommentLikePlus(map);
	}

	@Override
	public Map<String, Object> selectCommentLike(Map<String, Object> map) {
		// TODO Auto-generated method stub
		Map<String, Object> resultMap = movieDAO.selectCommentLike(map);
		return resultMap;
	}
	
	//댓글 등록
	@Override
	public void insertComment(Map<String, Object> map) {
		// TODO Auto-generated method stub
		movieDAO.insertComment(map);
	}
	
	//별점 확인
	@Override
	public int selectMovieRating(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return movieDAO.selectMovieRating(map);
	}

	@Override
	public void updateMovieRating(Map<String, Object> map) {
		// TODO Auto-generated method stub
		movieDAO.updateMovieRating(map);
	}

	@Override
	public void insertMovieRating(Map<String, Object> map) {
		// TODO Auto-generated method stub
		movieDAO.insertMovieRating(map);
	}

	@Override
	public double selectRatingAVG(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return movieDAO.selectRatingAVG(map);
	}

	@Override
	public int selectRatingTotal(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return movieDAO.selectRatingTotal(map);
	}

	@Override
	public List<Map<String, Object>> selectRatingEach(Map<String, Object> map) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> resultMap = movieDAO.selectRatingEach(map);
		return resultMap;
	}

	@Override
	public Map<String, Object> selectRatingUser(Map<String, Object> map) {
		// TODO Auto-generated method stub
		Map<String, Object> resultMap = movieDAO.selectRatingUser(map);
		return resultMap;
	}

	@Override
	public List<Map<String, Object>> selectUserRating(Map<String, Object> map) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> resultMap = movieDAO.selectUserRating(map);
		return resultMap;
	}
	
	@Override
	public Map<String, Object> selectUserRating2(Map<String, Object> map) {
		// TODO Auto-generated method stub
		Map<String, Object> resultMap = movieDAO.selectUserRating2(map);
		return resultMap;
	}

	@Override
	public List<Map<String, Object>> selectUserBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> resultMap = movieDAO.selectUserBoard(map);
		return resultMap;
	}
}