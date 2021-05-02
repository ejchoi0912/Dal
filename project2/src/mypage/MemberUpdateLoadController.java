package mypage;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import book.BookDao;
import login.LoginDao;
import login.MemberDto;

public class MemberUpdateLoadController extends HttpServlet {
   
      ServletConfig mConfig = null;

      
      @Override
      public void init(ServletConfig config) throws ServletException {
         mConfig = config;
         System.out.println("mConfig = " + mConfig);
      }
      
      @Override
      protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         System.out.println("S FileController");
         
         // tomcat 베포 - server
         String fupload =  mConfig.getServletContext().getRealPath("/upload");
         // 지정 폴더 - client
         // String fupload = "d:\\tep";
         System.out.println("업로드 폴더 : " + fupload);
         String yourTempDir = fupload;
         int yourMaxRequestSize = 100 * 1024 * 1024; // 1 Mbyte
         int yourMaxMemorySize = 100 * 1024;         // 1 Kbyte
         
         System.out.println("S FileController2");
         
         // form field의 데이터를 저장할 변수
         int userseq = 0;
         String userid = "";
         String pwd = "";
         String email = "";
         String phone = "";
         String birth = "";
         String yy = "";
         String mm = "";
         String dd = "";
         String filename = "";
         String userimage = "";
         
         // file명 저장
         String originalfilename = "";
         boolean isMultipart = ServletFileUpload.isMultipartContent(req);
         
         System.out.println("isMultipart = " + isMultipart);
         System.out.println("S FileController3");
         
         if(isMultipart == true){
            
            // FileItem 생성
            // form 필드에서 받은 자료가 무작위로 오기때문에 어떤 것이 file이고 input 값인지 알수가 없다 이 밑에 코드는 그것을 구분하기위한 준비작업이다.
            DiskFileItemFactory factory = new DiskFileItemFactory();
            
            factory.setSizeThreshold(yourMaxMemorySize);
            factory.setRepository(new File(yourTempDir));
            System.out.println("S FileController4");
            
            ServletFileUpload upload = new ServletFileUpload(factory);
            upload.setSizeMax(yourMaxRequestSize);
            System.out.println("S FileController5");
            
            List<FileItem> items = null;
          
           try {
            items = upload.parseRequest(req);
         } catch (FileUploadException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
          
            Iterator<FileItem> it = items.iterator();
            
            while(it.hasNext()){               
               FileItem item = it.next();
               if(item.isFormField()){ // id, title, content
                  if(item.getFieldName().equals("userseq")) {
                     userseq = Integer.parseInt( item.getString("utf-8") );
                  }
                  else if(item.getFieldName().equals("userid")){
                     userid = item.getString("utf-8");
                  } 
                  else if(item.getFieldName().equals("pwd")){
                     pwd = item.getString("utf-8");
                  } 
                  else if(item.getFieldName().equals("email")){
                     email = item.getString("utf-8");
                  }
                  else if(item.getFieldName().equals("phone")){
                     phone = item.getString("utf-8");
                  }
                  else if(item.getFieldName().equals("yy")){
                     yy = item.getString("utf-8");
                  }
                  else if(item.getFieldName().equals("mm")){
                     mm = item.getString("utf-8");
                  }   
                  else if(item.getFieldName().equals("dd")){
                     dd = item.getString("utf-8");
                  }
                  else if(item.getFieldName().equals("userimage")) {
                     userimage = item.getString("utf-8");
                  }                                    
                }else{   // file
                  if(item.getFieldName().equals("memberImg")){                    
                     if(item.getName() != null && !item.getName().equals("")){    
                           filename = processUploadFile(item, fupload);                           
                       }
                  	}
                  }                
            }
            if(filename == null || filename.equals("")){
                filename = userimage;
            }  
         }
        
         System.out.println("S FileController6");
         
        MypageDao dao = MypageDao.getInstance(); 

        birth = yy + "/" + mm + "/" + dd;
        System.out.println("pwd = " + pwd + "email = " + email + "phone = " + phone + "birth = " + birth +"filename = "+ filename);
        MemberDto dto = new MemberDto(userid, pwd, email, 0, phone, birth, filename);
        System.out.println("S FileController7");
        
        boolean isS = dao.updateMember(dto);
        
        System.out.println(isS);
        if(isS) {
           resp.sendRedirect("mypage?param=getmypagelist&membernum="+userseq);
        }
      }
      
      
      // upload 함수
      public String processUploadFile(FileItem fileItem, String dir)throws IOException{
                  
         String imgfilename = fileItem.getName();    // 경로 + 파일명
         String newfilename = "";
         long sizeInBytes = fileItem.getSize();    // 크기
         
         if(sizeInBytes > 0) {   // 파일이 정상인가?   // d:\\tem\\abc.txt = d:/tem/abc.txt 
            
            int idx = imgfilename.lastIndexOf("\\");
            
            if(idx == -1){ // 찾지 못하였다.
               idx = imgfilename.lastIndexOf("/");
            }
            
            imgfilename = imgfilename.substring(idx + 1); // 파일명만 받아온다.
            
            idx = imgfilename.lastIndexOf(".");
            
            String bfilename = imgfilename.substring(idx); // . 뒤에 문자를 가져온다.
            System.out.println("bfilename = " + bfilename);
            
            newfilename = (new Date().getTime()) + bfilename; // userid.png 등으로 저장
            System.out.println("newfilename = " + newfilename);
            
            File uploadFile = new File(dir, newfilename);
            System.out.println("uploadFile = " + uploadFile);
            
            try{         
               fileItem.write(uploadFile);   // 실제로 upload되는 부분
            }catch(Exception e){
               e.printStackTrace();
            }
         }
         return newfilename;
    }
          
      
}