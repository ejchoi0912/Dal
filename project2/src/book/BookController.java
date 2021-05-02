package book;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import club.ClubDao;
import club.ClubDto;
import mypage.MypageDao;
import net.sf.json.JSONObject;

public class BookController extends HttpServlet{

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
      System.out.println("bookController doProcess");
      
      String param = req.getParameter("param");
      
      //신작검색
      if(param.equals("booklist")) {
         System.out.println("글목록 검색 페이징 추가");
         
         
         
         String searchTitle = req.getParameter("searchTitle");
         String searchText = req.getParameter("searchText");
         String spage = req.getParameter("pageNumber");
         String menu = req.getParameter("menu");

   
         //페이지 값이 없다면 0으로 출력
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
         
         //처음 들어올 때 전체 출력
         if(menu == null || menu.equals("")) {
            menu = "total";
         }
         System.out.println("글목록 검색 페이징 추가 2/3");
         
         //db와 연결
         BookDao dao = BookDao.getInstance();
         List<BookDto> Newlist = dao.getNewSearchList(menu, searchTitle, searchText, page);
         List<BookDto> Userlist = dao.getUserSearchList(menu, searchTitle, searchText, page);
         
         req.setAttribute("Newlist", Newlist);
         req.setAttribute("Userlist", Userlist);
         
         
         //paging의 길이
         int len = dao.getAllBookLen(searchTitle, searchText, menu);
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
         req.setAttribute("menu", menu);
         
         System.out.println("글목록 검색 페이징 추가 3/3");
         req.getRequestDispatcher("index.jsp?content=book").forward(req, resp);
         
      }
      
      //선택한 책 출력
      if(param.equals("bookdetail")) {
         
         System.out.println("책 상세 컨트롤러 1/3");
         
         //댓글 페이징
         String choice = req.getParameter("choice");
         int bookNum = Integer.parseInt(req.getParameter("booknum"));
         System.out.println("책번호 : " +bookNum);
         
         //페이징 숫자 정하기
         String spage = req.getParameter("pageNumber");
         int page =0;
         if(spage != null && !spage.equals("")) {
            page=Integer.parseInt(spage);
         }
         
         //select선택
         if(choice == null) {
            choice = "revdate";
         }
         System.out.println("책 상세 컨트롤러 2/3");
         
         BookDao dao = BookDao.getInstance();
         //조회수 추가
         dao.getReadCountUpdate(bookNum);
         //선택 책 데이터
         BookDto book = dao.getPickBook(bookNum);
         //댓글 전체 데이터
         List<BookReviewDto> rev = dao.getAllReview(choice, bookNum, page);
         
         //페이징
         int len = dao.getAllReviewLen(bookNum);
         System.out.println("페이징 길이 : "+len);
         
         //페이징 숫자(1 2 3 4 5)
         int bookPage = len/10;
         if(len % 10 > 0) {
            bookPage = bookPage + 1;
         }         
         
       //책에 속한 소모임 이름 불러오기 
         ClubDao cDao = ClubDao.getInstance();
         List<ClubDto> club = cDao.bookClubList(bookNum);
                 
         // 위시리스트 추가 여부
          String smembernum = req.getParameter("membernum");
          
          int membernum = 0;
          
          System.out.println("smembernum = " + smembernum);
          if(smembernum != null) {
         	 membernum = Integer.parseInt(smembernum);
          }
          System.out.println("membernum = " + membernum);
          
          MypageDao mypagedao = MypageDao.getInstance();
          boolean like = mypagedao.getlike(membernum, bookNum);
          System.out.println("like = " + like);
         
 
         System.out.println("책 상세 컨트롤러 3/3");
         req.setAttribute("bookPage", bookPage+"");
         req.setAttribute("pageNumber", page+"");
         req.setAttribute("choice", choice);
         
         req.setAttribute("rev", rev);
         req.setAttribute("book", book);
         req.setAttribute("club", club);
         req.setAttribute("like", like);
         req.getRequestDispatcher("index.jsp?content=bookdetail").forward(req, resp);
         
      }else if(param.equals("masterPage")) {
          
          
           String searchTitle = req.getParameter("searchTitle");
           String searchText = req.getParameter("searchText");
          
           
           System.out.println(searchTitle + searchText);

         //검색창이 비어있다면 전체 출력
           if(searchTitle == null) {
              searchTitle = "";
           }
           if(searchText == null){
               searchText = "";
           }
           
             //처음 들어올 때 전체 출력

             System.out.println("글목록 검색 페이징 추가 2/3");
             
             //db와 연결
             BookDao dao = BookDao.getInstance();
             System.out.println(searchTitle+","+searchText);
             List<BookDto> bookList = dao.getBookAllList(searchTitle, searchText);
             
             req.setAttribute("bookList", bookList);
        
            req.setAttribute("searchTitle", searchTitle);
            req.setAttribute("searchText", searchText);
             
             req.setAttribute("error", "0");
             req.getRequestDispatcher("index.jsp?content=masterPage").forward(req, resp);

         }else if(param.equals("deleteBook")) {
            
            int bookNum = Integer.parseInt(req.getParameter("booknum"));
                   
            BookDao dao = BookDao.getInstance();
            boolean bookDelete = dao.getDeleteBook(bookNum);
            if(bookDelete == true) {

             //책 삭제 완료
            	
             String searchTitle = req.getParameter("searchTitle");
             String searchText = req.getParameter("searchText");
             String spage = req.getParameter("pageNumber");
               
            //페이지 값이 없다면 0으로 출력

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
            
              List<BookDto> bookList = dao.getBookAllList(searchTitle, searchText);
              req.setAttribute("bookList", bookList);
              
              //paging의 길이
              int len = dao.getBookLen(searchTitle, searchText);
              System.out.println("페이징 길이 : "+len);
              
              //페이징 숫자(1 2 3 4 5)
              int bookPage = len/12;
              if(len % 12 > 0) {
                 bookPage = bookPage + 1;
              }
              
             req.setAttribute("bookPage", bookPage+"");
             req.setAttribute("pageNumber", page+"");
             req.setAttribute("searchTitle", searchTitle);
             req.setAttribute("searchText", searchText);
             req.setAttribute("error", "deleteOk");
             req.getRequestDispatcher("index.jsp?content=masterPage").forward(req, resp);
              
              
              
            }else {
                // 삭제 실패
             	req.setAttribute("error", "bookdelete");
                 req.getRequestDispatcher("index.jsp?content=masterPage").forward(req, resp);
              }
          }else if(param.equals("bookInsertPro")) {
             String title = req.getParameter("title");
             int CATEGORIES = Integer.parseInt(req.getParameter("CATEGORIES"));
             String AUTHOR = req.getParameter("AUTHOR");
             String ISSUEDATE = req.getParameter("ISSUEDATE");
             String BOOKHEADER = req.getParameter("BOOKHEADER");
             String PUBLISHER = req.getParameter("PUBLISHER");
             
             BookDto book = new BookDto();
             book.setBooktitle(title);
             book.setCategories(CATEGORIES);
             book.setAuthor(AUTHOR);
             book.setIssudate(ISSUEDATE);
             book.setBookheader(BOOKHEADER);
             book.setPublisher(PUBLISHER);
             System.out.println("확인용"+book.toString());
             
             BookDao dao = BookDao.getInstance();
             boolean bookInsert = dao.getBookInsert(book);
             if(bookInsert == true) {
                resp.sendRedirect("masterInsert.jsp");
             }
          }else if(param.equals("bookInsert")) {
             resp.sendRedirect("index.jsp?content=masterInsert");
             
          }else if(param.equals("updateBook")) {
             
             int bookNum = Integer.parseInt(req.getParameter("booknum"));
             System.out.println("책번호 : " +bookNum);
             
             BookDao dao = BookDao.getInstance();
            
             dao.getReadCountUpdate(bookNum);
             //선택 책 데이터
             BookDto book = dao.getPickBook(bookNum);
             
             req.setAttribute("book", book);
             req.getRequestDispatcher("index.jsp?content=masterUpdate").forward(req, resp);
             
          }else if(param.equals("booklistScroll")) {
               String searchTitle = req.getParameter("searchTitle");
               String searchText = req.getParameter("searchText");
               String spage = req.getParameter("pageNumber");
               String menu = req.getParameter("menu");
               System.out.println("page==>"+spage);
               int page =0;
               if(spage != null && !spage.equals("")) {
                  page=Integer.parseInt(spage);
               }
               if(searchTitle == null) {
                  searchTitle = "";
               }
               if(searchText == null){
                   searchText = "";
                }
               if(menu == null || menu.equals("")) {
                  menu = "total";
               }
               BookDao dao = BookDao.getInstance();
               List<BookDto> Newlist = dao.getNewSearchList(menu, searchTitle, searchText, page);
               req.setAttribute("Newlist", Newlist);
               JSONObject jObj = new JSONObject();
               jObj.put("msg", Newlist);
               resp.setContentType("application/x-json; charset=utf-8");
               resp.getWriter().print(jObj);
           }
       
 	      //댓글 추가하기
       if(param.equals("reviewInsert")) {
     	  System.out.println("답글 컨트롤러 ");
     	  
     	  int bookNum = Integer.parseInt(req.getParameter("bookNum"));	 
     	  System.out.println("bookNum = " + bookNum);
     	  
     	  int membernum = Integer.parseInt(req.getParameter("membernum"));
     	  System.out.println("membernum = " + membernum);
     	  
           int memnum = Integer.parseInt(req.getParameter("userid"));
           System.out.println("memnum = " + memnum);
           
           String ratings[] = req.getParameterValues("rating");
           System.out.println("ratings = " + ratings);
           
           int rating = ratings.length;
           System.out.println("rating = " + rating);
           String revcontent = req.getParameter("revcontent");
           
           System.out.println("책번호 : " +bookNum);
           System.out.println("유저넘버 : " +memnum);
           System.out.println("별점 : " +rating);
           System.out.println(" : " +revcontent);
           
           BookReviewDto rev = new BookReviewDto(revcontent, rating, bookNum, memnum);
           
           MypageDao mydao = MypageDao.getInstance(); 
           BookDao bookdao = BookDao.getInstance();
           
           // readbook 추가 여부 -> 한번만 추가하기 위함
           boolean b =  mydao.getread(membernum, bookNum);
           
           bookdao.getInsertReview(rev);
           System.out.println("read북 추가여부 = " + b);
           if(b == false) {
        	   mydao.addreadBook(membernum, bookNum);
           }
           System.out.println("댓글 추가 성공");
          
           resp.sendRedirect("book?param=bookdetail&booknum=" + bookNum + "&membernum=" + membernum);
           
     	//  getInsertReview
     	  
       }
    }
    
    
 }