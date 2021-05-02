<%@page import="util.UtilEx"%>
<%@page import="schedule.SchedulUtilDto"%>
<%@page import="schedule.ScheduleDto"%>
<%@page import="login.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.GregorianCalendar"%>
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
	location.href = "main.jsp?content=home"; // 다시 login창으로 돌아간다.
	</script>	
	<%
}

mem = (MemberDto)userId;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 부트스트랩 --> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

 
<!-- CSS -->
<link href="css/schedule.css" rel="stylesheet" />
<link href="css/all.css" rel="stylesheet" />

</head>
<body>


<%
	Calendar cal = Calendar.getInstance();
	
	SchedulUtilDto Utildto = (SchedulUtilDto)request.getAttribute("Utildto");
	System.out.println("Utildto = " + Utildto.getP());
	
	List<ScheduleDto> list = (List)request.getAttribute("list");
	System.out.println("list = " + list.toString());
%>

<header style="height: 100px">
</header>

<div class="container">
	<div class="animate__animated animate__fadeIn Sheader" style="height:65px;border-left:4px solid #e8974c;padding-left:25px; margin-bottom: 70px;margin-top:20px;">
	   <h2>일정 관리</h2>
	   <p style="font-style: italic;">한 달 일정을 한 눈에 보여줍니다.</p>
	   <div style="float: right;">
			<img src='./img/calpen.svg' width='40px' height='40px' >일정추가
	  		<img src='./img/calBook.svg' style='height:40px'>start
	   		<img src='./img/calBook_End.svg' style='height:40px'>end
		</div>
	</div>
	<div class="row">
		 <div class="col-sm-9 col-xs-12 pr-4">
				 <div class="tTotal">
				 	<div class="table-header" style="background-image: url('./img/orange1.jpg');">
				 		<%=Utildto.getPp() %>&nbsp;&nbsp;<%=Utildto.getP() %>&nbsp;&nbsp;
				
						<font color="white" style="font-size: 42px"> 
							<%=String.format("%d년&nbsp;&nbsp;%d월", Utildto.getYear(), Utildto.getMonth()) %>
						</font>
						
						<%=Utildto.getN() %>&nbsp;&nbsp;<%=Utildto.getNn() %>
				 		
				 	</div>
				 	
						<table class="table table-border table_cal">	
							<thead> 
								<tr class="table-sm th_cal">
									<th style="color:#4a4a4a">일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>
								</tr>
							</thead>
							<tbody>
								<tr class="tr_cal">
								
										<%
										// 위쪽 빈칸
										for(int i=1; i < Utildto.getDayOfWeek(); i++){
											%>
											<td class="td_blank"></td>
											<%
										}
										// 날짜
								
										for(int i=1; i<=Utildto.getLastday(); i++){
											%>
								
									<td class="td_cal">
										<%=UtilEx.calllist(Utildto.getYear(), Utildto.getMonth(), i) %>&nbsp;&nbsp;<%=UtilEx.showPen(Utildto.getYear(), Utildto.getMonth(), i) %>
			 							<img alt="" src="" style="size: 10"><br>
										<div style="float: left"><%=UtilEx.makeStartTable(Utildto.getYear(), Utildto.getMonth(), i, list) %></div> 
										<div style="float: left"><%=UtilEx.makeEndTable(Utildto.getYear(), Utildto.getMonth(), i, list) %></div>	
									</td>
									
										<%
											if( (i + Utildto.getDayOfWeek()-1) % 7 == 0 && i != Utildto.getLastday()){ // 줄을 바꿔주기 위해 테이블을 새로 생성 && i가 마지막 날짜일때는 개행을 하면 안된다.
												%>
									</tr>
									<tr  class="tr_cal"> 
												<%
											}
										}
										%>
										
										<%-- 밑의 빈칸 --%>		
										<%
								
										for(int i=0; i< 7 - Utildto.getWeekday(); i++){
											%>
												<td  class="td_blank"></td>
											<%
										}
										%>
									</tr>
									
								
						</tbody>
					</table>		
				</div>
			</div>
			
			<!-- 전체 리스트 -->
			 <div class="col-sm-3 col-xs-12" style="height: 640px; padding:0; overflow-y: scroll;box-shadow: 0px 10px 30px 5px rgb(0 0 0 / 15%); "   >
			 	<div style="background-color: #f5f5f5;padding: 15px">				
			 	<%for(int i=1; i<list.size()+1; i++) {
			 		ScheduleDto dto = list.get(i-1);
			 		%>
			 			<span style="font-weight: 700;padding-right: 10px;color:#796050"><%=i %></span>			 						 		
				 		<span style="font-weight: 700;color:#e8974c"> <%=dto.getBooktitle() %></span>
				 		<a  class="delschedule" id="_delschedule" name="delschedule" style="float: right;">
				 			<img src="./img/noun_Delete.svg" style="height:20px;">
				 		</a><br>
				 		<span style="padding-left: 23px;"> <%=dto.getSchstart() %> - <%=dto.getSchend() %></span>
				 		<input type="hidden" value="<%=dto.getScheduleseq() %>" class="scheduleseq" id="_scheduleseq">
				 	
				 		
				 						 		
				 	<%
				 	if(i%2==0){
				 		%>
				 		</div><div style="background-color: #f5f5f5;padding: 15px">
				 		<%
				 	}else{
				 		%>
				 		</div><div style="background-color: white;padding: 15px">	
				 		<%
				 	}
			 	}
			 	%>	
			 	
			 	</div>	 	
			</div>

	</div>
</div>

<script type="text/javascript">
$(document).ready(function() {
	$(".delschedule").click(function() {
		let scheduleseq = $(".scheduleseq").val();
		
		location.href = "schedule?param=scheduldelete&scheduleseq="+scheduleseq+"&membernum="+"<%=mem.getMembernum() %>";
	});
});
</script>

</body>
</html>