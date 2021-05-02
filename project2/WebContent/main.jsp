<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String content = request.getParameter("content");
if(content==null){content = "home";}%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/main.css">
<title>BAVABOOK 홈페이지</title>
</head>
<body>

<header style="height: 60px;">
	<jsp:include page="navibar.jsp" flush="false"/>
</header>

<main>
	<jsp:include page='<%=content + ".jsp" %>' flush="false"/>
</main>

<footer>
	<jsp:include page="footer.jsp" flush="false"/>
</footer>

<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>
<script type="text/javascript">
function account() {   
   location.href = "login?param=register";
};

var user_id = $.cookie("user_id");
if(user_id != null){   // 저장된 id가 있음
   $("#userid").val( user_id );
   $("#chk_save_id").prop("checked", true);
}

$("#chk_save_id").click(function() {
   if( $("#chk_save_id").is(":checked") ){
      if( $("#userid").val().trim() == "" ){
         alert('id를 입력해 주세요');
         $("#chk_save_id").prop("checked", false);         
      }else{
         // 쿠키를 저장
         $.cookie("user_id", $("#userid").val().trim(), { expires:7, path:'./'});
      }
   }
   else{
      $.removeCookie("user_id", { path:'./' });
   }
}); 
</script>

</body>
</html>