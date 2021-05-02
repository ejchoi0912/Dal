<%@page import="club.ClubDto"%>
<%@page import="book.BookDto"%>
<%@page import="java.util.List"%>
<%@page import="login.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 로그인이 된 상태 인지 확인 -->
<%
request.setCharacterEncoding("utf-8");
Object ologin = request.getSession().getAttribute("userId");
MemberDto mem = null;
if(ologin == null){ // 로그인 세션이 없을경우 
	%>
	<script>	
	alert('로그인을 해 주십시오');
	location.href = "login.jsp"; // 다시 login창으로 돌아간다.
	</script>	
	<%
}
mem = (MemberDto)ologin;
%> 
 
<!-- 회원정보가져오기    -->
<%
MemberDto memberdto = (MemberDto)(request.getAttribute("memberdto"));
System.out.println("memberdto = " + memberdto);
String smembernum = (String)(request.getAttribute("membernum"));
System.out.println("memberdto = " + memberdto);
int membernum = Integer.parseInt(smembernum);
%>    
<!-- 위시리스트랑 읽은책리스트 관련 데이터 불러오기 -->     
<%
//위시리스트 LIST 가져오기
List<BookDto> wishlist= (List<BookDto>)request.getAttribute("wishlist");
//읽은책리스트 LIST 가져오기
List<BookDto> readlist= (List<BookDto>)request.getAttribute("readlist");
//위시리스트 전체 페이지 수
String swishPage = (String)request.getAttribute("wishPage"); 
//위시리스트 현재 페이지 수
String swishpageNumber = (String)request.getAttribute("wishpageNumber");
//읽은책 리스트 전체 페이지 수
String sreadPage = (String)request.getAttribute("readPage"); 
//읽은책 현재 페이지 수 
String sreadpageNumber = (String)request.getAttribute("readpageNumber"); 
//String to int
int wishPage = Integer.parseInt(swishPage);
int wishpageNumber = Integer.parseInt(swishpageNumber);
int readPage = Integer.parseInt(sreadPage);
int readpageNumber = Integer.parseInt(sreadpageNumber);
//검색값 가져오기
String search = (String)request.getAttribute("search");
String choice = (String)request.getAttribute("choice");
System.out.println("mypage.jsp Come in!!! wishPage = " + wishPage + " wishpageNumber = " + wishpageNumber + " readPage = " + readPage + " readpageNumber = " + readpageNumber);
%>
<!-- 클럽리스트 관련 데이터 불러오기 --> 
<%
//커뮤니티리스트 LIST 가져오기
List<ClubDto> clublist = (List<ClubDto>)request.getAttribute("clublist");
System.out.println("clublist.size()"+clublist.size());
//클럽전체페이지 수
String sclubPage = (String)request.getAttribute("clubPage"); 
//현재클럽페이지 수
String sclubpageNumber = (String)request.getAttribute("clubpageNumber"); 
//String to int
int clubPage = Integer.parseInt(sclubPage);
int clubpageNumber = Integer.parseInt(sclubpageNumber);
System.out.println("mypage.jsp Come in!!! clubPage "+clubPage+" clubpageNumber "+clubpageNumber);
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/mypage_profile.css?vol2">
<link rel="stylesheet" href="css/mypage_total.css">

<meta charset="UTF-8">
<title>마이페이지</title>
<script type="text/javascript">
$(document).ready(function() {
    // 검색어 있는 경우
    let search = "<%=search %>";
    if(search == "") return;
    
    // select
    let obj = document.getElementById("choice");
    obj.value = "<%=choice %>";
    obj.setAttribute("selected", "selected");
});
</script>
</head>
<body>

<header style="height: 60px"></header>

<div class="container totalcontent">
	<div class="row">
		<div class=" col-sm-8 wishAndsearch" >
		
		<div class="listHeader">
		<h2 style="color: #ab896e"> WISH LIST </h2>
		</div>
			
		<!----------------------------------wishlist-----------------------------wishlist-----------------------------wishlist---------------------------------wishlist-------------------------->
			<div class="wishlist">
				<table class="booklisttable">
					<col width="80"><col width="80"><col width="80"><col width="80"><col width="80">
					
					<%
						if(wishlist == null || wishlist.size() == 0){ // 저장된 게시물이 없을 경우
						   %>
						  
						  <!-- 검색값이 없을때 디폴트 이미지 가져옴 -->
						  
						  <tr>
						     <td class="booktd"><img src="./img/noneBook1.png" height="120" width="90"></td> 
						     <td class="booktd"><img src="./img/noneBook1.png" height="120" width="90"></td>
						     <td class="booktd"><img src="./img/noneBook1.png" height="120" width="90"></td>
						     <td class="booktd"><img src="./img/noneBook1.png" height="120" width="90"></td>
						     <td class="booktd"><img src="./img/noneBook1.png" height="120" width="90"></td>
						  </tr>
						  <tr>
						  <td class="bookshelftd"  colspan="5">
						  	<img src="./img/shelf.png"  style="width:650px;">
						  </td>
						  </tr>
						  <tr>
						     <td class="booktd"><img src="./img/noneBook1.png" height="120" width="90"></td>
						     <td class="booktd"><img src="./img/noneBook1.png" height="120" width="90"></td>
						     <td class="booktd"><img src="./img/noneBook1.png" height="120" width="90"></td>
						     <td class="booktd"><img src="./img/noneBook1.png" height="120" width="90"></td>
						      <td class="booktd"><img src="./img/noneBook1.png" height="120" width="90"></td>
						  </tr>
						  <tr>
						  <td class="bookshelftd"  colspan="5">
						  <img src="./img/shelf.png"  style="width:650px;">
						  </td>
						  </tr>
						  
						  <%   
						}else{ // 저장된 게시물이 있을 경우
						   %>
						
					
			  <tr> <!-- tr의 최초 시작점 -->
						<% 
			if(wishlist.size()%10==0) { //책이 10개인경우
				
				 for(int i=0; i<wishlist.size(); i++){
			    	   
					 System.out.println("wishlistsize = " + readlist.size());
					   BookDto wishdto = wishlist.get(i);
					   %>
					  <td  class="booktd">
					  <a href="book?param=bookdetail&booknum=<%=wishdto.getBooknum() %>">
					   <img class="service" src="./upload/<%=wishdto.getBookimage() %>.jpg" height="120" width="90">
					  </a>
					  </td>
					  
					  <%
					  if( (i+1) % 5 == 0 && i > 1){
					%>
									</tr>
									 <tr>
									 <td class="bookshelftd"  colspan="5">
						  			<img src="./img/shelf.png"  style="width:650px;">
									  </td>
						        	 </tr>
						        	<tr>
					<% 	     
				       } 
					}
			%>
			</tr>	
		 <% 
			}
			%>
			
			
			<!-- //나머지가 10이 아닌 경우 -->
			<%
			if(wishlist.size()%10!=0) { //책이 10의 배수가 아닌경우
						
						int bookcount = wishlist.size();
						int backcount = 10-(wishlist.size()%10); //마지막페이지 책의 갯수
							
						/* 뒤의책 개수가 5개보다 작은경우 */
						if(backcount<5){
							
							 for(int i=0; i<bookcount; i++){
						    
						     BookDto wishdto = wishlist.get(i);				
							
							 %> 
							 
							 
							  <td class="booktd">
							     <a href="book?param=bookdetail&booknum=<%=wishdto.getBooknum() %>">
							      <img class="service" src="./upload/<%=wishdto.getBookimage() %>.jpg %>" height="120" width="90">
							      </a>
							  </td>
							  <%
							  
							  if((i+1) % 5 == 0 && i > 1){
								  %>
								  </tr>
								  <tr>
								  <td class="bookshelftd"  colspan="5">
						  			<img src="./img/shelf.png"  style="width:650px;">
						  		  </td>
								  </tr>
								  
								  <% 
							  }
							}
							 
							 for(int i=0; i<backcount; i++){
								 %>
								 <td  class="booktd"><img src="./img/noneBook1.png" height="120" width="90"></td> 
								 <% 
							 }
							 %>
							    </tr>
								 <tr>
								 <td class="bookshelftd"  colspan="5">
						  		<img src="./img/shelf.png"  style="width:650px;">
						  		</td>
					        	 </tr>
					        	 <tr>
							  <% 
							 
						}	 
							/* 뒤의 책 개수가 5인경우 */
							if(backcount==5){
								 for(int i=0; i<bookcount; i++){
									 BookDto wishdto = wishlist.get(i);
									 %>
									 
									  <td class="booktd">
									      <a href="book?param=bookdetail&booknum=<%=wishdto.getBooknum() %>"> 
									      <img class="service" src="./upload/<%=wishdto.getBookimage() %>.jpg" height="120" width="90">
									      </a>
									  </td>
									  <%
									  
									  if((i+1) % 5 == 0 && i > 1){
										  %> 
										  </tr>
										  <tr>
										  <td class="bookshelftd"  colspan="5">
						  					<img src="./img/shelf.png"  style="width:650px;">
						  					</td>
						  				   </tr> 
									  <% 
									  }
									}
									 
									 for(int i=0; i<backcount; i++){
										 %>
										  <td  class="booktd"><img src="./img/noneBook1.png" height="120" width="90"></td>
										 <%  
									 }
									 %> 
									  </tr>
									 <tr>
									 <td class="bookshelftd"  colspan="5">
						  			<img src="./img/shelf.png"  style="width:650px;">
						  			</td>
						        	 </tr>
						        	 <tr>
								  <% 
								
								}
									
							/* 뒤의 책 개수가 5보다 큰 경우 */		
							if(backcount>5){
								 for(int i=0; i<bookcount; i++){
									 BookDto wishdto = wishlist.get(i);
									 
									%>			 
									  <td  class="booktd">
									      <a href="book?param=bookdetail&booknum=<%=wishdto.getBooknum() %>">
									      <img class="service" src="./upload/<%=wishdto.getBookimage() %>.jpg" height="120" width="90">
									      </a>
									  </td>
									  
									  <% 
									  if((i+1)%5==0 && i>1){
									  %>
										  </tr>
										  <tr>
										 <td class="bookshelftd"  colspan="5">
						  				<img src="./img/shelf.png"  style="width:650px;">
						  				</td>
						        		</tr>
						        		<tr>
									<%
									  }
									}
								 %>
									
									<%  
									 for(int i=0; i<backcount-5; i++){
										 %>
									 
										 <td  class="booktd"><img src="./img/noneBook1.png" height="120" width="90"></td>
										 
										 <%
									 }
									 %>
									 </tr>
									 <tr>
									 <td class="bookshelftd"  colspan="5">
						  			<img src="./img/shelf.png"  style="width:650px;">
						  			</td>
						        	 </tr>
						        	 <tr>
		                             <%  
									 for(int i=0; i<5; i++){
										 
										 %>
										 <td  class="booktd"><img src="./img/noneBook1.png" height="120" width="90"></td> 
										 
										 <%
									 }
		                             %>
									 </tr>
									  
									 <tr>
									 <td class="bookshelftd"  colspan="5">
						  			<img src="./img/shelf.png"  style="width:650px;">
						  			</td>
						        	 </tr>
						        	 <tr>
	                                <% 
	                                
	                                
	                                
								}
										
		                	}
							 %>
							 
						 
						 <% 
						} //else end
					%>
					
					
						
				    
				    
				    <!-- 위리리스트 페이징 -->
					<tr>
						<td colspan="5" class="searchpagingarea" >
							           
							<div class="btn-toolbar paging justify-content-center" role="toolbar" aria-label="Toolbar with button groups"">	
								<div class="btn-group mr-2 " role="group" aria-label="First group" >
								<%
									for(int i = 0;i<wishPage;i++){
										if(wishpageNumber== i){	//현재 페이지일  때
										%>
										<button type="button" class="btn" onclick="goPage(<%=i %>, <%=readpageNumber %>, <%=clubpageNumber %>, <%=membernum %>)"><%=i+1 %></button>
										<%
				    	 				}
										else{
										%>
											<button type="button" class="btn" onclick="goPage(<%=i %>, <%=readpageNumber %>, <%=clubpageNumber %>, <%=membernum %>)"><%=i+1 %></button>
										<%
										}
									}
									%>
								</div>
					    	</div>
							
						</td>
					</tr>
				</table>
			</div>	
			
			
				
			<!----------------------------------READLIST-----------------------READLIST----------------------------READLIST------------------------READLIST------------------READLIST----------->
			
			<div class="listHeader">
			<h2 style="color: #ab896e"> READ LIST </h2>
			</div>
			
			<div class="wishlist">
				<table class="booklisttable">
					<col width="80"><col width="80"><col width="80"><col width="80"><col width="80">
					
					<%
						if(readlist == null || readlist.size() == 0){ // 저장된 게시물으 없을 경우
							
						   %>
						  
						  <!-- 검색값이 없을때 디폴트 이미지 가져옴 -->
						  <tr>
						  	  <%
							  for(int i=0;i<5;i++){
							  %>
							      <td class="booktd"><img src="./img/noneBook1.png" height="120" width="90" style="padding-bottom: -20px;"></td>
							   <%
							  }
							  %>   
						  </tr>
						   <tr>
							  <td class="bookshelftd"  colspan="5">
							  	<img src="./img/shelf_Under.png"  style="width:650px;">
							  </td>
						  </tr>
						 <tr>
						  	  <%
							  for(int i=0;i<5;i++){
							  %>
							      <td class="booktd"><img src="./img/noneBook1.png" height="120" width="90"></td>
							   <%
							  }
							  %>   
						  </tr>
						  <tr>
						  <td class="bookshelftd"  colspan="5">
						  	<img src="./img/shelf_Under.png"  style="width:650px;">
						  </td>
						  </tr>
						  <%   
						}else{ // 저장된 게시물이 있을 경우
						   %>
						   
						 <tr>  <!-- tr의 최초시작 -->
					
			<% 
			if(readlist.size()%10==0) { //책이 10개인경우
				 for(int i=0; i<readlist.size(); i++){
			    	   
					 System.out.println("readlistSIZE = " + wishlist.size());
					   BookDto readdto = readlist.get(i);
					   %>
					  <td  class="booktd">
					   <a href="book?param=bookdetail&booknum=<%=readdto.getBooknum() %>">
					   <img class="service" src="./upload/<%=readdto.getBookimage() %>.jpg" height="120" width="90">
					    </a>
					  </td>
					  
					  <%
					  if( (i+1) % 5 == 0 && i > 1){
					%>
						     </tr> 
						     <tr>
						      <td class="bookshelftd"  colspan="5">
						  		<img src="./img/shelf.png"  style="width:650px;">
						 	 </td>
						     </tr>
						     <tr>
					<% 	     
				       } 
					}
			%>
			
				 </tr>
			<% 
			}
			%>
		
			
			
			<!-- //나머지가 10이 아닌 경우 -->
			<%
			if(readlist.size()%10!=0) { //책이 10의 배수가 아닌경우
						
						int bookcount = readlist.size();
						int backcount = 10-(readlist.size()%10); //마지막페이지 책의 갯수
							
						//남은칸이 5개 아래인경우
						if(backcount<5){
							
							 for(int i=0; i<bookcount; i++){
						     BookDto readdto = readlist.get(i);
							 %>
							 
							  <td  class="booktd">
							      <a href="book?param=bookdetail&booknum=<%=readdto.getBooknum() %>">
							      <img class="service" src="./upload/<%=readdto.getBookimage() %>.jpg" height="120" width="90">
							      </a>
							  </td>
							  <%
							  
							  if((i+1) % 5 == 0 && i > 1){
								  %>
								    </tr>
									 <tr>
									 <td class="bookshelftd"  colspan="5">
						  			<img src="./img/shelf.png"  style="width:650px;">
						 			 </td>
						        	 </tr>
						        	 <tr>
								  <% 
							  }
							}
							 
							 for(int i=0; i<backcount; i++){
								 %>
								 <td  class="booktd"><img src="./img/noneBook1.png" height="120" width="90"></td> 
								 <% 
							 }
							 %>
							    </tr>
								 <tr>
								 <td class="bookshelftd"  colspan="5">
						  			<img src="./img/shelf.png"  style="width:650px;">
						 		</td>
					        	 </tr>
					        	 <tr>
							  <% 
							 
						}	 
						/* 뒤의 책 개수가 5인경우 */
						if(backcount==5){
							 for(int i=0; i<bookcount; i++){
								 BookDto readdto = readlist.get(i);
								 %>
								 
								  <td class="booktd">
								       <a href="book?param=bookdetail&booknum=<%=readdto.getBooknum() %>">
								      <img class="service" src="./upload/<%=readdto.getBookimage() %>.jpg" height="120" width="90">
								      </a>
								  </td>
								  <%
								  
								  if((i+1) % 5 == 0 && i > 1){
									  %> 
									  </tr>
									  <tr>
									  <td class="bookshelftd"  colspan="5">
						  				<img src="./img/shelf.png"  style="width:650px;">
						 			  </td>
					  				   </tr> 
								  <% 
								  }
								}
								 
								 for(int i=0; i<backcount; i++){
									 %>
									  <td  class="booktd"><img src="./img/noneBook1.png" height="120" width="90"></td>
									 <%  
								 }
							
							}
						
						/* 뒤의 책 개수가 5보다 큰 경우 */				
						if(backcount>5){
							 for(int i=0; i<bookcount; i++){
								 BookDto readdto = readlist.get(i);
								 
								%>			 
								  <td  class="booktd">
								      <a href="book?param=bookdetail&booknum=<%=readdto.getBooknum() %>"> 
								      <img class="service" src="./upload/<%=readdto.getBookimage() %>.jpg" height="120" width="90">
								      </a>
								  </td>
								  
								  <% 
								  if((i+1)%5==0 && i>1){
								  %>
									  </tr>
									  <tr>
									 <td class="bookshelftd"  colspan="5">
						  				<img src="./img/shelf.png"  style="width:650px;">
						 			  </td>
					        		</tr>
					        		<tr>
								<%
								  }
								}
							 %>
								
								<%  
								 for(int i=0; i<backcount-5; i++){
									 %>
								 
									 <td class="booktd"><img src="./img/noneBook1.png" height="120" width="90"></td>
									 
									 <%
								 }
								 %>
								 </tr>
								 <tr>
								 <td class="bookshelftd"  colspan="5">
						  			<img src="./img/shelf.png"  style="width:650px;">
						 		</td>
					        	 </tr>
					        	 <tr>
	                             <%  
								 for(int i=0; i<5; i++){
									 
									 %>
									 <td  class="booktd"><img src="./img/noneBook1.png" height="120" width="90"></td> 
									 
									 <%
								 }
	                             %>
								 </tr>
								  
								 <tr>
								 <td class="bookshelftd"  colspan="5">
						  			<img src="./img/shelf.png"  style="width:650px;">
						 		</td>
					        	 </tr>
					        	 <tr>
                               <% 
                               
                               
                               
							}
									
	                	}
						 %>
						 
					 
					 <% 
					} //else end
				%>
					
					
					<!-- 읽은책 리스트 페이징 -->
					<tr>
						<td colspan="5" class="searchpagingarea" >
							           
						<div class="btn-toolbar paging justify-content-center" role="toolbar" aria-label="Toolbar with button groups"">	
								<div class="btn-group mr-2 " role="group" aria-label="First group" >
								<%
									for(int i = 0;i<readPage;i++){
										if(readpageNumber== i){	//현재 페이지일  때
										%>
										<button type="button" class="btn" onclick="goPage(<%=wishpageNumber %> , <%=i %>, <%=clubpageNumber %>, <%=membernum %>)"><%=i+1 %></button>
										<%
				    	 				}
										else{
										%>
											<button type="button" class="btn" onclick="goPage(<%=wishpageNumber %> , <%=i %>, <%=clubpageNumber %>, <%=membernum %>)"><%=i+1 %></button>
										<%
										}
									}
									%>
								</div>
					    	</div>
							
						</td>
					</tr>			
		
				</table>
			</div>	
			
			</div>
			
					
		
		
		<!--  책장과 개인정보 사이에  세로로 빈공간 
		 	<div class=" col-sm-1 mr-auto">
			</div>   -->
			
			
			
		
	
		<div class=" col-sm-4 memAndclub">
		
		
			<!-------------------프로필----------------------------프로필----------------------------프로필------------------------프로필------------------프로필--------프로필------------프로필------------->
		

			<div class=" member" style="width: 300px; margin: 50px" >
				<!-- <h2>PROFILE</h2> -->
				<table class="profiletable">
					<tr>
					<td>
							<div class="container px-0 h-100">
								<div class="row h-100 justify-content-center align-items-center">
									<div class="card">
										<div class="card-header">
											<div class="profile_pic">
												<img alt="" src="<%=memberdto.getUserimage() %>">
											</div>
										</div>
										<div class="card-body">
											<div class="d-lfex justify-content-center flex-column">
												<div class="name_container">
													<div class="name"><%=memberdto.getUserid() %></div> 
												</div>
												<div class="address"><%=memberdto.getEmail()%></div>
											</div>
										</div>
										<div class="card-footer">
											<div class="view_profile">
												<a href="schedule?param=calendarlist&membernum=<%=membernum %>" style="color: #4b4b49; text-decoration: none;">일정관리</a> <!-- param 값 안근이가 하는거 -->
											</div>
											<div class="message">
												<a href="mypage?param=memberupdate&membernum=<%=membernum %>" style="color: #4b4b49; text-decoration: none;">정보수정</a> 
											</div>
										</div>
									</div>
								</div>
							</div>
						</td>
						</tr>
					</table>
				</div>
			
				
		<!-- ----------------검색------------------>
				
				<div class="searchlala input-group" style="width: 300px;margin: 0 auto">	
				<form class="form-inline" action="#">
				<select class="col-4 form-control" id="choice">
			    	<option value="title">책제목</option>
					<option value="author">책저자</option>
			  	</select>
	     		<input class="col-6 form-control" type="text" placeholder="search" value="<%=search %>" id="search" >
	     		<button class="col-2 btn" type="button"  onclick="searchBooks(<%=wishpageNumber %> , <%=readpageNumber %>, <%=clubpageNumber %>, <%=membernum %>)"><i class="fa fa-search" aria-hidden="true"></i></button>

				</form> 
			    </div>
			    
			    
			    
			    
			    <div class='searchlulu'>
			    </div>
		
		<!-- -----------------커뮤니티--------------->		
					
			<div class="clublist">
					<table class="clublisttable" style="margin-left: auto; margin-right: auto;" id="ta"  radius="3" rborder="#999999" rbgcolor="#F8F8F8">
					<col width="350px">
					<tr>
					<th style="font-size: 20pt; background-color: #e8d3c1;height: 40px;color:#666663">MY CLUB</th>
					</tr>
					
						<%
						if(clublist == null || clublist.size() == 0){ // 저장된 게시물으 없을 경우
						   %>
						 
						  <tr>
						     <td class="clubImageTd" >커뮤니티 리스트가 없습니다</td>
						  </tr>
						  <tr>
						     <td  class="clubImageTd">커뮤니티 리스트가 없습니다</td>
						  </tr>
						  <tr>
						     <td  class="clubImageTd">커뮤니티 리스트가 없습니다</td>
						  </tr>
						 
						  <%   
						}
						else{ // 저장된 게시물이 있을 경우
						   %> 
						     
						  
						  <% 
								if(clublist.size()%3==0) { //클럽이 3의 배수인 경우
								for(int i=0; i<clublist.size(); i++){
									%>
							    <tr class="something">		
									<% 
									System.out.println("clublistsize = " + clublist.size());
								
									ClubDto clubdto = clublist.get(i);									
									%>									
									<td class="clubImageTd" onmouseover="this.style.background='#f1edea'" onmouseout="this.style.background='white'">
									<a href="#" style="color: #4b4b49; text-decoration: none;">
										<img src="<%=clubdto.getClubimage() %>" width="70px" height="70px" style="vertical-align:middle;padding: 0 auto;">
										<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
										<span><%= clubdto.getClubtitle() %></span>
									</a>	
								  </td>								   
								   </tr>
								  
								   <%
								  
								
									}		
								}
							%>
						
			
							<%
								if(clublist.size()%3!=0) { //클럽이 3의 배수가 아닌경우
											
										int clubcount = clublist.size();
										int backcount = 3-(clublist.size()%3); //마지막페이지 책의 갯수
											
											 for(int i=0; i<clubcount; i++){
											 ClubDto clubdto = clublist.get(i);
											 %>
											 <!-- 클럽상세페이지로 가기 -->
											 <td class="clubImageTd" onmouseover="this.style.background='#f1edea'" onmouseout="this.style.background='white'"
											 	onclick="location.href='club?param=getclubdetail&clubseq=<%=clubdto.getClubseq() %>'">
											 <a href="#"  style="color: #4b4b49; text-decoration: none;" >
												 <img src="<%=clubdto.getClubimage() %>" width="70px" height="70px" style="vertical-align:middle;">
												<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
												 <span><%= clubdto.getClubtitle() %></span>
											 </a>				 			    
											  </td>
											  </tr>
											  <%		
											}
											 
											 for(int i=0; i<backcount; i++){
												 %>
												 <td class="clubImageTd"></td> 
												 </tr>
												 <% 
											 }
										} //if end			
										
										%>
				 
						 <% 
						 }//else end(저장된 게시물이 있을 경우)		    
						
					%>
						
						<!-- 커뮤니티 페이징 -->
						<tr>
						<td colspan="2" class="searchpagingarea">
							           
								<div class="btn-toolbar justify-content-center" role="toolbar" aria-label="Toolbar with button groups"">	
								<div class="btn-group mr-2 " role="group" aria-label="First group" >
								<%
									for(int i = 0;i<clubPage;i++){
										if(clubpageNumber== i){	//현재 페이지일  때
										%>
										<button type="button" class="btn" onclick="goPage(<%=wishpageNumber %> ,<%=readpageNumber %> ,<%=i %>, <%=membernum %>)"><%=i+1 %></button>
										<%
				    	 				}
										else{
										%>
											<button type="button" class="btn" onclick="goPage(<%=wishpageNumber %> ,<%=readpageNumber %> ,<%=i %>, <%=membernum %>)"><%=i+1 %></button>
										<%
										}
									}
									%>
								</div>
					    	</div>
						
						</td>
						</tr>			
		
				</table>		
			
			</div>
		
		</div>
				
	</div>
			
</div>
			
			
			
				
 <script type="text/javascript">
 
 function searchBooks(wishpageNumber , readpageNumber, clubpageNumber, membernum) {
	 let choice = document.getElementById("choice").value;
	   let search = document.getElementById("search").value;
	      
	   /* if($("#choice").val()!=null && $("#search").val()!=null ){
	       choice = document.getElementById("choice").value;
	       search = document.getElementById("search").value;
	   } */
	   
	   location.href = "mypage?param=getmypagelist&choice=" + choice + 
	   "&search=" + search + "&wishpageNumber=" + wishpageNumber + "&readpageNumber=" + readpageNumber + "&clubpageNumber=" + clubpageNumber +"&membernum="+ membernum;
	   
	   
}
 function goPage( wishpageNumber , readpageNumber, clubpageNumber , membernum) {
	   let choice = document.getElementById("choice").value;
	   let search = document.getElementById("search").value;
	      
	  /* if($("#choice").val()!=null && $("#search").val()!=null ){
	       
	      
	   }*/
	   
	   location.href = "mypage?param=getmypagelist&choice=" + choice + 
			   "&search=" + search + "&wishpageNumber=" + wishpageNumber + "&readpageNumber=" + readpageNumber + "&clubpageNumber=" + clubpageNumber +"&membernum="+ membernum;
	}
 
 
</script>
	
	
</body>
</html>