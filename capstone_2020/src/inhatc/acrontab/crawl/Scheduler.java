package inhatc.acrontab.crawl;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class Scheduler {
	//초 분 시 일 월 년
	//매일 12시에 실행
	//cron = "0 0 12 * * *"
	//12시간 마다 실행하겠다
	//cron = "0 0 0/12 * * *"
	@Scheduled(cron = "0 26 12 * * *")
	public void cronTest1() {
		System.out.println("스케줄러 확인");
	}
	
	@Scheduled(cron = "0 30 12 * * *")
	public void UpdateBoxOfficeCSV() {
		//바로 하면 박스오피스도 준비중일 수 있으니 자정으로부터 30분 지난 시간에 크롤링
		System.out.println("BoxOffice Update Start");
		Runtime rt = Runtime.getRuntime();
		String exeFile = "C:\\_Routine\\WorkBench\\crawl\\boxoffice.exe";
		System.out.println("실행:"+exeFile);
		Process p;
		try {
			p = rt.exec(exeFile);
			p.waitFor();
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			System.out.println("BoxOffice Update Fail.");
		}
		System.out.println("BoxOffice Update Finish!");
		
	}
}
