package club;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import book.BookDto;
import login.MemberDto;
import schedule.ScheduleDao;

public class ClubController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}

	public void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		System.out.println("ClubController doProcess");
		HttpSession session = req.getSession();
		MemberDto user = (MemberDto) session.getAttribute("userId");
		
		ClubDao clubdao = ClubDao.getInstance();
		String param = req.getParameter("param");
		System.out.println("---------param = " + param);
		
		if (param.equals("clublist")) {
			System.out.println("여기는 들어옴");
			String search = req.getParameter("search");
			String spageNumber = req.getParameter("pageNumber");
			System.out.println("spageNumber = " + spageNumber);
			int pageNumber = 0; // 현재 페이지를 가르키는 변수
			
			if (spageNumber != null && !spageNumber.equals("")) { // 페이지 넘버를 클릭했을 경우
				pageNumber = Integer.parseInt(spageNumber);
			}
			System.out.println("pageNumber : " + pageNumber);
			if (search == null) {
				search = "";
			}

			List<ClubDto> clublist = clubdao.searchClubList(search, pageNumber);
			req.setAttribute("clublist", clublist);

			int listsize = clublist.size();
			int listRow = listsize / 4;

			if (listsize % 4 > 0) {
				listRow = listRow + 1;
			}
			req.setAttribute("listRow", listRow);

			int len = clubdao.getAllClub(search);
			System.out.println("len = " + len);
			int cmPage = len / 16;
			if ((len % 16) > 0) {
				cmPage = cmPage + 1;
			}
			req.setAttribute("cmPage", cmPage + "");
			req.setAttribute("pageNumber", pageNumber + "");
			req.setAttribute("search", search);
			req.getRequestDispatcher("index.jsp?content=community").forward(req, resp);
		}

		// 클럽 상세화면
		else if (param.equals("getclubdetail")) {
			System.out.println("getclubdetail");

			int clubseq = Integer.parseInt(req.getParameter("clubseq"));
			List<CardDto> cardlist = clubdao.getCardList(clubseq);
			List<MemberDto> memlist = clubdao.getMember(clubseq);
			ClubDto club = clubdao.getClub(clubseq);
			
			int memnum=0;
			if(user!=null) memnum=user.getMembernum();
			
			boolean isMember = clubdao.isMember(clubseq, memnum);
			boolean isMaster = clubdao.isMaster(clubseq, memnum);
			System.out.println("mem"+isMember + " master" + isMaster);
			
			req.setAttribute("cardlist", cardlist);
			req.setAttribute("memlist", memlist);
			req.setAttribute("club", club);
			req.setAttribute("clubseq", clubseq);
			req.setAttribute("isMember", isMember);
			req.setAttribute("isMaster", isMaster);
			
			req.getRequestDispatcher("index.jsp?content=community_detail").forward(req, resp);
		}

		// 클럽수정 클럽장만!!
		else if (param.equals("updateClub")) {

			int clubseq = Integer.parseInt(req.getParameter("clubseq"));
			String clubtitle = req.getParameter("clubtitle");
			String clubtext = req.getParameter("clubtext");
			//String clubimage = req.getParameter("clubimage");
			String clubimage = "";
			
			ClubDto dto = new ClubDto(clubseq, clubtitle, clubtext, clubimage);

			clubdao.updateClub(dto);

			resp.sendRedirect("club?param=getclubdetail&clubseq=" + clubseq); // 다시 클럽상세화면으로 이동!! 되는지는 정확하지 않음...
		}

		// 클럽생성
		else if (param.equals("addclub")) {
						
			String clubtitle = req.getParameter("clubtitle");
			String clubtext = req.getParameter("clubtext");
			int membernum = user.getMembernum();
			String clubimage = req.getParameter("clubimage");

			ClubDto dto = new ClubDto(clubtitle, clubtext, membernum, clubimage);

			boolean message = clubdao.addClub(dto);

			resp.sendRedirect("message.jsp?param=joinclub&message=" + message);
		}
		
		//클럽가입
		else if (param.equals("joinclub")) { //클럽번호, 유저번호 필요
			
			int clubseq = Integer.parseInt(req.getParameter("clubseq"));
			int membernum = Integer.parseInt(req.getParameter("membernum"));
			System.out.println("clubseq = " + clubseq + "membernum = " + membernum);
			
			boolean message = clubdao.joinClub(clubseq, membernum);
			
			resp.sendRedirect("message.jsp?param=joinclub&message=" + message); 
		}
		
		// talklist 불러오기
		else if (param.equals("talklist")) {
			System.out.println("talklist 들어왔나?");

			int cardseq = Integer.parseInt(req.getParameter("cardseq")); // 카드번호를 받아온다
			System.out.println("cardseq = " + cardseq);

			List<TalkDto> talklist = clubdao.getTalkList(cardseq);
			System.out.println("들어왔나?");
			System.out.println(talklist.toString());

			CardDto card = clubdao.getCard(cardseq);
			System.out.println(card.toString());

			req.setAttribute("talklist", talklist);
			req.setAttribute("card", card);
			req.setAttribute("cardseq", cardseq); // ?? 필요한지 확인
			req.getRequestDispatcher("index.jsp?content=community_card_detail").forward(req, resp);
		}

		// 토크내용 추가
		else if (param.equals("talkadd")) {
			System.out.println("talkadd");

			String talkcontent = req.getParameter("talkcontent"); // 토크내용 가져옴
			System.out.println(talkcontent);
			
			int membernum = Integer.parseInt(req.getParameter("membernum")); // 멤버번호 가져옴
			int cardseq = Integer.parseInt(req.getParameter("cardseq")); // 카드번호 가져옴
			
			
			TalkDto dto = new TalkDto(talkcontent, membernum, cardseq);
			
			clubdao.addTalk(dto); // talk 내용 추가
			
			resp.sendRedirect("club?param=talklist&cardseq=" + cardseq); // 다시 리스트로 이동
		}
		
		// card를 추가하기 위한 준비작업
		else if(param.equals("cardadd")) {
			System.out.println("cardadd");
			
			int clubseq = Integer.parseInt( req.getParameter("clubseq") );
			System.out.println("clubseq = " + clubseq);
			
			req.setAttribute("clubseq", clubseq);
			
			// booklist를 위한 부분
			String searchTitle = req.getParameter("searchTitle");
	        String searchText = req.getParameter("searchText");
	        String spage = req.getParameter("pageNumber");
			
	        ScheduleDao schdao = ScheduleDao.getInstance();
	        
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

			List<BookDto> Booklist = schdao.getAllSearchList(searchTitle, searchText, page);
			System.out.println("Booklist = " + Booklist.toString());
			req.setAttribute("Booklist", Booklist);
							
			//paging의 길이
			int len = schdao.getAllSearchBookLen(searchTitle, searchText);
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
			
			req.getRequestDispatcher("index.jsp?content=community_card_add").forward(req, resp);
		}
		
		// 카드를 실제를 추가하는 부분
		else if(param.equals("cardaddAf")) {
			int clubseq = Integer.parseInt(req.getParameter("clubseq"));
			int booknum = Integer.parseInt(req.getParameter("choicebooknum"));
			String cardtitle = req.getParameter("cardtitle");
			String cardtext = req.getParameter("cardtext");
			String startdate = req.getParameter("startdate");
			String enddate = req.getParameter("enddate");
			
			System.out.println(clubseq + ", " + booknum + ", " + cardtitle + ", " + cardtext + ", "
								+ startdate + ", " + enddate);
			
			CardDto dto = new CardDto(0, cardtitle, cardtext, startdate, enddate, booknum, clubseq);
			
			boolean message = clubdao.addCard(dto);
			
			resp.sendRedirect("message.jsp?param=cardadd&message=" + message + "&clubseq=" + clubseq);
		}		
	}
}
