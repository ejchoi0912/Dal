package mypage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import book.BookDto;
import club.ClubDto;
import db.DBClose;
import db.DBConnection;
import login.MemberDto;

public class MypageDao {

	
private static MypageDao dao = new MypageDao();
	
	private MypageDao() {
		
	}
	
	public static MypageDao getInstance() {
		return dao;
	}
	
	// 마이페이지 위시리스트
	public List<BookDto> getwishList(String choice, String search, int page, int membernum ) {
		String sql = " SELECT BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, "
				+ "	AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE, RNUM "
                + " FROM ";
        
        sql += " (SELECT ROW_NUMBER()OVER(ORDER BY WISHSEQ DESC) AS RNUM, " 
        		+  "    BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, "
        		+ " 	AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE  " 
        		+  "    FROM MYLIBRARY M, BOOK B "
                + "   WHERE M.WISHBOOK = B.BOOKNUM  ";
        
        String sWord = "";
        if(choice.equals("title")) {
            sWord = " AND B.BOOKTITLE LIKE '%" + search + "%' ";
        }
	 	else if(choice.equals("writer")) {
         sWord = " AND AUTHOR LIKE '%" + search + "%' ";
	 	} 
        sql = sql + sWord;
        
        sql += " AND M.MEMBERNUMFK = ? AND B.BOOKNUM > 0 ) ";
        
        sql = sql + " WHERE RNUM >= ? AND RNUM <= ? ";
        
        int start, end;
        start = 1 + 10*page;
        end = 10+ 10*page;
        System.out.println("start = " + start + "end = " + end);
        
        Connection conn = null;
        PreparedStatement psmt = null;
        ResultSet rs = null;
        
        List<BookDto> list = new ArrayList<BookDto>();
        
        try {
            conn = DBConnection.getConnection();
            System.out.println("1/4 getwishList success");
                
            psmt = conn.prepareStatement(sql);
            psmt.setInt(1, membernum);
            psmt.setInt(2, start);
            psmt.setInt(3, end);
            System.out.println("2/4 getwishList success");
        
            
            rs = psmt.executeQuery();
            
            System.out.println("3/4 getwishList success");
            
            while(rs.next()) {
            	int i=1;
            	BookDto dto = new BookDto(rs.getInt(i++),
            							  rs.getString(i++),
            							  rs.getInt(i++),
            							  rs.getInt(i++),
            							  rs.getInt(i++),
            							  rs.getInt(i++),
            							  rs.getString(i++),
            							  rs.getString(i++),
            							  rs.getString(i++),
            							  rs.getString(i++),
            							  rs.getString(i++));
            	
                list.add(dto);
            }            
            System.out.println("4/4 getwishList success");
            
        } catch (SQLException e) {    
            System.out.println("getwishList fail");
            e.printStackTrace();
        } finally {            
            DBClose.close(conn, psmt, rs);            
        }
        
        return list;
	}
	
	// 마이페이지 읽은 책 리스트
	public List<BookDto> getreadList(String choice, String search, int page, int membernum ){
		String sql = " SELECT BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, "
				+ "		AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE, RNUM "
                + " FROM ";
		
		sql += " (SELECT ROW_NUMBER()OVER(ORDER BY WISHSEQ DESC) AS RNUM, " 
        		+  "    BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, "
        		+ " 	AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE " 
        		+  "    FROM MYLIBRARY M, BOOK B "
                + "   WHERE M.READBOOK = B.BOOKNUM ";
       
		  String sWord = "";
	        if(choice.equals("title")) {
	            sWord = " AND BOOKTITLE LIKE '%" + search + "%' ";
	        }
		 	else if(choice.equals("writer")) {
		 		sWord = " AND AUTHOR LIKE '%" + search + "%' ";
		 	} 
	        sql = sql + sWord;
	        
	        sql += " AND M.MEMBERNUMFK = ? AND B.BOOKNUM > 0 ) ";
	        
	        sql += " WHERE RNUM >= ? AND RNUM <= ? ";
	        
	        int start, end;
	        start = 1 + 10*page;
	        end = 10+ 10*page;
	        
	        Connection conn = null;
	        PreparedStatement psmt = null;
	        ResultSet rs = null;
	        
	        List<BookDto> list = new ArrayList<BookDto>();
	        
	        try {
	            conn = DBConnection.getConnection();
	            System.out.println("1/4 getreadList success");
	                
	            psmt = conn.prepareStatement(sql);
	            System.out.println("2/4 getreadList success");
	            psmt.setInt(1, membernum);
	            psmt.setInt(2, start);
	            psmt.setInt(3, end);
	            
	            rs = psmt.executeQuery();
	            
	            System.out.println("3/4 getreadList success");
	            
	            while(rs.next()) {
	            	int i=1;
	            	BookDto dto = new BookDto(rs.getInt(i++),
	            							  rs.getString(i++),
	            							  rs.getInt(i++),
	            							  rs.getInt(i++),
	            							  rs.getInt(i++),
	            							  rs.getInt(i++),
	            							  rs.getString(i++),
	            							  rs.getString(i++),
	            							  rs.getString(i++),
	            							  rs.getString(i++),
	            							  rs.getString(i++));
	            	
	                list.add(dto);
	            }            
	            System.out.println("4/4 getreadList success");
	            
	        } catch (SQLException e) {    
	            System.out.println("getreadList fail");
	            e.printStackTrace();
	        } finally {            
	            DBClose.close(conn, psmt, rs);            
	        }
	        
	        return list;
	}
	
	// 위시전체 총수
	public int getAllWish(String choice, String search, int membernum) {
			String sql = " SELECT COUNT(*) "
			   + " FROM ";
	        
	        sql += " (SELECT ROW_NUMBER()OVER(ORDER BY WISHSEQ DESC) AS RNUM, " 
	        		+  "    BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, "
	        		+ " 	AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE  " 
	        		+  "    FROM MYLIBRARY M, BOOK B "
	                + "   WHERE M.WISHBOOK = B.BOOKNUM ";
	        
	        String sWord = "";
	        if(choice.equals("title")) {
	            sWord = " AND B.BOOKTITLE LIKE '%" + search + "%' ";
	        }
		 	else if(choice.equals("writer")) {
	         sWord = " AND AUTHOR LIKE '%" + search + "%' ";
		 	} 
	        sql = sql + sWord;
	        
	        sql += " AND M.MEMBERNUMFK = ? AND B.BOOKNUM > 0) ";
		         
	      Connection conn = null;
	      PreparedStatement psmt = null;
	      ResultSet rs = null;
	      
	      int len = 0; //return 해줄 글의 총수
	      
	      
	      try {
	         conn = DBConnection.getConnection();
	         System.out.println("1/3 S getAllWish");
	         
	         psmt= conn.prepareStatement(sql);
	         psmt.setInt(1, membernum);
	         System.out.println("2/3 S getAllWish");
	         
	         rs = psmt.executeQuery();
	         if(rs.next()) {
	            len = rs.getInt(1);
	         }
	         System.out.println("3/3 S getAllWish");	         
	      } catch (SQLException e) {
	         System.out.println("Fail getAllWish");
	         e.printStackTrace();
	      } finally {
	         DBClose.close(conn, psmt, rs);
	      }
	      
	      return len;	    
	}
	
	// 읽은 책 총수
	public int getAllRead(String choice, String search, int membernum) {
		String sql = " SELECT COUNT(*)"
                + " FROM ";
		
		sql += " (SELECT ROW_NUMBER()OVER(ORDER BY WISHSEQ DESC) AS RNUM, " 
        		+  "   BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, "
        		+ " 	AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE " 
        		+  "    FROM MYLIBRARY M, BOOK B "
                + "   WHERE M.READBOOK = B.BOOKNUM ";
       
		  String sWord = "";
	        if(choice.equals("title")) {
	            sWord = " AND BOOKTITLE LIKE '%" + search + "%' ";
	        }
		 	else if(choice.equals("writer")) {
		 		sWord = " AND AUTHOR LIKE '%" + search + "%' ";
		 	} 
	        sql = sql + sWord;
	        
	        sql += " AND M.MEMBERNUMFK = ? AND B.BOOKNUM > 0) ";
	        
	      Connection conn = null;
	      PreparedStatement psmt = null;
	      ResultSet rs = null;
	      
	      int len = 0; //return 해줄 글의 총수
	      
	      
	      try {
	         conn = DBConnection.getConnection();
	         System.out.println("1/3 S getAllRead");
	         
	         psmt= conn.prepareStatement(sql);
	         psmt.setInt(1, membernum);
	         System.out.println("2/3 S getAllRead");
	         
	         rs = psmt.executeQuery();
	         if(rs.next()) {
	            len = rs.getInt(1);
	         }
	         System.out.println("3/3 S getAllRead");	         
	      } catch (SQLException e) {
	         System.out.println("Fail getAllRead");
	         e.printStackTrace();
	      } finally {
	         DBClose.close(conn, psmt, rs);
	      }
	      
	      return len;	    
	}
	
	//클럽리스트 불러오기
	public List<ClubDto> getClubList(int page, int membernum) {
		
		String sql = " SELECT CLUBSEQS, CLUBTITLE, CLUBTEXT, CLUBIMAGE, RNUM "
                    + " FROM (SELECT ROW_NUMBER()OVER(ORDER BY CL.CLUBSEQ DESC) AS RNUM, CL.CLUBSEQ AS CLUBSEQS, CLUBTITLE, CLUBTEXT, CLUBIMAGE  " 
                			+ " FROM CLUBLINK CL, CLUB C "
                			+ " WHERE CL.CLUBSEQ = C.CLUBSEQ "
                			+ " AND CL.MEMBERNUM = ? )"
                	
                + " WHERE RNUM >= ? AND RNUM <= ? ";
	        
	        int start, end;
	        start = 1 + 3*page;
	        end = 3+ 3*page;
	        
	        Connection conn = null;
	        PreparedStatement psmt = null;
	        ResultSet rs = null;
	        
	        List<ClubDto> list = new ArrayList<ClubDto>();
	        
	        try {
	            conn = DBConnection.getConnection();
	            System.out.println("1/4 getClubList success");
	                
	            psmt = conn.prepareStatement(sql);
	            System.out.println("2/4 getClubList success");
	            psmt.setInt(1, membernum);
	            psmt.setInt(2, start);
	            psmt.setInt(3, end);
	            
	            rs = psmt.executeQuery();
	            
	            System.out.println("3/4 getClubList success");
	            
	            while(rs.next()) {
	            	int i=1;
	            	ClubDto dto = new ClubDto(rs.getInt(i++), 
					            			rs.getString(i++), 
					            			rs.getString(i++), 
					            			rs.getString(i++)); 
	            	
	            	
	            	
	                list.add(dto);
	            }            
	            System.out.println("4/4 getClubList success");
	            
	        } catch (SQLException e) {    
	            System.out.println("getClubList fail");
	            e.printStackTrace();
	        } finally {            
	            DBClose.close(conn, psmt, rs);            
	        }
	        
	        return list;
	}
	
	//클럽리스트 총수
	public int getAllClub(int membernum) {
		String sql = " SELECT COUNT(*)"
	                + " FROM CLUBLINK"
	                + "   WHERE MEMBERNUM = ? ";
       
	      Connection conn = null;
	      PreparedStatement psmt = null;
	      ResultSet rs = null;
	      
	      int len = 0; //return 해줄 글의 총수
	      
	      try {
	         conn = DBConnection.getConnection();
	         System.out.println("1/3 S getAllClub");
	         
	         psmt= conn.prepareStatement(sql);
	         psmt.setInt(1, membernum);
	         System.out.println("2/3 S getAllClub");
	         
	         rs = psmt.executeQuery();
	         if(rs.next()) {
	            len = rs.getInt(1);
	         }
	         System.out.println("3/3 S getAllClub");	         
	      } catch (SQLException e) {
	         System.out.println("Fail getAllClub");
	         e.printStackTrace();
	      } finally {
	         DBClose.close(conn, psmt, rs);
	      }
	      
	      return len;	    
	}
	
	// 나의 정보가져오기
	public MemberDto getMyInfo(int membernum) {
			String sql = " SELECT USERID, PWD, EMAIL, GENDER, PHONE, BIRTH, USERIMAGE "
					+ " FROM MEMBERS "
					+ " WHERE MEMBERNUM = ? ";		
		
		    Connection conn = null;
	        PreparedStatement psmt = null;
	        ResultSet rs = null;
	        
	        MemberDto dto = null;
	        
	        try {
	            conn = DBConnection.getConnection();
	            System.out.println("1/3 getMyInfo success");
	                
	            psmt = conn.prepareStatement(sql);
	            System.out.println("2/3 getMyInfo success");
	            
	            
	            psmt.setInt(1, membernum);
	            rs = psmt.executeQuery();

		        while(rs.next()) {
		        	int i=1;
		        	dto = new MemberDto(rs.getString(i++), 
					    				rs.getString(i++), 
					    				rs.getString(i++), 
					    				rs.getInt(i++), 
					    				rs.getString(i++), 
					    				rs.getString(i++),
					    				rs.getString(i));
		        		
		        }            
		        System.out.println("3/3 getMyInfo success");
		        
		    } catch (SQLException e) {    
		        System.out.println("getMyInfo fail");
		        e.printStackTrace();
		    } finally {            
		        DBClose.close(conn, psmt, rs);            
		    }
	        return dto;
		    }
	
	
	public boolean updateMember(MemberDto dto) {
		 String sql = " UPDATE MEMBERS SET "
	                + " PWD=?, EMAIL=?, PHONE=?, USERIMAGE=?  "
	                + " WHERE USERID = ? ";
	        
	        Connection conn = null;
	        PreparedStatement psmt = null;
	        int count = 0;
	        
	        try {
	            conn = DBConnection.getConnection();
	            System.out.println("1/3 S updateMember");
	            
	            psmt = conn.prepareStatement(sql);
	            psmt.setString(1, dto.getPwd());
	            psmt.setString(2, dto.getEmail());
	            psmt.setString(3, dto.getPhone());
	            psmt.setString(4, dto.getUserimage());
	            psmt.setString(5, dto.getUserid());
	            
	            
	            System.out.println("2/3 S updateMember");
	            
	            count = psmt.executeUpdate();
	            System.out.println("3/3 S updateMember");
	            
	        } catch (Exception e) {            
	            e.printStackTrace();
	        } finally{
	            DBClose.close(conn, psmt, null);            
	        }        
	        
	        return count>0?true:false;
	    }
	/////////////////////////////////민선 추가부분////////////////////////////////////////////////////////////    
		//wishlist 추가하기
		public void addWishBook(int membernum, int booknum) {
			
			String sql = " INSERT INTO MYLIBRARY(MEMBERNUMFK, WISHSEQ, WISHBOOK, READBOOK) "
			+ " VALUES(?, SEQ_WISH.NEXTVAL, ?, 0)";
			
			Connection conn = null;
			PreparedStatement psmt = null;
			
			
			try {
				conn = DBConnection.getConnection();
				System.out.println("1/3 S addwishbook");
				
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, membernum);
				psmt.setInt(2, booknum);
				System.out.println("2/3 S addwishbook");
				
				psmt.executeUpdate();
				System.out.println("3/3 S addwishbook");
				
			} catch (Exception e) {            
				e.printStackTrace();
				System.out.println("addwishbook 오류");
			} finally{
				DBClose.close(conn, psmt, null);            
			}        
			
		} 
	
		//wishlist 삭제하기
		public void deleteWishBook(int membernum, int booknum) {
			
			String sql = " DELETE FROM MYLIBRARY "
					   + " WHERE MEMBERNUMFK = ? AND WISHBOOK = ? ";
			
			Connection conn = null;
			PreparedStatement psmt = null;
			
			
			try {
				conn = DBConnection.getConnection();
				System.out.println("1/3 S deleteWishBook");
				
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, membernum);
				psmt.setInt(2, booknum);
				System.out.println("2/3 S deleteWishBook");
				
				psmt.executeUpdate();
				System.out.println("3/3 S deleteWishBook");
				
			} catch (Exception e) {            
				e.printStackTrace();
				System.out.println("deleteWishBook 오류");
			} finally{
				DBClose.close(conn, psmt, null);            
			}              
		}
		
		
	  public boolean getlike(int membernum, int booknum) {
	        String sql = " SELECT COUNT(*) "
	              + " FROM MYLIBRARY "
	              + " WHERE MEMBERNUMFK=? AND WISHBOOK=? ";
	        
	        Connection conn = null;
	         PreparedStatement psmt = null;
	         ResultSet rs = null;
	         
	         int count = 0; //return 해줄 글의 총수
	         
	         try {
	            conn = DBConnection.getConnection();
	            System.out.println("1/3 S getlike");
	            
	            psmt= conn.prepareStatement(sql);
	            psmt.setInt(1, membernum);
	            psmt.setInt(2, booknum);
	            System.out.println("2/3 S getlike");
	            
	            rs = psmt.executeQuery();
	            if(rs.next()) {
	               count = rs.getInt(1);
	            }
	            System.out.println("3/3 S getlike");            
	         } catch (SQLException e) {
	            System.out.println("Fail getlike");
	            e.printStackTrace();
	         } finally {
	            DBClose.close(conn, psmt, rs);
	         }
	         
	         return count>0?true:false;       
	 }
	  
	//readlist 추가하기
	public void addreadBook(int membernum, int booknum) {
		String sql = " INSERT INTO MYLIBRARY(MEMBERNUMFK, WISHSEQ, WISHBOOK, READBOOK) "
				+ " VALUES(?, SEQ_WISH.NEXTVAL, 0, ?)";
		
		System.out.println("addreadBook booknum = " + booknum);
		Connection conn = null;
		PreparedStatement psmt = null;
		
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 S addreadBook");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, membernum);
			psmt.setInt(2, booknum);
			System.out.println("2/3 S addreadBook");
			
			psmt.executeUpdate();
			System.out.println("3/3 S addreadBook");
			
		} catch (Exception e) {            
			e.printStackTrace();
			System.out.println("addreadBook 오류");
		} finally{
			DBClose.close(conn, psmt, null);            
		}        		
	}
	
	 public boolean getread(int membernum, int booknum) {
	        String sql = " SELECT COUNT(*) "
	              + " FROM MYLIBRARY "
	              + " WHERE MEMBERNUMFK=? AND READBOOK=? ";
	        
	        Connection conn = null;
	         PreparedStatement psmt = null;
	         ResultSet rs = null;
	         
	         int count = 0; //return 해줄 글의 총수
	         
	         try {
	            conn = DBConnection.getConnection();
	            System.out.println("1/3 S getread");
	            
	            psmt= conn.prepareStatement(sql);
	            psmt.setInt(1, membernum);
	            psmt.setInt(2, booknum);
	            System.out.println("2/3 S getread");
	            
	            rs = psmt.executeQuery();
	            if(rs.next()) {
	               count = rs.getInt(1);
	            }
	            System.out.println("3/3 S getread");            
	         } catch (SQLException e) {
	            System.out.println("Fail getread");
	            e.printStackTrace();
	         } finally {
	            DBClose.close(conn, psmt, rs);
	         }
	         
	         return count>0?true:false;       
	 }
}
	

