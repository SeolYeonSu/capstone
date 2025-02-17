package inhatc.capstone.sample.controller;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import inhatc.capstone.common.map.CommandMap;
import inhatc.capstone.sample.service.SampleService;
import inhatc.capstone.user.service.UserService;
@Controller
public class SampleController {
	Logger log = Logger.getLogger(this.getClass());
	 
    @Resource(name="sampleService")
    private SampleService sampleService;
 
    @RequestMapping(value="/sample/openBoardList.do")
    public ModelAndView openSampleBoardList(Map<String,Object> commandMap) throws Exception{
        List<Map<String,Object>> list = sampleService.selectBoardList(commandMap);
        ModelAndView mv = new ModelAndView("/sample/boardList");
        mv.addObject("list", list);
         
        return mv;
    }
    
   @RequestMapping(value="/bbs/openBoardWrite.do")
   public ModelAndView openBoardWrite(CommandMap commandMap) throws Exception{
	   
	    ModelAndView mv = new ModelAndView("/sample/boardWrite");
	    return mv;
	}
   
   @RequestMapping(value="/bbs/insertBoard.do")
   public ModelAndView insertBoard(CommandMap commandMap) throws Exception{
	   System.out.println(commandMap.get("TITLE").toString());
	   System.out.println("in");
       sampleService.insertBoard(commandMap.getMap());
       System.out.println("끝");
       ModelAndView mv = new ModelAndView("redirect:/sample/openBoardList.do"); 
       return mv;
   }
   
   @RequestMapping(value="/bbs/openBoardDetail.do")
   public ModelAndView openBoardDetail(CommandMap commandMap) throws Exception{
       Map<String,Object> map = sampleService.selectBoardDetail(commandMap.getMap());
    
       ModelAndView mv = new ModelAndView("/sample/boardDetail");
       mv.addObject("map", map);
    
       return mv;
   }

   @RequestMapping(value="/bbs/openBoardUpdate.do")
   public ModelAndView openBoardUpdate(CommandMap commandMap) throws Exception{
       Map<String,Object> map = sampleService.selectBoardDetail(commandMap.getMap());
    
       ModelAndView mv = new ModelAndView("/sample/boardUpdate");
       mv.addObject("map", map);
    
       return mv;
   }
    
   @RequestMapping(value="/bbs/updateBoard.do")
   public ModelAndView updateBoard(CommandMap commandMap) throws Exception{
       sampleService.updateBoard(commandMap.getMap());
       
       ModelAndView mv = new ModelAndView("redirect:/sample/openBoardDetail.do");
       mv.addObject("IDX", commandMap.get("IDX"));
    
       return mv;
   }
   
   @RequestMapping(value="/bbs/deleteBoard.do")
   public ModelAndView deleteBoard(CommandMap commandMap) throws Exception{
	   System.out.println(commandMap.get("IDX"));
       sampleService.deleteBoard(commandMap.getMap());
    
       ModelAndView mv = new ModelAndView("redirect:/sample/openBoardList.do");
       return mv;
   }


}
