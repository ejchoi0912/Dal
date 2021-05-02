<%@page import="book.BookDto"%>
<%@page import="login.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
request.setCharacterEncoding("utf-8");
Object userId = session.getAttribute("userId");
MemberDto mem = null;

if(userId == null){ // 로그인 세션이 없을경우 
	%>
	<script>
	alert('로그인을 해 주십시오');
	location.href = "main.jsp?content=login"; // 다시 login창으로 돌아간다.
	</script>	
	<%
}

mem = (MemberDto)userId;
%>



<%
	// Schedule 부분을 가져오는 부분
	Calendar cal = Calendar.getInstance();

	String syear = (String)request.getAttribute("syear");
	String smonth = (String)request.getAttribute("smonth");
	String sday = (String)request.getAttribute("sday"); 
	String enddate = (String)request.getAttribute("enddate");
	
	cal.set(Calendar.MONTH, Integer.parseInt(smonth)-1); // 파라미터로 얻어온 month로 다시 Calendar클래스에 MONTH를 다시 세팅한다.
	
	List<Integer> date = (List)request.getAttribute("date");
	
	
	System.out.println("book정보 가져오는 부분");
	// 책을 가져옴
	List<BookDto> Booklist = (List)request.getAttribute("Booklist");
	System.out.println("1");
 	//전체 페이지 번호
 	int bookPage = Integer.parseInt((String)request.getAttribute("bookPage"));
 	System.out.println("2");
 	//페이징 번호
 	int pageNumber = Integer.parseInt((String)request.getAttribute("pageNumber"));
 	System.out.println("3");
 	//검색변수
 	String searchTitle = (String)request.getAttribute("searchTitle");
 	String searchText = (String)request.getAttribute("searchText");
 	System.out.println("4");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
   
  
  <!-- css -->
 <link href="css/book.css" rel="stylesheet" />
  
  
   <!-- 애니메이션용 링크 -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
   
   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> 

	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
	
	<!-- font font-family: 'Noto Serif KR', serif; -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700;900&display=swap" rel="stylesheet">
  
	
	
<title>일정 추가</title>
</head>
<body style="font-family: 'Noto Serif KR', serif;">

<div style="height: 4em">
</div>
<div class="container">
	<div class="animate__animated animate__fadeIn Sheader" style="height:65px;border-left:4px solid #e8974c;padding-left:25px; margin-bottom:50px;margin-top:50px;">
	   <h2>일정 추가</h2>
	   <p style="font-style: italic;">자유롭게 일정을 추가하세요.</p>
	</div>


	<div class="row">
	<div class="col-sm-8 col-xs-12">
		<div id="NewBook" class="container tab-pane active"><br>
   	<div class="gtco-container" style="margin-top: -50px;margin-left: -50px">
   	<div class='row gtco-section1 gtco-products'>
			<!-- 책을 가져오는 부분 -->
   	 		<%
   	 			if(Booklist == null || Booklist.size() == 0){
   	 		%>
   	 		<div style="margin-left: 30px;margin-top: 20px">
   	 			<p>검색한 책이 없습니다.</p>
   	 		</div>
   	 		<%
   	 			}else{
   	 				for(int i=0;i<Booklist.size();i++){
   	 					BookDto dto = Booklist.get(i);
   	 				
		 		%>	
		 		<div class="col-sm-3 col-xs-12 service">
	 		 	<a href="#" id="booktitle" onclick="choice('<%=dto.getBooktitle() %>', '<%=dto.getBooknum() %>')"  class="gtco-item two-row bg-img animate__animated animate__fadeInUp">
	 		 		<div class="overlay">
					<div class="copy">
						<h3><%=dto.getBooktitle() %></h3>
						<p><%=dto.getAuthor() %></p>
					</div>
				</div>	
		 		 	<img class="service" src="./upload/<%=dto.getBookimage() %>" style="height: 240px" >
	 			</a>
	 			</div>	
	 			<%		}
	 			}%>	  	
	 		</div>
	</div>		
	</div>		
	
	
	
				<!-- 페이징 버튼 -->
			<div class="btn-toolbar justify-content-center paging" role="toolbar" aria-label="Toolbar with button groups" style="margin-bottom: 30px;">	
				<div class="btn-group mr-2" role="group" aria-label="First group" >
				<%
					for(int i = 0;i<bookPage;i++){
						if(pageNumber == i){	//현재 페이지일  때
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
    	<!-- /////////////////////////////////////////////// -->
    	
	<div class="col-sm-4 col-xs-12" style="background-color:#f5f5f5;height: 500px; box-shadow: 0px 10px 30px 5px rgb(0 0 0 / 15%);">
		
    	
	<!-- //////////////////////////// -->
	<div style="border-bottom: 3px solid #E8D3C1;margin-bottom: 10px;margin-top: 20px">
         <h2 class="animate__animated animate__fadeInRight" style="margin-left: 10px;">ADD BOOK</h2>
      </div>
	<div class="animate__animated animate__fadeInRight" style="height: 500px;width:350px;" align="center">
	<form id="frm" action="schedule" method="">
	<input type="hidden" value="schedulwriteAf" name="param">
	<input type="hidden" value="<%=mem.getMembernum() %>" name="membernum">
	<table class="table table-border">
	<col width="100"><col width="280">
	<tr>
		<th>ID</th>
		<td>
			<%=mem.getUserid() %>
			<input type="hidden" name="id" value="<%=mem.getUserid() %>">
		</td>
	</tr>
	<tr>
		<th>START</th>
		<td>
			<select name="syear" id="syear" >
			<%
				for(int i = date.get(0) - 5;i <= date.get(0) + 5; i++){
					%>
					<option <%=syear.equals(i + "")?"selected='selected'":"" %> value="<%=i %>" > <!-- 파라미터로 넘어온 년도와 같은 것이 selected되게하는 코드 -->
						<%=i %>
					</option>
					<%
				}
			
			%>
			</select>년
			
			<select name="smonth" id="smonth" >
			<%
				for(int i = 1;i <= 12; i++){
					%>
					<option <%=smonth.equals(i + "")?"selected='selected'":"" %> value="<%=i %>"> <!-- 파라미터로 넘어온 년도와 같은 것이 selected되게하는 코드 -->
						<%=i %>
					</option>
					<%
				}
			
			%>
			</select>월
			
			<select name="sday" id="sday">
			<%
				for(int i = 1;i <= cal.getActualMaximum(Calendar.DAY_OF_MONTH); i++){ // cal.getActualMaximum(Calendar.DAY_OF_MONTH) 해당 월에 마지막 일수까지
					%>
					<option <%=sday.equals(i + "")?"selected='selected'":"" %> value="<%=i %>" > <!-- 파라미터로 넘어온 년도와 같은 것이 selected되게하는 코드 -->
						<%=i %>
					</option>
					<%
				}
			
			%>
			</select>일
		<tr>	
		<th>END</th>	
		<td>
			<input class="form-control form-control-sm" type="text" id="enddate" name="enddate" value="<%=enddate %>">			
		</td>
		</tr>	
		
		<tr>	
		<th>선택한 책</th>	
		<td>
			<input class="form-control form-control-sm" type="text" id="choicebook" name="choicebook" value="" readonly="readonly">
			<input type="hidden" id="choicebooknum" name="choicebooknum" value="">		
		</td>
		</tr>
		
		<tr>	
		
		<th>검색</th>	
		<td>
			<div class="input-group mb-3 ">
				<select id="searchTitle" class="form-control form-control-sm">
			    	<option value="title">책제목</option>
					<option value="author">책저자</option>
			  	</select>
			    <input type="text" class="form-control form-control-sm"" id="searchText" value="<%=searchText %>" placeholder="검색">
			    <div class="input-group-append">
			    	<button class= "btn btn-sm" type="button" onclick="searchBook()"><i class="fa fa-search" aria-hidden="true"></i></button>
			     </div>
			</div>
		</td>
		</tr>	
		<tr>
			<td colspan="2">
				<input class= "btn pull-right form-control-sm"" type="button" id="canceladd" value="취소">
				<input class= "btn pull-right form-control-sm"" type="button" id="addschedule" value="일정추가">
			</td>
		</tr>
	</table>
</form>
</div>
	
	
	
    	
	</div>
</div>
</div>

<script type="text/javascript">

function searchBook(){
	let syear = document.getElementById("syear").value;
	let smonth = document.getElementById("smonth").value;
	let sday = document.getElementById("sday").value;
	let enddate = document.getElementById("enddate").value;
	
	let searchTitle = document.getElementById("searchTitle").value;
	let searchText = document.getElementById("searchText").value;
	
	location.href = "schedule?param=schedulwrite&syear="+syear+ "&smonth=" +smonth + "&sday="+sday+ "&enddate=" + enddate +
					"&searchTitle="+searchTitle+"&searchText="+searchText;
}

function goPage(pageNumber){
	let syear = document.getElementById("syear").value;
	let smonth = document.getElementById("smonth").value;
	let sday = document.getElementById("sday").value;
	let enddate = document.getElementById("enddate").value;
	
	let searchTitle = document.getElementById("searchTitle").value;
	let searchText = document.getElementById("searchText").value;

	location.href = "schedule?param=schedulwrite&syear="+syear+ "&smonth=" +smonth + "&sday="+sday+ "&enddate=" + enddate +
					"&searchTitle="+searchTitle+"&searchText="+searchText+"&pageNumber="+pageNumber;
}

function choice(booktitle, booknum){
	alert(booknum);
	
	$("#choicebook").val(booktitle);
	$("#choicebooknum").val(booknum);
}

</script>

<script type="text/javascript">
$(document).ready(function() {
	
	let week = ['일', '월', '화', '수', '목', '금', '토'];
	
	$("#enddate").datepicker({
		dateFormat: "yy/mm/dd",
		dayNamesMin: week,
		monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		onSelect: function( d ) {
			let arr = d.split('/');
			
			$("#eyear").val( arr[0].trim() );
			$("#emonth").val( arr[1] );
			$("#eday").val( arr[2] );
			
			let weekday = new Date( $("#enddate").datepicker( { dateFormat:"yy/mm/dd"} ).val() );
			
			$("#eweek").val( week[weekday.getDay()] );
		}
	});
	
	$("#addschedule").click(function() {
		// id와 pw는 조건절을 따로 만들어주는 것이 더 좋다.
		if( $("#date").val() == ""){ // || $("#_pwd").val() == ""){
			alert("끝나는 날짜를 선택해주세요");
			return;
		}else if ($("#choicebook").val() == ""){
			alert("책을 선택해주세요");
			return;
		}
		
		$("#frm").submit();	
				
	});
	
	$("#canceladd").click(function() {
		location.href = "schedule?param=calendarlist&year=<%=syear %>&month=<%=smonth %>&membernum=<%=mem.getMembernum() %>"
	});
	
});

</script>

</body>
</html>