<%@page import="login.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/all.css" rel="stylesheet">
<link href="css/styles1.css" rel="stylesheet">
<style type="text/css">
	*,h1,h2,h3,h4,h5,h6,p{font-family:Noto Serif KR;}
	.Ubuntu{font-family:Ubuntu ital;}
	.Fugaz{font-family:Fugaz One, cursive;}
</style>
</head>
<body>
<%
MemberDto userId = (MemberDto)session.getAttribute("userId");
String error = (String)request.getAttribute("error");
%>   
<%   if(userId !=null){
   System.out.println("session userId : " + userId.getUserid() + userId.getAuth());
   }else {System.out.println("Id:null "); }%>
<%
if (error != null){
if (error.equals("1")) {%>
<script type="text/javascript">
alert("정보를 정확히 입력해주세요.");
</script>
<%}}%>

<!-- service -->
<% String contents = request.getParameter("content");
if(contents==null){contents = "home";}%>
<nav class="navbar navbar-shrink navbar-expand-lg fixed-top" id="mainNav">
          <div class="container">

              <a class="navbar-brand js-scroll-trigger"  href="#page-top">BAVABOOK</a>
              <!-- 화면줄였을때 버튼 -->
              <button class="navbar-toggler navbar-toggler-right" type="button"
                      data-toggle="collapse" data-target="#navbarResponsive" 
                      aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                      menu
                  <i class="fas fa-bars ml-1"></i>
              </button>

              <div class="collapse navbar-collapse" id="navbarResponsive">
                  <ul class="navbar-nav text-uppercase ml-auto"> <!-- fc1은 글색깔 변경 클래스 -->
                  <%if(contents.equals("home")){ %>
                      <li class="nav-item"><a class="nav-link js-scroll-trigger fc1" href="#services">Services</a></li>
                  <%} %>
                      <li class="nav-item"><a class="nav-link js-scroll-trigger fc1" href="main?param=mainscreen">처음으로</a></li>
                      <li class="nav-item"><a class="nav-link js-scroll-trigger fc1" href="book?param=booklist">책추천받기</a></li>
                      <li class="nav-item"><a class="nav-link js-scroll-trigger fc1" href="club?param=clublist">소통하기</a></li>
                      
                      <%if(userId != null && userId.getAuth()==0){%>
               <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle js-scroll-trigger fc1" href="main.jsp?content=login" id="navbardrop"
                     data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><%=userId.getUserid()%>님</a>
                     <div class="dropdown-menu dropdown-menu-right"  aria-labelledby="navbardrop"  >
                       <a class="dropdown-item" href="book?param=masterPage">관리자페이지로 가기</a>
                       <a class="dropdown-item" href="login?param=logoutPro">로그아웃</a>
                     </div>
               </li>
               
               <%}else if(userId != null && !userId.equals("")){%>
               <li class="nav-item dropdown">
                  <a class="nav-link dropdown-toggle js-scroll-trigger fc1" href="main.jsp?content=login" id="navbardrop"
                     data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><%=userId.getUserid()%>님</a>
                     <div class="dropdown-menu dropdown-menu-right"  aria-labelledby="navbardrop"  >
                       <a class="dropdown-item" href="mypage?param=getmypagelist&membernum=<%=userId.getMembernum() %>">내 서재로 가기</a>
                       <a class="dropdown-item" href="schedule?param=calendarlist&membernum=<%=userId.getMembernum() %>">일정관리</a>
                       <a class="dropdown-item" href="login?param=logoutPro">로그아웃</a>
                     </div>
               </li>
                      
                      <%}else{%>
               <li class="nav-item">
                  <a class="nav-link js-scroll-trigger fc1" href="club?param=clublist" data-toggle="modal" data-target="#exampleModal">로그인</a>
               </li>
               <!-- <li class="nav-item"><a class="nav-link js-scroll-trigger fc1" href="club?param=clublist">로그인</a></li> -->
               <%}%>  
                      
                      
                  </ul>
              </div>
          </div>
      </nav>


<div class="container">   
   <!-- 모달 테두리 -->
   <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
      aria-labelledby="title-dialog" aria-describedby="desc-txt" aria-hidden="true">
      <!-- 모달 본체 -->
      <div class="modal-dialog modal-sm" role="document">
         <!-- 모달 내용 -->
         <div class="modal-content col-xs-3">
               <!-- 모달 제목 -->
               <h5 class="modal-title" id="exampleModalLabel" style="text-align: center; margin-top: 20px">Login</h5>
                  <!-- 모달 본문 -->
                  <div class="modal-body ">
                     <form action="login?param=loginpro" method="post"  onsubmit="return checkValue()">
                     <div class="col-md-12 mx-auto">
                   <div class="form-group">
                      <label>Your ID</label>
                       <input type="text" id="userid" class="form-control" name="id" placeholder="아이디">
                      </div> <!-- form-group// -->
                        <div class="checkbox" >
                        <label> <input type="checkbox" name="remember" id="chk_save_id"> save ID </label>
                       </div> <!-- checkbox .// -->
                      <div class="form-group">
                      <a class="float-right" href="login?param=findId">Forgot?</a>
                      <label>Your password</label>
                       <input type="password" id="pwd" class="form-control" name="pwd" placeholder="******">
                      </div> <!-- form-group// --> 
                      <div class="form-group"> 
                      </div> <!-- form-group// -->  
                      <div class="form-group">
                       <button type="submit" class="btn btn-search btn-block"> Login  </button><br>
                       <button type="button" class="btn btn-search btn-block" onclick="account()"> Register  </button>
                   </div> <!-- form-group// -->    
                 </div>                                                       
               </form>
                </div>
         </div>
      </div>
   </div>
</div>
<script>


function checkValue(){
	$("#exampleModal").on('shown.bs.modal', function () {
		
	   if($("#userid").val()==""){
	      alert("아이디를 입력하세요")
	      return false;
	   }
	   if($("#pwd").val() == ""){
	      alert("비밀번호를 입력하세요")
	      return false;
	   }
	   
	});
}

</script>
</body>
</html>