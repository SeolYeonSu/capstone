package inhatc.capstone.homeCon;

import java.text.DateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import inhatc.capstone.common.map.CommandMap;

import inhatc.capstone.sample.service.SampleService;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	
	
	Logger log = Logger.getLogger(this.getClass());
	@RequestMapping(value="/inter.do")
	public ModelAndView openSampleList(Map<String, Object> commandMap) throws Exception {
		ModelAndView mav = new ModelAndView("");
		log.debug("인터셉터 테스트");
		return mav;
	}
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/resolver.do")
	public ModelAndView testMapArgumentResolver(CommandMap commandMap) throws Exception{
	 
	    if(commandMap.isEmpty() == false){
	        Iterator<Entry<String,Object>> iterator = commandMap.getMap().entrySet().iterator();
	        Entry<String,Object> entry = null;
	        while(iterator.hasNext()){
	            entry = iterator.next();
	            log.debug("key : "+entry.getKey()+", value : "+entry.getValue());
	        }
	    }
	 
	    ModelAndView mv = new ModelAndView("");
	    return mv;
	}

	@RequestMapping(value = "/homes.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		/*
		TestMapper mapper = sqlSession.getMapper(TestMapper.class);
        TestDTO dto = new TestDTO();
        dto.setId("testId");
        dto.setName("testName");
        mapper.insertUser(dto);
        
        TestDTO user = mapper.selectUsers().get(0);
        System.out.println(user.getId());
        System.out.println(user.getName());
        
		*/
		/*
		TestMapper mapper = sqlSession.getMapper(TestMapper.class);
		TestDTO dto = new TestDTO();
		//dto.setId("t1");
		TestDTO user = mapper.selectUsers().get(0);
		System.out.println(user.getId());
        System.out.println(user.getName());
		//TestDTO pw = mapper.selectPW().get(0);
		//System.out.println(pw.getPW());
		 * */
		 System.out.println("ddddddd");
		return "home";
	}
	
	@RequestMapping(value="/home.do")
	public String openHome() {
		System.out.println( org.springframework.core.SpringVersion.getVersion() ); 

		
		return "home";
	}
	
}
