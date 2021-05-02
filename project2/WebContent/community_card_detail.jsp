<%@page import="login.MemberDto"%>
<%@page import="club.CardDto"%>
<%@page import="club.TalkDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
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
    
    
    
    
<%	//로그인 정보가져오기 
	
	List<TalkDto> talklist = (List<TalkDto>)request.getAttribute("talklist");
	CardDto card = (CardDto)request.getAttribute("card");
	int cardseq = (Integer)request.getAttribute("cardseq");%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link href="css/all.css" rel="stylesheet">
<title>카드화면</title>
<style type="text/css">
*{ margin: 0; padding: 0; color: #696969;}

.cardimg{
	margin: 0 auto 50px auto;
    position: relative;
    overflow: hidden;
    background-color: #f1edea; 
    height: 270px; 
    width: 180px;
    box-shadow: 2px 2px 6px 1px #4b4b49;
}
.cardimg img{
 	position: absolute;
    height: 100%;
	top: 50%;
	left: 50%;
    transform: translate(-50%, -50%);
}
.centerline{
    border-right: dotted #e1e1e1 1px;
}
.chatbox{
    height: 750px; 
	margin-bottom: 20px;
    padding: 0;
    padding-bottom: 100px; /* 85 */
}
.chatcontent{
    background-color: /* #f1edea; */ ;
    height: 100%; width: 100%; 
    overflow-y: scroll;
    padding: 0;
}
.userpic{
    position: relative;
    overflow: hidden;
    border-radius: 50%;
    /* border: solid #ab906e 1px; */
    height: 50px; width: 50px;
    margin: 20px; margin-bottom: 5px;
    /* box-shadow: 3px 3px 5px 1px #ab896e; */
}
.userpic>img{
    position: absolute;
    width: 100%;
	top: 50%;
	left: 50%;
    transform: translate(-50%, -50%);
}
.talk{
    margin: 0;
    line-height: 100%;
}
.talkbox{
	line-height:20px;
	color: #696969;
    position: relative;
    border: solid #e1e1e1 1px;
    margin: 30px 6px 20px 20px;
    padding: 10px 10px 10px 12px;
    border-radius: 4px;
    max-width: 600px;
    /* box-shadow: 3px 3px 5px 1px #ab896e; */
}
.talkbox:after {
    content: "";
    width: 15px;
    height: 15px;
    background: white;
    border-top: solid #e1e1e1 1px;
    border-left: solid #e1e1e1 1px;
    position: absolute;
    top: 13px;
    left: -8.5px;
    transform: skewX(45deg);
}
.input-group{
    position: absolute;
    bottom: 0;
}
.input-group textarea{
    resize: none;
    border-top-right-radius: 0; 
    border-bottom-right-radius: 0;
}
.input-group .btn{ height: 85px;}

.btn:focus, .btn:active,
#chat .form-control:focus, #chat .form-control:active{
  outline: 0;
  box-shadow: 0 0 0 0 rgb(0 0 0 / 0%);
  border-color: #e1e1e1;
}
.btn, .btn .fab{
  background: #e9974d;
  color: white;
  border-top-left-radius: 0;
  border-bottom-left-radius: 0;
}
.btn:hover,
.btn-main:hover,
.btn:hover .fab{
  background: #f2f2f2;
  color: #696969;
}

</style>

</head>
<body>


<header style="height: 6em;">
</header>

<main>
<div class="container mt-3">
<div class="row">
<div class="col-sm-3 pt-4 centerline" >

    <div style="background-color:#f5f5f5; box-shadow: 0px 10px 20px 3px rgb(0 0 0 / 15%); padding-top: 20px; height: 100%;">

        <div class="container cardimg">
            <img src="./upload/<%=card.getBookimg() %>" alt="" onerror="this.src='./img/noneBook1.png'">
            <% System.out.println(card.getBookimg()); %>
        </div>

        <div class="col ml-4">
            <h4>토론주제 : <%=card.getCardtitle() %></h4>
            <h5>모임제목 : <%=card.getCardtitle() %></h5>
            <br>
        </div>

    </div>
    
</div>


<div class="col-sm-9 pt-4" id="chat">

	<div class="col chatbox" style="background-color: white;">
	    <div class="col chatcontent">
	    
	    <% for(TalkDto dto : talklist){ %>
	    	<div class="row talk align-self-end">
		    	<div align="center">
		        	<div class="userpic"><img src="./upload/<%=mem.getUserimage()  %>" alt="" onerror="this.src='./img/user_80px.jpg'"></div>
		        	<span id="userid"><%=dto.getUserid()%></span>
		        </div>
	        	<p class="talkbox"><%=dto.getTalkcontent()%></p>
	        	<p class="align-self-end" style="font-size: 12px;"><%=dto.getTalkdate() %></p>
	        </div>
	   <% } %>
	    </div>
	    
	    <div class="input-group">
	        <form class="form-inline" action="club?param=talkadd" method="post" style="width: 100%;">
	        <textarea class="form-control col-11" name="talkcontent" id="talkcontent" cols="58" rows="3" placeholder="내용입력"></textarea>
	        <button class="btn col-1" type="button" id="talkbtn"><i class="fab fa-telegram-plane fa-2x" aria-hidden="true" ></i></button>
	        <input type="hidden" name="cardseq" id="cardseq" value="<%=cardseq %>">
	        <input type="hidden" name="membernum" value="<%=mem.getMembernum() %>">
	        <input type="hidden" name="memberid" value="<%=mem.getUserid() %>">
	        </form>
	    </div>
	</div>

</div>

</div> <!-- 로우 끝 -->
</div> <!-- 전체칸 끝 -->
</main>


<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>
<script type="text/javascript"> //스크롤위치저장, 커서자동이동, 10초마다 새로고침
    $(document).ready(function() {
   	
    	//let nowscroll = $(".chatcontent")[0].scrollHeight;스크롤 마지막
    	let nowscroll = $.cookie("nowscroll");
    	$(".chatcontent").scrollTop(nowscroll); //쿠키에서 스크롤 받아와서 셋팅 
    	
	    $('#talkcontent').focus(); // 커서를 입력칸에
	    
	    $(".chatcontent").scroll(function () { //스크롤 변경시 값 받아옴
    		nowscroll = $(".chatcontent").scrollTop(); //변수에 저장
    		$.cookie("nowscroll", nowscroll,{ //쿠키에 저장
  		    		expires:1, path:'./'});
    	});
	    
        $("#talkcontent").keydown(function(key) { //키 입력하면 스크롤 마지막으로
        	if(key.keyCode == 13) {
        		
    	      	let talk = $("#talkcontent").val();
    	      	talk = $.trim(talk); 
    	   		if(talk==""){
    	   		}else{
    	   		
        		
              	nowscroll = $(".chatcontent")[0].scrollHeight;
             	$.cookie("nowscroll", nowscroll,{ //쿠키에 저장
   		    		expires:1, path:'./'});
               	
               	$("form").submit();
               }
    	   		
    	   		
        		}
           });
        
       $("#talkbtn").click(function() {
	      	let talk = $("#talkcontent").val();
	      	talk = $.trim(talk);
	   		if(talk==""){
	   		}else{
	   			$("form").submit();
	   		}
        	   
      		nowscroll = $(".chatcontent")[0].scrollHeight; //키 클릭하면 스크롤 마지막으로
           	$.cookie("nowscroll", nowscroll,{ //쿠키에 저장
	    		expires:1, path:'./'});
           });
           
           let cardseq = $("#cardseq").val();
           setTimeout(function() { 
           location.replace("club?param=talklist&cardseq="+cardseq) },10000);
       });
</script>
	    
	    
<footer>
</footer>

</body>
</html>