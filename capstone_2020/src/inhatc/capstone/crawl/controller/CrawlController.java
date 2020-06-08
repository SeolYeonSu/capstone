package inhatc.capstone.crawl.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import inhatc.capstone.common.map.CommandMap;
import inhatc.capstone.crawl.service.CrawlService;
import inhatc.capstone.crawl.service.CrawlServiceImpl;



@Controller
public class CrawlController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="crawlService")
	CrawlService crawlService;
	
	
	@SuppressWarnings("null")
	@RequestMapping(value="/crawl/openCrawlPage.do")
    public ModelAndView openMovieSearchResult() throws Exception{
		
		List<List<String>> data = null;
		String path = "C:\\Users\\jinki\\Desktop\\final.csv"; //csv 파일 경로 설정
		System.out.println("in");
		try {
			//csv 셋팅
			CrawlServiceImpl cs = new CrawlServiceImpl();
			cs.readCSV(path);
			//csv 가져오기
			data = cs.getCSV();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		} 
		/*
		for (int i = 0; i < data.size(); i++) {
			String[] a = (String[]) data.get(i).toArray();
			
			for (int j = 0; j < data.get(i).size(); j++) {
				System.out.print(a[j]+" ");
			}
			System.out.println();
		}
		*/
		//String[][] arrData = null;
		
		/* 1--
		for (int i = 0; i < data.size(); i++) {
			String[] a = (String[]) data.get(i).toArray();
			for (int j = 0; j < data.get(i).size(); j++) {
				System.out.print(a[j]+" ");
				//arrData[i][j] = "'"+a[j]+"'";
			}
			System.out.println();
		}
		*/
		
		/*
		for (int i = 0; i < arrData.length; i++) {
			for (int j = 0; j < arrData.length; j++) {
				System.out.println(arrData[i][j]);
			}
		}
		*/
		//이 부분을 이제 어떻게 처리할지 고민해 봐야함
		/*
		for (int index = 0; index < list.size(); index++) {
			//System.out.println(list.get(index));
			String[] box;
			//System.out.println();
			String tmp = "";
			tmp = list.get(index).toString().replace("[", "");
			tmp = tmp.replace("]", "");
			box = tmp.split(",");
			
			if(index == 0) {
				//title
				for (int i = 0; i < box.length; i++) {
					   System.out.print("("+i+"):"+box[i]);
				   }
				   System.out.println();
			}
			else {
				
				for (int i = 0; i < box.length; i++) {
					   System.out.print("("+i+"):"+box[i]);
				   }
				   System.out.println();

			   //boxlen = box.length;
			   //System.out.println(box[0]);

			}
			   
			              
		}
		
	*/
		int dataYLen = data.size();
		int dataXLen = data.get(1).size();
		
		//csv를 받아와서 2차원 배열에 삽입
		String[][] str = new String[dataYLen-1][dataXLen-1];
		for (int i = 0; i < dataYLen-1; i++) {
			String[] a = (String[]) data.get(i+1).toArray();
			for (int j = 0; j < dataXLen-1; j++) {
				//int ian = i-1;
				//int jan = j-1;
				//System.out.print(a[jan]+" ");
				String tmp = a[j+1];
				str[i][j] = tmp;
				
				
			}
			//System.out.println();
		}
		
		//전치행렬
		String[][] tmp = new String[dataXLen-1][dataYLen-1];
		for (int i = 0; i < dataYLen-1; i++) {
			for (int j = 0; j < dataXLen-1; j++) {
				//System.out.print(str[i][j]+" ");
				
				tmp[j][i] = str[i][j];
				//System.out.print(tmp[j][i]+" ");
			}
			//System.out.println();
		}
		
		//전치행렬완성된걸 출력
		List<List<String>> attendanceData = new ArrayList<List<String>>();; //attendance 관객수
		for (int i = 0; i < dataXLen-1; i++) {
			List<String> tmpList = new ArrayList<String>();
			String[] array = new String[dataYLen-1];
			for (int j = 0; j < dataYLen-1; j++) {
				//System.out.print(tmp[i][j]+" ");
				
                
                
                array[j] = tmp[i][j];
                //배열에서 리스트 반환
                //System.out.println(array[0]);
                
                
			}
			tmpList = Arrays.asList(array);
            //System.out.println(tmpList);
            attendanceData.add(tmpList);
			//System.out.println();
		}
		//이제 배열을 만들어서 리스트로 넘기고 지금은 8행16열 정도인데
		//이걸 전치행렬로 바꿔서 16행 8열로 바꿔준다
		//그리고 잘 가공해서 리스트 잘 만들어가지고 보낸다.
		
		ModelAndView mv = new ModelAndView("crawl/crawlPage");
		mv.addObject("boxoffice",data);
		mv.addObject("attendance",attendanceData);
        return mv;
    }
	
	
	//개발중
	@RequestMapping(value="/crawl/GetCsv.do")
	@ResponseBody
	public List<List<String>> giveCSV() throws Exception{
		List<List<String>> data = null;
		String path = "C:\\Users\\jinki\\Desktop\\final.csv"; //csv 파일 경로 설정
		System.out.println("in");
		try {
			//csv 셋팅
			crawlService.readCSV(path);
			//csv 가져오기
			data = crawlService.getCSV();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		} 
		/*
		for (int i = 0; i < data.size(); i++) {
			String[] a = (String[]) data.get(i).toArray();
			
			for (int j = 0; j < data.get(i).size(); j++) {
				System.out.print(a[j]+" ");
			}
			System.out.println();
		}
		*/
		return data; 
	}
}
