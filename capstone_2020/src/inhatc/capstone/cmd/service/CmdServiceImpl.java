package inhatc.capstone.cmd.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;

import org.springframework.stereotype.Service;

@Service("CmdService")
public class CmdServiceImpl implements CmdService{
	private StringBuffer buffer;
	private Process process;
	private BufferedReader bufferedReader;
	private StringBuffer readBuffer;
	
	private String url = "C:\\_Routine\\WorkBench\\crawl";
	private String url_naver = "\\naverCrawl";
	private String url_daum = "\\daumCrawl";
	private String url_nate = "\\nateCrawl";
	private String url_exe = ".exe";
	@Override
	public String inputCommand(int urlNum) {
		// TODO Auto-generated method stub
		//1 네이버 2 다음 3 네이트
		String cmd = "";
		if(urlNum == 0) {
			cmd = url + url_naver;
		}else if(urlNum == 1) {
			cmd = url + url_daum;
		}else if(urlNum == 2) {
			cmd = url + url_nate;
		}
		cmd += url_exe;
		return cmd;
	}

	@Override
	public ArrayList<MV_Rank_DTO> execCMD_MV_Rank(String command) throws InterruptedException {
		// TODO Auto-generated method stub
		ArrayList<MV_Rank_DTO> list = new ArrayList<MV_Rank_DTO>();
		try {
			process = Runtime.getRuntime().exec(command);
			process.waitFor();
			bufferedReader = new BufferedReader(new InputStreamReader(process.getInputStream(),"EUC-KR"));
			
			String line = null;
			
			while((line = bufferedReader.readLine()) != null) {
				MV_Rank_DTO data = new MV_Rank_DTO();
				
				line=line.replace("[","");
				line=line.replace("]","");
				line=line.replaceAll("'","");
				String[] rankTitle = line.split(",");
				//System.out.println(rankTitle[1]);
				data.setRank(rankTitle[0]);
				data.setTitle(rankTitle[1]);
				list.add(data);
			}
			return list;//리턴을 ArrayList로 변경 
		}catch (IOException e) {
			e.printStackTrace();
			System.exit(1);
		}
		
		return null;
	}

}
