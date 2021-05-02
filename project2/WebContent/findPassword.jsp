<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.form-gap {
    padding-top: 70px;
}
</style>
<meta charset="UTF-8">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
﻿<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="css/fonts.css" rel="stylesheet" />

<title>Insert title here</title>
</head>
<body>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<div class="form-gap"></div>
<div class="container">
	<div class="row">
		<!-- <div class="col-md-4 col-md-offset-4"> -->
      <div class="text-center">
        <h3><i class="fa fa-lock fa-4x"></i></h3>
        <h2 class="text-center">비밀번호 찾기</h2>
        <p>가입 시 입력한 정보를 기재해주세요.</p>
         	<div>
             <label>
             <input id="userid" name="userid" placeholder="User ID" size="30">
             </label>
            </div>
            <div>
             <label>
             <input id="email" name="email" placeholder="Email address" size="30">
             </label>
            </div>
            <div>  
             <label>
             <input id="phone" name="phone" placeholder="Phone number" size="30">
             </label>
            </div>
            <input type="button" class="btn btn-lg btn-primary btn-light" onclick="findPwd()" value="비밀번호 찾기">
        </div>
    </div>
</div>

<script type="text/javascript">

function findPwd() {
	$.ajax({
		url : 'login?param=findPasswordPro',
		type : 'POST',
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		data : { "userid":$("#userid").val() 
					, "email" : $("#email").val()	
					, "phone" : $("#phone").val()	
					},
		success : function (data) {
			console.log(data)
			if(data.pwd){
				alert("검색된 비밀번호 : "+data.pwd)
			}else{
				alert("해당 정보로는 비밀번호를 찾을 수 없습니다.")
				
			}
		},
		
		error:function() {
			alert('error');
		}
	});
};


</script>
</body>
</html>