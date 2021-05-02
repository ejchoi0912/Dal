<%@page import="login.MemberDto"%>
<%@page import="book.BookDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 
  <!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- 부트스트랩 --> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!--  css -->
 <!--  <link href="css/style1.css" rel="stylesheet" />  -->
  <link href="css/all.css" rel="stylesheet" />
  <link href="css/book.css" rel="stylesheet" />
  <link href="css/bookaction.css" rel="stylesheet" />

<!-- font font-family: 'Noto Serif KR', serif; -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700;900&display=swap" rel="stylesheet">
  
 <!-- 애니메이션용 링크 -->
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>

<!-- 돋보기 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <title>책 추천받기</title>


<style type="text/css">

.menu{
   border-left: 3px solid black;
   font-weight: bold;
}
</style>
</head>
<body style="font-family: 'Noto Serif KR', serif;">

<%
	Object userId = session.getAttribute("userId");
	MemberDto mem = null;
	int membernum = -1;
	
	if(userId != null){ // 로그인 세션이 있을경우 
		mem = (MemberDto)userId;
		membernum = mem.getMembernum();
	}
	
    //변수 받아오기
    //신작 리스트 받아오기
    List<BookDto> Newlist = (List<BookDto>)request.getAttribute("Newlist");
   //이달의 추천 받아오기
   List<BookDto> Userlist = (List<BookDto>)request.getAttribute("Userlist");

    //전체 페이지 번호
    int bookPage = Integer.parseInt((String)request.getAttribute("bookPage"));
    
    //페이징 번호
    int pageNumber = Integer.parseInt((String)request.getAttribute("pageNumber"));
    
    //검색변수
    String searchTitle = (String)request.getAttribute("searchTitle");
    String searchText = (String)request.getAttribute("searchText");
    
    //menu 변수
    String menu = (String)request.getAttribute("menu");
    
   System.out.println("신작 갯수 : "+Newlist.size());
   System.out.println("오늘의 책 갯수 : "+Userlist.size());
   System.out.println("검색 select : "+searchTitle);
   System.out.println("menu 카테고리 : "+menu);
   System.out.println("검색 문자 : "+searchText);
   System.out.println("신작 갯수 출력 : "+Newlist.size());
   System.out.println("페이징 번호pageNumber(현재)  : " +pageNumber);
   System.out.println("페이징 숫자bookPage(전체)  : " +bookPage);
 %> 

<script type="text/javascript">
//해당 선택
let menu = "<%=menu%>";
document.getElementById('total').className += menu;
document.getElementById(menu).classList.toggle("left-active");

$(document).ready(function() {
   // 검색어 있는 경우
   let searchTitle = "<%=searchTitle %>";
   if(searchTitle == "") return;
   
   // select
   let obj = document.getElementById("searchText");
   obj.value = "<%=searchText %>";
   obj.setAttribute("selected", "selected");

});

</script>

 
<header style="height: 5em">
</header>

<!-- //////////////////////////////////////책 목록 보이는 부분///////////////////////////////////////////////////////// -->
<div class="container">

<div class="animate__animated animate__fadeIn Sheader" style="height:65px;border-left:4px solid #e8974c;padding-left:25px; margin-bottom: 70px;margin-top:20px;">
   <a href="book?param=booklist"><h2>추천 도서</h2></a>
   <p>BAVABOOK에서 선정한 책입니다.</p>
</div>

  <div class="row">
   <div class="col-sm-3" style="background-color:#f5f5f5;box-shadow: 0px 10px 30px 5px rgb(0 0 0 / 15%);">
   <br>
      
      <nav>
      <div style="border-bottom: 3px solid #E8D3C1;margin-bottom: 20px;">
         <h2 class="animate__animated animate__fadeInLeft" style="margin-left: 10px;">MENU</h2>
      </div>
      
      <ul class="category_ul animate__animated animate__fadeInLeft">
         <li id="total" class="nav-item-active" >
            <a href="#none" class="nav-link left-link" onclick="pagebtn('total')" >전체</a>
         </li >
         <li id="poemFict" class="nav-item-active">
            <a href="#none" class="nav-link left-link" onclick="pagebtn('poemFict')">시/소설</a>
         </li>
         <li id="essaSimp" class="nav-item-active">
            <a href="#none" class="nav-link left-link" onclick="pagebtn('essaSimp')">에세이/자기계발서</a>
         </li>
         <li id="econSoci" class="nav-item-active">
            <a href="#none" class="nav-link left-link" onclick="pagebtn('econSoci')">경제/사회</a>
         </li>
         <li id="artComic" class="nav-item-active">
            <a href="#none" class="nav-link left-link" onclick="pagebtn('artComic')">예술/만화</a>
         </li>
         <li id="historical" class="nav-item-active">
             <a href="#none" class="nav-link left-link" onclick="pagebtn('historical')">역사</a>
         </li>
         <li id="science" class="nav-item-active">
             <a href="#none" class="nav-link left-link" onclick="pagebtn('science')">과학</a>
         </li>
      </ul>
       
      </nav>
      <br><br>
      <!-- 검색부분 -->   
      
      <div class="input-group search animate__animated animate__fadeInLeft">
         
   
            <select id="searchTitle" class="form-control">
                <option value="title">책제목</option>
               <option value="author">책저자</option>
              </select>
             <input type="text" class="form-control" id="searchText" value="<%=searchText %>" placeholder="검색">
             <div class="input-group-append">
                <button class= "btn" type="button" onclick="searchBook()"><i class="fa fa-search" aria-hidden="true"></i></button>
             </div>      
      </div>
   </div>


   
   <!-- 책 목록 보이는 부분 -->
   <div class="col-sm-9 p-4">       
     <!-- Nav tabs -->
     <ul class="nav nav-tabs" role="tablist">
       <li class="nav-item">
         <a class="nav-link active" id="select1" data-toggle="tab" href="#NewBook">신작</a>
       </li>
       <li class="nav-item">
         <a class="nav-link" id="select2" data-toggle="tab" href="#userSelect">올해의 책</a>
       </li>
     </ul>
      
     <!-- Tab panes -->
     <div class="tab-content">
     <!--신작  -->
       <div id="NewBook" class="container tab-pane active">
          <div class="gtco-container">
           <div class='row gtco-section gtco-products'>
            
                 <%
                    if(Newlist == null || Newlist.size() == 0){
                 %>
                 <div>
                    <p>검색한 책이 없습니다.</p>
                 </div>
                 <%
                    }else{
                       for(int i=0;i<Newlist.size();i++){
                          BookDto Newbook = Newlist.get(i);
                       
                 %>   
                 <div class="service col-sm-3 col-xs-12 justify-content-center">
                  <a href="book?param=bookdetail&booknum=<%=Newbook.getBooknum() %>&membernum=<%=membernum %>" class="gtco-item two-row bg-img animate__animated animate__fadeInUp">
                     <div class="overlay">
                     <div class="copy" style="bottom:30px">
                        <h3><%=Newbook.getBooktitle() %></h3>
                        <p><%=Newbook.getAuthor() %></p>
                     </div>
                  </div>   
                     <img class="" src="./upload/<%=Newbook.getBookimage() %>" style="height: 240px" onerror='this.src="./img/noneBook1.png"'>
                 </a>
              
                    </div>   
                 <%      }
                     }%>        
              </div>
         </div>      
               
               <!-- 페이징 버튼 -->
            <div class="btn-toolbar paging justify-content-center animate__animated animate__fadeInUp pagintAni" role="toolbar" aria-label="Toolbar with button groups">   
               <div class="btn-group mr-2 " role="group" aria-label="First group">
               <%
                  for(int i = 0;i<bookPage;i++){
                     if(pageNumber == i){   //현재 페이지일  때
                     %>
                     <button type="button" class="btn" onclick="goPage(<%=i %>)"><%=i+1 %></button>
                     <%
                       }
                     else{
                     %>
                        <button type="button" class="btn" onclick="goPage(<%=i %>)"><%=i+1 %></button>
                     <%
                     }
                  }
                  %>
               </div>
             </div>
         </div>

          <!-- 이달의 책 -->
          <div id="userSelect" class="container tab-pane fade">
                <div class="gtco-container">
                 <div class='row gtco-section gtco-products'>
                  
                       <%
                          if(Userlist == null || Userlist.size() == 0){
                       %>
                       <div>
                          <p>검색한 책이 없습니다.</p>
                       </div>
                       <%
                          }else{
                             for(int i=0;i<Userlist.size();i++){
                                BookDto userbook = Userlist.get(i);
                             
                       %>   
                       <div class="service col-sm-3 col-xs-12 justify-content-center">
                        <a href="book?param=bookdetail&booknum=<%=userbook.getBooknum() %>&membernum=<%=membernum %>"  class="gtco-item two-row bg-img animate__animated animate__fadeInUp" ">
                           <div class="overlay">
                           <div class="copy">
                              <h3><%=userbook.getBooktitle() %></h3>
                              <p><%=userbook.getAuthor() %></p>
                           </div>
                        </div>   
                           <img class="service" src="./upload/<%=userbook.getBookimage() %>" style="height: 240px">
                       </a>
                          </div>   
                       <%      }
                           }%>        
                    </div>
               </div>      
                   
               <div class=" btn-toolbar text-center paging justify-content-center" role="toolbar" aria-label="Toolbar with button groups">   
                  <div class="btn-group mr-2 " role="group" aria-label="First group">
                  <%
                     for(int i = 0;i<bookPage;i++){
                        if(pageNumber == i){   //현재 페이지일  때
                        %>
                           <button type="button" class="btn" onclick="goPage(<%=i %>)"><%=i+1 %></button>
                        <%
                          }
                        else{
                           %>
                           <button type="button" class="btn" onclick="goPage(<%=i %>)"><%=i+1 %></button>
                           <%
                        }
                     }
                     %>
                  </div>
                </div>
             </div>
          </div>
         
      
     </div>
   </div>
</div>
</div>

<script type="text/javascript">
var menu1;

function searchBook(){
   let searchTitle = document.getElementById("searchTitle").value;
   let searchText = document.getElementById("searchText").value;
   
   location.href = "book?param=booklist&searchTitle="+searchTitle+"&searchText="+searchText;
}

function goPage(pageNumber){
   let searchTitle = document.getElementById("searchTitle").value;
   let searchText = document.getElementById("searchText").value;
   

   location.href = "book?param=booklist&searchTitle="+searchTitle+"&searchText="+searchText+"&pageNumber="+pageNumber+"&menu=<%=menu %>";
}

function pagebtn(menu){
   let searchTitle = document.getElementById("searchTitle").value;
   let searchText = document.getElementById("searchText").value;
   menu1 = menu;
   location.href="book?param=booklist&searchTitle="+searchTitle+"&searchText="+searchText+"&menu="+menu;
}

</script>

 <!-- 쿠키 -->
<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>
<script type="text/javascript">
 $(document).ready(function() {
    var activee = $.cookie("activee");
   
    if(activee == "1"){
       $("#select1").removeClass('active');
       $("#select2").addClass('active');
       
       $("#bookheader").removeClass('active');
       $("#bookheader").addClass('fade');
       
       $("#answer").removeClass('fade');
       $("#answer").addClass('active');
    }
    
    $('#select2').click(function(){
       activee = 1
       $.cookie("activee", activee,{ expires:1, path:'./'});
    });
    $('#select1').click(function(){
       activee = 0
       $.cookie("activee", activee,{ expires:1, path:'./'});
    });
    
 });
</script>





</body>
</html>