package mypage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.BookDto;
import club.CardDto;
import club.ClubDao;
import club.ClubDto;
import club.TalkDto;
import db.DBConnection;
import login.LoginDao;
import login.MemberDto;

public class MypageController extends HttpServlet{
   
   
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      doProcess(req, resp);
   }

   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      doProcess(req, resp);
   }
   
   public void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
      DBConnection.initConnection();
      req.setCharacterEncoding("utf-8");
      System.out.println("MypageController doProcess");
      
      String param = req.getParameter("param");
      System.out.println("param"+param);
      
      
        if(param.equals("getmypagelist")) {
         System.out.println("getwishlist controller");
         
         //위시리스트와 읽은책리스트를 보내주기
          String choice = req.getParameter("choice");
            String search = req.getParameter("search");        
            System.out.println("choice= "+choice+"search= "+search);
            
            String swishpageNumber = req.getParameter("wishpageNumber");
            String sreadpageNumber = req.getParameter("readpageNumber");
            
            System.out.println("swishpageNumber = " + swishpageNumber + "sreadpageNumber = " + sreadpageNumber);
            
            int wishpageNumber = 0;
            int readpageNumber = 0;
            
            if(swishpageNumber != null && !swishpageNumber.equals("")) {
               wishpageNumber = Integer.parseInt(swishpageNumber);
            }
            if(sreadpageNumber != null && !sreadpageNumber.equals("")) {
               readpageNumber = Integer.parseInt(sreadpageNumber);
            }
            System.out.println("getwishlist controller1");
            
            if(choice == null) {
                choice = "";
                System.out.println("choice="+choice);
            }
            if(search == null) {
                search = "";
                System.out.println("search="+search);
            }
           
            
            
            List<BookDto> wishlist = dao.getwishList(choice, search, wishpageNumber, membernum);
            System.out.println(wishlist.size());
            List<BookDto> readlist = dao.getreadList(choice, search, readpageNumber, membernum);
            System.out.println(readlist.size());
            req.setAttribute("wishlist", wishlist);
            req.setAttribute("readlist", readlist);
            
            
            System.out.println("getwishlist controller2");
          
            int wishlen = dao.getAllWish(choice, search, membernum);
            System.out.println("wishlen= "+wishlen);
            int readlen = dao.getAllRead(choice, search, membernum);
            System.out.println("readlen= "+readlen);
            System.out.println("getwishlist controller3");
            
            int wishPage = wishlen / 10;        // 23 -> 2
            if((wishlen % 10) > 0){
               wishPage = wishPage + 1;
            }
            
            int readPage = readlen/ 10;
            if((readlen % 10) > 0 ) {
               readPage = readPage + 1;
            }
            
            System.out.println("getwishlist controller4");
            
            System.out.println("getwishlist controller5");
            req.setAttribute("wishPage", wishPage + "");
            req.setAttribute("wishpageNumber", wishpageNumber + "");
            
            req.setAttribute("readPage", readPage + "");
            req.setAttribute("readpageNumber", readpageNumber + "");
            
            System.out.println("wishPage!!!!!!!!!!!!!!!!!!!!!!!!!!!!"+wishPage);
            System.out.println("readpage!!!!!!!!!!!!!!!!!!!!!!!!!!!!"+readPage);
            
            req.setAttribute("search", search);
            req.setAttribute("choice", choice);
            System.out.println("getwishlist controller6");
            
            System.out.println("getclublist controller");
         
            //클럽리스트를 보내주기
            String sclubpageNumber = req.getParameter("clubpageNumber");
            
            System.out.println("sclubpageNumber = " + sclubpageNumber);
            
            int clubpageNumber = 0;
            
            if(sclubpageNumber != null && !sclubpageNumber.equals("")) {
               clubpageNumber = Integer.parseInt(sclubpageNumber);
            }
           
            System.out.println("getclublist controller1");

            
            dao = MypageDao.getInstance();
            
            List<ClubDto> clublist = dao.getClubList(clubpageNumber, membernum);

            req.setAttribute("clublist", clublist);
            
            System.out.println("getclublist controller2");
   
            int len = dao.getAllClub(membernum);
            
            System.out.println("wishlen"+len);
            
            int clubPage = len / 3;        // 5 -> 2
            if((len % 3) > 0){
               clubPage = clubPage + 1;
            }
                       
            System.out.println("getclublist controller3");
            
            req.setAttribute("clubPage", clubPage + "");
            req.setAttribute("clubpageNumber", clubpageNumber + "");
         
            System.out.println("getclublist controller4");
            
            
            req.getRequestDispatcher("index.jsp?content=mypage").forward(req, resp);                 
       }
        
        if(param.equals("memberupdate")) {
           System.out.println("memberupdate controller");
           
           int membernum = Integer.parseInt( req.getParameter("membernum") );
           System.out.println("membernum = " + membernum);
           MypageDao dao = MypageDao.getInstance();
           
           MemberDto memberdto = dao.getMyInfo(membernum);
           
           System.out.println("memberdto = " + memberdto);
           //회원정보 가져옴
           req.setAttribute("memberdto", memberdto);
           req.setAttribute("membernum", membernum);
           //회원정보 빈칸에 넣기
           req.getRequestDispatcher("mypageUpdate.jsp").forward(req, resp);  
           
        }
      
      //wishbook삭제
      if(param.equals("wishbookDelete")) {
      
         System.out.println("위시북 삭제");
         
         int booknum = Integer.parseInt(req.getParameter("bookNum"));
         int membernum = Integer.parseInt(req.getParameter("userid"));
         System.out.println("책번호 : "+booknum+" 멤버번호 : "+ membernum);
         
         MypageDao dao = MypageDao.getInstance();
         dao.deleteWishBook(membernum, booknum);
         
         resp.sendRedirect("book?param=bookdetail&booknum=" + booknum + "&membernum=" + membernum);
      }
      
      //wishbook 추가
      if(param.equals("wishbookInsert")) {
      
         System.out.println("위시북 추가");
         
         int booknum = Integer.parseInt(req.getParameter("bookNum"));
         int membernum = Integer.parseInt(req.getParameter("userid"));
         System.out.println("책번호 : "+booknum+" 멤버번호 : "+ membernum);
         
         MypageDao dao = MypageDao.getInstance();
         dao.addWishBook(membernum, booknum);
         
         resp.sendRedirect("book?param=bookdetail&booknum=" + booknum + "&membernum=" + membernum);
      }
     
   }
   
}
   
