<%@page import="club.ClubDto"%>
<%@page import="db.DBConnection"%>
<%@page import="login.MemberDto"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%request.setCharacterEncoding("utf-8");
MemberDto mem = (MemberDto)request.getSession().getAttribute("userId");

List<ClubDto> clublist = (List)request.getAttribute("clublist");
System.out.println("clublist = " + clublist );
Integer listRow = (Integer)request.getAttribute("listRow");
String cmPage1 = (String)request.getAttribute("cmPage");
String pageNumber1 = (String)request.getAttribute("pageNumber");
String search = (String)request.getAttribute("search");
System.out.println("search = " + search );
int cmPage = Integer.parseInt(cmPage1);
int pageNumber = Integer.parseInt(pageNumber1);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/animate.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="css/all.css" rel="stylesheet">

<title>클럽 메인화면</title>
<style type="text/css">

*{ margin: 0; padding: 0;}
/* 
.btn{
    background-color: #ab906e;
    color: white;
}
.btn:hover{
    background-color: #4b4b49;
    color: white;
} */
.table{
	width: 100%;
	border-spacing: 0;
}
.table col{
	width: 25%;
}
/* #_search{
    border-top-right-radius: 0;
    border-bottom-right-radius: 0;
} */
.clubwrap{
    opacity: 0;
    position: relative;
    height: 100%;
    animation: fadeInUp 1s both;
    margin-top: 20px;
}
.clubimg{
    position: relative;
	overflow: hidden;
	height: 150px;
    width: 150px;
    box-shadow: 0px 10px 30px 5px rgb(0 0 0 / 15%);
}
.clubimg img{
	position: absolute;
	width: 99%;
	top: 50%;
	left: 50%;
    transform: translate(-50%, -50%);
    box-shadow: 0px 10px 30px 5px rgb(0 0 0 / 15%);
}
.clubback{
	position: absolute;
	height: 100%;
    width: 150px;
	top: 100%; left: 0;
	padding: 40px 20px 20px 30px;
	font-size: 14px;
    z-index: 20;
    color: #696969;
    background-color: rgba(255, 255, 255, 0.75);
    opacity: 0;
  	visibility: hidden;
    transition: all 1s;
}
.clubwrap:hover .clubback{
  opacity: 1;
  visibility: visible;
  transform: translate(0%, -100%);
  transition: all 1s;
}
.row-shlef{
    position: relative;
    margin-bottom: -22px;
    z-index: 2;
}
.shelf-back{
	background-image: url("./img/shelf.png");
	background-repeat: no-repeat;
	background-position: bottom;
	background-size: 100%;
}
.table{
	border-style: hidden; 
}
.table td{
	padding-bottom: 23px;
	margin-top: 50px;
}

.Sheader{
   margin-bottom: 40px;
   height:80px;
   border-left: 4px solid #e8974c;
   padding-left: 10px;
   margin-bottom: 50px;
}
.Sheader  a{ text-decoration: none;}
.Sheader a h2{
   color: #4b4b49;   
   font-size: 20pt;
   font-weight: 700;
}
.Sheader p{
   margin-top:5px;
   color: #4b4b49;   
   font-size: 11pt;
   font-weight: 400;
   font-style: italic;
}
.btn-page{
  background-color: #e8d3c1;
  color: #f1edea;
  border: 1px solid #f1edea;
  border-radius:10%;
  padding-top: 3px;
}
.btn-page:hover,.btn-page:active,.btn-page:focus{
  background-color: #f1edea;
  border-color: #f1edea;
  color:#4b4b49;
  outline: none;
}
.form-control:focus,.btn:active{border-color: #ab906e;}
.btn-search{
  background: #f2f2f2;
  color:  #e9974d;
  border-top-left-radius: 0;
  border-bottom-left-radius: 0;
  position: relative;
  margin-left: -1px;
}
.btn-search:hover{
  background: #e9974d;
  color: #f2f2f2;
}
input.search{
  border-radius: 0;
  width: 100%;
  color: #666;
  border: 1px solid #E8E8E8;
}
.input-group input.search:focus{
  outline: 0.5 #e9974d;
}
.form-control{
  border-top-right-radius: 0;
  border-bottom-right-radius: 0;
  border: 1px solid #E8E8E8;
}
.btn:focus, .btn:active, 
.btn-search:focus, .btn-search:active, 
.form-control:focus, .form-control:active,   
textarea:focus, #chat textarea:active{
  outline: 0;
  box-shadow: none;
  border-style: none;
}
</style>
</head>
<body>

<script type="text/javascript">
$(document).ready(function() {
	let search = "<%=search %>";
	if(search == "") return;
	$("#_search").val(search);
});
</script>

<header style="height: 4em;">
</header>

<main>


<div class="container my-5 px-4 py-0 Sheader" style="border-left: solid #e9974d 4px;">
    <a href="club?param=booklist"><h3>책 토론모임</h3></a>
    <p>사람들과 책에 대해 토론 할 수 있습니다.</p>
</div>


<div class="container mt-5">
<div class="row">
<div class="col-9 px-5">
	<table class="table" >
	<col><col><col><col>
	<tr><th colspan="4"></th></tr>
	<%if(clublist == null || clublist.size() == 0){%>
	<tr><td colspan="4">소모임이 없습니다</td></tr>
	<%}else{%>
	<tr class="shelf-back">
	<%for(int i=0; i<clublist.size(); i++){
		ClubDto dto = clublist.get(i);%>
		<td>
			
			<%-- <span id="userid"><%=dto.getClubtitle() %></span> --%>
			
			<div class="clubwrap">
				<a href="club?param=getclubdetail&clubseq=<%=dto.getClubseq()%>">
			<div class="clubback"><p><%=dto.getClubtitle() %></p></div>
			<div class="clubimg" >
	           		<img src="./clubload/<%=dto.getClubimage() %>" onerror="this.src='./img/club2.png'">
        	</div>
	        	</a>
        	</div>
			
			
		</td>
		<%if( (i+1)%4==0 && i>1 ){%>
		</tr>
		<tr class="shelf-back">
	<%}}}%>

	</table><br>
	
	<div class="btn-toolbar" role="toolbar" aria-label="page" style="justify-content: center;"> <!-- 페이지 번호 -->
	<div class="btn-group" role="group" aria-label="...">
	<%for(int i = 0;i < cmPage; i++){
		if(pageNumber == i){%>
		<button type="button" class="btn btn-page"><%=i+1 %></button>
		<%}else{%>		
		<button type="button" class="btn btn-page" onclick="goPage(<%=i %>)"><%=i+1 %></button>
	<%}}%>
	</div>
	</div>
		
</div>


<div class="col-3 p-0" style="height: 500px">
	<br>
	<div class="row m-0" >
		<label>소모임 검색</label>
		<input class="form-control col-9 m-0" type="text" placeholder="검색" id="_search" name="search" >
		<button class="btn btn-search col-3 m-0" onclick="search();" type="button" ><i class="fa fa-search" aria-hidden="true" style="color: white;"></i></button>
	</div>
	<br><br>
	<button class="btn btn-main col" id="addclub" type="button" data-toggle="modal" data-target="#exampleModal2" style="height: 60px">모임 만들기</button>
</div>
</div>
</div>
</main>



<div class="container">   
   <!-- 모달 테두리 -->
   <div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog"
      aria-labelledby="title-dialog" aria-describedby="desc-txt" aria-hidden="true" >
      <div class="modal-dialog" role="document" >   <!-- 모달 본체 -->
         <div class="modal-content"><!-- 모달 내용 -->
               <h4 class="modal-title mt-5 ml-5" id="exampleModalLabel">소모임 생성</h4><!-- 모달 제목 -->
                  <!-- 모달 본문 -->
                  <div class="modal-body">
                     <form action="clubimg" id="frm" enctype="multipart/form-data" method="post">
                     		<% if(mem!=null){ %>
                     		<input type="hidden" value="<%=mem.getMembernum() %>" name="membernum">
                     		<% } %>
                            <div class="form-group row">
                                <label for="clubtitle" class="col-md-4 col-form-label text-md-right">소모임 제목</label>
                                <div class="col-md-6">
                                    <input type="text" id="clubtitle" class="form-control" name="clubtitle" placeholder="제목" maxlength='10'>
                                </div>
                            </div>
                            
                            <div class="form-group row">
                                <label for="clubtext" class="col-md-4 col-form-label text-md-right">소모임 소개글</label>
                                <div class="col-md-6">
                                	<textarea rows="7" cols="" id="clubtext" class="form-control" name="clubtext" placeholder="소개글" style="resize: none;"></textarea>
                                </div>
                            </div>

                            <div align="center" class="form-group row">
                            <label for="clubtitle" class="col-md-4 col-form-label text-md-right">클럽 사진</label>
                                <input type="file" id="input_img" name="clubImg">
                            </div>

                            <div class="col-md-6 offset-md-4">
	                            <button type="button"  class="btn btn-search" id="writebtn">작성완료</button>
                            </div>
                     </form>
                  </div>

            <div class="modal-footer">
               <button type="button" class="btn btn-search" data-dismiss="modal">닫기</button>
            </div>
            
         </div>
      </div>
   </div>
</div>



<footer>
</footer>



<script type="text/javascript">

function goPage( pageNum ) {
	let search = document.getElementById("_search").value;
	location.href ="club?param=clublist&search=" + search + "&pageNumber=" + pageNum; 
}
function search() {
	let search = document.getElementById("_search").value;
	location.href ="club?param=clublist&search=" + search; 
}
</script>

<script type="text/javascript">
$(document).ready(function() {

	// 작성완료 버튼 클릭시
	$("#addclub").click(function () {
		let mem = "<%=mem %>";
		if(mem=="null"){
			alert("로그인해주세요");
			$("#exampleModal2").on('show.bs.modal', function (e) {
				e.preventDefault();
			});
		}
		
	});
	
	$("#writebtn").click(function () {
		if( $("#clubtitle").val() == ""){ // || $("#_pwd").val() == ""){
			alert("클럽제목을 입력하세요");
			return false;
		}else if ($("#clubtext").val() == ""){
			alert("클럽설명을 입력하세요");
			return false;
		}else {
			$("#frm").submit();	
		}
				
	});

});
</script>

</body>
</html>