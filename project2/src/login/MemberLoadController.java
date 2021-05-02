package login;

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

import book.BookController;
import book.BookDao;
import book.BookDto;

public class MemberLoadController extends HttpServlet {
	
		ServletConfig mConfig = null;

	   
	   @Override
	   public void init(ServletConfig config) throws ServletException {
	      mConfig = config;
	      System.out.println("mConfig = " + mConfig);
	   }
	   
	   @Override
	   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		   System.out.println("S FileController");
		   String param = req.getParameter("param");
		   System.out.println("param = " + param);
		   // tomcat 배포 - server
		   String fupload =  mConfig.getServletContext().getRealPath("/upload");
		   // 지정 폴더 - client
		   // String fupload = "d:\\tep";
		   System.out.println("업로드 폴더 : " + fupload);
		   String yourTempDir = fupload;
		   int yourMaxRequestSize = 100 * 1024 * 1024; // 1 Mbyte
		   int yourMaxMemorySize = 100 * 1024;			// 1 Kbyte
		   boolean isMultipart = ServletFileUpload.isMultipartContent(req);
		   
		   System.out.println("S FileController2");
		   String newfilename = "";
		   // form field의 데이터를 저장할 변수
		   String userid = "";
		   String pwd = "";
		   String email = "";
		   int gender = 0;
		   String phone = "";
		   String yy = "";
		   String mm = "";
		   String dd = "";
		   
		   //Book
		   String booktitle = "";
		   int category = 0;
		   String author ="";
		   String issudate = "";
		   String publisher = "";
		   String bookheader = "";
		   String checkFlag = "";
		   int bookNumber = 0; //Integer.parseInt(req.getParameter("booknum"));
		   // file명 저장
		   String originalfilename = "";
		   String oldfile = "";
		   
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
		   			if(item.getFieldName().equals("userid")){
		   				userid = item.getString("utf-8");
		   			} 
		   			else if(item.getFieldName().equals("pwd")){
		   				pwd = item.getString("utf-8");
		   			} 
		   			else if(item.getFieldName().equals("email")){
		   				email = item.getString("utf-8");
		   			}
		   			else if(item.getFieldName().equals("gender")){
		   				gender = Integer.parseInt( item.getString("utf-8").trim() );
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
		   			}else if(item.getFieldName().equals("booktitle")) {
		   				booktitle = item.getString("utf-8");
		   			}else if(item.getFieldName().equals("categories")) {
		   				category = Integer.parseInt( item.getString("utf-8").trim() );
		   				System.out.println(category);
		   			}else if(item.getFieldName().equals("author")) {
		   				author = item.getString("utf-8");
		   			}else if(item.getFieldName().equals("issudate")) {
		   				issudate = item.getString("utf-8");
		   			}else if(item.getFieldName().equals("publisher")) {
		   				publisher = item.getString("utf-8");
		   				
		   			}else if(item.getFieldName().equals("bookheader")) {
		   				bookheader = item.getString("utf-8");
		   			}else if(item.getFieldName().equals("checkFlag")) {
		   				checkFlag = item.getString("utf-8");
		   			}else if(item.getFieldName().equals("bookNumber")) {
		   				
	                     bookNumber = Integer.parseInt(item.getString("utf-8").trim());
	                     System.out.println("booknum" + bookNumber);
		   			}else if(item.getFieldName().equals("oldfile")) {
		   				oldfile = item.getString("utf-8");
		   			}
		   		}else {
	   				if(item.getFieldName().equals("memberImg")){
	   					System.out.println("getFieldName ~~~");
						newfilename = processUploadFile(item, fupload);
		   			}else if(item.getFieldName().equals("bookimage")) {
		   				newfilename = processUploadFile(item, fupload);
		   			}
	   			}
		   }
		   	System.out.println("booktitle :" + booktitle);
		   	System.out.println("checkFlag :" + checkFlag);
		   	System.out.println("issudate :" + issudate);
		   
		  }
		   
		   if(newfilename == "") {
			   newfilename = oldfile;
		   }
		   
		   System.out.println("S FileController6");
		   if(userid != "") {
			   	  LoginDao dao = LoginDao.getInstance(); 

				  String birth = yy + "/" + mm + "/" + dd;
				  System.out.println("userid = " + userid + "pwd = " + pwd + "email = " + email + "gender = " 
						  				+ gender + "phone = " + phone + "birth = " + birth);
				  MemberDto dto = new MemberDto(userid, pwd, email, gender, phone, birth, newfilename);
				  System.out.println("S FileController7");
				  
				  boolean isS = dao.addMember(dto);
				  req.getRequestDispatcher("main?param=mainscreen").forward(req, resp);
		   }
		   else if(booktitle != "") {
			   boolean isS =false;
			     BookDao dao = BookDao.getInstance(); 

				 System.out.println("newfilename : " + newfilename);
				  BookDto dto = new BookDto(bookNumber, booktitle, category, author, issudate, bookheader, publisher, newfilename);
				  System.out.println(dto.toString());
				  System.out.println("checkFlag : "+checkFlag);
				  
				  
                  
       
				 
                  if(checkFlag.equals("insert")) {
					  System.out.println("insert!!");
					  isS = dao.getBookInsert(dto);
		                 
		                 if(isS == true) {

		                        String searchTitle = req.getParameter("searchTitle");
		                        String searchText = req.getParameter("searchText");
		                        String spage = req.getParameter("pageNumber");
		                    
		                  
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
		                     
		                        
		                        System.out.println("searchTitle"+searchTitle);
		                        System.out.println("searchText"+searchText);
		                        System.out.println("page"+page);
		                        List<BookDto> bookList = dao.getBookAllList(searchTitle, searchText);
		                        for(int i=0;i<bookList.size();i++) {
		                           System.out.println(bookList.get(i));
		                        }
		                        req.setAttribute("bookList", bookList);
		                        
		                        
		                      //paging 
		                     int len = dao.getBookLen(searchTitle, searchText);
		                     
		                     int bookPage = len/12;
		                     if(len % 12 > 0) {
		                        bookPage = bookPage + 1;
		                     }
		                       
		                   
		                     req.setAttribute("bookPage", bookPage+"");
		                     req.setAttribute("pageNumber", page+"");
		                     req.setAttribute("searchTitle", searchTitle);
		                     req.setAttribute("searchText", searchText);
		                        
		                        req.setAttribute("error", "0");
		                        req.getRequestDispatcher("index.jsp?content=masterPage").forward(req, resp);
		                      
		                 }else {

		                        String searchTitle = req.getParameter("searchTitle");
		                        String searchText = req.getParameter("searchText");
		                        String spage = req.getParameter("pageNumber");
		                    
		                  
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
		                     
		                       
		                        System.out.println("searchTitle"+searchTitle);
		                        System.out.println("searchText"+searchText);
		                        System.out.println("page"+page);
		                        List<BookDto> bookList = dao.getBookAllList(searchTitle, searchText);
		                        for(int i=0;i<bookList.size();i++) {
		                           System.out.println(bookList.get(i));
		                        }
		                        req.setAttribute("bookList", bookList);
		                        
		                        
		                     int len = dao.getBookLen(searchTitle, searchText);
		                     

		                     int bookPage = len/12;
		                     if(len % 12 > 0) {
		                        bookPage = bookPage + 1;
		                     }
		                       
		                   
		                        req.setAttribute("bookPage", bookPage+"");
		                     req.setAttribute("pageNumber", page+"");
		                     req.setAttribute("searchTitle", searchTitle);
		                     req.setAttribute("searchText", searchText);
		                        
		                        req.setAttribute("error", "0");
		                        req.getRequestDispatcher("index.jsp?content=masterPage").forward(req, resp);
		                 }
		              }else if(checkFlag.equals("update")) {
		                 System.out.println("update!!");
		                 isS = dao.getUpdateBook(dto);
		                 System.out.println(isS);
		                 if(isS == true) {

		                        String searchTitle = req.getParameter("searchTitle");
		                        String searchText = req.getParameter("searchText");
		                        String spage = req.getParameter("pageNumber");
		                    
		                  
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
		                     
		                       
		                        System.out.println("searchTitle"+searchTitle);
		                        System.out.println("searchText"+searchText);
		                        System.out.println("page"+page);
		                        List<BookDto> bookList = dao.getBookAllList(searchTitle, searchText);
		                        for(int i=0;i<bookList.size();i++) {
		                           System.out.println(bookList.get(i));
		                        }
		                        req.setAttribute("bookList", bookList);
		                        
		                        
		                      //paging
		                     int len = dao.getBookLen(searchTitle, searchText);
		                     
		                     int bookPage = len/12;
		                     if(len % 12 > 0) {
		                        bookPage = bookPage + 1;
		                     }
		                       
		                   
		                     req.setAttribute("bookPage", bookPage+"");
		                     req.setAttribute("pageNumber", page+"");
		                     req.setAttribute("searchTitle", searchTitle);
		                     req.setAttribute("searchText", searchText);
		                     req.setAttribute("error", "0");
		                     req.getRequestDispatcher("index.jsp?content=masterPage").forward(req, resp);
		                 }else {

		                        String searchTitle = req.getParameter("searchTitle");
		                        String searchText = req.getParameter("searchText");
		                        String spage = req.getParameter("pageNumber");
		                    
		                  
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
		                     
		                      
		                        System.out.println("searchTitle"+searchTitle);
		                        System.out.println("searchText"+searchText);
		                        System.out.println("page"+page);
		                        List<BookDto> bookList = dao.getBookAllList(searchTitle, searchText);
		                        for(int i=0;i<bookList.size();i++) {
		                           System.out.println(bookList.get(i));
		                        }
		                        req.setAttribute("bookList", bookList);
		                        
		                     int len = dao.getBookLen(searchTitle, searchText);
		                     //System.out.println("페이징 길이 : "+len);

		                     int bookPage = len/12;
		                     if(len % 12 > 0) {
		                        bookPage = bookPage + 1;
		                     }
		                       
		                   
		                     req.setAttribute("bookPage", bookPage+"");
		                     req.setAttribute("pageNumber", page+"");
		                     req.setAttribute("searchTitle", searchTitle);
		                     req.setAttribute("searchText", searchText);
		                        
		                     req.setAttribute("error", "0");
		                     req.getRequestDispatcher("index.jsp?content=masterPage").forward(req, resp);
		                 }
		                
		              }
		               
		             
		             
		         }
		        
		      }
	   
	   // upload 함수
	   public String  processUploadFile(FileItem fileItem, String dir)throws IOException{
	   	
	   	String imgfilename = fileItem.getName();	 // 경로 + 파일명
	   	String newfilename = "";
	   	long sizeInBytes = fileItem.getSize();	 // 크기
	   	
	   	/*
	   	File uploadPath = new File(dir);
	   	
	   	if(!uploadPath.exists()) {
			try{
				uploadPath.mkdir(); //폴더 생성합니다.
			    System.out.println("폴더가 생성되었습니다.");
		        } 
		        catch(Exception e){
			    e.getStackTrace();
			}    
		}
	   	*/
	   	
	   	if(sizeInBytes > 0) {	// 파일이 정상인가?	// d:\\tem\\abc.txt = d:/tem/abc.txt 
	   		
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
	   			fileItem.write(uploadFile);	// 실제로 upload되는 부분
	   		
	   		}catch(Exception e){
	   			e.printStackTrace();
	   		}
	   		
	   	}
	   	return newfilename;
	 }
}
