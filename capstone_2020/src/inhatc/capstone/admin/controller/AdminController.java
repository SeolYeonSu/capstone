package inhatc.capstone.admin.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import inhatc.capstone.common.map.CommandMap;
import inhatc.capstone.admin.service.AdminService;

@Controller
public class AdminController {
	Logger log = Logger.getLogger(this.getClass());
	 
    @Resource(name="adminService")
    private AdminService adminService;

   @RequestMapping(value="/admin/openAdmin.do")
   public ModelAndView openAdmin(Map<String,Object> commandMap) throws Exception{
	   List<Map<String,Object>> list = adminService.selectReportList(commandMap);
	   List<Map<String,Object>> list2 = adminService.selectRpComList(commandMap);
	   List<Map<String,Object>> list3 = adminService.selectLogList(commandMap);
	   ModelAndView mv = new ModelAndView("/admin/admin");
	   mv.addObject("list", list);
	   mv.addObject("list2", list2);
	   mv.addObject("list3", list3);
	   return mv;
   }
   
   @RequestMapping(value="/admin/openUserList.do")
   @ResponseBody
   public List<Map<String,Object>> openUserList(CommandMap commandMap) throws Exception{
	   List<Map<String,Object>> list = adminService.selectUserList(commandMap.getMap());
	   return list;
   } 
   
   @RequestMapping(value="/admin/openReportBoard.do")
   @ResponseBody
   public List<Map<String,Object>> openReportBoard(CommandMap commandMap) throws Exception{
	   List<Map<String,Object>> list = adminService.selectReportBoard(commandMap.getMap());
	   return list;
   }
   
   @RequestMapping(value="/admin/reportProcess.do")
   public ModelAndView reportProcess(CommandMap commandMap) throws Exception{ 
	   adminService.deleteBoard(commandMap.getMap());
       adminService.updateReport(commandMap.getMap());
       adminService.insertRpCompleted(commandMap.getMap());
       
       String day = (String)commandMap.get("CHECKSTOP");
       if(!(day.equals("없음"))) {  																// 신고 처리 시 활동정지 '3일' 이상, '영구' 이면 
    	   Map<String,Object> select_map = adminService.selectUserStop(commandMap.getMap());    // 기존 활동정지 내용이 있는지 가져옴
    	   if(select_map == null) {																// 기존 활동정지 내용이 없으면	
    		   adminService.insertUserStop(commandMap.getMap());								// 활동정지 정보를 새로 입력함 
    	   }
    	   else {																				// 기존 활동정지 내용이 있으면
        	   String select_day = (String) select_map.get("US_DAY");	                        // 기존 활동정지 일수를 가졍옴
    		   if(select_day.equals("영구")) {}													// '영구'정지 이면 아무것도 하지않음
    		   else {
    			   int num1 = Integer.parseInt(day.substring(0, 1));						    // 기존 활동정지 일수 + 새로운 활동정지 일수 후 업데이트
    			   int num2 = Integer.parseInt(select_day.substring(0, 1));
    			   int sum = num1 + num2;
    			   String new_day = Integer.toString(sum) + "일";
    			   commandMap.getMap().put("CHECKSTOP", new_day);
    			   adminService.updateUsDay(commandMap.getMap());
    		   }
    		   
    	   }
    	   
       }
       
       ModelAndView mv = new ModelAndView("/popup");
       mv.addObject("msg", "처리되었습니다.");
       mv.addObject("loc", "/admin/openAdmin.do");
       return mv;
   }
   
   @RequestMapping(value="/admin/updateRpcom.do")
   @ResponseBody
   public boolean updateRpcom(CommandMap commandMap) throws Exception{ 
	   
	   adminService.deleteBoard(commandMap.getMap());
       adminService.updateRpcom(commandMap.getMap());
       return true;
   }

}
