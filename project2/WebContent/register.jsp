<%@page import="login.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //세션에서 아이디 받아옴(로그인 안하면 null)
String id = null;
int auth = 3;
MemberDto login_Dto = null;
if(session.getAttribute("login_Dto") != null){
   login_Dto = (MemberDto)session.getAttribute("login_Dto");
   id = login_Dto.getUserid();
   auth = login_Dto.getAuth();
}
//getAttribute 로 error 받기 (회원가입 실패)
String error = (String)request.getAttribute("error");
%> 

<%
if (error == "1") {%>
<script>
alert("정보를 정확히 입력해주세요.");
</script>
<%}%>    


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
 
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
 
 
 <link rel="stylesheet" href="./css/register.css">
        
</head>
<body>

  <div class="regiform">
       <form action="loginimg" method="post" name="userInfo" enctype="multipart/form-data" onsubmit="return checkValue()">

    <!-- header -->
    <div id="header">
        <a href="" target="_blank"><img src="./img/ab8962_logo.png" id="logo"></a>
    </div>


    <!-- wrapper -->
    < <div id="wrapper">
            <!-- content-->
            <div id="content">
               <!-- 이미지 업로드 -->
            
                <div>
                   <div>
		               <h3 class="join_title"><label>이미지 업로드</label></h3>
	                   <input type="file" class="filebtnR" id="input_img" name="memberImg">
	                   <h3 class="join_title">
                		  	 <label>이미지 미리보기</label>
            		    </h3>
                      <div class="img_wrap">
                          <img id="img" />
                          	
               	   	  </div>
                  </div>
               </div>
            

				
            <!-- ID -->
            <div>
                <h3 class="join_title">
                    <label for="userid">아이디</label>
                </h3>
                <span class="box int_btn"">
                    <input type="text" id="userid" name="userid" class="int" maxlength="20" >
                    <!-- 중복체크 버튼 -->
                 </span>
                 <span>
                    <input type="button" class="btnR" id="btn" value="중복체크" onclick="idcheck()">
                </span>
              <!--   <span class="error_next_box"></span> -->
            </div>

            <!-- PW1 -->
            <div class="form-group">
                    <h3 class="join_title"><label for="pwd">비밀번호</label></h3>
                    <span class="box int_pass">
                        <input type="password"name="pwd" id="pwd" class="int" maxlength="20">
                        
                    </span>
                </div>


            <!-- PW2 -->
            <div class="form-group">
                    <h3 class="join_title"><label for="pwd2">비밀번호 확인</label></h3>
                    <span class="box int_pass_check">
                        <input type="password" name="pwd2" id="pwd2" class="int" maxlength="20">
                    </span>
                </div>

            <!-- BIRTH -->
            <div class="form-group">
                <h3 class="join_title"><label for="yy">생년월일</label></h3>

                <div id="bir_wrap">
                    <!-- BIRTH_YY -->
                    <div id="bir_yy">
                  	  <span class="box">
                               <select type="text" id="yy" name="yy" class="int" >
                               <%for(int i=1970;i<2022;i++) { %>
                                  <option value="<%=i%>"><%=i %></option>
                               <%} %>   
                               </select>
                        </span>
                    </div>

                    <!-- BIRTH_MM -->
                    <div id="bir_mm">
                            <span class="box">
                                   <select type="text"  name="mm" id="mm"  class="int" onchange="checkDay(this)">
                               <%for(int i=1;i<13;i++) { %>
                                  <option value="<%=i%>"><%=i %></option>
                               <%} %>   
                               </select>
                            </span>
                       </div>

                    <!-- BIRTH_DD -->
                    <div id="bir_dd">
                         <span class="box">
                        <select type="text"   id="dd" name="dd" class="int" >
                               <%for(int i=1;i<32;i++) { %>
                                  <option value="<%=i%>"><%=i %></option>
                               <%} %>   
                           </select>
                           
                        </span>
                    </div>
            </div>  
            <!-- GENDER -->
            <div>
                <h3 class="join_title"><label for="gender">성별</label></h3>
                <span class="box gender_code">
                    <select name="gender" id="gender" class="sel">
                        <option value="0">성별</option>
                        <option value="1">남자</option>
                        <option value="2">여자</option>
                    </select>                            
                </span>
                <!-- <span class="error_next_box">필수 정보입니다.</span> -->
            </div>

            <!-- EMAIL -->
               <div class="form-group">
                    <h3 class="join_title"><label for="email">이메일</label></h3>
                    <span class="box int_btn">
                        <input type="text" name="email" id="email" class="int" maxlength="100" placeholder="이메일 입력"
                        	onkeyup="this.value=this.value.replace(/[^a-zA-Z-_0-9_@_.]/g,'');">
                     </span>
					<span>
                       <input type="button" class="btnR" id="email_ch" value="중복체크" onclick="emailcheck()">

                    </span>
                </div>

            <!-- MOBILE -->
            <div class="form-group">
                    <h3 class="join_title"><label for="phone">휴대전화</label></h3>
                    <span class="box int_mobile">
                        <input type="text" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" name="phone" id="phone" class="int" maxlength="11" placeholder="전화번호 입력">

                    </span> 
                </div>


            <!-- JOIN BTN-->
              <div class="form-group">
                   <div class="btn_area">
                      <input type="submit" value="가입하기" id="btnJoin">
                   </div>
                </div>
            </div>
       </form>
    </div>

<!-- cookie 아이디저장 -->
<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript" ></script>   

<!-- 회원가입 관련 체크시작 -->
<script type="text/javascript">
function idcheck() {
   $.ajax({
      url : 'login?param=idCheck',
      type : 'POST',
      contentType : "application/x-www-form-urlencoded; charset=utf-8",
      data : { "id":$("#userid").val() },
      success : function (data) {
         //console.log(data);
         //alert('success');
         //alert(data.msg);
         if(data.msg == "YES"){
            alert("사용 가능한 아이디입니다.")
         }else{
            alert("사용 불가능한 아이디입니다.")
         }
      },
      
      error:function() {
         alert('error');
      }
   });
};
function emailcheck() {
   $.ajax({
      url : 'login?param=emailCheck',
      type : 'POST',
      contentType : "application/x-www-form-urlencoded; charset=utf-8",
      data : { "email":$("#email").val() },
      success : function (data) {
         //console.log(data);
         //alert('success');
         //alert(data.msg);
         if(data.msg == "YES"){
            alert("사용 가능한 이메일입니다.")
         }else{
            alert("사용 불가능한 이메일입니다.")
         }
      },
      
      error:function() {
         alert('error');
      }
   });
};
//회원가입 시 로그인 정보
function checkValue() {
   console.log("okok")
   
   //id, pwd 유효성 검사
   var RegExp = /^[a-zA-Z0-9]{4,12}$/;
   //이메일 유효성검사
   var e_RegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
   
   var objId = document.getElementById("userid"); //아이디
   var objPwd = document.getElementById("pwd"); //비밀번호
   var objPwd2 = document.getElementById("pwd2"); //비밀번호확인
   var objEmail = document.getElementById("email");//메일
   
// ================ ID 유효성검사 ================ //
   if(objId.value==''){
      alert('ID를 입력해주세요.');
      return false;
   }
   if(!RegExp.test(objId.value)){
      alert('ID는 4~10자의 영문 대소문자와 숫자로만 입력해주세요.');
      return false;
   }
// ================ PASSWORD 유효성검사 ===============//
   if(objPwd.value==''){ // 비밀번호 입력여부 검사
       alert('Password를 입력해주세요.');
       return false;
   }
   if(!RegExp.test(objPwd.value)){ //패스워드 유효성검사
       alert('Password는 4~12자의 영문 대소문자와 숫자로만 입력하여 주세요.');
       return false;
   }
   if(objPwd.value==objId.value){ //패스워드와 ID가 동일한지 검사
       alert('Password는 ID와 동일하면 안됩니다.');
       return false;
   }
   
   if(objPwd2.value!=objPwd.value){ //비밀번호와 비밀번호확인이 동일한지 검사
       alert('비밀번호가 틀립니다. 다시 확인하여 입력해주세요.');
       return false;
   }
   
   // ================ email 유효성검사 ================ //
   if(e_RegExp.value == ''){ // 이메일 입력여부 검사
       alert('이메일을 입력해주세요.');
       return false;
   }
   
   if(!e_RegExp.test(objEmail.value)){ //이메일 유효성 검사
       alert('올바른 이메일 형식이 아닙니다.');
       return false;
   }
   if($('#input_img').val() == "") {
	      alert("첨부파일은 필수!");
	      return false;
	}
}
</script>
<!-- 회원가입 체크 끝 -->
 <script type="text/javascript">        
var sel_file;
$(document).ready(function() {
    $("#input_img").on("change", handleImgFileSelect);
}); 
function handleImgFileSelect(e) {
    var files = e.target.files;
    var filesArr = Array.prototype.slice.call(files);
    filesArr.forEach(function(f) {
        if(!f.type.match("image.*")) {
            alert("확장자는 이미지 확장자만 가능합니다.");
            return;
        }
        sel_file = f;
        var reader = new FileReader();
        reader.onload = function(e) {
            $("#img").attr("src", e.target.result);
        }
        reader.readAsDataURL(f);
    });
}

function checkDay(send){
	   var day = 0;
	   var html = ""
	   if(send.value % 2 == 1){
	      day = 31;
	   }
	   if(send.value % 2 == 0){
	      day = 30;
	   }
	   if(send.value == 2){
	      day = 28
	   }
	   for(var i=1;i<=day;i++){
	      html += "<option value='"+i+"'>"+i+"</option>"
	   }
	   $("#dd").append(html)
}


</script>

    </body>
</html>