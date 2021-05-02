<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.form-gap {
   margin: 0 auto;
    padding-top: 70px;
    
}



</style>
<meta charset="UTF-8">

<!-- 제이쿼리 -->
 <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>



<!-- 부트스트랩 4 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- css1 -->
<link href="css/fonts.css?ver1" rel="stylesheet" />

<!-- font -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<title>Insert title here</title>
</head>
<body>



<div class="container" id="nav1" style="margin-top: 150px">
      <div class="col-sm-5" style="margin: 0 auto">
   
        <!-- Nav pills -->
        <ul class="nav nav-pills nav-justified" role="tablist">
          <li class="nav-item">
            <a class="nav-link active" data-toggle="pill" href="#id" >아이디 찾기</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="pill" href="#pwd">비밀번호 찾기</a>
          </li>
        </ul>
      
        <!-- Tab panes -->
        <div class="tab-content">
          <div id="id" class="container tab-pane active"><br>
            <div class="Main">
               <div class="MainIn">
                  <img class="imgId" src="./img/id.svg">
                  <h2 style="color:#767676">아이디 찾기</h2>
              </div>
              <div style="text-align: center">
                 <div style="width: 300px;margin: 0 auto;">
                  <p style="text-align: left;margin-bottom: 3px;">가입 시 입력한 정보를 기재해주세요.</p>
                  </div>
                  <label>
                      <input id="email" name="email" placeholder="Email address" size="30">
                   </label>
   
                     <label>
                      <input id="phone" name="phone" placeholder="Phone number" size="30">
                  </label>
              </div>
              <div style="width: 300px;margin: 0 auto">
               <input type="button" class="btn btn-lg btn-search btn-block" onclick="findId()" value="아이디 찾기">
             </div>
          </div>
          </div>
          
          <div id="pwd" class="container tab-pane fade"><br>
            
             <div class="Main">
               <div class="MainIn">
                     <img class="imgId" src="./img/pwd.svg">
                     <h2>비밀번호 찾기</h2>
                  </div>             
           
                 <div style="text-align: center">
                    <div style="width: 300px;margin: 0 auto;">
                        <p style="text-align: left;margin-bottom: 3px;">가입 시 입력한 정보를 기재해주세요.</p>
                     </div>
                       <label>
                         <input id="userid2" name="userid2" placeholder="User ID" size="30">
                      </label>
                      <label>
                         <input id="email2" name="email2" placeholder="Email address" size="30">
                      </label>
                 
                      <label>
                         <input id="phone2" name="phone2" placeholder="Phone number" size="30">
                      </label>
                  <div style="width: 300px;margin: 0 auto">
                     <input type="button" class="btn btn-search btn-lg btn-block" onclick="findPwd()" value="비밀번호 찾기">
                  </div>
              </div>
          </div>
        </div>
      </div>
   </div>
</div>



<script type="text/javascript">

function findId() {
   $.ajax({
      url : 'login?param=findIdPro',
      type : 'POST',
      contentType : "application/x-www-form-urlencoded; charset=utf-8",
      data : { "email":$("#email").val() 
               , "phone" : $("#phone").val()   
               },
      success : function (data) {
         console.log(data)
         if(data.userId ){
            alert("검색된 아이디:"+data.userId)
         }else{
            alert("해당 정보로 검색된 아이디가 없습니다.")
            
         }
      },
      
      error:function() {
         alert('error');
      }
   });
};


//pwd찾기
function findPwd() {
   $.ajax({
      url : 'login?param=findPasswordPro',
      type : 'POST',
      contentType : "application/x-www-form-urlencoded; charset=utf-8",
      data : { "userid":$("#userid2").val() 
               , "email" : $("#email2").val()   
               , "phone" : $("#phone2").val()   
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


</script>
</body>
</html>