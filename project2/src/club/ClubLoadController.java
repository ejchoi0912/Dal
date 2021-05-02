package club;

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


public class ClubLoadController extends HttpServlet {
	
		ServletConfig mConfig = null;

	   
	   @Override
	   public void init(ServletConfig config) throws ServletException {
	      mConfig = config;
	   }

	   @Override
	   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		   System.out.println("S ClubLoadController");
		      
		   // tomcat 베포 - server
		   String fupload =  mConfig.getServletContext().getRealPath("/clubload");
		   // 지정 폴더 - client
		   // String fupload = "d:\\tep";
		   System.out.println("업로드 폴더 : " + fupload);
		   String yourTempDir = fupload;
		   int yourMaxRequestSize = 100 * 1024 * 1024; // 1 Mbyte
		   int yourMaxMemorySize = 100 * 1024;			// 1 Kbyte
		   
		   System.out.println("S ClubLoadController2");
		   
		   // form field의 데이터를 저장할 변수
		   String clubtitle = "";
		   String clubtext = "";
		   int membernum = 0;
		   String filename = "";

		   boolean isMultipart = ServletFileUpload.isMultipartContent(req);
		   System.out.println("isMultipart = " + isMultipart);
		   System.out.println("S ClubLoadController3");
		   if(isMultipart == true){
		   	
		   	// FileItem 생성
		   	// form 필드에서 받은 자료가 무작위로 오기때문에 어떤 것이 file이고 input 값인지 알수가 없다 이 밑에 코드는 그것을 구분하기위한 준비작업이다.
		   	DiskFileItemFactory factory = new DiskFileItemFactory();
		   	
		   	factory.setSizeThreshold(yourMaxMemorySize);
		   	factory.setRepository(new File(yourTempDir));
		   	System.out.println("S ClubLoadController4");
		   	
		   	ServletFileUpload upload = new ServletFileUpload(factory);
		   	upload.setSizeMax(yourMaxRequestSize);
		   	System.out.println("S ClubLoadController5");
		   	
		   	List<FileItem> items = null;
	       
	        try {
				items = upload.parseRequest(req);
			} catch (FileUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	     
		   	Iterator<FileItem> it = items.iterator();
		   	System.out.println("S ClubLoadController6");
		   	
		   	while(it.hasNext()){
		   		
		   		FileItem item = it.next();
		   		if(item.isFormField()){ // id, title, content 
		   			if(item.getFieldName().equals("clubtitle")){
		   				clubtitle = item.getString("utf-8");
		   			} 
		   			else if(item.getFieldName().equals("clubtext")){
		   				clubtext = item.getString("utf-8");
		   			}
		   			else if(item.getFieldName().equals("membernum")){
		   				membernum = Integer.parseInt( item.getString("utf-8").trim() );
		   			}
		   		}
		   		else{	// file
		   			if(item.getFieldName().equals("clubImg")){
		   				filename = processUploadFile(item, fupload);
		   			}
		   		}
		   	 }
		  }
		   
		  ClubDao dao = ClubDao.getInstance();
		  System.out.println("filename = " + filename);
		  
		  ClubDto dto = new ClubDto(clubtitle, clubtext, membernum, filename);
		  boolean b = dao.addClub(dto);
		  resp.sendRedirect("message.jsp?param=addclub&message=" + b);
	   }
	   
	   
	   // upload 함수

	   public String processUploadFile(FileItem fileItem, String dir)throws IOException{
	   	
	   	String originalfilename = fileItem.getName();	 // 경로 + 파일명
	   	String filename = "";
	   	long sizeInBytes = fileItem.getSize();	 // 크기
	   	
	   	if(sizeInBytes > 0) {	// 파일이 정상인가?	// d:\\tem\\abc.txt = d:/tem/abc.txt 
	   		
	   		int idx = originalfilename.lastIndexOf("\\");
	   		
	   		if(idx == -1){ // 찾지 못하였다.
	   			idx = originalfilename.lastIndexOf("/");
	   		}
	   		
	   		originalfilename = originalfilename.substring(idx + 1); // 파일명만 받아온다.
	   		
	   		idx = originalfilename.lastIndexOf(".");
	   		
	   		String bfilename = originalfilename.substring(idx); // . 뒤에 문자를 가져온다.
	   		
	   		filename = (new Date().getTime()) + bfilename; // bookseq.png 등으로 저장
	   	
	   		File uploadFile = new File(dir, filename);
	   		
	   		try{			
	   			fileItem.write(uploadFile);	// 실제로 upload되는 부분
	   		}catch(Exception e){
	   			e.printStackTrace();
	   		}
	   		
	   	}
	   	return filename;
	 }	
}
