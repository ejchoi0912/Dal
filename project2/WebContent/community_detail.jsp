<%@page import="book.BookDto"%>
<%@page import="club.ClubDto"%>
<%@page import="club.CardDto"%>
<%@page import="login.LoginDao"%>
<%@page import="login.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%	
	System.out.println("community_detail");
	MemberDto user = (MemberDto)session.getAttribute("userId");
	List<MemberDto> memlist = (List<MemberDto>)request.getAttribute("memlist");
	List<CardDto> cardlist = (List<CardDto>)request.getAttribute("cardlist");
	
	boolean isMember, isMaster;
	isMember = (boolean)request.getAttribute("isMember");
	isMaster = (boolean)request.getAttribute("isMaster");
	System.out.println("isMember = " + isMember + "isMaster = " + isMaster);
	
	int size=0;	if(memlist!=null)size = memlist.size();
	boolean loopout = false;
	ClubDto club = (ClubDto)request.getAttribute("club");
	int clubseq = (Integer)request.getAttribute("clubseq");
	%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="css/all.css" rel="stylesheet">
	
<title>소모임 상세화면</title>
<style type="text/css">
*{ margin: 0; padding: 0;}

.clubintro{
	padding-top: 10px;
	border: solid black 1px;
	border-radius: 20px;
}
input:focus,
.clubintrotext{
	border: none;
	background-color: none;
	outline: none;
}
.clubimg{
	position: relative;
    overflow: hidden;
	margin: 20px auto;
	height: 360px;
	width: 240px;
}
.clubimg>img{
    position: absolute;
    width: 100%;
	top: 50%;
	left: 50%;
    transform: translate(-50%, -50%);
}
.userpic{
    position: relative;
    overflow: hidden;
    border-radius: 50%;
    height: 50px; width:50px;
    margin: 20px 0 0 20px;
    
}
.userpic>img{
    position: absolute;
    /* width: 100%; */
    height: 100%;
	top: 50%;
	left: 50%;
    transform: translate(-50%, -50%);
}
.card-wrap{
	margin:20px;
    height: 200px;
    width: 140px;
    padding: 0;
	transform-style: preserve-3d;
	transition: all 1s;
}
.card-front{
	position: absolute;
    overflow: hidden;
    height: 200px;
    width: 133px;
    /* transform: rotateY(0deg); */
    backface-visibility: hidden;
    z-index: 2;
}
.card-front img{
	position: absolute;
    height: 100%;
	top: 50%; left: 50%;
    transform: translate(-50%, -50%);
}
.card-back{
	position: absolute;
	height: 200px;
	width: 133px;
	top: 100%; left: 0;
	padding: 20px;
    z-index: 10;
    color: #696969;
    background-color: rgba(255, 255, 255, 0.85);
    opacity: 0;
  	visibility: hidden;
    /* transition: all 1s; */
    /* transform: rotateY(0deg);
    top: 50%; left: 50%;
    transform: translate(-50%, -50%); */
}
.card-wrap:hover .card-back{
	/* transform: rotateY(-180deg); */
	opacity: 1;
 	visibility: visible;
  	transform: translate(0%, -100%);
  	transition: all 1s;
}


input,textarea{background-color:transparent;}

#joinclub img,#updateclub img{height: 150px; bottom: 12px; position: relative;}
#addcard img{height: 120px; top: -22px; position: relative;}
#updateclub{cursor: pointer;}
.btn-wrap{
	margin-right: 10px;
	position: relative;
}
.arrow_box{
	display: none;
	position: absolute;
	/* width: 100px; 
	height: 30px ; */
	top: -34%; left: 10.5%;
	padding: 2px 8px;
	border-radius: 3px;
	background: #e8d3c1;
	color: #333;
	text-align: center;
}

.btn-wrap a:hover+.arrow_box{
  display: block;
}
.btn-wrap img:hover+.arrow_box1{
  display: block;
}
</style>
</head>
<body>

<header style="height: 6em;">
</header>

<main>


<div class="container-fluid mb-5" style= "height: ; background-color: #f5f5f5;">
    <div class="container">
        <div class="row">

            <div class="col-sm-9" style="height: 400px;">

                <div class="row">

                    <div class="col-sm-4" >
                        
                        <div class="col p-0" >
                            <div class="clubimg" style="box-shadow: 0px 10px 20px 3px rgb(0 0 0 / 15%)">
                                <img src="./clubload/<%=club.getClubimage()%>" alt="" onerror="this.src='./img/club1.png'">
                            </div>
                        </div>

                    </div> 
        
                    <div class="col-sm-8 py-3" >
                    
                        <form class="" action="club?param=updateClub" method="post">
                        <div class="col pt-3" style="height: 60px; "> <h3><%=club.getClubtitle()%></h3>
                             <input type="hidden" name="clubtitle" value="<%=club.getClubtitle()%>">
                             <input id="clubseq" type="hidden" name="clubseq" value="<%=clubseq %>">
                        </div>

                        <div class="col p-2" style="height: 230px; ">
                            <table class="table" style="min-width: 100px; height: 200px;">
                                <col width="140px">
                                <tr><td>소모임장</td><td><input class="clubintrotext" type="text" name="userid" readonly="readonly" value="<%=club.getUserid()%>"></td></tr>
                                <tr><td>소모임창설일</td><td><input class="clubintrotext" type="text" name="clubdate" readonly="readonly" value="<%=club.getClubdate()%>"></td></tr>
                                <tr class="update" height="0px"><td>우리 모임 소개</td><td>
                                <textarea class="clubintrotext" rows="" cols="" name="clubtext" id="clubtext" readonly="readonly" style="resize: none;"><%=club.getClubtext()%></textarea>
                                </td></tr>			
                            </table>
                        </div> <!-- 테이블 끝 -->
						
                        
	                    <div class="col">
	
							<div class="row mt-2" id="btns" style=" height: 80px;  width: 100%; display: flex; justify-content: flex-end; ">
								
								<div class="btn-wrap" id="joinclub" >
								<a href="#"><img src="./img/clubRegi_e8d3c1.svg"  onmouseover="this.src='./img/clubRegi_e8974c.svg'" onmouseout="this.src='./img/clubRegi_e8d3c1.svg'"></a>
								<p class="arrow_box">가입하기</p>
								</div>
								
								<div class="btn-wrap" id="updateclub">
								<img src="./img/clubUpdate_e8d3c1.svg" onmouseover="this.src='./img/clubUpdate_e8974c.svg'" onmouseout="this.src='./img/clubUpdate_e8d3c1.svg'">
								<p class="arrow_box arrow_box1">수정하기</p>
								</div>
								
								<div class="btn-wrap" id="addcard">
								<a href="#" ><img src="./img/addCard_e8d3c1.svg" onmouseover="this.src='./img/addCard_e8974c.svg'" onmouseout="this.src='./img/addCard_e8d3c1.svg'"></a>
	                            <p class="arrow_box">카드추가</p>
								</div>
								
								<input id="isMem" type="hidden" value="<%=isMember %>">
								<input id="isMst" type="hidden" value="<%=isMaster %>">
								
								<% if(user!=null){ %>
								<input id="membernum" type="hidden" value="<%=user.getMembernum() %>">
								<% } %>
								
	                        </div>
						</div> <!-- 단추모음 -->

						</form>
                    </div>

                </div> <!-- 두번째줄(사진 테이블) -->
            </div> <!-- 왼쪽 큰상자 -->


            <div class="col-sm-3 p-1 pt-2" style="height: 400px;">
				<div style="box-shadow: 0px 10px 20px 3px rgb(0 0 0 / 15%);">
                <div class="col py-4 text-center" style="height: 80px; ">
                    <h3>참여유저수 :  <span id="clublinkcount"><%=size%>명</span></h3>
                </div>
                
                <div class="container p-0" style="height: 300px; overflow-y:scroll ">

					<%if(size>0){ %>
					<%for(int i=0; i<size; i++){
						MemberDto dto = memlist.get(i);%>
						<div class="text-center p-0" style="height: 70px;">
	                        <div class="userpic" style="float:left"><img src="<%=request.getContextPath()+"/upload/"+dto.getUserimage()%>" alt="" onerror="this.src='./img/user_80px.jpg'"></div>
	                        <span id="userid" style="float: left; margin:35px 0 0 15px"><%=dto.getUserid()%></span>
	                    </div>
						
						<%if(i>10){%>
							<div class="text-center pt-4">
							<i class="fa fa-ellipsis-h fa-3x" aria-hidden="true"></i>
							</div>
							<%loopout = true;}%>
						<%if(loopout) break;%>
					<%}}%>
				</div> <!-- 유저이미지 -->

              </div> <!-- 오른쪽 큰상자 -->
              </div>
          </div> <!-- 전체 큰 row -->
     </div> <!-- 전체 큰 상자 -->
</div> <!-- 위에 fluid 상자 -->

<br><br>

<div class="container" style="height: 350px">
	<div class="row">
		
		<div class="col-sm-12 pl-5 " style="height: 100%;" >
		
			<div class="maincarousel" > <!-- 메인케로셀 -->
			      <div id="carouselSample" class="carousel slide" data-ride="carousel">
			      
			      <div class="carousel-inner">

					<%if(cardlist.size()<1){ %>
					
					<div class="carousel-item active">
			            <div class="imgh mx-auto"><h4>토론방이 없습니다.</h4><h4>카드를 생성하여 토론을 시작하세요.</h4></div>
			         </div>
					
					
					<%}else{%>
					<div class="carousel-item active">
					<div class="row imgh " style="margin-left: 26%">
					<%for(int i=0; i<cardlist.size(); i++){
						CardDto dto = cardlist.get(i);%>
							<a href="club?param=talklist&cardseq=<%=dto.getCardseq()%>" class="cardclick">
								<div class="card-wrap ">
									<div class="card-front">
								        <img src="./upload/<%=dto.getBookimg() %>" alt="" onerror="this.src='./img/noneBook1.png'">
								    </div>
								    
								    <div class="card-back">
								        <div class="card-info"><h4><%=dto.getCardtitle()%></h4><p><%=dto.getCardtext()%></p></div>
								    </div>
							    </div>
							</a>
				
						<%if((i+1)%3==0&&i>1){%>  
						</div>
						</div>
						<div class="carousel-item" >
						<div class="row imgh" style="margin-left: 26%">
						<%}%>
					
					<%}%>
					</div>
					</div>
					<%}%>

			      </div>
			      
			      <!-- controller 부분 -->
			      <%if(cardlist.size()>1){ %>
			      
			      <a class="carousel-control-prev" href="#carouselSample" role="button" data-slide="prev" style="color: black">
			         <span class="fa fa-chevron-left fa-3x" aria-hidden="true"></span>
			      </a>
			      <a class="carousel-control-next" href="#carouselSample" role="button" data-slide="next" style="color: black">
			         <span class="fa fa-chevron-right fa-3x" aria-hidden="true"></span>
			      </a>
			      
			      <%}%>
			      
			       </div>
			   </div>
			
			
		</div>

	
	
	
	
	
	</div>
</div>
	

</main>


<footer>
</footer>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	let b = false;
	
	if($("#isMem").val()=="true"){
		$("#joinclub").hide();
		
	}else if($("#isMst").val()=="true"){
		$("#joinclub").hide();
		
	}else{
		$('.cardclick').click(function(e) { alert("가입 후 입장이 가능합니다."); e.preventDefault(); });
		$("#joinclub").show();
	}
	
	if($("#isMst").val()=="true"){
		$("#addcard").show();
		$("#updateclub").show();
	}else{

		$("#addcard").hide();
		$("#updateclub").hide();	
		
	}
 	
	$("#joinclub").click(function() {
		let clubseq = $("#clubseq").val();
		let membernum = $("#membernum").val();
		if(membernum==null){ alert("로그인이 필요합니다."); return;}
		else{
			location.href="club?param=joinclub&clubseq=" + clubseq + "&membernum=" + membernum;
		}
	});
	 
	$("#updateclub").click(function() {
		if(b==false){
			$(".arrow_box1").text("수정완료");
			$("#clubtext").removeAttr("readonly");
			$(".update").css("background-color","#f1edea");
			b=true;
		}else{
			/* $(".arrow_box1").text("수정하기");
			$("#clubtext").attr("readonly",true);
			$(".update").css("background-color",""); */
			b=false;
			alert("수정완료")
			$("form").submit();
		}
	});
	
	$("#addcard").click(function() {
		let clubseq = $("#clubseq").val();
		location.href="club?param=cardadd&clubseq=" + clubseq;
	});
});

</script>



</body>
</html>