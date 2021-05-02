package main;

import java.awt.Choice;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.BookDao;
import book.BookDto;
import club.ClubDao;
import club.ClubDto;
import login.LoginDao;
import login.MemberDto;

public class MainController extends HttpServlet{
	
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
		System.out.println("MainController doProcess");
		
		String param = req.getParameter("param");
		
		if(param.equals("mainscreen")) {
			BookDao bookdao = BookDao.getInstance();
			ClubDao clubdao = ClubDao.getInstance();
			LoginDao logindao = LoginDao.getInstance();
			
			/*
			String choice = req.getParameter("choice");
			
			if(choice == null && choice.equals("")) {
				choice = "1";
			}
			*/

			List<BookDto> newBooklist = bookdao.getNewBookList();			// 신작
			List<BookDto> bestBooklist = bookdao.getBestBookList();			// 이달의 책	 
			List<ClubDto> bestClublist = clubdao.getBestClubList();			// 시끌벅적 소모임
			List<MemberDto> bestMemberlist = logindao.getBestMemberList();	// 활발히 활동한 사용자
			
			System.out.println("newBooklist = " + newBooklist.toString() );
			System.out.println("bestBooklist = " + bestBooklist.toString() );
			System.out.println("bestClublist = " + bestClublist.toString() );
			System.out.println("bestMemberlist = " + bestMemberlist.toString() );
			
			req.setAttribute("newBooklist", newBooklist);
			req.setAttribute("bestBooklist", bestBooklist);
			req.setAttribute("bestClublist", bestClublist);
			req.setAttribute("bestMemberlist", bestMemberlist);
			
			req.setAttribute("content", "home");
			
			String error = req.getParameter("error");
			if(error != null) {
				req.setAttribute("error", "1");
			}			
			// 소그룹 순위
			
			req.getRequestDispatcher("index.jsp").forward(req, resp);			
		}
	}
}
