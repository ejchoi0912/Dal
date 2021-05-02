<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="book.BookDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
 <!--  <link href="css/book.css" rel="stylesheet" />
 
   -->
<style type="text/css">
body {
    margin: 0;
}


.btn-search{
  border-radius: 2;
  background: #e8974c;
  color: #f5f5f5;
  width: 100%;
  border: 1px solid #E8E8E8;

}

.btn-search:hover{
  background: #f2f2f2;
  color: #4b4b49;
  transition: background-color 0.3s linear;
}

.container .master > a{
   text-decoration: none;
}

.container .master > a> h4{
   color: #4b4b49;   
   font-size: 20pt;
   font-weight: 700;
}

.container .master > p{
   margin-top:5px;
   color: #4b4b49;   
   font-size: 11pt;
   font-weight: 400;
   font-style: italic;
}

</style>
  
<title>관리자 수정페이지</title>
</head>
<body>
  <script>
  $( function() {
    $( "#datepicker" ).datepicker();
  } );
  </script>

<header style="height: 5em">
</header>

<div class="container">
	<div class="master" style="height:65px;border-left:4px solid #e8974c;padding-left:25px; margin-bottom: 50px;margin-top:20px;">
	   <a href="book?param=masterPage"><h4>BAVABOOK 관리자 페이지</h4></a>
	   <p>BAVABOOK 관리자페이지입니다.</p>
	</div>
</div>


<!-- ///////////////////// 관리자 insert /////////////////////// -->
<div style="background-color: #f1edea; height: 450px; margin-top: 50px">
	<div class="container" style="position: relative;">
		 <form action="loginimg?param=book" method="post" enctype="multipart/form-data">
  			<input type="hidden" name="checkFlag" value="insert" />
		  <div class="row p-4">
		   <div class="col-sm-9" style="margin:0 auto;">
		      <div class="row" >
		         <div class="col-sm-6 service-wrap" style="margin-top: 5px; text-align: center;" >
		            <div class="center-block bookimg" style="text-align: center; display: inline-block;">
		            <label for="newImg">
		               
		                  <img id="bookImg" style="height: 400px;" class="img-responsive bookimg" src="./img/noneBook1.png">
		               
		            </label>
		            <input type="file" name="bookimage" id="newImg" style="display: none">
		            </div>
		         </div>   
		
		         <div class="col-sm-6 p-5" style="margin-left: -20px">
		            <!-- <div><input name="booktitle" value=""></div> -->
		           
		       
		            <table class="table table-borderless table-sm">
		               <col width="100px">
		               <tr>
		               <th colspan="2">
		               <tr>
		                  <th>책제목</th>
		                  <td><input type="text"  name="booktitle" placeholder="책제목"  value=""></td>
		               </tr>
		               <tr>
		                  <th>장르</th>
		                  <td>
		                  <select class="category" name="categories" style="width:185.6px;height:30px">
		                		<option value="100"  >시</option>
		               			<option value="200" >소설</option>
		               			<option value="300" >에세이</option>
		               			<option value="400" >자기계발</option>
		               			<option value="500" >경제</option>
		               			<option value="600" >역사</option>
		               			<option value="700" >예술</option>
		               			<option value="800" >과학</option>
		               			<option value="900" >사회</option>
		               			<option value="1000" >만화</option>
		             		</select>
		             		</td>
		               </tr>
		               <tr>
		                  <th>작가</th>
		                  <td><input type="text"  name="author" placeholder="작가"  value=""></td>
		               </tr>
		               <tr>
		                  <th>북헤더</th>
		                  <td><input type="text"  name="bookheader" placeholder="북헤더"  value=""></td>
		               </tr>
		               <tr>
		                  <th>발행일</th>
		                  <td><input type="text" name="issudate"  placeholder="발행일" id="datepicker" value=""></td>
		               </tr>
		               <tr>
		                  <th>출판사</th>
		                  <td><input type="text" name="publisher" placeholder="출판사" value=""></td>
		               </tr>
		            </table>
		               <div class="row" style="margin-right: -280px;">
		                     <div class="col-sm-6 p-2" style="margin-left: 10px;">
		                         <button class="btn btn-search" type="submit" >작성 완료</button>
		                     </div>
		                  </div> 
		         </div>
		      </div>
		           
		       </div>
		   </div>
		   </form>
		</div>

</div>


 <!-- The Modal -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title"></h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body" align="center">
           <img src="https://image.aladin.co.kr/product/26809/94/cover500/k572730190_1.jpg" style="height: 600px">
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary btn-block" data-dismiss="modal">닫기</button>
        </div>
        
      </div>
    </div>
  </div>
 <script type="text/javascript">        
var sel_file;

$(document).ready(function() {
    $("#newImg").on("change", handleImgFileSelect);
    
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
            $("#bookImg").attr("src", e.target.result);
        }
        reader.readAsDataURL(f);
    });
}

function deleteBook(bookNum){
	location.href = "book?param=deleteBook&booknum="+bookNum;
}
</script>

</body>
</html>