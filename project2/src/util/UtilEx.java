package util;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import schedule.ScheduleDto;


public class UtilEx {

	// 날짜를 클릭하면 그날의 일정을 모두 볼 수 있는 callist.jsp로 이동하는 함수
	public static String calllist(int year, int month, int day) {
		String str = "";
		
		str += String.format("&nbsp;<span style='color:#4b4b49;font-weight:500;font-size:11pt;margin-top:-2px;margin-bottom:3px'>", year, month, day);
		str += String .format("%2d", day);
		str += "</span>";
		
		// str = <a href='callist.jsp?year=2021&month=3&day=19'>19</a>
		return str;
	}
	
	// 일정을 추가하기 위해서 pen이미지를 클릭하면 calwrite.jsp로 이동하는 함수
	public static String showPen(int year, int month, int day) {
		String str ="";
		
		String image = "<img src='img/calpen.svg' width='18px' height='18px' style='float:right;margin-top:2px'>";
		
		str = String.format("<a href='%s&syear=%d&smonth=%d&sday=%d'>%s</a>", 
							"schedule?param=schedulwrite", year, month, day, image);
		// str = <a href='calwrite.jsp?year=2019&month=09&day=19'><img str='image/pen2.png' width='18px' height='18px'></a>
		
		return str;
	}
	
	// 한문자를 두문자로 변경해 주는 함수 => 2021 3 19 -> 3을 03으로 변경하기 위한 함수 -> 1~9 -> 01 ~ 09로 변경해주는 함수
	public static String two(String msg) {
		return msg.trim().length()<2?"0"+msg.trim():msg.trim(); // 글자수가 2보다 작을때 0을 붙여서 반환한다.
	}
	
	// nvl 함수 : 문자열이 비어 있는지 확인 함수
	public static boolean nvl(String msg) {
		return msg == null || msg.trim().equals("")?true:false;
	}
	
	// 달력의 날짜 별로 설정할 테이블을 작성하는 함수 -> 날짜별로 테이블을 만들어주는 함수
	public static String makeStartTable(int year, int month, int day, List<ScheduleDto> list) {
		String str = "";
		
		// 2021 3 19 -> 20210319
		String dates = (year + "") + "/" + two(month + "") + "/" + two(day + "");
		
		str += "<table>";
		str += "<col width='10'><col width='10'><col width='10'>";
		int count = 0;	
		str += "<tr>";
		for(ScheduleDto dto : list) { // 20210319   20210415
			
			if(dto.getSchstart().substring(0, 10).equals(dates)) {
				System.out.println("makeStartTable~~~~~~~~~~~~~~~~~");
				str += "<td style='padding:0;border-top:none'>";
				
				str += "<img src='./img/calBook.svg' style='height:40px'>";
				
				str += "</td>";
				count ++;
				System.out.println("count = " + count);
				if(count%3==0) {
					str += "</tr>";
					str += "<tr>";
				}
			}
		}
		str += "</tr>";
		str += "</table>";
		
		return str;
	}
	
	public static String makeEndTable(int year, int month, int day, List<ScheduleDto> list) {
		String str = "";
		
		// 2021 3 19 -> 2021/03/19
		String dates = (year + "") + "/" + two(month + "") + "/" + two(day + "");
		
		str += "<table>";
		str += "<col width='10'><col width='10'><col width='10'>";
		int count = 0;			
		str += "<tr>";
		for(ScheduleDto dto : list) { // 20210319   20210415
			if(dto.getSchend().substring(0, 10).equals(dates)) {
				System.out.println("makeEndTable~~~~~~~~~~~~~~~~~");
				
				str += "<td style='padding:0; border-top:none;'>";
				
				/* str += "<img src='./img/dot.png' ><br>"; */
				str += "<img src='./img/calBook_End.svg' style='height:40px'>";
		
				str += "</td>";
				count ++;
				System.out.println("count = " + count);
				if(count%3 == 0) {
					System.out.println("개행!!!!!!!!!!!!!!!");
					str += "</tr>";
					str += "<tr>";
				}
			}
		}
		str += "</tr>";
		str += "</table>";
		
		return str;
	}
	// 일정의 제목이 길 때 -> ...로 처리하는 함수	=>	테이블이 깨지는 현상을 방지한다.
	public static String dot3(String msg) {
		String str = "";
		if(msg.length() >= 7) {
			str = msg.substring(0, 7);
			str += "...";
		}else {
			str = msg.trim();
		}
		
		return str;
	}
	
	public static String dateFormat(String s, String date) {
		SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.s");
		SimpleDateFormat newform = new SimpleDateFormat(s);
		String sdate = "";
		
		
		try {
			Date newdate = (Date)form.parse(date);
			sdate = newform.format(newdate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return sdate;		
	}
}
