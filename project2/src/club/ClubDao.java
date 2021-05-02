package club;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.swing.text.StyledEditorKit.BoldAction;

import db.DBClose;
import db.DBConnection;
import login.MemberDto;

public class ClubDao {
	
private static ClubDao dao = new ClubDao();
	
	private ClubDao() {
		DBConnection.initConnection();
	}
	
	public static ClubDao getInstance() {
		return dao;
	}
	
	// card 추가
	public boolean addCard(CardDto dto) {
		String sql = " INSERT INTO CARD(CARDSEQ, CARDTITLE, CARDTEXT, CARDSTART, CARDEND, BOOKNUM, CLUBSEQ) "
				+ " VALUES (SEQ_CLUB.NEXTVAL, ?, ?, ?, ?, ?, ?) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 S addCard");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getCardtitle());
			psmt.setString(2, dto.getCardtext());
			psmt.setString(3, dto.getCardstart());
			psmt.setString(4, dto.getCardend());
			psmt.setInt(5, dto.getBooknum());
			psmt.setInt(6, dto.getClubseq());
			System.out.println("2/3 S addCard");
			
			count = psmt.executeUpdate();
			System.out.println("3/3 S addCard");
			
			
		} catch (SQLException e) {
			System.out.println("Fail addCard");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}
		
		return count>0?true:false;
	}
	// 카드검색
	public List<CardDto> getCardList(int clubseq){
		String sql = " SELECT CARDSEQ, CARDTITLE, CARDTEXT, CARDSTART, CARDEND, B.BOOKIMAGE, CLUBSEQ "
				+ " FROM CARD C, BOOK B"
				+ " WHERE C.BOOKNUM=B.BOOKNUM AND CLUBSEQ = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<CardDto> cardlist = new ArrayList<CardDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 S getCardList");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, clubseq);
			System.out.println("2/4 S getCardList");
			
			rs = psmt.executeQuery();
			System.out.println("3/4 S getCardList");
			
			while(rs.next()) {
				int i=1;
				CardDto dto = new CardDto(rs.getInt(i++),
										  rs.getString(i++),
										  rs.getString(i++),
										  rs.getString(i++),
										  rs.getString(i++),
										  rs.getString(i++),
										  rs.getInt(i));
				cardlist.add(dto);
			}
			System.out.println("4/4 getCardList");
		} catch (SQLException e) {
			System.out.println("Fail getCardList");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return cardlist;
	}
	// 카드 불러오기
	public CardDto getCard(int cardseq) {
		String sql =" SELECT C.CARDSEQ, C.CARDTITLE, C.CARDTEXT, C.CARDSTART, C.CARDEND, B.BOOKNUM, C.CLUBSEQ, B.BOOKIMAGE "
				+ " FROM CARD C, BOOK B "
				+ " WHERE C.BOOKNUM=B.BOOKNUM AND C.CARDSEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		CardDto carddto = new CardDto(); 
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 S getCard");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, cardseq);
			System.out.println("2/4 S getCard");
			
			rs = psmt.executeQuery();
			System.out.println("3/4 S getCard");
			
			if(rs.next()) {
				int i=1;
				
				carddto = new CardDto(rs.getInt(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getInt(i++), rs.getInt(i++), rs.getString(i++)); 
			}
			System.out.println("4/4 S getCard");
		} catch (SQLException e) {
			System.out.println("Fail getCard");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return carddto;
	}
	
	public List<ClubDto> getClubList(){
		String sql = " SELECT CLUBSEQ, CLUBTITLE, CLUBTEXT, CLUBDATE, MEMBERNUM, CLUBIMAGE "
				+ " FROM CLUB ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<ClubDto> clublist = new ArrayList<ClubDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 S getClubList");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/4 S getClubList");
			
			rs = psmt.executeQuery();
			System.out.println("3/4 S getClubList");
			
			while(rs.next()) {
				int i=1;
				ClubDto dto = new ClubDto(rs.getInt(i++),
										  rs.getString(i++),
										  rs.getString(i++),
										  rs.getString(i++),
										  rs.getInt(i++),
										  rs.getString(i));
				clublist.add(dto);
			}
			System.out.println("4/4 S getClubList");
		} catch (SQLException e) {
			System.out.println("Fail getClubList");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return clublist;
	}
	
	// 하나의 클럽을 불러오는 메소드
	public ClubDto getClub(int clubseq){
		String sql = " SELECT CLUBSEQ, CLUBTITLE, CLUBTEXT, CLUBDATE, M.USERID, CLUBIMAGE "
				+ " FROM CLUB C, MEMBERS M "
				+ " WHERE M.MEMBERNUM = C.MEMBERNUM AND CLUBSEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		ClubDto clubdto = new ClubDto();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 S getClubList");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, clubseq);
			System.out.println("2/4 S getClubList");
			
			rs = psmt.executeQuery();
			System.out.println("3/4 S getClubList");
			
			if(rs.next()) {
				int i=1;
				clubdto = new ClubDto(rs.getInt(i++),
									  rs.getString(i++),
									  rs.getString(i++),
			  dateFormat("yyyy-MM-dd",rs.getString(i++)),
									  rs.getString(i++),
									  rs.getString(i));
	
			}
			System.out.println("4/4 S getClubList");
		} catch (SQLException e) {
			System.out.println("Fail getClubList");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return clubdto;
	}
	
	// 클럽 검색
	/*
	public List<ClubDto> searchClubList(String clubname){
		String sql = " SELECT CLUBSEQ, CLUBTITLE, CLUBTEXT, CLUBDATE, MEMBERNUM, CLUBIMAGE "
				+ " FROM CLUB "
				+ " WHERE CLUBTITLE = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<ClubDto> clublist = new ArrayList<ClubDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 S searchClubList");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, clubname);
			System.out.println("2/4 S searchClubList");
			
			rs = psmt.executeQuery();
			System.out.println("3/4 S searchClubList");
			
			while(rs.next()) {
				int i=1;
				ClubDto dto = new ClubDto(rs.getInt(i++),
										  rs.getString(i++),
										  rs.getString(i++),
										  rs.getString(i++),
										  rs.getInt(i++),
										  rs.getString(i));
				clublist.add(dto);
			}
			System.out.println("4/4 S searchClubList");
		} catch (SQLException e) {
			System.out.println("Fail searchClubList");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return clublist;
	}
	*/
	
	// 클럽추가
	public boolean addClub(ClubDto dto) {
		String sql = " INSERT INTO CLUB(CLUBSEQ, CLUBTITLE, CLUBTEXT, CLUBDATE, MEMBERNUM, CLUBIMAGE) "
				+ " VALUES (SEQ_CLUB.NEXTVAL, ?, ?, SYSDATE, ?, ?) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 S addClub");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getClubtitle());
			psmt.setString(2, dto.getClubtext());
			psmt.setInt(3, dto.getMembernum());
			psmt.setString(4, dto.getClubimage());
			System.out.println("2/3 S addClub");
			
			count = psmt.executeUpdate();
			System.out.println("3/3 S addClub");
			
			
		} catch (SQLException e) {
			System.out.println("Fail addClub");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}
		
		return count>0?true:false;
	}
	
	// 클럽수정 -> 클럽장만!! 
	public boolean updateClub( ClubDto dto) {
		String sql = " UPDATE CLUB SET "
				+ " CLUBTITLE=?, CLUBTEXT=? " //CLUBIMAGE=?
				+ " WHERE CLUBSEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 S updateClub");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getClubtitle());
			psmt.setString(2, dto.getClubtext());
			//psmt.setString(3, dto.getClubimage());
			psmt.setInt(3, dto.getClubseq());
			System.out.println("2/3 S updateClub");
			
			count = psmt.executeUpdate();
			System.out.println("3/3 S updateClub");
			
		} catch (SQLException e) {
			System.out.println("Fail updateClub");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}
		
		return count>0?true:false;
	}
	// 지금 들어온 사람이 해당 모임장인지 확인하는 녀석
	public boolean isMaster(int seq, int memnum){
		String sql = " SELECT MEMBERNUM "
				   + " FROM CLUB "
				   + " WHERE CLUBSEQ=? ";
	
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		int membernum=0;
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 isMaster");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			System.out.println("2/4 isMaster");
			
			rs = psmt.executeQuery();
			System.out.println("3/4 isMaster");
			
			while(rs.next()) {
				membernum = rs.getInt(1);
			}
			System.out.println("4/4 isMaster");
			
		} catch (SQLException e) {System.out.println("Fail isMaster");}
		finally {DBClose.close(conn, psmt, rs);}
		return membernum==memnum?true:false;
	}
	// 클럽가입 -> 클럽멤버추가
	public boolean insertClubMember(int clubnum, int membernum) {
		String sql = " INSERT INTO CLUBLINK(CLUBSEQ, MEMBERNUM) "
				+ " VALUES (?, ?) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 S insertClubMember");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, clubnum);
			psmt.setInt(2, membernum);
			System.out.println("1/3 S insertClubMember");
			
			count = psmt.executeUpdate();
			System.out.println("1/3 S insertClubMember");
		} catch (SQLException e) {
			System.out.println("Fail insertClubMember");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}
		
		return count>0?true:false;
	}
	
	// 해당 모임에 가입한 member을 가지고오는 메소드 --> 클럽번호를 매개변수로 받는다.
	public List<MemberDto> getMember(int seq){
		String sql = " SELECT CB.CLUBSEQ, CL.MEMBERNUM, MB.MEMBERNUM, MB.USERID, MB.EMAIL, MB.GENDER, CLUBMASTER, USERIMAGE "
				   + " FROM CLUB CB, CLUBLINK CL, MEMBERS MB "
				   + " WHERE CB.CLUBSEQ = CL.CLUBSEQ "
				   + "		AND CL.MEMBERNUM = MB.MEMBERNUM "
				   + "			AND CB.CLUBSEQ = ? ";
	
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<MemberDto> memberlist = new ArrayList<MemberDto>();
				
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 S getMember");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			System.out.println("1/4 S getMember");
			
			rs = psmt.executeQuery();
			System.out.println("1/4 S getMember");
			
			while(rs.next()) {
				int i = 3;
				MemberDto dto = new MemberDto(rs.getInt(i++),
											rs.getString(i++), 
											rs.getString(i++), 
											rs.getInt(i++), 
											rs.getInt(i++),
											rs.getString(i)); 
				memberlist.add(dto);
			}
			System.out.println("1/4 S getMember");
		} catch (SQLException e) {
			System.out.println("Fail getMember");
			e.printStackTrace();
		}finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return memberlist;
	}
	
	// 해당 모임에 이 사람이 가입한지 확인하는 녀석
	public boolean isMember(int seq, int memnum){
		String sql = " SELECT COUNT(*) "
				   + " FROM CLUBLINK "
				   + " WHERE CLUBSEQ=? AND MEMBERNUM=?";
	
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 isMember");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			psmt.setInt(2, memnum);
			System.out.println("2/4 isMember");
			
			rs = psmt.executeQuery();
			System.out.println("3/4 isMember");
			
			while(rs.next()) {
				count = rs.getInt(1);
			}
			System.out.println("4/4 isMember");
			
		} catch (SQLException e) {System.out.println("Fail isMember");}
		finally {DBClose.close(conn, psmt, rs);}
		
		return count>0?true:false;
	}
	
	// talk 내용 추가
	public boolean addTalk(TalkDto dto) {
		String sql = " INSERT INTO TALK (TALKSEQ, TALKCONTENT, TALKDATE, MEMBERNUM, CARDSEQ) "
				+ " VALUES (SEQ_TALK.NEXTVAL, ?, SYSDATE, ?, ?) ";
				
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 S addTalk");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getTalkcontent());
			psmt.setInt(2, dto.getMembernum());
			psmt.setInt(3, dto.getCardseq());
			
			System.out.println("1/3 S addTalk");
			
			count = psmt.executeUpdate();
			System.out.println("1/3 S addTalk");
		} catch (SQLException e) {
			System.out.println("Fail addTalk");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}
		
		return count>0?true:false;
	}
	
	// 카드의 대화내용을 가져오기 위한 메소드 --> 카드번호를 매개변수로 받는다.
	public List<TalkDto> getTalkList(int seq){
		String sql = " SELECT TA.TALKSEQ, TA.TALKCONTENT, TA.TALKDATE, MB.USERID, CA.CARDSEQ "
				+ " FROM CARD CA, TALK TA, MEMBERS MB "
				+ " WHERE CA.CARDSEQ = TA.CARDSEQ "
				+ " 	AND TA.MEMBERNUM = MB.MEMBERNUM "
				+ "			AND CA.CARDSEQ = ? "
				+ " ORDER BY TA.TALKSEQ ";
		
		System.out.println("sql = " + sql );
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<TalkDto> talklist = new ArrayList<TalkDto>();
				
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 S getTalk");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			System.out.println("2/4 S getTalk");
			
			rs = psmt.executeQuery();
			System.out.println("3/4 S getTalk");
			
			SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.s");
			SimpleDateFormat newform = new SimpleDateFormat("MM.dd HH:mm");
			
			while(rs.next()) {
				String sdate = "";
				try {
					Date newdate = form.parse(rs.getString(3));
					sdate = newform.format(newdate);
				} catch (ParseException e) {e.printStackTrace();}
				
				int i = 1;
				TalkDto dto = new TalkDto(rs.getInt(i++), 	   //TALKSEQ,
											rs.getString(i++), //TALKCONTENT
											sdate, //TALKDATE
											rs.getString(i+1), //USERID
											rs.getInt(i+2)); 	   //CARDSEQ
				talklist.add(dto);
			}
			System.out.println("4/4 S getTalk");
		} catch (SQLException e) {
			System.out.println("Fail getTalk");
			e.printStackTrace();
		}finally {
			DBClose.close(conn, psmt, rs);
		}
		return talklist;
	}
	
   public List<ClubDto> searchClubList(String clubname, int page){
	      String sql = " SELECT CLUBSEQ, CLUBTITLE, CLUBTEXT, CLUBDATE, MEMBERNUM, CLUBIMAGE, RNUM "
	            + " FROM ";
	      
	      sql +=  " (SELECT ROW_NUMBER()OVER(ORDER BY CLUBSEQ DESC) AS RNUM, " + 
					"	CLUBSEQ, CLUBTITLE, CLUBTEXT, CLUBDATE, MEMBERNUM, CLUBIMAGE " + 
					"	FROM CLUB ";
	      
	      String sWord = "";
	      if(clubname != null && !clubname.equals("")) {
	    	  sWord = " WHERE CLUBTITLE LIKE '%" + clubname + "%' ";
	      }
	      sql = sql + sWord;
	      
	      sql = sql + " ORDER BY CLUBSEQ DESC) ";
	      
	      sql = sql + " WHERE RNUM >= ? AND RNUM <= ? ";
			
		int start, end;
		start = 1 + 16 * page; 
		end = 16 + 16 * page;  
	      
	      Connection conn = null;
	      PreparedStatement psmt = null;
	      ResultSet rs = null;
	      
	      List<ClubDto> clublist = new ArrayList<ClubDto>();
	      
	      try {
	         conn = DBConnection.getConnection();
	         System.out.println("1/4 S searchClubList");
	         
	         psmt = conn.prepareStatement(sql);
	         psmt.setInt(1, start);
			 psmt.setInt(2, end);
	         System.out.println("2/4 S searchClubList");
	         
	         rs = psmt.executeQuery();
	         System.out.println("3/4 S searchClubList");
	         
	         while(rs.next()) {
	            int i=1;
	            ClubDto dto = new ClubDto(rs.getInt(i++),
	                                rs.getString(i++),
	                                rs.getString(i++),
	                                rs.getString(i++),
	                                rs.getInt(i++),
	                                rs.getString(i));
	            clublist.add(dto);
	         }
	         System.out.println("4/4 S searchClubList");
	      } catch (SQLException e) {
	         System.out.println("Fail searchClubList");
	         e.printStackTrace();
	      } finally {
	         DBClose.close(conn, psmt, rs);
	      }
	      
	      return clublist;
	   }
   
    // 총 클럽 수
	public int getAllClub(String clubname) {
		String sql = " SELECT COUNT(*) FROM CLUB ";
		
		 String sWord = "";
	     if(clubname != null && !clubname.equals("")) {
	    	 sWord = " WHERE CLUBTITLE LIKE '%" + clubname + "%' ";
	     }
	     sql = sql + sWord;

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		int len = 0; //return 해줄 글의 총수
		
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 S getAllClub");
			
			psmt= conn.prepareStatement(sql);
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
	
	// 책 상세 페이지에서 책 관련 카드모음 
	public List<ClubDto> bookClubList(int booknum){
		String sql = " SELECT CL.CLUBSEQ, CL.CLUBTITLE, AL.TALKSUM "
				+ " FROM CLUB CL, (SELECT C.CARDSEQ, T.TALKSUM, C.BOOKNUM, C.CLUBSEQ "
				+ "					FROM CARD C, (SELECT CARDSEQ, COUNT(*) AS TALKSUM FROM TALK GROUP BY CARDSEQ) T "
				+ " 								WHERE C.CARDSEQ=T.CARDSEQ) AL "
				+ " WHERE CL.CLUBSEQ = AL.CLUBSEQ AND AL.BOOKNUM=" + booknum;
										
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<ClubDto> clublist = new ArrayList<ClubDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 S bookClubList");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/4 S bookClubList");
			System.out.println(sql);
			rs = psmt.executeQuery();
			System.out.println("3/4 S bookClubList");
			
			while(rs.next()) {
				int i=1;
				ClubDto dto = new ClubDto(rs.getInt(i++),
										  rs.getString(i++),
										  rs.getInt(i));
				clublist.add(dto);
			}
			System.out.println("4/4 bookClubList");
		}
		catch (SQLException e) {System.out.println("Fail bookClubList");}
		finally {DBClose.close(conn, psmt, rs);}
		return clublist;			
	   }
	
	//날짜 형식 바꿔주는
		public String dateFormat(String s, String date) {
			SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.s");
			SimpleDateFormat newform = new SimpleDateFormat(s);
			
			String sdate = "";
			try {
				Date newdate = form.parse(date);
				sdate = newform.format(newdate);
			}
			catch (ParseException e) {e.printStackTrace();}
			return sdate;
	}
	
	// 클럽 가입
	public boolean joinClub(int clubseq, int membernum) {
		String sql = " INSERT INTO CLUBLINK(CLUBSEQ, MEMBERNUM) "
				+ " VALUES(?, ?) ";
				
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 S joinClub");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, clubseq);
			psmt.setInt(2, membernum);
			System.out.println("1/3 S joinClub");
			
			count = psmt.executeUpdate();
			System.out.println("1/3 S joinClub");
		} catch (SQLException e) {
			System.out.println("Fail joinClub");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}
		
		return count>0?true:false;		
	}
	
	// 시끌벅적 클럽리스트
	public List<ClubDto> getBestClubList(){
		String sql = " SELECT CB.CLUBSEQ, CB.CLUBTITLE, CB.CLUBTEXT, CB.CLUBDATE, CB.MEMBERNUM, CB.CLUBIMAGE, SUM,"
				+ " ROW_NUMBER()OVER(ORDER BY SUM DESC) AS RNUM "
				+ " FROM CLUB CB, (SELECT CLUBSEQ, COUNT(*) AS SUM "
				+ " FROM CLUBLINK "
				+ " GROUP BY CLUBSEQ) CL "
				+ " WHERE CB.CLUBSEQ = CL.CLUBSEQ ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<ClubDto> clublist = new ArrayList<ClubDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 S getBestClubList");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/4 S getBestClubList");
			System.out.println(sql);
			rs = psmt.executeQuery();
			System.out.println("3/4 S getBestClubList");
			
			while(rs.next()) {
				int i=1;
				ClubDto dto = new ClubDto(rs.getInt(i++),
										  rs.getString(i++),
										  rs.getString(i++),
										  rs.getString(i++),
										  rs.getInt(i++),
										  rs.getString(i++),
										  rs.getInt(i));
				clublist.add(dto);
			}
			System.out.println("4/4 getBestClubList");
		}
		catch (SQLException e) {System.out.println("Fail getBestClubList");}
		finally {DBClose.close(conn, psmt, rs);}
		return clublist;			
			
	}
}
