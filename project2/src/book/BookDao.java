package book;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;

public class BookDao {
   private static BookDao dao = new BookDao();
   
   private BookDao() {
      DBConnection.initConnection();
   }
   
   public static BookDao getInstance() {
      return dao;
   }
   
   //북 전체 불러오기(최신순)
   public List<BookDto> getBookList(String searchTitle, String searchText, int pageNumber){
      
      String sql = " SELECT BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, "
            + " AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE, RNUM "
            + " FROM (SELECT ROW_NUMBER()OVER(ORDER BY ISSUEDATE DESC, BOOKNUM DESC) AS RNUM, BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE,"
            + " AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE "
            + " FROM BOOK "
            + " WHERE BOOKDEL = 0 ";
      
      String sWord ="";
      if(searchTitle.equals("title")) {
         sWord = " AND BOOKTITLE LIKE '%" +searchText+ "%' ";   
      }else if(searchTitle.equals("author")) {
         sWord = " AND AUTHOR LIKE '%"+searchText+"%' ";
      }
      
      sql = sql + sWord + " ORDER BY ISSUEDATE DESC, BOOKNUM DESC) ";
      sql = sql + " WHERE RNUM BETWEEN ? AND ? ";
      
      int start, end;
      start = 1 + 12*pageNumber;
      end = 12 + 12*pageNumber;
      
      System.out.println(sql);
      
      Connection conn = null;
      PreparedStatement psmt = null;
      ResultSet rs = null;
      
      List<BookDto> list = new ArrayList<BookDto>();
      
      try {
         
         conn = DBConnection.getConnection();
         System.out.println("getBookList 1/4");
         
         psmt = conn.prepareStatement(sql);
         psmt.setInt(1, start);
         psmt.setInt(2, end);
         System.out.println("getBookList 2/4");
         
         rs = psmt.executeQuery();
         System.out.println("getBookList 3/4");
         
         //전체 다 가지고오기
         while(rs.next()) {   
            int i = 1;
            BookDto dto = new BookDto(rs.getInt(i++),
                              rs.getString(i++),
                              rs.getInt(i++),
                              rs.getInt(i++),
                              rs.getInt(i++),
                              rs.getDouble(i++),
                              rs.getString(i++),
                              rs.getString(i++),
                              rs.getString(i++),
                              rs.getString(i++),
                              rs.getString(i));

            
         list.add(dto);            
            
         }
         
         System.out.println("getBookList 4/4");
         
      } catch (SQLException e) {
         System.out.println("getBookList 오류");
         e.printStackTrace();
      }finally {
         
         db.DBClose.close(conn, psmt, rs);
      }
      
      return list;         
   }
   
   
   //페이징을 위한 데이터 전체 길이 출력 메소드
         public int getBookLen(String searchTitle, String searchText) {
            
            String sql = " SELECT COUNT(*) FROM BOOK "
                     + " WHERE BOOKDEL = 0 ";   //데이터 전체의 갯수 출력
            
            String sWord = "";      
            if(searchTitle.equals("title")) {
               sWord = " AND BOOKTITLE LIKE '%"+searchText+"%' ";
            }else if(searchTitle.equals("author")) {
               sWord = " AND AUTHOR LIKE '%"+searchText+"%' ";
            }
            
            sql = sql + sWord;
            
            System.out.println(sql);
            Connection conn = null;
            PreparedStatement psmt = null;
            ResultSet rs = null;
            //길이 출력 받아줄 함수
            int len = 0;
            
            try {
               conn = DBConnection.getConnection();
               System.out.println("getBookLen 세기 1/3");
               
               psmt = conn.prepareStatement(sql);
               System.out.println("getBookLen 세기 2/3");
               
               rs = psmt.executeQuery();
               if(rs.next()) {
                  len = rs.getInt(1);
               }
               System.out.println("getBookLen 세기 3/3");
               
            } catch (SQLException e) {
               System.out.println("getBookLen 세기 오류");

               e.printStackTrace();
            }finally {
               DBClose.close(conn, psmt, rs);
            }
            return len;
            
         }
   
   
   
   //신작 전체 /장르별
   public List<BookDto> getNewSearchList(String menu, String searchTitle, String searchText, int pageNumber){
      
      String sql = " SELECT BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, "
            + " AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE, RNUM "
            + " FROM (SELECT ROW_NUMBER()OVER(ORDER BY ISSUEDATE DESC) AS RNUM, BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE,"
            + " AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE "
            + " FROM BOOK "
            + " WHERE BOOKDEL = 0 ";
      
      String sWord ="";
      if(searchTitle.equals("title")) {
         sWord = " AND BOOKTITLE LIKE '%" +searchText+ "%' ";   
      }else if(searchTitle.equals("author")) {
         sWord = " AND AUTHOR LIKE '%"+searchText+"%' ";
      }
      /*
      시 소설 100 200
      에세이자기계발 300 400
      사회경제 500 900
       역사 600
       과학 800
       예술 만화 700 1000
      */
      String category = "";
      
      if(menu.equals("total")) {
         sql = sql + sWord;
         
      }else{
         
         if(menu.equals("poemFict")) {
            category = " AND (CATEGORIES = 100 OR CATEGORIES = 200) ";
         }
         else if(menu.equals("essaSimp")) {
            category = " AND (CATEGORIES = 300 OR CATEGORIES = 400) ";
         }
         else if(menu.equals("econSoci")) {
            category = " AND (CATEGORIES = 500 OR CATEGORIES = 900) ";
         }
         else if(menu.equals("artComic")) {
            category = " AND (CATEGORIES = 700 OR CATEGORIES = 1000) ";
         }
         else if(menu.equals("historical")) {
            category = " AND CATEGORIES = 600 ";
         }
         else if(menu.equals("science")) {
            category = " AND CATEGORIES = 800 ";
         }
         sql = sql + sWord + category;
      }
      
      sql = sql + " ORDER BY ISSUEDATE DESC) ";
      sql = sql + " WHERE RNUM BETWEEN ? AND ? ";
      
      int start, end;
      start = 1 + 12*pageNumber;
      end = 12 + 12*pageNumber;
      
      System.out.println(sql);
      
      Connection conn = null;
      PreparedStatement psmt = null;
      ResultSet rs = null;
      
      List<BookDto> list = new ArrayList<BookDto>();
      
      try {
         
         conn = DBConnection.getConnection();
         System.out.println("getNewSearchList 1/4");
         
         psmt = conn.prepareStatement(sql);
         psmt.setInt(1, start);
         psmt.setInt(2, end);
         System.out.println("getNewSearchList 2/4");
         
         rs = psmt.executeQuery();
         System.out.println("getNewSearchList 3/4");
         
         //전체 다 가지고오기
         while(rs.next()) {   
            int i = 1;
            BookDto dto = new BookDto(rs.getInt(i++),
                              rs.getString(i++),
                              rs.getInt(i++),
                              rs.getInt(i++),
                              rs.getInt(i++),
                              rs.getDouble(i++),
                              rs.getString(i++),
                              rs.getString(i++),
                              rs.getString(i++),
                              rs.getString(i++),
                               rs.getString(i));
            
         list.add(dto);            
            
         }
         
         System.out.println("getNewSearchList 4/4");
         
      } catch (SQLException e) {
         System.out.println("getNewSearchList 오류");
         e.printStackTrace();
      }finally {
         
         db.DBClose.close(conn, psmt, rs);
      }
      
      return list;   
            
   }
   
   //유저들 추천 책
      public List<BookDto> getUserSearchList(String menu, String searchTitle, String searchText, int pageNumber){
         
         String sql = " SELECT BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, "
               + " AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE, RNUM "
               + " FROM (SELECT ROW_NUMBER()OVER(ORDER BY GRADE DESC, BOOKREADCOUNT DESC) AS RNUM, BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE,"
               + " AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE "
               + " FROM BOOK "
               + " WHERE BOOKDEL = 0 ";
         
         String sWord ="";
         if(searchTitle.equals("title")) {
            sWord = " AND BOOKTITLE LIKE '%" +searchText+ "%' ";   
         }else if(searchTitle.equals("author")) {
            sWord = " AND AUTHOR LIKE '%"+searchText+"%' ";
         }
         /*
         시 소설 100 200
         에세이자기계발 300 400
         사회경제 500 900
          역사 600
          과학 800
          예술 만화 700 1000
         */
         String category = "";
         
         if(menu.equals("total")) {
            sql = sql + sWord;
            
         }else{
            
            if(menu.equals("poemFict")) {
               category = " AND (CATEGORIES = 100 OR CATEGORIES = 200) ";
            }
            else if(menu.equals("essaSimp")) {
               category = " AND (CATEGORIES = 300 OR CATEGORIES = 400) ";
            }
            else if(menu.equals("econSoci")) {
               category = " AND (CATEGORIES = 500 OR CATEGORIES = 900) ";
            }
            else if(menu.equals("artComic")) {
               category = " AND (CATEGORIES = 700 OR CATEGORIES = 1000) ";
            }
            else if(menu.equals("historical")) {
               category = " AND CATEGORIES = 600 ";
            }
            else if(menu.equals("science")) {
               category = " AND CATEGORIES = 800 ";
            }
            sql = sql + sWord + category;
         }
         
         sql = sql + " ORDER BY GRADE DESC, BOOKREADCOUNT DESC) ";
         sql = sql + " WHERE RNUM BETWEEN ? AND ? ";
         
         int start, end;
         start = 1 + 12*pageNumber;
         end = 12 + 12*pageNumber;
         
         System.out.println(sql);
         
         Connection conn = null;
         PreparedStatement psmt = null;
         ResultSet rs = null;
         
         List<BookDto> list = new ArrayList<BookDto>();
         
         try {
            
            conn = DBConnection.getConnection();
            System.out.println("getUserSearchList 1/4");
            
            psmt = conn.prepareStatement(sql);
            psmt.setInt(1, start);
            psmt.setInt(2, end);
            System.out.println("getUserSearchList 2/4");
            
            rs = psmt.executeQuery();
            System.out.println("getUserSearchList 3/4");
            
            //전체 다 가지고오기
            while(rs.next()) {   
               int i = 1;
               BookDto dto = new BookDto(rs.getInt(i++),
                                 rs.getString(i++),
                                 rs.getInt(i++),
                                 rs.getInt(i++),
                                 rs.getInt(i++),
                                 rs.getDouble(i++),
                                 rs.getString(i++),
                                 rs.getString(i++),
                                 rs.getString(i++),
                                 rs.getString(i++),
                                  rs.getString(i));
               
            list.add(dto);            
               
            }
            
            System.out.println("getUserSearchList 4/4");
            
         } catch (SQLException e) {
            System.out.println("getUserSearchList 오류");
            e.printStackTrace();
         }finally {
            
            db.DBClose.close(conn, psmt, rs);
         }
         
         return list;   
               
      }
      
   
   
   //페이징을 위한 데이터 전체 길이 출력 메소드
      public int getAllBookLen(String searchTitle, String searchText, String menu) {
         
         String sql = " SELECT COUNT(*) FROM BOOK "
                  + " WHERE BOOKDEL = 0 ";   //데이터 전체의 갯수 출력
         
         String sWord = "";      
         if(searchTitle.equals("title")) {
            sWord = " AND BOOKTITLE LIKE '%"+searchText+"%' ";
         }else if(searchTitle.equals("author")) {
            sWord = " AND AUTHOR LIKE '%"+searchText+"%' ";
         }
         
         String category = "";
         if(menu.equals("total")) {
            sql = sql + sWord;
            
         }else{
            
            if(menu.equals("poemFict")) {
               category = " AND (CATEGORIES = 100 OR CATEGORIES = 200) ";
            }
            else if(menu.equals("essaSimp")) {
               category = " AND (CATEGORIES = 300 OR CATEGORIES = 400) ";
            }
            else if(menu.equals("econSoci")) {
               category = " AND (CATEGORIES = 500 OR CATEGORIES = 900) ";
            }
            else if(menu.equals("artComic")) {
               category = " AND (CATEGORIES = 700 OR CATEGORIES = 1000) ";
            }
            else if(menu.equals("historical")) {
               category = " AND CATEGORIES = 600 ";
            }
            else if(menu.equals("science")) {
               category = " AND CATEGORIES = 800 ";
            }
            sql = sql + sWord + category;
         }
         
         System.out.println(sql);
         Connection conn = null;
         PreparedStatement psmt = null;
         ResultSet rs = null;
         //길이 출력 받아줄 함수
         int len = 0;
         
         try {
            conn = DBConnection.getConnection();
            System.out.println("전체 데이터 갯수 세기 1/3");
            
            psmt = conn.prepareStatement(sql);
            System.out.println("전체 데이터 갯수 세기 2/3");
            
            rs = psmt.executeQuery();
            if(rs.next()) {
               len = rs.getInt(1);
            }
            System.out.println("전체 데이터 갯수 세기 3/3");
            
         } catch (SQLException e) {
            System.out.println("전체 데이터 갯수 세기 오류");

            e.printStackTrace();
         }finally {
            DBClose.close(conn, psmt, rs);
         }
         return len;
         
      }
   
      //선택한 책 정보 불러오기 (bookdetail)
      public BookDto getPickBook(int bookNum){
         
         String sql = " SELECT BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE "
                  +" FROM BOOK "
                  + " WHERE BOOKNUM = "+bookNum;
         
         Connection conn = null;
         PreparedStatement psmt = null;
         ResultSet rs = null;
         
         BookDto dto = null;
         
         System.out.println(sql);
         try {
            
            conn = DBConnection.getConnection();
            System.out.println("getPickBook 1/4");
            
            psmt = conn.prepareStatement(sql);
            System.out.println("getPickBook 2/4");
            
            rs = psmt.executeQuery();
            System.out.println("getPickBook 3/4");
            
            //전체 다 가지고오기
            if(rs.next()) {   
               int i = 1;
               dto = new BookDto(rs.getInt(i++),
                                 rs.getString(i++),
                                 rs.getInt(i++),
                                 rs.getInt(i++),
                                 rs.getInt(i++),
                                 rs.getDouble(i++),
                                 rs.getString(i++),
                                 rs.getString(i++),
                                 rs.getString(i++),
                                 rs.getString(i++),
                                  rs.getString(i));            
            }
            
            System.out.println("getPickBook 4/4");
            
         } catch (SQLException e) {
            System.out.println("getPickBook 오류");
            e.printStackTrace();
         }finally {
            
            db.DBClose.close(conn, psmt, rs);
         }
         return dto;   
         
      }
      
      //조회수 늘리기
      public void getReadCountUpdate(int booknum) {
         
         String sql = " UPDATE BOOK "
                  +" SET BOOKREADCOUNT = BOOKREADCOUNT+1 "
                  +" WHERE BOOKNUM = ? ";
         
         Connection conn = null;
         PreparedStatement psmt = null;
         
         try {
                     
         conn = DBConnection.getConnection();
         System.out.println("readcount 1/3");
         
         psmt = conn.prepareStatement(sql);
         psmt.setInt(1, booknum);
         System.out.println("readcount 2/3");
         
         psmt.executeUpdate();   //count로 안 받아줘도 가능
         System.out.println("readcount 3/3");
         } catch (Exception e) {
            System.out.println("readcount 연결 오류");
            e.printStackTrace();
         }finally {
            DBClose.close(conn, psmt, null);
         }
          
      }
   
    //관리자 책 추가하기   (insert용 생성자 사용) 확인차 boolean으로 했는데 원하시면 void형으로 바꾸시면 됩니다.
      public boolean getBookInsert(BookDto dto) {
         
         String sql = " INSERT INTO BOOK(BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE) "
                  +" VALUES(SEQ_BOOK.NEXTVAL, ?, ?, 0, 0, 0, ?,TO_DATE(?,'MM-DD-YYYY'), ?, ?, ?) ";

         
         Connection conn = null;
         PreparedStatement psmt = null;
         int count = 0;
         
         try {
                     
         conn = DBConnection.getConnection();
         System.out.println("getBookInsert 1/3");
         
         psmt = conn.prepareStatement(sql);
         psmt.setString(1, dto.getBooktitle());
         psmt.setInt(2, dto.getCategories());
         psmt.setString(3, dto.getAuthor());
         psmt.setString(4, dto.getIssudate());
         psmt.setString(5, dto.getBookheader());
         psmt.setString(6, dto.getPublisher());
         psmt.setString(7, dto.getBookimage());
         System.out.println("getBookInsert 2/3");
         
         count = psmt.executeUpdate();   //count로 안 받아줘도 가능
         System.out.println("getBookInsert 3/3");
         
         } catch (Exception e) {
            System.out.println("getBookInsert 연결 오류");
            e.printStackTrace();
         }finally {
            DBClose.close(conn, psmt, null);
         }
         return count>0?true:false;
         
      }
      
      //관리자용 삭제 (확인차 boolean으로 했는데 원하시면 void형으로 바꾸시면 됩니다.)
      public boolean getDeleteBook(int booknum) {
         
         String sql = " UPDATE BOOK "
                  +" SET BOOKDEL = 1 "
                  +" WHERE BOOKNUM = "+booknum;
         
         Connection conn = null;
         PreparedStatement psmt = null;
         int count = 0;
         
         try {
                     
         conn = DBConnection.getConnection();
         System.out.println("getDeleteBook 1/3");
         
         psmt = conn.prepareStatement(sql);
         System.out.println("getDeleteBook 2/3");
         
         count = psmt.executeUpdate();   //count로 안 받아줘도 가능
         System.out.println("getDeleteBook 3/3");
         
         } catch (Exception e) {
            System.out.println("getDeleteBook 오류");
            e.printStackTrace();
         }finally {
            DBClose.close(conn, psmt, null);
         }
         return count>0?true:false;
         
      }
      
      //관리자용 수정 (dto로 받아서 처리)
      public boolean getUpdateBook(BookDto book) {
         
         String sql = " UPDATE BOOK "
                  +" SET BOOKTITLE=?, CATEGORIES=?, AUTHOR=?, ISSUEDATE=?, BOOKHEADER=?, PUBLISHER=?, BOOKIMAGE=? "
                  +" WHERE BOOKNUM = ? ";
         
         Connection conn = null;
         PreparedStatement psmt = null;
         int count = 0;
         
         try {
                     
         conn = DBConnection.getConnection();
         System.out.println("getUpdateBook 1/3");
         
         psmt = conn.prepareStatement(sql);
         psmt.setString(1, book.getBooktitle());
         psmt.setInt(2, book.getCategories());
         psmt.setString(3, book.getAuthor());
         psmt.setString(4, book.getIssudate());
         psmt.setString(5, book.getBookheader());
         psmt.setString(6, book.getPublisher());
         psmt.setString(7, book.getBookimage());
         psmt.setInt(8, book.getBooknum());
         System.out.println("getUpdateBook 2/3");
         
         count = psmt.executeUpdate();   //count로 안 받아줘도 가능
         System.out.println("getUpdateBook 3/3");
         
         } catch (Exception e) {
            System.out.println("getUpdateBook 오류");
            e.printStackTrace();
         }finally {
            DBClose.close(conn, psmt, null);
         }
         return count>0?true:false;
         
      }
      
      //wishbook insert(원하시면 void로 바꾸시면 됩니다.)
      public boolean getInsertWishBook(int membernum, int booknum) {
         
         String sql = " INSERT INTO MYLIBRARY(MEMBERNUM, WISHBOOK) "
                  +" VALUES(?, ?) ";
         
         Connection conn = null;
         PreparedStatement psmt = null;
         int count = 0;
         
         try {
                     
         conn = DBConnection.getConnection();
         System.out.println("getInsertWishBook 1/3");
         
         psmt = conn.prepareStatement(sql);
         psmt.setInt(1, membernum);
         psmt.setInt(2, booknum);
         
         System.out.println("getInsertWishBook 2/3");
         
         count = psmt.executeUpdate();   //count로 안 받아줘도 가능
         System.out.println("getInsertWishBook 3/3");
         
         } catch (Exception e) {
            System.out.println("getInsertWishBook 오류");
            e.printStackTrace();
         }finally {
            DBClose.close(conn, psmt, null);
         }
         return count>0?true:false;
         
      }
      
      //댓글 insert
      public void getInsertReview(BookReviewDto rev) {
          
          String sql = " INSERT INTO REVIEW(REVSEQ, REVCONTENT, REVDATE, RATING, BOOKNUM, MEMBERNUM) "
                +" VALUES(SEQ_REVIEW.NEXTVAL, ?, SYSDATE, ?, ?, ?) ";
          
          Connection conn = null;
          PreparedStatement psmt = null;
                   
          try {
                      
          conn = DBConnection.getConnection();
          System.out.println("getInsertReview 1/3");
          
          psmt = conn.prepareStatement(sql);
          psmt.setString(1, rev.getRevcontent());
          psmt.setInt(2, rev.getRating());
          psmt.setInt(3, rev.getBooknum());
          psmt.setInt(4, rev.getMembernum());
       
          System.out.println("getInsertReview 2/3");
          
          psmt.executeUpdate();   //count로 안 받아줘도 가능
          System.out.println("getInsertReview 3/3" + rev.getMembernum());

          setActivity(rev.getMembernum()); //유저 활동지수 올리는 메서드
          ratingAvg(rev.getBooknum()); //책 별점 평균계산
          } catch (Exception e) {
             System.out.println("getInsertReview 오류");
             e.printStackTrace();
          }finally {
             DBClose.close(conn, psmt, null);
          }
       }
      
      //회원 리뷰쓰면 활동지수 올리는 함수
      public void setActivity(int seq) {
         String sql = " UPDATE MEMBERS SET ACTIVITY=ACTIVITY+1 WHERE MEMBERNUM=? ";
         
         Connection conn = null;
         PreparedStatement psmt = null;
                  
         try {
            conn = DBConnection.getConnection();
            System.out.println("setActivity 1/3");
            
            psmt = conn.prepareStatement(sql);
            psmt.setInt(1, seq);
            System.out.println("setActivity 2/3" + seq);
            
            psmt.executeUpdate();
            System.out.println("setActivity 3/3");
         }
         catch (Exception e) {System.out.println("setActivity 오류");}
         finally {DBClose.close(conn, psmt, null);}         
      }
      
      //댓글 select
      public List<BookReviewDto> getAllReview(String choice, int booknum, int pageNum){
         
         String sql = "";
         //최신순
         if(choice.equals("revdate")) {      
            sql =    " SELECT REVSEQ, REVCONTENT, REVDATE, RATING, BOOKNUM, MEMBERNUMER, USERID, USERIMAGE, RNUM "
                  + " FROM(SELECT REVSEQ, REVCONTENT, REVDATE, RATING, BOOKNUM, M.MEMBERNUM AS MEMBERNUMER, USERID, USERIMAGE, ROW_NUMBER()OVER(ORDER BY REVDATE DESC, REVSEQ DESC) AS RNUM "
                  + " FROM MEMBERS M, REVIEW R " 
                  + " WHERE M.MEMBERNUM = R.MEMBERNUM "
                     + "   AND BOOKNUM = ? " 
                  + " ORDER BY REVDATE DESC, REVSEQ DESC) " 
                  + " WHERE RNUM BETWEEN ? AND ? ";
      
            //rating높은 순
         }else if(choice.equals("rating")) {
            sql =    " SELECT REVSEQ, REVCONTENT, REVDATE, RATING, BOOKNUM, MEMBERNUMER, USERID, USERIMAGE, RNUM "
                  + " FROM(SELECT REVSEQ, REVCONTENT, REVDATE, RATING, BOOKNUM, M.MEMBERNUM AS MEMBERNUMER, USERID, USERIMAGE, ROW_NUMBER()OVER(ORDER BY RATING DESC, REVDATE DESC) AS RNUM "
                  + " FROM MEMBERS M, REVIEW R " 
                  + " WHERE M.MEMBERNUM = R.MEMBERNUM "
                     + "   AND BOOKNUM = ? " 
                  + " ORDER BY RATING DESC, REVDATE DESC) " 
                  + " WHERE RNUM BETWEEN ? AND ? ";
      
         }   
         
         int start, end;
         start = 1 + 10*pageNum;
         end = 10 + 10*pageNum;
         
         
         Connection conn = null;
         PreparedStatement psmt = null;
         ResultSet rs = null;
         
         List<BookReviewDto> list = new ArrayList<BookReviewDto>();
         
         System.out.println(sql);
         try {
            
            conn = DBConnection.getConnection();
            System.out.println("getAllReview 1/4");
            
            psmt = conn.prepareStatement(sql);
            psmt.setInt(1, booknum);
            psmt.setInt(2, start);
            psmt.setInt(3, end);
            System.out.println("getAllReview 2/4");
            /* System.out.println(rs.getString(7)); */
            
            rs = psmt.executeQuery();
            System.out.println("getAllReview 3/4");
            
            //전체 다 가지고오기
            while(rs.next()) {   
               int i = 1;
               BookReviewDto rev = new BookReviewDto(rs.getInt(i++),
                                          rs.getString(i++),
                                          rs.getString(i++),
                                          rs.getInt(i++),
                                          rs.getInt(i++),
                                          rs.getInt(i++),
                                          rs.getString(i++),
                                          rs.getString(i++));
               list.add(rev);
            }
            
            System.out.println("getAllReview 4/4");
            
         } catch (SQLException e) {
            System.out.println("getAllReview 오류");
            e.printStackTrace();
         }finally {
            
            db.DBClose.close(conn, psmt, rs);
         }
         return list;   
         
      }
      
      //페이징을 위한 데이터 댓글 전체길이
      public int getAllReviewLen(int booknum) {
         
         String sql = " SELECT COUNT(*) FROM REVIEW "
                  +" WHERE BOOKNUM = " + booknum;
         
         System.out.println(sql);
         Connection conn = null;
         PreparedStatement psmt = null;
         ResultSet rs = null;
         
         //길이 출력 받아줄 함수
         int len = 0;
         
         try {
            conn = DBConnection.getConnection();
            System.out.println("getAllReviewLen 1/3");
            
            psmt = conn.prepareStatement(sql);
            System.out.println("getAllReviewLen 2/3");
            
            rs = psmt.executeQuery();
            if(rs.next()) {
               len = rs.getInt(1);
            }
            System.out.println("getAllReviewLen 3/3");
            
         } catch (SQLException e) {
            System.out.println("getAllReviewLen 오류");

            e.printStackTrace();
         }finally {
            DBClose.close(conn, psmt, rs);
         }
         return len;
         
      }
      
      
      //해당 책의 현재 별점 가져오기
      public int getBookgrade(int booknum) {
          String sql = " SELECT GRADE FROM BOOK WHERE BOOKNUM = ? ";

          Connection conn = null;
          PreparedStatement psmt = null;
          ResultSet rs = null;
          int grade = 0;
          try {
             conn = DBConnection.getConnection();
             System.out.println("getBookgrade 1/3");
             
             psmt = conn.prepareStatement(sql);
             System.out.println("getBookgrade 2/3");
             
             psmt.setInt(1, booknum);
             rs = psmt.executeQuery();
             if(rs.next()) { grade = rs.getInt(1); }
             System.out.println("getBookgrade 3/3");
          }
          catch (SQLException e) {System.out.println("getBookgrade 오류");}
          finally { DBClose.close(conn, psmt, rs);}
          return grade;
       }
      
      // 신작
      public List<BookDto> getNewBookList() {
         String sql = " SELECT BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, "
                   + " AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE, RNUM "
                   + " FROM (SELECT ROW_NUMBER()OVER(ORDER BY ISSUEDATE DESC, BOOKNUM DESC) AS RNUM, BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE,"
                   + " AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE "
                   + " FROM BOOK "
                   + " WHERE BOOKDEL = 0 "
                  + " ORDER BY ISSUEDATE DESC, BOOKNUM DESC) "
                  + " WHERE RNUM BETWEEN 1 AND 3 ";
         
             System.out.println(sql);
             
             Connection conn = null;
             PreparedStatement psmt = null;
             ResultSet rs = null;
             
             List<BookDto> list = new ArrayList<BookDto>();
             
             try {
                
                conn = DBConnection.getConnection();
                System.out.println("getNewBookList 1/4");
                
                psmt = conn.prepareStatement(sql);
                System.out.println("getNewBookList 2/4");
                
                rs = psmt.executeQuery();
                System.out.println("getNewBookList 3/4");
                
                //전체 다 가지고오기
                while(rs.next()) {   
                   int i = 1;
                   BookDto dto = new BookDto(rs.getInt(i++),
                                     rs.getString(i++),
                                     rs.getInt(i++),
                                     rs.getInt(i++),
                                     rs.getInt(i++),
                                     rs.getDouble(i++),
                                     rs.getString(i++),
                                     rs.getString(i++),
                                     rs.getString(i++),
                                     rs.getString(i++),
                                     rs.getString(i));

                   
                list.add(dto);            
                }
             }catch (SQLException e) {
                  System.out.println("getNewBookList 오류");
                  e.printStackTrace();
               }finally {
                  
                  db.DBClose.close(conn, psmt, rs);
               }
               
               return list; 
      }    
      
      //RATING 평균내기
      public void ratingAvg(int booknum) {
         //select별점가져오기
         String sql1 = " SELECT B.BOOKNUM, B.BOOKTITLE, B.GRADE, BA.GRADEAVG "
               + " FROM BOOK B, (SELECT BOOKNUM, ROUND(AVG(RATING),1) AS GRADEAVG "
               + " FROM REVIEW GROUP BY BOOKNUM) BA "
               + " WHERE B.BOOKNUM=BA.BOOKNUM "
               + " AND BA.BOOKNUM=? ";
         //update
         String sql2 = " UPDATE BOOK SET GRADE=? WHERE BOOKNUM=? ";
         
         Connection conn = null;
         PreparedStatement psmt = null;
         ResultSet rs = null;
          Double ratingAvg = 0.0;
        
          try {
              conn = DBConnection.getConnection();
              conn.setAutoCommit(false); //자동 커밋 해체
              System.out.println("1/6 ratingAvg");
              
              //select 부터
              psmt = conn.prepareStatement(sql1);
              psmt.setInt(1, booknum);
              
              rs = psmt.executeQuery();
              if(rs.next()) {ratingAvg = rs.getDouble(4);}
              System.out.println("2/6 ratingAvg" + ratingAvg);
              
              psmt.clearParameters();//psmt 초기화
              System.out.println("3/6 ratingAvg");
              
              //다음 update
              psmt = conn.prepareStatement(sql2);
              psmt.setDouble(1, ratingAvg);
              psmt.setInt(2, booknum);
              System.out.println("4/6 ratingAvg");
              
              psmt.executeUpdate();
              System.out.println("5/6 ratingAvg");
              
              conn.commit();
              System.out.println("6/6 ratingAvg");
           
          }
          
           catch (SQLException e) {
              System.out.println("ratingAvg fail");
              try {conn.rollback();}
              catch (SQLException e1) {e1.printStackTrace();}
           }
             
           finally {
              try {conn.setAutoCommit(true);}
              catch (SQLException e) {e.printStackTrace();}
              DBClose.close(conn, psmt, rs);
           }
          
         }
      
      // 이달의 책
      public List<BookDto> getBestBookList(){
         String sql = " SELECT BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, "
                  + " AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE, RNUM "
                  + " FROM (SELECT ROW_NUMBER()OVER(ORDER BY GRADE DESC, BOOKREADCOUNT DESC) AS RNUM, BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, "
                  + " AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE "
                  + " FROM BOOK "
                  + " WHERE BOOKDEL = 0 "
                  + " ORDER BY GRADE DESC, BOOKREADCOUNT DESC) "
                  + " WHERE RNUM BETWEEN 1 AND 4 ";
                      
            System.out.println(sql);
            
            Connection conn = null;
            PreparedStatement psmt = null;
            ResultSet rs = null;
            
            List<BookDto> list = new ArrayList<BookDto>();
            
            try {
               
               conn = DBConnection.getConnection();
               System.out.println("getBestBookList 1/4");
               
               psmt = conn.prepareStatement(sql);
           
               System.out.println("getBestBookList 2/4");
               
               rs = psmt.executeQuery();
               System.out.println("getBestBookList 3/4");
           
               while(rs.next()) {   
                  int i = 1;
                  BookDto dto = new BookDto(rs.getInt(i++),
                                    rs.getString(i++),
                                    rs.getInt(i++),
                                    rs.getInt(i++),
                                    rs.getInt(i++),
                                    rs.getDouble(i++),
                                    rs.getString(i++),
                                    rs.getString(i++),
                                    rs.getString(i++),
                                    rs.getString(i++),
                                     rs.getString(i));
                  
               list.add(dto);            
                  
               }
               
               System.out.println("getBestBookList 4/4");
               
            } catch (SQLException e) {
               System.out.println("getBestBookList 오류");
               e.printStackTrace();
            }finally {
               
               db.DBClose.close(conn, psmt, rs);
            }
            
            return list;   
      }
      
      public List<BookDto> getBookAllList(String searchTitle, String searchText){
         
         String sql = " SELECT BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, "
                   + " AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE, RNUM "
                   + " FROM (SELECT ROW_NUMBER()OVER(ORDER BY ISSUEDATE DESC, BOOKNUM DESC) AS RNUM, BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE,"
                   + " AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE "
                   + " FROM BOOK "
                   + " WHERE BOOKDEL = 0 ";
             
             String sWord ="";
             
             if(searchTitle.equals("title")) {
                sWord = " AND BOOKTITLE LIKE '%" +searchText+ "%' ";   
             }else if(searchTitle.equals("author")) {
                sWord = " AND AUTHOR LIKE '%"+searchText+"%' ";
             }
             
             sql = sql + sWord + " ORDER BY ISSUEDATE DESC, BOOKNUM DESC) ";
             
             System.out.println(sql);
             
             Connection conn = null;
             PreparedStatement psmt = null;
             ResultSet rs = null;
             
             List<BookDto> list = new ArrayList<BookDto>();
             
             try {
                
                conn = DBConnection.getConnection();
                System.out.println("getBookList 1/4");
                
                psmt = conn.prepareStatement(sql);
                System.out.println("getBookList 2/4");
                
                rs = psmt.executeQuery();
                System.out.println("getBookList 3/4");
                
                //전체 다 가지고오기
                while(rs.next()) {   
                   int i = 1;
                   BookDto dto = new BookDto(rs.getInt(i++),
                                     rs.getString(i++),
                                     rs.getInt(i++),
                                     rs.getInt(i++),
                                     rs.getInt(i++),
                                     rs.getDouble(i++),
                                     rs.getString(i++),
                                     rs.getString(i++),
                                     rs.getString(i++),
                                     rs.getString(i++),
                                     rs.getString(i));

                   
                list.add(dto);            
                   
                }
                
                System.out.println("getBookList 4/4");
                
             } catch (SQLException e) {
                System.out.println("getBookList 오류");
                e.printStackTrace();
             }finally {
                
                db.DBClose.close(conn, psmt, rs);
             }
             
             return list;         
          }
      
}