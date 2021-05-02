package schedule;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import book.BookDto;
import db.DBClose;
import db.DBConnection;

public class ScheduleDao {
	
	private static ScheduleDao dao = new ScheduleDao();
	
	private ScheduleDao() {	
	}
	
	public static ScheduleDao getInstance() {
		return dao;
	}
	
	// 스케줄 리스트 불러오기
	public List<ScheduleDto> getScheduleList(int membernum, String yyyyMM, String eyyyyMM){
		String sql = " SELECT SCHEDULESEQ, SC.BOOKNUM, MEMBERNUM, SUBSCRIBE, SCHSTART, SCHEND, BO.BOOKTITLE, RNUM, STARTDATE, ENDDATE " + 
				 	 " FROM " + 
					 "	(SELECT ROW_NUMBER()OVER(PARTITION BY SUBSTR(SCHSTART, 1, 8)ORDER BY SCHSTART ASC) AS RNUM, "+ 
					 "			SCHEDULESEQ, BOOKNUM, MEMBERNUM, SUBSCRIBE, SCHSTART, SCHEND, " +
					 "			ROW_NUMBER()OVER(PARTITION BY SCHSTART ORDER BY SCHSTART ASC) AS STARTDATE, " +
					 "			ROW_NUMBER()OVER(PARTITION BY SCHEND ORDER BY SCHEND ASC) AS ENDDATE " + 
					 " FROM SCHEDULE " + 
					 " WHERE MEMBERNUM=? AND (SUBSTR(SCHSTART, 1, 7)=? OR SUBSTR(SCHEND, 1, 7)=?)) SC, BOOK BO " +
					 " WHERE SC.BOOKNUM = BO.BOOKNUM "; 
					

		System.out.println("sql = " + sql);
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<ScheduleDto> list = new ArrayList<ScheduleDto>();
		
		try {
			
			conn = DBConnection.getConnection();
			System.out.println("1/4 S getScheduleList");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, membernum);
			psmt.setString(2, yyyyMM);
			psmt.setString(3, eyyyyMM);
			System.out.println("2/4 S getScheduleList");
			
			rs = psmt.executeQuery(); // 데이터값을 받는 코드
			System.out.println("3/4 S getScheduleList");
			
			while(rs.next()) {
				int i = 1;
				ScheduleDto dto = new ScheduleDto(rs.getInt(i++),
												  rs.getInt(i++),
												  rs.getInt(i++),
												  rs.getInt(i++),
												  rs.getString(i++),
												  rs.getString(i++),
												  rs.getString(i));
				
				list.add(dto);
			}
			System.out.println("4/4 S getScheduleList");
			
		} catch (SQLException e) {
			System.out.println("Fail getScheduleList");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return list;
	}
	
    public List<BookDto> getAllSearchList(String choice, String search, int pageNumber){
        
        String sql = " SELECT BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE, "
              + " AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE, RNUM "
              + " FROM (SELECT ROW_NUMBER()OVER(ORDER BY ISSUEDATE DESC, BOOKNUM DESC) AS RNUM, BOOKNUM, BOOKTITLE, CATEGORIES, BOOKREADCOUNT, BOOKDEL, GRADE,"
              + " AUTHOR, ISSUEDATE, BOOKHEADER, PUBLISHER, BOOKIMAGE "
              + " FROM BOOK "
              + " WHERE BOOKDEL = 0 ";
        
        String sWord ="";
        if(choice.equals("title")) {
           sWord = " AND BOOKTITLE LIKE '%" +search+ "%' ";   
        }else if(choice.equals("author")) {
           sWord = " AND AUTHOR LIKE '%"+search+"%' ";
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
     public int getAllSearchBookLen(String searchTitle, String searchText) {
        
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
     
     // 스케줄 추가
     public boolean addSchedule(int booknum, int membernum, String startdate, String enddate) {
    	 String sql = " INSERT INTO SCHEDULE(SCHEDULESEQ, BOOKNUM, MEMBERNUM, SUBSCRIBE, SCHSTART, SCHEND) "
    			 	+ " VALUES(SEQ_SCHEDULE.NEXTVAL, ?, ?, 0, ?, ?) ";
    	 
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 S addSchedule");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, booknum);
			psmt.setInt(2, membernum);
			psmt.setString(3, startdate);
			psmt.setString(4, enddate);
			System.out.println("2/3 S addSchedule");
			
			count = psmt.executeUpdate();
			System.out.println("3/3 S addSchedule");
			
			
		} catch (SQLException e) {
			System.out.println("Fail addSchedule");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}
		
		return count>0?true:false;
     }
     
     // 일정 삭제
     public boolean deleteSchedule(int scheduleseq) {
         String sql = " DELETE FROM SCHEDULE "
                  + " WHERE SCHEDULESEQ = ? ";
         
       Connection conn = null;
       PreparedStatement psmt = null;
       int count = 0;
       
       try {
          conn = DBConnection.getConnection();
          System.out.println("1/3 S deleteSchedule");
          
          psmt = conn.prepareStatement(sql);
          psmt.setInt(1, scheduleseq);
          System.out.println("2/3 S deleteSchedule");
          
          count = psmt.executeUpdate();
          System.out.println("3/3 S deleteSchedule");
          
          
       } catch (SQLException e) {
          System.out.println("Fail deleteSchedule");
          e.printStackTrace();
       } finally {
          DBClose.close(conn, psmt, null);
       }
       
       return count>0?true:false;
      }

}
