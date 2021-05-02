<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String param = request.getParameter("param");
	String message = request.getParameter("message");
	
	int clubseq = 0;
	if(param.equals("cardadd")){
		clubseq = Integer.parseInt( request.getParameter("clubseq") ); // 카드추가를 위함
		System.out.println("clubseq = " + clubseq);
	}
	
	int membernum = 0;
	if(param.equals("scheduldelete")){
		membernum = Integer.parseInt( request.getParameter("membernum")); // 스케줄 삭제에서 리스트로 돌아기기 위함
		System.out.println("membernum = " + membernum);
	}
	
	System.out.println("param = " + param);
	System.out.println("message = " + message);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 클럽추가성공 -->
<%
if(param.equals("addclub")){
	%>
		<%if(message.equals("true")){ %>
			<script type="text/javascript">
			alert("클럽을 추가하였습니다.");
			location.href = "club?param=clublist"
			</script>
	<%
		}else{
			%>
			<script type="text/javascript">
			alert("클럽 추가에 실패하였습니다.");
			location.href = "club?param=clublist"
			</script>
			<%
		}
}
%>

<!-- 클럽 가입 성공 -->
<%
if(param.equals("joinclub")){
	%>
		<%if(message.equals("true")){ %>
			<script type="text/javascript">
			alert("클럽에 가입되었습니다.");
			location.href = "club?param=clublist"
			</script>
	<%
		}else{
			%>
			<script type="text/javascript">
			alert("클럽가입에 실패하였습니다.");
			location.href = "club?param=clublist"
			</script>
			<%
		}
}
%>

<!-- 카드 추가 성공 -->

<%
if(param.equals("cardadd")){
	%>
		<%if(message.equals("true")){ %>
			<script type="text/javascript">
			alert("카드가 추가되었습니다.");
			location.href = "club?param=getclubdetail&clubseq=<%=clubseq %>";
			</script>
	<%
		}else{
			%>
			<script type="text/javascript">
			alert("카드 추가에 실패했습니다.");
			location.href = "club?param=getclubdetail&clubseq=<%=clubseq %>";
			</script>
			<%
		}
}
%> 

<!-- 일정삭제 성공 -->
<%
if(param.equals("scheduldelete")){
	%>
		<%if(message.equals("true")){ %>
			<script type="text/javascript">
			alert("일정이 삭제되었습니다.");
			location.href = "schedule?param=calendarlist&membernum=<%=membernum %>";
			</script>
	<%
		}else{
			%>
			<script type="text/javascript">
			alert("일정 삭제에 실패하였습니다.");
			location.href = "schedule?param=calendarlist&membernum=<%=membernum %>";
			</script>
			<%
		}
}
%> 


</body>
</html>