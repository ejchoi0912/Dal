package login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;



public class LoginController extends HttpServlet{
   
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
      resp.setCharacterEncoding("UTF-8"); 
      resp.setContentType("text/html; charset=UTF-8"); 
      
      System.out.println("LoginController doProcess");
      
      
      String param = req.getParameter("param");
      System.out.println(param);
      
      if(param.equals("loginpro")) { // 로그인시 요청
      System.out.println("ok");
      String id = req.getParameter("id");
      String pwd = req.getParameter("pwd");
      HttpSession session = req.getSession();
      System.out.println(id);
      
      LoginDao dao = LoginDao.getInstance();

      MemberDto log = null;      
      int lo_auth = 3;
      MemberDto userId = dao.login(id, pwd);
      System.out.println("userId : "+ userId);// 찍히는 값 userId, 가입 안되건 null
         if(userId != null && !userId.equals("")) {  
            
           // session에 로그인 정보 담기 작성 필요

        	MemberDto dto = new MemberDto();

            session.setAttribute("userId", userId);
            session.setMaxInactiveInterval(30*60*60);

            resp.sendRedirect("main?param=mainscreen");
            
         }else {
            // req.setAttribute("error", "1"); // 로그인 실패 부분
        	 resp.sendRedirect("main?param=mainscreen&error=1");
         }
         
         
      }else if(param.equals("registerPro")){ //회원가입시 요청
        
          //회원 가입 정보 받기
         String userid = req.getParameter("userid");
         String pwd = req.getParameter("pwd");
         String email = req.getParameter("email");
         int gender = Integer.parseInt(req.getParameter("gender"));
         String phone = req.getParameter("phone");
         String userimage = req.getParameter("memberImg");
         
         String yy = req.getParameter("yy");
         String mm = req.getParameter("mm");
         String dd = req.getParameter("dd");
         
         String birth = yy + "/" + mm + "/" + dd;
         //관리자 0, user 3
         
         // 
         LoginDao dao = LoginDao.getInstance();
         boolean regCheck = dao.addMember(new MemberDto(userid, pwd, email, gender, phone, birth, userimage));
         
         if(regCheck == true) {
            resp.sendRedirect("index.jsp");
         }else {
            req.setAttribute("error", "1"); // 회원가입 실패 여부
            resp.sendRedirect("register.jsp");
         }
         
      // 해당 부분은 ajax 요청으로 전송
      }else if(param.equals("idCheck")) { // 아이디 확인시 요청
        LoginDao dao = LoginDao.getInstance();
        
        String checkId = req.getParameter("id");
         System.out.println("userid : " + checkId);
         
         boolean check=false; //아이디 빈값 체크
         if(checkId != "") check = dao.checkId(checkId);
         
         String str = "NO";
         if(check == true) {
            // 아이디 중복시
            str = "YES";
            
         }else {
            // 아이디 중복 아닐시
            str = "NO";
         }
         JSONObject jObj = new JSONObject();
         jObj.put("msg", str);
         
         resp.setContentType("application/x-json; charset=utf-8");
         resp.getWriter().print(jObj);
      
      }else if(param.equals("emailCheck")) {      //회원가입 시 이메일 체크
         LoginDao dao = LoginDao.getInstance();
         String checkEmail = req.getParameter("email");
         System.out.println("email : " + checkEmail);
         
         boolean check=false; //이메일 빈값 체크
         if(checkEmail != "") check = dao.checkId(checkEmail);
         
         String str = "NO";
          if(check == true) {
             // 아이디 중복시
             str = "YES";
             
          }else {
             // 아이디 중복 아닐시
             str = "NO";
          }
          JSONObject jObj = new JSONObject();
          jObj.put("msg", str);
          
          resp.setContentType("application/x-json; charset=utf-8");
          resp.getWriter().print(jObj);
      
      }else if(param.equals("register")) {
         resp.sendRedirect("register.jsp");
       
      }else if(param.equals("findId")) {
          resp.sendRedirect("findId.jsp");
       
      }else if(param.equals("findPassword")) {
          resp.sendRedirect("findPassword.jsp");
      
      }else if(param.equals("findIdPro")) {
          String email = req.getParameter("email");
          String phone = req.getParameter("phone");
          LoginDao dao = LoginDao.getInstance();
          String userId = dao.findId(email, phone);
          System.out.println("user : "+userId);
          JSONObject jObj = new JSONObject();
           jObj.put("userId", userId);
           
           resp.setContentType("application/x-json; charset=utf-8");
           resp.getWriter().print(jObj);
       }else if(param.equals("findPasswordPro")) {
          String userid = req.getParameter("userid");
          String email = req.getParameter("email");
           String phone = req.getParameter("phone");
           LoginDao dao = LoginDao.getInstance();
           String pwd = dao.findPassword(userid, email, phone);
           System.out.println("userPwd : "+pwd);
           JSONObject jObj = new JSONObject();
           jObj.put("pwd", pwd);
           
           resp.setContentType("application/x-json; charset=utf-8");
           resp.getWriter().print(jObj);
       }else if(param.equals("logoutPro")) {
           HttpSession session = req.getSession();
           session.invalidate();
           resp.sendRedirect("main?param=mainscreen");
        }
        
     }
 }