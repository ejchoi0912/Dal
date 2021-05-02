package schedule;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.BookDao;
import book.BookDto;
import util.UtilEx;

public class ScheduleController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	public void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		req.setCharacterEncoding("utf-8");
		System.out.println("ScheduleController doProcess");
		
		String param = req.getParameter("param");
		System.out.println("param = " + param);
		
		
		if(param.equals("calendarlist")) {
			System.out.println("doProcess callist");
			
			/*
			  int membernum = Integer.parseInt( req.getParameter("membernum") );
			  System.out.println("membernum = " + membernum);
			 */
			
//			Calendar 클래스를 가져오는 두가지 방법
			Calendar cal = Calendar.getInstance();
//			Calendar cal = new GregorianCalendar();
			
			cal.set(Calendar.DATE, 1);	// 오늘 날짜를 -> 1일로 초기화해주는 설정
			
			String syear = req.getParameter("year"); // 다시 들어오는 값이 있는 경우
			String smonth = req.getParameter("month"); // 다시 들어오는 값이 있는 경우
			int membernum = Integer.parseInt( req.getParameter("membernum"));
			
			System.out.println("calendarlist membernum = " + membernum);
			System.out.println("syear = " + syear);
			System.out.println("smonth = " + smonth);
				
			
			int year = cal.get(Calendar.YEAR);
			if(UtilEx.nvl(syear) == false){ // parameter가 넘어와서 syear가 값이 있을 경우
				year = Integer.parseInt(syear);
			}
			
			int month = cal.get(Calendar.MONTH) + 1;
			if(UtilEx.nvl(smonth) == false){
				month = Integer.parseInt(smonth);
			}
			
			if(month < 1){
				month = 12;
				year--;
			}else if(month > 12){
				month = 1;
				year++;
			}
		
			req.setAttribute("year", year);
			req.setAttribute("month", month);
		
			cal.set(year, month-1, 1); // 연 월 일 세팅 완료
			
			// image 설정
			// <<  	year--
			String pp = String.format("<a href='%s&year=%d&month=%d&membernum=%d'><img src='img/leftleft.svg' style='height:35px;padding-bottom:12px'></a>", "schedule?param=calendarlist", year-1, month, membernum);
			
			// <	month--
			String p = String.format("<a href='%s&year=%d&month=%d&membernum=%d'><img src='img/left.svg' style='height:35px;padding-bottom:12px'></a>", "schedule?param=calendarlist", year, month-1, membernum);
			
			// >	month++
			String n = String.format("<a href='%s&year=%d&month=%d&membernum=%d'><img src='img/right.svg' style='height:35px;padding-bottom:12px'></a>", "schedule?param=calendarlist", year, month+1, membernum);
			
			// >>	year++
			String nn = String.format("<a href='%s&year=%d&month=%d&membernum=%d'><img src='img/rightright.svg' style='height:35px;padding-bottom:12px'></a>", "schedule?param=calendarlist", year+1, month, membernum);
			
			List<String> image = new ArrayList<String>();
			
			// 요일
			int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK); 
			int lastday = cal.getActualMaximum(Calendar.DAY_OF_MONTH); // 마지막 날짜
			
			System.out.println("dayOfWeek = " + dayOfWeek);
			System.out.println("year = " + year + "month = " + month);
			ScheduleDao dao = ScheduleDao.getInstance();
			List<ScheduleDto> list = dao.getScheduleList(membernum, year + "/" + UtilEx.two(month + ""), year + "/" + UtilEx.two(month + ""));
			System.out.println("list = " + list);
			
			req.setAttribute("list", list);
			
			cal.set(Calendar.DATE, lastday); // 그 달의 마지막 날짜로 세팅
			int weekday = cal.get(Calendar.DAY_OF_WEEK);
			
		
			SchedulUtilDto Utildto = new SchedulUtilDto(year, month, pp, p, nn, n, dayOfWeek, lastday, weekday);
			
			req.setAttribute("Utildto", Utildto);
			
			
			
			req.getRequestDispatcher("index.jsp?content=mypage_schedule").forward(req, resp);
		}
		
		if(param.equals("schedulwrite")) {
			System.out.println("schedulwrite 1");
			
			// schedul을 위한 부분
			String syear = req.getParameter("syear");
			String smonth = req.getParameter("smonth");
			String sday = req.getParameter("sday");
		    String senddate = req.getParameter("enddate");
			
		    String enddate = "";
		    if(senddate!=null && !senddate.equals("")) {
		    	enddate = senddate;
		    }
		    
			req.setAttribute("syear", syear);
			req.setAttribute("smonth", smonth);
			req.setAttribute("sday", sday);
			req.setAttribute("enddate", enddate);	
			
			Calendar cal = Calendar.getInstance();
			
			int tyear = cal.get(Calendar.YEAR);
			int tmonth = cal.get(Calendar.MONTH) + 1;
			int tday = cal.get(Calendar.DATE);
			int thour = cal.get(Calendar.HOUR_OF_DAY);
			int tmin = cal.get(Calendar.MINUTE);
			
			List<Integer> date = new ArrayList<Integer>();
			
			date.add(tyear);
			date.add(tmonth);
			date.add(tday);
			date.add(thour);
			date.add(tmin);
			
			req.setAttribute("date", date);
						
			// booklist를 위한 부분
			String searchTitle = req.getParameter("searchTitle");
	        String searchText = req.getParameter("searchText");
	        String spage = req.getParameter("pageNumber");
			
	        ScheduleDao dao = ScheduleDao.getInstance();
	        
			int page =0;
			if(spage != null && !spage.equals("")) {
				page=Integer.parseInt(spage);
			}
			
			//검색창이 비어있다면 전체 출력
			if(searchTitle == null) {
				searchTitle = "";
			}
			if(searchText == null){
				 searchText = "";
			 }
			
			System.out.println("글목록 검색 페이징 추가 2/3");
			
			//db와 연결

			List<BookDto> Booklist = dao.getAllSearchList(searchTitle, searchText, page);
			
			req.setAttribute("Booklist", Booklist);
							
			//paging의 길이
			int len = dao.getAllSearchBookLen(searchTitle, searchText);
			System.out.println("페이징 길이 : "+len);
			
			//페이징 숫자(1 2 3 4 5)
			int bookPage = len/12;
			if(len % 12 > 0) {
				bookPage = bookPage + 1;
			}
			System.out.println("글목록 검색 페이징 추가 2/3");
			req.setAttribute("bookPage", bookPage+"");
			req.setAttribute("pageNumber", page+"");
			req.setAttribute("searchTitle", searchTitle);
			req.setAttribute("searchText", searchText);
			
			req.getRequestDispatcher("mypage_addschecdul.jsp").forward(req, resp);
		}
		
		
		if(param.equals("schedulwriteAf")) {
			System.out.println("schedulwriteAf 1");
			
			// schedul을 위한 부분
			String syear = req.getParameter("syear");
			String smonth = req.getParameter("smonth");
			String sday = req.getParameter("sday");
		    String enddate = req.getParameter("enddate");
		    String choicebook = req.getParameter("choicebook");
		    int membernum = Integer.parseInt(req.getParameter("membernum"));
		    int choicebooknum = Integer.parseInt( req.getParameter("choicebooknum") );
		    String booktitle = req.getParameter("choicebook");
		    
		    System.out.println("membernum = " + membernum + "choicebooknum = " + choicebooknum);
		    System.out.println("syear = " + syear + "smonth = " + smonth + "sday = " + sday);
		    
		    System.out.println("enddate = " + enddate);
		    System.out.println("choicebook = " + choicebook);
		    
		    String startdate = "" + syear + "/" + UtilEx.two(smonth) + "/" + UtilEx.two(sday);
		    
		    System.out.println("startdate = " + startdate);
		    
		    ScheduleDto dto = new ScheduleDto(choicebooknum, membernum, 0, startdate, enddate, booktitle);
		    
		    ScheduleDao dao = ScheduleDao.getInstance();
		    boolean b = dao.addSchedule(choicebooknum, membernum, startdate, enddate);
		    
		    if(b) {
		    	System.out.println("일정을 성공적을 추가하였습니다");
		    }
		    resp.sendRedirect("schedule?param=calendarlist&membernum=" + membernum);
		}
		
		// 일정삭제
		if(param.equals("scheduldelete")) {
	         System.out.println("scheduldelete 1");
	         
	         int  scheduleseq = (Integer.parseInt(req.getParameter("scheduleseq")));
	         int membernum = Integer.parseInt( req.getParameter("membernum"));
	         
	         System.out.println("scheduleseq = " + scheduleseq);
	                   
	          ScheduleDao dao = ScheduleDao.getInstance();
	          boolean message = dao.deleteSchedule(scheduleseq);
	          
	          resp.sendRedirect("message.jsp?param=scheduldelete&message=" + message + "&membernum=" + membernum);
	         
	      }
	}
}
