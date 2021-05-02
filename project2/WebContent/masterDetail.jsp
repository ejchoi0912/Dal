<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="book.BookDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link href="css/main.css" rel="stylesheet" />
  <link href="css/book.css" rel="stylesheet" />

  
<title>책 디테일</title>
</head>
<body>

<%
BookDto book = (BookDto)request.getAttribute("book");
System.out.println(book.toString());

%>
<header style="height: 5em">
<!-- 로고 -->
<nav class="navbar navbar-expand-sm fixed-top justify-content-end js-scroll-trigger">
   <div class="logo"><img alt="" src="./img/ab8962_logo.png"></div>
      <!-- 네비게이션 -->
         <div class="collapse navbar-collapse m-0 mr-5 justify-content-end" id="navbar-content">
         
         <ul class="navbar-nav ">
            <li class="nav-item">
               <a class="nav-link linkcol" href="main.jsp?content=home">처음으로</a>
            </li>
            <li class="nav-item">
               <a class="nav-link linkcol" href="main.jsp?content=book">책 추천받기</a>
            </li>
            <li class="nav-item">
               <a class="nav-link linkcol" href="main.jsp?content=community">소통하기</a>
            </li>
            <li class="nav-item">
               <a class="nav-link linkcol" href="main.jsp?content=mypage">내 서재로 가기</a>
            </li>
            <li class="nav-item dropdown">
               <a class="nav-link dropdown-toggle linkcol" href="main.jsp?content=login" id="navbardrop"
                  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">로그인</a>
                  <div class="dropdown-menu dropdown-menu-right"  aria-labelledby="navbardrop"  >
                    <a class="dropdown-item" href="#">로그인</a>
                    <a class="dropdown-item" href="#">내 서재로 가기</a>
                    <a class="dropdown-item" href="#">일정관리</a>
                  </div>
               </li>
         </ul>   
         </div>
         
         <button class="navbar-toggler" type="button" data-toggle="collapse"
          data-target="#navbar-content" aria-controls="navbar-content" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span> 
      </button>
</nav>
</header>


<!-- /////////////////////////책소개부분//////////////////////////// -->
<div class="container">
  <div class="row p-4">
   <div class="col-sm-9">
      <div class="row">
         <div class="col-sm-5 service-wrap" >
            <div class="center-block bookimg" style="text-align: center; display: inline-block">
               <a data-toggle="modal" data-target="#myModal" >
                  <img class="img-responsive bookimg" src="https://image.aladin.co.kr/product/26809/94/cover500/k572730190_1.jpg">
               </a>
            </div>
         </div>   

         <div class="col-sm-7 p-5">
            <div>
               <h2 class = "p-2"><%=book.getBooktitle() %></h2>
            </div>
            
            <table class="table table-borderless table-sm">
               <col width="100">
               <tr>
               <th colspan="2">
               <tr>
                  <th>장르</th>
                  <%
                  String category = "";
                  if(book.getCategories() == 100){
                     category = "시";
                  }else if(book.getCategories() == 200){
                     category = "소설";
                  }else if(book.getCategories() == 300){
                     category = "에세이";
                  }else if(book.getCategories() == 400){
                     category = "자기계발";
                  }else if(book.getCategories() == 500){
                     category = "경제";
                  }else if(book.getCategories() == 600){
                     category = "역사";
                  }else if(book.getCategories() == 700){
                     category = "예술";
                  }else if(book.getCategories() == 800){
                     category = "과학";
                  }else if(book.getCategories() == 900){
                     category = "사회";
                  }else if(book.getCategories() == 1000){
                     category = "만화";
                  }
                  %>
                  
                  <td><%=category %></td>
               </tr>
               <tr>
                  <th>작가</th>
                  <td><%=book.getAuthor() %></td>
               </tr>
               <tr>
                  <th>발행일</th>
                  <%
                  String issuedate = book.getIssudate();
                  DateFormat dF = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.0");         //데이터가 2021-03-12 15:30으로 들어온다.
                  Date date = dF.parse(issuedate);            
                  SimpleDateFormat rdate1 = new SimpleDateFormat("yyyy-MM-dd");

               %>
                  <td><%=rdate1.format(date) %></td>
               </tr>
               <tr>
                  <th>출판사</th>
                  <td><%=book.getPublisher() %></td>
               </tr>
            </table>
            <div class="col-sm-12 p-3" style="border: 1px solid black">
               <div class="row">
                  <div class="col-sm-6 p-4">
                      <h1>별점</h1>
                  </div>
                     <div class="col-sm-6 p-4">
                         <h1><%=book.getBookreadcount() %></h1>
                     </div>
                  </div>
            </div>   
            
         </div>
      </div>
           
       </div>
<button>수정</button>
<button>삭제</button>

  
   </div>
</div>





 <!-- The Modal -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title"><%=book.getBooktitle() %></h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body" align="center">
           <img src="https://image.aladin.co.kr/product/26809/94/cover500/k572730190_1.jpg" style="height: 600px">
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary btn-block" data-dismiss="modal">닫기</button>
        </div>
        
      </div>
    </div>
  </div>


</body>
</html>