package inhatc.capstone.crawl.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;

public class DayService {
	private String time1;
	private String yes_day;
	
	public void setDay() throws ParseException {
		// TODO Auto-generated method stub
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		Date time = new Date();
		time1 = format1.format(time);
		
		Date setDate;
		setDate = format1.parse(time1);
		Calendar cal = new GregorianCalendar(Locale.KOREA);
		cal.setTime(setDate);
		cal.add(Calendar.DATE, -1);
		yes_day = format1.format(cal.getTime());
		
	}
	
	
	public String getToday() {
		// TODO Auto-generated method stub
		return time1;
	}

	
	public String getYesday() {
		// TODO Auto-generated method stub
		return yes_day;
	}
}
