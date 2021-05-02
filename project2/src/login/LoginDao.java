package login;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;


public class LoginDao {
   
private static LoginDao dao = new LoginDao();
   
   private LoginDao() {
      DBConnection.initConnection();
   }
   
   public static LoginDao getInstance() {
      return dao;
   }
   
   public boolean addMember(MemberDto dto) {
	  String sql = " INSERT INTO MEMBERS(MEMBERNUM, USERID, PWD, EMAIL, GENDER, PHONE, BIRTH, ACTIVITY, AUTH, CLUBMASTER, USERIMAGE) "
	            + " VALUES(SEQ_MEMBERS.NEXTVAL, ?, ?, ?, ?, ?, ?, 0, 3, 0, ?) ";
      
      Connection conn = null;
      PreparedStatement psmt = null;      
      int count = 0;
      
      try {
         conn = DBConnection.getConnection();
         System.out.println("1/3 addMember success");
            
         psmt = conn.prepareStatement(sql);
         System.out.println("2/3 addMember success");
         
         psmt.setString(1, dto.getUserid());
         psmt.setString(2, dto.getPwd());
         psmt.setString(3, dto.getEmail());
         psmt.setInt(4, dto.getGender());
         psmt.setString(5, dto.getPhone());
         psmt.setString(6, dto.getBirth());
         psmt.setString(7, dto.getUserimage());
         
         
        count = psmt.executeUpdate();
        
         System.out.println("3/3 addMember success");
 //        conn.commit();

      } catch (SQLException e) {         
         e.printStackTrace();
         System.out.println("addMember fail");
      } finally {
         DBClose.close(conn, psmt, null);         
      }
      
      return count>0?true:false;
   }

   public MemberDto login(String id, String pwd) {
      
      String sql = " SELECT MEMBERNUM, USERID, AUTH, USERIMAGE  "
            + " FROM MEMBERS "
            + " WHERE USERID=? AND PWD=? ";
      
      Connection conn = null;
      PreparedStatement psmt = null;
      ResultSet rs = null;
      String userId = null;
      MemberDto dto = null;
      try {
         conn = DBConnection.getConnection();
         psmt = conn.prepareStatement(sql);
         System.out.println("1/3 login suc");
         
         psmt.setString(1, id);
         psmt.setString(2, pwd);
         
         System.out.println("2/3 login suc");
         
         rs = psmt.executeQuery();
         
         if(rs.next()) {
   
            dto = new MemberDto(rs.getInt(1),rs.getString(2),rs.getInt(3),rs.getString(4));
         }
         
         System.out.println("3/3 login suc" + dto.toString());
         
      } catch (Exception e) {
         System.out.println("login fail");
         e.printStackTrace();
      } finally {
         DBClose.close(conn, psmt, rs);         
      }
            
      return dto;
   }
   
   
   public boolean checkId(String id) {   
      
      String sql = " SELECT COUNT(*) FROM MEMBERS "   
            + " WHERE USERID=? ";
      
      Connection conn = null;
      PreparedStatement psmt = null;
      ResultSet rs = null;
      
      boolean findid = false;
      
      try {
         conn = DBConnection.getConnection();
         System.out.println("1/3 CheckId success");
            
         psmt = conn.prepareStatement(sql);
         System.out.println("2/3 CheckId success");
         System.out.println(id);
         
         psmt.setString(1, id.trim());
         
         rs = psmt.executeQuery();
         System.out.println("3/3 CheckId success");
         
         if(rs.next()) {   
            if(rs.getInt("COUNT(*)") != 0){
               
               findid = false;
            //   System.out.println(rs.getInt("COUNT(*)"));
            }
            else if(rs.getInt("COUNT(*)") == 0) {
               
               findid = true;
            }
            
         }      
         System.out.println(findid);
      } catch (Exception e) {         
         e.printStackTrace();
         System.out.println("getId fail");
      } finally {
         DBClose.close(conn, psmt, rs);      
      }
      
      return findid;
   }
   
   public boolean CheckEmail(String email) {   
      
      String sql = " SELECT COUNT(*) FROM MEMBERS "   
            + " WHERE EMAIL=? ";
      
      Connection conn = null;
      PreparedStatement psmt = null;
      ResultSet rs = null;
      
      boolean findiemail = false;
      
      try {
         conn = DBConnection.getConnection();
         System.out.println("1/3 CheckEmail success");
            
         psmt = conn.prepareStatement(sql);
         System.out.println("2/3 CheckEmail success");
         
         psmt.setString(1, email.trim());
         
         rs = psmt.executeQuery();
         System.out.println("3/3 CheckEmail success");
         
         if(rs.next()) {   
            if(rs.getInt("COUNT(*)") != 0){
               
               findiemail = false;
            //   System.out.println(rs.getInt("COUNT(*)"));
            }
            else if(rs.getInt("COUNT(*)") == 0) {
               
               findiemail = true;
            }
         }         
         System.out.println(findiemail);
      } catch (Exception e) {         
         e.printStackTrace();
         System.out.println("CheckEmail fail");
      } finally {
         DBClose.close(conn, psmt, rs);         
      }
      
      return findiemail;
   }
   
   public String findId(String email, String phone) {
        System.out.println("eail : "+email);
        System.out.println("phone : "+phone);
        String sql = " SELECT USERID  "
              + " FROM MEMBERS "
              + " WHERE EMAIL=? AND PHONE=? ";
        
        Connection conn = null;
        PreparedStatement psmt = null;
        ResultSet rs = null;
        String userId = null;
        try {
           conn = DBConnection.getConnection();
           psmt = conn.prepareStatement(sql);
           System.out.println("1/3 findId suc");
           
           
           psmt.setString(1, email);
           psmt.setString(2, phone);
           
           System.out.println("2/3 findId suc");
           
           rs = psmt.executeQuery();
           
           if(rs.next()) {
              userId = rs.getString(1);            
           }
           System.out.println("userId : "+userId);
           System.out.println("3/3 findId suc");
           
        } catch (Exception e) {
           System.out.println("findId fail");
           e.printStackTrace();
        } finally {
           DBClose.close(conn, psmt, rs);         
        }
              
        return userId;
     }
   
   public String findPassword(String id, String email, String phone) {
        System.out.println("id : "+id);
        System.out.println("eail : "+email);
        System.out.println("phone : "+phone);
        String sql = " SELECT PWD  "
              + " FROM MEMBERS "
              + " WHERE USERID=? AND EMAIL=? AND PHONE=? ";
        
        Connection conn = null;
        PreparedStatement psmt = null;
        ResultSet rs = null;
        String pwd = null;
        try {
           conn = DBConnection.getConnection();
           psmt = conn.prepareStatement(sql);
           System.out.println("1/3 findPassword suc");
           
           psmt.setString(1, id);
           psmt.setString(2, email);
           psmt.setString(3, phone);
           
           System.out.println("2/3 findPassword suc");
           
           rs = psmt.executeQuery();
           
           if(rs.next()) {
              pwd = rs.getString(1);            
           }
           System.out.println("userPwd : " + pwd);
           System.out.println("3/3 findPassword suc");
           
        } catch (Exception e) {
           System.out.println("findPassword fail");
           e.printStackTrace();
        } finally {
           DBClose.close(conn, psmt, rs);         
        }
              
        return pwd;
     }
   
   // 활발히 활동한 사용자
   public List<MemberDto> getBestMemberList(){
		//유저 활동 순위 리스트			
			String sql = " SELECT MEMBERNUM, USERID, PWD, EMAIL, GENDER, PHONE, BIRTH, NVL(ACTIVITY, 0), AUTH, CLUBMASTER, USERIMAGE "
					+ " FROM (SELECT ROW_NUMBER()OVER(ORDER BY NVL(ACTIVITY, 0) DESC) AS RNUM, MEMBERNUM, USERID, PWD, EMAIL, GENDER,"
					+ " PHONE, BIRTH, ACTIVITY, 0, AUTH, CLUBMASTER, USERIMAGE "
					+ " FROM MEMBERS) " 
					+ " WHERE RNUM BETWEEN 1 AND 4 ";
		
			System.out.println("sql = " + sql);		
			
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			
			List<MemberDto> list = new ArrayList<MemberDto>();
			
			try {
				conn = DBConnection.getConnection();
				System.out.println("1/4 S getActivityList");
				
				psmt = conn.prepareStatement(sql);
				System.out.println("2/4 S getActivityList");
				
				rs = psmt.executeQuery();
				System.out.println("3/4 S getActivityList");
				
				while(rs.next()) {
					int i = 1;
			
				MemberDto dto = new MemberDto(rs.getInt(i++),
										      rs.getString(i++),
										      rs.getString(i++), 
										      rs.getString(i++),
											  rs.getInt(i++),
											  rs.getString(i++), 
											  rs.getString(i++), 
											  rs.getInt(i++),
											  rs.getInt(i++),
											  rs.getInt(i++),
											  rs.getString(i++));
					list.add(dto);
					
				}
				System.out.println("4/4 S getActivityList");
			} catch (SQLException e) {
				System.out.println("getActivityList fail");
				e.printStackTrace();
			} finally {
				DBClose.close(conn, psmt, rs);
			}
			
			return list;
	}
   
}