<%@page import="login.MemberDto"%>
<%@page import="club.ClubDto"%>
<%@page import="book.BookDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<BookDto> newBooklist = (List<BookDto>)request.getAttribute("newBooklist");				// 신작
List<BookDto> bestBooklist = (List<BookDto>)request.getAttribute("bestBooklist");			// 이달의 책
List<ClubDto> bestClublist = (List<ClubDto>)request.getAttribute("bestClublist");			// 시끌벅적 소모임
List<MemberDto> bestMemberlist = (List<MemberDto>)request.getAttribute("bestMemberlist");	// 활발히 활동한 사용자

System.out.println("newBooklist = " + newBooklist.toString() );
System.out.println("bestBooklist = " + bestBooklist.toString() );
System.out.println("bestClublist = " + bestClublist.toString() );
System.out.println("bestMemberlist = " + bestMemberlist.toString() );
%>    
    
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>BAVABOOK</title>
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles1.css" rel="stylesheet">
        <link rel="stylesheet" href="css/animate.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
        
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Fugaz+One&display=swap" rel="stylesheet">
    
    <style>

    </style>

    </head>
    <body id="page-top">

        <!-- Masthead-->
        <header class="masthead">
            <div class="container">
                <div class="masthead-subheading">Welcome To Our Page!</div>
                <div class="masthead-heading text-uppercase">BAVABOOK</div>
                <a class="btn btn-main btn-xl text-uppercase js-scroll-trigger" href="#services">Tell Me More</a>
            </div>
        </header>

        <!-- Services-->
        <section class="page-section" id="services">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase mb-0" >Services</h2>
                    <div style="background-color: #e9974d; height: 3px; width: 200px; margin: 5px auto 15px auto;" ></div>
                    
                    <h3 class="section-subheading text-muted">BAVABOOK에서 사용할 수 있습니다.</h3>
                </div>
                <div class="row text-center">
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x" >
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                           <i class="fas fa-tasks fa-stack-1x fa-inverse" ></i>
                        </span>
                        <h4 class="my-3">BOOK REVIEW</h4>
                        <p class="text-muted">여러 사용자의 리뷰를 볼 수 있습니다.</p>
                    </div>
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                            <i class="fas fa-circle fa-stack-2x text-primary"></i>
                            <i class="fas fa-book-reader fa-stack-1x fa-inverse"></i>
                        </span>
                        <h4 class="my-3">PRIVATE BOOKCASE</h4>
                        <p class="text-muted">개인 서재를 관리할 수 있습니다.</p>
                    </div>
                    <div class="col-md-4">
                        <span class="fa-stack fa-4x">
                           <i class="fas fa-circle fa-stack-2x text-primary"></i>
                           <i class="fas fa-users fa-stack-1x fa-inverse" style="font-size: 80px; color: #f8f9fa;" ></i>
                        </span>
                        <h4 class="my-3">COMMUNITY</h4>
                        <p class="text-muted">사용자들과 책에대한 토론을 할 수 있습니다.</p>
                    </div>
                </div>
               <!-- <div align="center" style="margin-top: 130px">
                     <a class="btn btn-primary btn-xl login" href="main?param=mainscreen">START</a>
               </div> -->

            </div>
        </section>
        
        <!-- 책슬라이드 -->
        <section class="page-section" id="bookslide">
            
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase mb-0" >BAVABOOK 선정</h2>
                    <div style="background-color: #e9974d; height: 3px; width: 300px; margin: 5px auto 15px auto;" ></div>
                    <h3 class="section-subheading text-muted mb-5">BAVABOOK의 따끈따근한 책</h3>
                </div>
            </div>
            
            
            <div class="jumbotron-fluid p-0" style="background-color: #f5f5f5;height: 650px;">
			   <div class="maincarousel" > <!-- 메인케로셀 -->
			      <div id="carouselSample" class="carousel slide" data-ride="carousel">
			      
			      <div class="carousel-inner">
			         <!-- first slide -->
			         <div class="carousel-item active">
			            <div class="imgh mx-auto" align="center"><img alt="first" class="d-block" style="height: 600px;margin-top: 25px" src="./upload/mainBook1.png"></div>
			         </div>
			         <!-- second slide -->
			         <div class="carousel-item" >
			         	<div class="imgh mx-auto" align="center"><img alt="second" class="d-block" style="height: 600px;margin-top: 25px" src="./upload/mainBook2.png"></div>
			         </div>
			         <!-- third slide -->
			         <div class="carousel-item" >
			      		 <div class="imgw mx-auto" align="center"><img alt="third" class="d-block" style="height: 600px;margin-top: 25px" src="./upload/mainBook3.png"></div>
			         </div>
			      </div>
			      
			      <!-- controller 부분 -->
			      <a class="carousel-control-prev" href="#carouselSample" role="button" data-slide="prev" style="color:#696969; ">
			         <span class="fa fa-chevron-left fa-4x" aria-hidden="true"></span>
			      </a>
			      <a class="carousel-control-next" href="#carouselSample" role="button" data-slide="next" style="color: #696969;">
			         <span class="fa fa-chevron-right fa-4x" aria-hidden="true" ></span>
			      </a>
			      
			       </div>
			   </div>
			</div>
			
			
        </section>
        

        <!-- 책순위 -->
        <section class="page-section" id="bookranking">
            <div class="container">

                <div class="text-center">
                    <h2 class="section-heading text-uppercase mb-0" >베스트셀러</h2>
                    <div style="background-color: #e9974d; height: 3px; width: 180px; margin: 5px auto 15px auto;" ></div>
                    <h3 class="section-subheading text-muted ">BAVABOOK이 추천하는 이달의 책</h3>
                </div>

                <div class="row text-center">
					<%for(int i=1;i<bestBooklist.size()+1;i++){ 
						BookDto dto = bestBooklist.get(i-1);
						%>
	                    <div class="col-md-3 ">
	                        
	                        <div class="col bookrankimg bimg<%=i %>">
	                            <a href="book?param=bookdetail&booknum=<%=dto.getBooknum() %>" class="">
	
	                                <div class="overlay">
	                                    <h5><%=dto.getBooktitle() %></h5><br>
	                                    <p><%=dto.getBookheader() %></p>
	                                </div>
	                            
	                            <img src="./upload/<%=dto.getBookimage()%>" alt="">
	                            </a>
	                        </div>
	                    </div>
					<%} %>
                </div>

            </div>
        </section>
<br><br><br><br>
        <!-- 이용자 활동순위-->
        <section class="page-section" id="bestactivity">
            <div class="container" >
                <div class="text-center">
                    <h2 class="section-heading text-uppercase mb-0" >활동 순위</h2>
                    <div style="background-color: #e9974d; height: 3px; width: 330px; margin: 5px auto 15px auto;" ></div>
                    <h3 class="section-subheading text-muted ">책과 관련된 활동을 가장 많이 한 사용자입니다.</h3>
                </div>
            </div>

            <div class="container-fluid p-0 user-box1">
                <div class="row">
                
                	<div class="col-md-9 count-wrap">
                        <div class="row user-row">

                		<%for(int i=1; i<bestMemberlist.size()+1; i++){
                        		MemberDto dto = bestMemberlist.get(i-1);%>
                            <div class="col-md-3 user-box3">
                                <div class="user-wrap pos<%=i%>">
                                    <div style="text-align: center;">
                                        <div class="userGrade"><img src="./img/userGrade<%=i%>.png" alt=""></div>
                                        <h3 class="timer"><%=dto.getActivity()-1 %></h3>
                                    </div>
                                </div>
                                <div class="user-box4 pbs<%=i%>"><div class="outline ac<%=i%>"><span></span><span></span></div></div>
                            </div>
                         <%}%>
                            
						</div>
                	</div>


	                <div class="col-md-3 user-box2 activerank por1">
	                    <div class="activerank1">
	                        <h3 class="mb-5 text-left">활동별 순위</h3>
	                        <h5 class="text-muted">
	                        <ol type="1" class="text-muted pl-4">
	                        	<%for(int i=1; i<bestMemberlist.size()+1; i++){
	                        		MemberDto dto = bestMemberlist.get(i-1); %>                        	
	                            <li><p class="text-muted"><%=dto.getUserid() %></p></li>
	                            <%}%>
	                        </ol>
	                        </h5>
	                    </div>
	                </div> <!-- 아이디 칸 -->
                
                
              </div> <!-- 로우 끝 -->
            </div>
        </section>

        <!-- 소모임-->
        <section class="page-section" id="bestclub">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase mb-0" >시끌벅적 소모임</h2>
                    <div style="background-color: #e9974d; height: 3px; width: 250px; margin: 5px auto 15px auto;" ></div>
                    <h3 class="section-subheading text-muted">현재 활발히 활동중인 소모임</h3>
                </div>

                <div class="row text-center">
                	<%for(int i=1; i<5; i++){
                    		ClubDto dto = bestClublist.get(i-1);
                    		String sdate = dto.getClubdate();
                    		String date = sdate.substring(0, 10);
                    %>    
                    <div class="col-md-3">
                         <div class="card card<%=i %>">
                            <a href="club?param=getclubdetail&clubseq=<%=dto.getClubseq() %>"><div class="clubimg"><img src="./clubload/<%=dto.getClubimage() %>" alt="" onerror="this.src='./img/club1.png'"></div></a>
                            <div class="card-body text-left py-0">
                                <p class="text-muted my-3" style="font-size: 14px;"><%=dto.getClubtitle() %></p>
                                <a href="club?param=getclubdetail&clubseq=<%=dto.getClubseq() %>"><h5 class="mb-4"><%=dto.getClubtext() %></h5></a>
                            </div>
                            <div class="card-footer px-0">
                                <div class="row mx-0 px-1">                                   
                                    <div class="col-6"><p class="text-muted m-0 text-center"><i class="far fa-calendar-minus"></i> <%=date %></p></div>
                                    <div class="col-6"><p class="text-muted m-0 text-center"><i class="fas fa-users"></i> <%=dto.getMembersum() %>명</p></div>
                                </div>
                            </div>
                       	 </div>
                    </div>
					 <%} %>

            </div>
        </section>

        <!-- Bootstrap core JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Third party plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
        <!-- Contact form JS-->
        <script src="assets/mail/jqBootstrapValidation.js"></script>
        <script src="assets/mail/contact_me.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <script src="js/jquery.waypoints.min.js"></script>
        <script src="js/jquery.inview.min.js"></script> 
        
        <script>
        $(document).ready(function(){
        	
            $('.carousel').carousel({interval: 3000});
            
            $('.bookrankimg').css('opacity', 0);
            $('#bookranking').waypoint(function() {
                $('.bookrankimg').addClass('fadeInUp');
            }, { offset: '50%' });

            $('.card').css('opacity', 0);
            $('#bestclub').waypoint(function() {
                $('.card').addClass('fadeInUp');
            }, { offset: '50%' });

            $('.user-wrap').css('opacity', 0);
            $('.activerank').css('opacity', 0);
            $('#bestactivity').waypoint(function() {
                $('.user-wrap').addClass('fadeInLeft');
                $('.activerank').addClass('fadeInRight');
            }, { offset: '50%' });

        });

        $('.count-wrap').bind('inview', function(event, visible, visiblePartX, visiblePartY) {
            if (visible) {
                $(this).find('.timer').each(function () {
                    var $this = $(this);
                    $({ Counter: 1000 }).animate({ Counter: $this.text() }, {
                        duration: 2000,
                        easing: 'swing',
                        step: function () {
                            $this.text(Math.ceil(this.Counter));
                        }
                    });
                });
                $(this).unbind('inview');
            }
        });
        </script>
    </body>
</html>