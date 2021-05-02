<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="css/ranking.css">
<link rel="stylesheet" href="css/main.css">
<style>  * { margin: 0; padding: 0; font-family: Fugaz One; color: #ab906e; }</style>
<title>홈페이지 메인</title>
</head>
<body>

<header>
<nav class="navbar navbar-expand-sm fixed-top text-justify js-scroll-trigger">
	<!-- 로고 -->
	<div class="logo "><img alt="" src="./img/ab8962_logo.png"></div>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
			 data-target="#navbar-content" aria-controls="navbar-content" aria-expanded="false" aria-label="Toggle navigation">
			<i class="fa fa-bars fa-2x" aria-hidden="true"></i>
	</button>
	<!-- 네비게이션 -->
		<div class="collapse navbar-collapse m-0 mr-5 justify-content-end" id="navbar-content">
			
			<ul class="navbar-nav text-center">
				<li class="nav-item">
					<a class="nav-link linkcol underline" href="main.jsp?content=home">처음으로</a>
				</li>
				<li class="nav-item">
					<a class="nav-link linkcol underline" href="book?param=booklist">책추천 받기</a>
				</li>
				<li class="nav-item">
					<a class="nav-link linkcol underline" href="main.jsp?content=community">소통하기</a>
				</li>
				<!-- <li class="nav-item">
					<a class="nav-link linkcol" href="main.jsp?content=mypage">서재로 가기</a>
				</li> -->
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle linkcol" href="main.jsp?content=login" id="navbardrop"
					   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">로그인</a>
				      <div class="dropdown-menu dropdown-menu-right"  aria-labelledby="navbardrop"  >
				        <a class="dropdown-item" data-toggle="modal" data-target="#exampleModal">로그인</a>
				        <a class="dropdown-item" href="#">서재로 가기</a>
				        <a class="dropdown-item" href="#">일정관리</a>
				      </div>
   				</li>
			</ul>	
   		</div>
</nav>
</header>

<a href="club?param=clublist">클럽리스트로 </a>

<main>
<div class="jumbotron jumbotron-fluid p-0">
	<div class="maincarousel" > <!-- 메인케로셀 -->
      <div id="carouselSample" class="carousel slide" data-ride="carousel">
      <!-- indicator(이동할 수 있는 바) -->
      <!-- <ol class="carousel-indicators">
         <li data-target="#carouselSample" data-slide-to="0" class="active">
         <li data-target="#carouselSample" data-slide-to="1">
         <li data-target="#carouselSample" data-slide-to="2">
      </ol> -->
      <div class="carousel-inner">
         <!-- first slide -->
         <div class="carousel-item active">
         	<div class="imgh mx-auto"><img alt="first" class="d-block" src="http://image.yes24.com/momo/scmfiles/AdvertFiles/202103/2578206_210324030109.jpg"></div>
            <!-- caption -->
            <div class="carousel-caption d-none d-md-block">
               <!-- <h5>신작 추천</h5> -->
            </div>
         </div>
         <!-- second slide -->
         <div class="carousel-item" >
			<div class="imgh mx-auto"><img alt="second" class="d-block" src="http://image.yes24.com/momo/scmfiles/AdvertFiles/202103/2575602_210303025102.jpg"></div>
         <!-- caption -->
            <div class="carousel-caption d-none d-md-block">
               <!-- <h5>신작 추천</h5> -->
            </div>
         </div>
         <!-- third slide -->
         <div class="carousel-item" >
		 <div class="imgw mx-auto"><img alt="third" class="d-block" src="http://image.yes24.com/momo/scmfiles/AdvertFiles/202103/2644630_210315110233.jpg"></div>
         <!-- caption -->
            <div class="carousel-caption d-none d-md-block">
               <!-- <h5>신작 추천</h5> -->
            </div>
         </div>
      </div>
      <!-- controller 부분 -->
      <a class="carousel-control-prev" href="#carouselSample" role="button" data-slide="prev">
         <span class="fa fa-chevron-left fa-2x" aria-hidden="true"></span>
      </a>
      <a class="carousel-control-next" href="#carouselSample" role="button" data-slide="next">
         <span class="fa fa-chevron-right fa-2x" aria-hidden="true"></span>
      </a>
  	  </div>
	</div>
</div>

<div class="container" >
<div class="container-fluid">
  <div class="row">
	<div class="col-sm-7 d-none d-sm-block p-4">
		<div class="col mb-4 p-4 mainpart"> 활동적인 소모임
			<div class="row my-3 mx-auto">
				<div class="clubView1" style="width: 30%; height: 200px;">
					<a href=""><img src="http://image.yes24.com/goods/91065309/800x0" alt="달러구트 꿈 백화점"></a>
				</div>

				<div class="clubView1" style="width: 30%; height: 200px;">
					<a href=""><img src="http://image.yes24.com/goods/98859230/800x0" alt="설레는 건 많을수록 좋아"></a>
				</div>

				<div class="clubView1" style="width: 30%; height: 200px;">
					<a href=""><img src="http://image.yes24.com/goods/97665161/800x0" alt="이상한 과자 가게 전천당 10"></a>
				</div>

			</div>

		<!-- 
			<ul data-viewname="이미지" class="clubList">
			<li data-viewname="소모임이미지" class="clubView1" style="display: inline;">&nbsp;&nbsp;
			<div class="clubView1" style="display: inline; border: black solid; height: 500px;">
			<a href=""><img src="http://image.yes24.com/goods/91065309/800x0" alt="달러구트 꿈 백화점"></a>
			</div>
			</li>
			<li data-viewname="소모임이미지" class="clubView2" style="display: inline;">&nbsp;&nbsp;
			<div style="display: inline; border: 1px solid;">
			<a href="#">소모임 이미지1</a>
			</div>
			</li>
			<li data-viewname="소모임이미지" class="clubView3" style="display: inline;">&nbsp;&nbsp;
			<div style="display: inline; border: 1px solid;">
			<a href="#">소모임 이미지1</a>
			</div>
			</li>
			</ul>
		 -->


		</div>
		<div class="col pt-4 mainpart" style="height: 300px;"> 활동순위
			<ul data-viewname="이미지" class="energeticUser mx-auto mt-5">
			<li data-viewname="소모임이미지" class="clubView2" style="display: inline-block;">&nbsp;&nbsp;
			<div id="userCircle">
			<a href="#">유저이미지1</a>
			</div>
			</li>
			<li data-viewname="소모임이미지" class="clubView2" style="display: inline-block;">&nbsp;&nbsp;
			<div id="userCircle">
			<a href="#">유저이미지2</a>
			</div>
			</li>
			<li data-viewname="소모임이미지" class="clubView2" style="display: inline-block;">&nbsp;&nbsp;
			<div id="userCircle">
			<a href="#">유저이미지3</a>
			</div>
			</li>
			<li data-viewname="소모임이미지" class="clubView2" style="display: inline-block;">&nbsp;&nbsp;
			<div id="userCircle">
			<a href="#">유저이미지4</a>
			</div>
			</li>
			<li data-viewname="소모임이미지" class="clubView2 " style="display: inline-block;">&nbsp;&nbsp;
			<div id="userCircle">
			<a href="#">유저이미지5</a>
			</div>
			</li>
			</ul>
		</div>
	</div>
	
	<div class="col-sm-5 p-4">
		<div class="col mb-5 p-3 mainpart1" >
			<div class="input-group search">
			<form class="form-inline" action="#">
				<select class="form-control">
			    	<option>책제목</option>
					<option>책저자</option>
			  	</select>
	     		<input class="form-control" type="text" placeholder="검색">
	     		<button class="btn" type="button"><i class="fa fa-search" aria-hidden="true"></i></button>
			</form> 
			</div>
		</div>

		<div class="col mainpart" style="height: 500px;"> 책순위
			<div class="content">
				<div class="colors">
					<table>
						<tr>
							<td align="center"><a class="default" href="javascript:void(0)" style="text-decoration:none;color: #4b4b49;font-size: 10pt">이달의 책</a></td>
							<td align="center"><a class="blue" href="javascript:void(0)" style="text-decoration:none;color: #4b4b49;font-size: 10pt">카테고리별 추천</a></td>
						</tr>
					</table>
				</div>
				<div id="jquery-accordion-menu" class="jquery-accordion-menu">
					<div class="jquery-accordion-menu-header">Header </div>
					<ul>
						<li><a href="#"><span class="jquery-accordion-menu-label">1 </span><i class="fa fa-home"></i>주린이가 가장 알고 싶은 최다질문 TOP 77  </a></li>
						<li><a href="#"><span class="jquery-accordion-menu-label">2 </span><i class="fa fa-glass"></i>달러구트 꿈 백화점 </a></li>
						<li><a href="#"><span class="jquery-accordion-menu-label">3 </span><i class="fa fa-file-image-o"></i>2030 축의 전환  </a></li>
						<li><a href="#"><span class="jquery-accordion-menu-label">4 </span><i class="fa fa-cog"></i>공정하다는 착각 </a></li>
						<li><a href="#"><span class="jquery-accordion-menu-label">5 </span><i class="fa fa-newspaper-o"></i>모래알만 한 진실이라도 </a></li>
						<li><a href="#"><span class="jquery-accordion-menu-label">6 </span><i class="fa fa-suitcase"></i>파친코. 1  </a></li>
						<li><a href="#"><span class="jquery-accordion-menu-label">7 </span><i class="fa fa-user"></i>아몬드 </a></li>
						<li><a href="#"><span class="jquery-accordion-menu-label">8 </span><i class="fa fa-envelope"></i>주식투자 무작정 따라하기(2020) </a></li>
					</ul>
					<div class="jquery-accordion-menu-footer">Footer </div>
				</div>
			</div>
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
			<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
			<script type="text/javascript" src="js/ranking.js"></script>
		</div>
	</div>
  </div>
</div>
</div>
</main>

<div class="container">
	
	<button type="button" class="btn btn-secondary" data-toggle="modal"
		data-target="#exampleModal">전환버튼</button>
		
		<!-- 모달 테두리 -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<!-- 모달 본체 -->
		<div class="modal-dialog" role="document">
			<!-- 모달 내용 -->
			<div class="modal-content">
				<!-- 모달 헤더 -->
				<!-- <div class="modal-header"> -->
					<!-- 모달 제목 -->
					<h5 class="modal-title" id="exampleModalLabel">로그인하기</h5>
						<!-- 모달 본문 -->
						<div class="modal-body">
							<form action="login?param=loginpro" method="post">
							
							<input type="text" name="id" id="id" placeholder="아이디">
							<input type="text" name="pwd" id="pwd" placeholder="패스워드">
							<button type="submit">로그인</button>
							<button type="button" onclick="account()">회원가입</button>
							<br>
							<a href="#">아이디 저장하기</a><input type="checkbox" id="chk_save_id">
							<br>
							<a href="login?param=findId">아이디찾기</a>
							<br>
							<a href="login?param=findPassword">비밀번호찾기</a>
							
							</form>
						<!-- 닫기 버튼 -->
					<!-- <button type="button" class="close" data-dismiss="modal" aria-lable="cloas">
						<span aria-hidden="true">&times;</span>
					</button> -->
				</div>
				<!-- </div> -->
				
				<!-- 모달 꼬리말 -->
				<div class="modal-footer">
					<!-- 닫기 버튼 -->
					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				</div>
				
			</div>
		
		</div>
	</div>
	
</div>

<footer>
<hr> 
<div class="container mb-5" style="height: 30px;">
<a href="#">도움말</a> <a href="#">약관</a> <a href="#">사이트맵</a>
</div>
</footer>

</body>
</html>