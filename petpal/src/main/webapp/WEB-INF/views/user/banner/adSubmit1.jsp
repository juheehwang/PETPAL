<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            a > img {
                width: 50%;
                height: 50%;
                margin-top: 20px;
                margin-bottom: 10px;
                margin-left: 15px;
                margin-right: 15px;
                text-align: center;
            }
            td > input {
            	height: 40px;
                width: 95%;
                border-radius: 10px;
                border: 1px solid rgb(175, 175, 175);
            }
            tr, td {
            	font-size: 17px;
				height: 55px;
				text-align: left;
			}
            td > button {
                background-color: #45B99C; 
                height: 35px;
                color: white;
                border-color: #45B99C; 
                border: 1px solid; 
                font-size: 16px; 
                font-weight: 500;
                border-radius: 10px;
            }
            div > button {
                background-color: #45B99C; 
                height: 35px;
                color: white;
                border-color: #45B99C; 
                border: 1px solid;
                font-size: 16px; 
                font-weight: 500;
                border-radius: 10px;
                margin-left: 20px;
            }
            td > input::placeholder {
                font-size: 15px;
                color:#a1a1a1;
            }
        </style>
        <meta charset="utf-8">
        <title>PET-PAL</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="image/png" href="favicon.ico">

        <!--Google Font link-->
        <link href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">


        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/slick/slick.css"> 
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/slick/slick-theme.css">
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/animate.css">
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/iconfont.css">
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/font-awesome.min.css">
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/bootstrap.css">
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/magnific-popup.css">
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/bootsnav.css">

        <!--Theme custom css -->
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/style.css">

        <!--Theme Responsive css-->
        <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/responsive.css" />

        <script src="${ pageContext.servletContext.contextPath }/resources/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
        <script>
	        const message = '${ requestScope.message }';
	    	if(message != null && message !== '') {
	    		alert(message);
	    	}
        </script>
    </head>

    <body data-spy="scroll" data-target=".navbar-collapse">


        <!-- Preloader -->
        <div id="loading">
            <div id="loading-center">
                <div id="loading-center-absolute">
                    <div class="object" id="object_one"></div>
                    <div class="object" id="object_two"></div>
                    <div class="object" id="object_three"></div>
                    <div class="object" id="object_four"></div>
                </div>
            </div>
        </div><!--End off Preloader -->


        <div class="culmn">
            <!--Home page style-->


            <jsp:include page="../common/userHeader.jsp"/>

            <section id="account" class="account" style="width: 70%; margin: 0px auto;  margin-bottom: 40px;">
                <div style="color: #45B99C; font-size: 25px; font-weight: 600;">?????? ??????</div>
            </section>
            
			<section id="account" class="account" style="width: 70%; margin: 0px auto;  margin-bottom: 20px;">
                <div style="font-size: 20px; font-weight: 600; float: left; margin-left: 10px;">?????? ???????????? ??? ????????????</div>
                <br>
                <hr style="border-color: rgb(175, 175, 175);">
            </section>
            
            <section id="accountmanagement" class="accountmanagement">
                <div style="width: 70%; border: 1px solid rgba(175, 175, 175, 0.616); margin: 0px auto; border-radius: 35px; margin-bottom: 80px;">
					<table style="width: 90%; height: 83%; margin-left: 30px; margin-top: 20px; margin-bottom: 20px;">
						<tr>
							<td style="width: 25%">?????? ????????????</td>
							<td><textarea class="form-control" style="height: 90%">
(???)?????? (?????? "??????")??? ???????????? ????????????(?????? "?????????")??? ???????????? ????????? ?????? ????????????(?????? 2021.06.23)
????????? ?????? ???????????? ????????? ???????????? ????????? ????????????. ???????????? ????????? Native??? Advertising??? ???????????? ????????? ??? ?????? ?????? ???????????? ????????? ?????? ??????????????? ???????????? ?????? ?????? ????????????.
?????? ???????????? ???????????? ?????????????????? ?????? ???????????? ???????????? ?????? ???????????? ????????? ??????????????? ????????? ???????????? ????????? ??????????????? ???????????? ???????????? ?????? ????????? ???????????? ?????? ??? ????????? ????????? ????????????.
????????? ???????????? ????????? ?????? ???????????? ????????? ???????????? ????????????.
							</textarea></td>
							<td style="width:140px; padding-left: 20px"><label name="admit4" style="font-size: 15px; font-weight: normal;">
							<input type="checkbox" name='admit' id='admit0' style="width: 15px;">  ?????? ??????</label></td>
						</tr>
						<tr style="height:300px;">
							<td>?????? ??????</td>
							<td><textarea class="form-control" style="height: 90%">
?????? ?????? (?????? ??? ?????? 2021. 06. 23)
???1??? ??????							

???1???(??????) ??? ????????? ???????????? ??? ???????????? ???????????? ?????? ???????????? ?????? ??? ?????????(?????????????????? ????????? ?????? ????????? ????????????, ?????? ??????????????? ????????????)??? ????????????(www.pet-pal.com), ????????? ??????????????????, ?????? ????????? ????????? ?????????/??????????????? ???????????? ?????? ???????????? ?????? ????????? ????????? ?????? ??????, ?????? ??? ????????? ?????? ????????? ???????????? ???????????? ??????. 

???2???(???????????????)
1. ??????????????????, ?????? ????????????, ????????? ??????????????????, ?????? ????????? ????????? ??????????????? ????????? ??? ?????? ???????????? ????????? ?????? ?????? ???????????? ????????? ???????????? ??? ????????? ???????????? ????????? ?????? ???????????? ????????? ??????????????? ????????? ?????? ????????????.
2. ???????????? ???????????????, ?????? ????????????, ????????? ??????????????????, ?????? ????????? ?????? ????????? ???????????? ????????? ???????????? ??? ?????? ????????? ?????? ?????? ????????? ???????????? ??????????????? ???????????? ????????? ?????? ???????????? ????????????.
3. ????????????????????????, ???????????? ?????? ????????????, ????????? ??????????????????, ?????? ????????? ??????????????? ????????? ?????? ???????????? ???????????? ????????? ????????? ??? ????????? ????????? ???????????? ????????? ?????? ????????? ????????????. 4. ?????????????????????, ???????????? ????????? ????????????????????? ?????? ??????????????? ????????? ????????????.
4. ??????????????????, ???????????? ??????????????? ???????????? ???????????? ????????? ????????? ???????????? ?????? ????????? ????????????.
5. ????????? ???????????????, ???????????? ???????????? ?????? ???????????? ????????? ???????????? ????????? ?????? ????????? ?????????, ??????, ?????? ?????? ?????? ????????? ?????? ????????? ????????????.
6. ??????????????????, ??????????????? ????????? ???????????? ???????????? ???????????? ?????????, ??????, ??????DB ?????? ?????? URL Link ?????? ???????????? ???????????? ???????????? ???????????? ?????? ????????????.
  
???3???(????????? ?????? ??? ??????)
??? ????????? ??? ????????? ????????? ???????????? ?????? ??? ??? ????????? ????????? ?????? ????????????, ????????? ????????????????????? ??????????????? ????????????.
??? ????????? ????????? ????????? ?????? ?????? ??? ???????????? ???????????? ?????? ???????????? ??? ????????? ????????? ??? ??????.
??? ????????? ??? ????????? ????????? ???????????? ??????????????? ???????????? ??? ??????????????? ??????????????? ??????????????? ???????????? ??? ???????????? 7??? ????????? ????????? ?????? ????????? ?????? ?????? ?????? ????????? ?????? ????????????, ????????? ????????????????????? ????????????. ??????, ?????? ????????? ??????????????? ????????? ???????????? ??? ???????????? 14??? ????????? ????????? ?????? ????????? ?????? ?????? ?????? ?????? ????????? ?????? ????????????, ????????? ????????????????????? ???????????????, ??????????????? ?????? ?????? ????????? ????????? ????????????.
??? ???????????? ??????????????? ???????????? ?????? ?????? ?????? ???????????? ????????? ??????????????? ????????? ??? ??????.
??? ??? ???????????? ????????? ????????? ????????? ??? ????????? ????????? ???????????? ??????????????? ???????????? ?????????????????? ?????? ??????, ????????? ?????? ?????? ?????? ??????, ???????????????????????? ????????? ??????????????? ???????????? ????????? ???????????? ??? ???????????? ?????? ???????????? ?????????.

???4???(????????? ??????)
??? ???????????? ???????????? ??????????????? ?????? ???(?????? ?????????????????????)??? ????????? ?????? ????????? ?????? ??? ????????? ???????????? ????????? ?????? ??????????????????, ???????????? ???????????? ????????? ???????????? ??? ????????? ????????? ??????????????? ?????? ?????? ????????? ????????? ????????? ?????? ???????????? ???????????? ????????? ??? ??????.
??? ????????? ???1?????? ?????? ?????????????????? ?????? ????????? ???????????? ???????????? ????????? ????????? ??? ??????. 
1. ????????? ??? ?????? ?????? ?????? ??????????????? ?????? ??????????????? ???????????? ????????? ??????????????? ????????? ??????	
2. ??? ????????? ????????? ????????? ???????????? ?????? ????????? ????????? ?????? ?????? ??????
3. ????????? ???????????? ????????? ????????? ????????? ??????
4. ?????????????????? ??????????????? ????????? ????????? ????????? ???????????? ??????
5. ?????? ???1??? ?????? ???4?????? ????????? ????????? ????????? ????????? ????????? ???????????? ????????? ?????? ??????
??? ????????? ?????? ??????????????? ?????? ?????? ??? ??????????????? ?????? ????????? ????????? ???????????? ????????? ?????? ??? ??????, ??? ?????? ?????? ??????????????? ?????? ???????????? ?????? ??? ????????? ????????????.
???5???(???????????? ???????????? ??????) ????????? ?????? ???????????? ???????????? ?????? ??? ????????????, ???????????? ?????? ??????(?????? ??????????????? ???????????? ?????????)??? ????????? ?????? ????????????, ????????? ??????????????? ?????? ????????????, ???????????? ???????????? ????????? ?????? ??? ?????? ????????? ??????????????? ??????. ???6???(?????? ???????????? ????????? ???????????? ?????? ???)
??? ?????? ??????????????? ????????? ????????? ?????? ????????? ?????? ????????? ?????? ??????????????? ????????????, ????????? ?????? ????????? ?????? ????????? ?????? ??????????????? ????????? ??? ??????. ???????????? ????????? ?????? ???????????? ?????? ??? ??????????????? ?????????????????? ????????? ?????? ????????????, ????????? ??????????????? ?????? ?????? ????????????.
??? ?????? ??????????????? ????????? ????????? ?????? ????????? ???????????? ????????? ????????? ?????? ?????? ???????????? ????????? ??????????????? ??????. ????????? ???????????? ???????????? ??????, ?????? ??? ?????? ?????? ????????? ????????? ?????????, ?????? ?????? ??? ????????? ????????? ?????? ?????? ??????????????? ????????? ????????? ????????? ????????? ????????? ????????? ????????? ??? ??????.
??? ????????? ??????????????? ??????????????? ????????? ?????? ???2??? ????????? ?????? ????????? ??????????????? ???????????? ?????????, ????????? ?????? ????????? ?????? ????????? ???????????? ?????? ???????????? ?????? ???????????? ?????? ????????? ?????? ????????? ????????? ??? ??????.
??? ????????? ???1?????? ?????? ??????????????? ????????? ????????? ?????? ???????????? ?????? ???????????? ???????????? ????????? ???????????? ?????? ???????????? ????????? ??????????????? ???????????? ??? ??????????????? ????????? ?????? ?????? ????????? ????????????.

???5???(???????????? ???????????? ??????) ????????? ?????? ???????????? ???????????? ?????? ??? ????????????, ???????????? ?????? ??????(?????? ??????????????? ???????????? ?????????)??? ????????? ?????? ????????????, ????????? ??????????????? ?????? ????????????, ???????????? ???????????? ????????? ?????? ??? ?????? ????????? ??????????????? ??????. ???6???(?????? ???????????? ????????? ???????????? ?????? ???)
??? ?????? ??????????????? ????????? ????????? ?????? ????????? ?????? ????????? ?????? ??????????????? ????????????, ????????? ?????? ????????? ?????? ????????? ?????? ??????????????? ????????? ??? ??????. ???????????? ????????? ?????? ???????????? ?????? ??? ??????????????? ?????????????????? ????????? ?????? ????????????, ????????? ??????????????? ?????? ?????? ????????????.
??? ?????? ??????????????? ????????? ????????? ?????? ????????? ???????????? ????????? ????????? ?????? ?????? ???????????? ????????? ??????????????? ??????. ????????? ???????????? ???????????? ??????, ?????? ??? ?????? ?????? ????????? ????????? ?????????, ?????? ?????? ??? ????????? ????????? ?????? ?????? ??????????????? ????????? ????????? ????????? ????????? ????????? ????????? ????????? ??? ??????.
??? ????????? ??????????????? ??????????????? ????????? ?????? ???2??? ????????? ?????? ????????? ??????????????? ???????????? ?????????, ????????? ?????? ????????? ?????? ????????? ???????????? ?????? ???????????? ?????? ???????????? ?????? ????????? ?????? ????????? ????????? ??? ??????.
??? ????????? ???1?????? ?????? ??????????????? ????????? ????????? ?????? ???????????? ?????? ???????????? ???????????? ????????? ???????????? ?????? ???????????? ????????? ??????????????? ???????????? ??? ??????????????? ????????? ?????? ?????? ????????? ????????????.

???6???(?????????) ?????? ??????????????? ????????????????????? ?????? ??? CPC(Cost Per Cost) ????????? ????????????, 2?????? ????????? 1?????? ????????? ??????, 2?????? ?????? ????????? ?????? ?????? ?????? CPC ????????? ??????.
1. 1??? ??????(?????????)
?????? ?????? ????????? ?????? ????????????.
1??? : 200,000??? (20??????)
2??? : 350,000??? (35??????)
?????? ?????? : ?????? ?????? ??? 3??? ?????? ??????
?????? ?????? : ???????????????
2.	2??? ??????
?????? ?????? ?????? ????????????.
150??? / Click (1??? ?????? ??? 150??? ??????)
?????? ?????? : ?????? ???????????? ??????
?????? ?????? : ?????? ???????????? ??????

???7???(??? ???????????? ????????? ??????)
??? ????????? ??????????????? ??? ????????? ???????????? ????????? ?????? ?????????, ??? ????????? ?????? ??????????????? ??????????????? ??????????????? ????????? ?????????.
??? ????????? ???????????? ????????? ????????? ???????????? ?????? ?????????????????? ????????? ?????? ?????? ??????, ??????????????? ?????? ?????? ?????????????????? ????????? ????????? ??? ??????. ???, ????????? ???13??? 5?????? ?????? ???????????? ??????????????? ??????.
??? ???????????? ???????????? ??????????????? ???????????? ?????? ????????? ?????? ??????????????? ???????????? ????????? ??????????????? ??????.
??? ???????????? ???????????? ???????????? ????????? ????????? ???????????? ???????????? ?????? ?????? ????????? ??? ?????? ????????? ????????? ?????? ???????????? ??????????????? ??????.
??? ???????????? ???????????? ?????? ?????? ?????? ????????? ?????? ?????? ????????? ?????? ?????? ?????? ???????????? ??????????????? ????????????, ???????????? ?????? ???????????? ?????? ?????? ???????????? ?????????, ??????????????? ???3????????? ??? ???????????? ????????? ???????????? ????????????.

???8???(???????????? ????????????)
??? ????????? ????????? ?????? ????????? ?????? ?????? ???????????? ?????? ???????????? ???????????? ??????????????? ?????? ???3???????????? ???????????? ?????? ????????? ?????? ?????? ?????? ?????? ????????? ??????????????? ????????? ??? ??????. ??? ?????? ???????????? ?????? ????????? ?????? ????????? ??????????????? ??????, ?????? ????????? ?????? ????????? ???????????? ????????? ????????? ????????? ??? ??????.
??? ???????????? ???1?????? ???????????? ??????????????? ??????????????? ????????? ????????? ?????? ?????? ?????? ?????? ?????? ????????? ??????????????? ??????, ?????? ???????????? ????????? ???????????? ????????? ??????????????? ??????.

???10???(?????? ??? ??????)
??? ???????????? ????????? ????????? ?????? ??????????????? ????????? ??? ??????. 1??? ????????? ????????? ??????, ????????????????????? ?????? ??????????????? 2??? ?????? ?????? ????????? ????????????.
??? 1??? ????????? ?????? ?????? ????????? ?????? ??????????????? ?????? ?????? ??????????????? ????????? ???????????????.
??? 1??? ????????? ????????? ?????? ?????? ?????? ???????????? ??? 100% ?????? ????????? ?????????.
??? 1??? ????????? ????????? ?????? ????????? ?????? ???????????? ??? ???????????? ????????? ????????? ?????? 2??? ???????????? ???????????? ????????? ????????????.
1. ?????? ?????? ???????????? ???????????? ???????????? ?????? ?????? ????????? ???????????? ??? ????????? ????????? ??? ??????. ??? ??????, ?????? ?????? ???????????? ???????????? ?????? ??????????????? ?????? ???????????? ???????????? ????????? ?????? ??????????????? ??????. ???, ????????? ????????? ????????? ?????? ???????????? ??? ????????? ?????????.
2. ????????? ???12???(???????????? ????????? ????????? ?????? ??? ??????)??? ???????????? ????????? ????????? ?????? ???????????? ?????? ???????????? ????????????, ????????? ????????? ????????? ??? ????????? ????????? ??? ?????????, ????????? ??????????????? ?????? ???????????? ??? ????????? ?????? ????????? ????????? ??? ??????.
3. ????????? ??? ????????? ?????? ????????? ??????????????? ?????? ??????, ?????? ????????? ????????? ???????????? ??????????????? ??????????????? ??????????????? ????????? ??????. ???????????? ??? ????????? ?????? ????????? ??????????????? ?????? ??????, ????????? ????????? ????????? ?????? ????????? ??????????????? ??????/?????? ????????? ????????? ???????????? ??????????????? ??????????????? ????????? ??????, ?????? ????????? ?????? ?????? ?????? ??? ???????????? ??????????????? ????????? ????????? ??????. ???1?????? ?????? ?????? ?????? ???????????? ????????? ???????????? ????????? ?????? ????????? ???????????? ????????? ??? ??????.
4. ?????? ?????? ???????????? ???????????? ?????? ??? ?????? ????????? ?????? ??? ????????? ?????? ????????? ?????? ????????? ??? ??????. 
o. ????????? ????????? ????????????, ??????????????????, ?????????????????? ??????, ??????, ????????????, ????????????, ????????????, ?????? ????????? ????????? ???????????? ??????????????? ??? ??? ?????? ??? ??????
o. ??? ????????? ??????????????????, ????????????????????? ????????? ??????

???11???(???????????? ?????? ??????)
??? ????????? ???????????? ?????? ????????? ?????? ?????? ??? ????????? ??????????????? ?????? ??? ???????????? ????????? ????????????, (??????)????????????, ?????? ?????? ???????????? ??? ??? ??????.
??? ????????? ????????? ????????? ?????? ????????? ?????? ?????? ??? ????????? ??????????????? ?????? ??? 7??? ?????? ????????? ?????? ????????????, ????????? ????????????????????? ??????????????? ?????????????????? ????????? ????????? ????????? ??? ??????. ??????, ???????????? ????????? ????????? ???????????? ????????? ????????? ????????? ????????? ???????????? ???1?????? ?????? ???????????? ????????????.
??? ???????????? ????????? ????????? ????????? ????????? ????????????, (??????)????????????, ?????? ?????? ????????? ???????????? ?????? ???????????? ???????????? ??????????????? ??????.
??? ????????? ???1?????? ????????? ?????? ???????????????, ???2?????? ????????? ?????? ????????? ??????, ???????????? ?????? ??????????????? ?????? ????????? ??????, ???????????? ????????? ????????? ????????????, (??????)????????????, ?????? ?????? ????????? ????????????, ???????????? ????????? ???????????? ?????? ????????? ????????? ???????????? ???????????? ?????????.
??? ????????? ???????????? ????????? ????????? ???????????? ?????? ?????????????????? ????????? ?????? ?????? ??????, ??????????????? ?????? ?????? ?????????????????? ????????? ?????????????????? ???2?????? ????????? ?????? ????????? ??? ??????.

???12???(???????????????)
??? ???????????? ???????????? ????????? ?????? ????????? ?????? ?????? ???????????? ?????? ??????????????? (?????????????????????????????????????????? ??? ????????? ?????? ??????)??? ?????? ????????? ??? ?????? ????????? ???????????? ?????????, ????????? ?????? ???????????? ???3?????? ?????????????????? ????????? ????????? ????????? ????????? ?????? ????????? ??????????????? ???????????? ????????? ????????????.
??? ???????????? ????????? ???1?????? ?????? ???????????? ????????? ?????? ????????? ?????????????????????????????????????????? ?????? ??? ??? ?????? ????????? ????????????, ????????? ?????? ??????????????? ???????????? ?????????????????? ??????????????? ??????.
??? ???1?????? ?????? ???????????? ?????? ??? ????????? ???3?????? ??????????????? ?????? ????????? ??????????????? ?????? ????????? ?????????????????? ????????? ????????? ?????? ??????, ????????? ???????????? ??????????????? ?????? ???????????? ?????? ???????????? ??????????????? ???????????? ????????? ????????? ????????? ??? ??????.
??? ????????? ????????? ??????????????? ????????? ?????? ???????????? ?????? ?????????????????? ????????????, ???????????? ????????? ???????????? ?????? ????????? ?????? ???????????? ???????????????, ????????? ????????? ?????? ??? ????????? ????????? ????????? ??????, ?????? ?????? ?????? ?????? ????????? ????????????.
??? ????????? ??????????????? ?????? ????????? ???????????? ?????? ?????????, ?????????, ?????? ??? ?????? ????????? ?????? ?????????????????? ????????????.

???13???(???????????? ??????)
??? ???????????? ????????? ????????? ????????? ????????? ???????????? ?????? ????????? ????????? ?????? ????????? ?????? ????????? ??????????????? ????????????. ???????????? ????????? ????????? ????????? ???????????? ????????? ????????? ?????????????????? ??????????????? ???????????? ??????, ?????????????????????, ??????????????? ?????? ?????? ??? ?????????????????? ?????? ????????? ????????? ??????????????? ????????? ??????????????? ??????.
??? ????????? ???????????? ?????? ?????? ????????? ?????? ????????? ??????????????? ????????? ???????????? ???????????? ??????????????? ????????????, ???????????? ??????????????? ??? ???????????? ?????????????????? ????????? ??????????????? ??????.
							</textarea></td>
							<td style="width:140px; padding-left: 20px"><label name="admit4" style="font-size: 15px; font-weight: normal;">
							<input type="checkbox" name='admit' id='admit1' style="width: 15px;">  ?????? ??????</label></td>
						</tr>
						<tr>
							<td style="width: 20%">??????????????? ??????????????????????</td>
							<td><textarea class="form-control" style="height: 90%">
?????? ??? ??????????????? ????????????????????????? ?????? ??????
??? ?????? ??? ??????????????? ?????????????????????? ??????
-  ????????? ?????? ??? ??????????????? ????????? ?????? ????????? ???????????? ????????? ?????? ?????? ??????????????? ???????????? ?????? ???????????? ?????????????????? ???????????????????????????????????????.
-  ????????? ?????? ??? ??????????????? ????????????????????????? ????????? ????????? ?????? ???114?????? ??????????????? ????????? ??????????????? ??????????????? ????????????, ?????? ?????? ???????????? ???????????? ????????? ?????? ??? ????????? ???????????? ??? ??????????????? ???????????? ?????? ????????? ?????? ????????????.
??? ?????? ??? ??????????????? ?????????????????????? ??????
-  ????????? ?????? ??? ??????????????? ????????? ?????? ??????(?????????, ??????, ???????????????, ????????????, ???????????????, ??????????????????, ??????????????? ???81??????13??? ?????????????????? ?????????, ???????????????, ????????????, ????????????, ????????????, ??????????????? ??? ?????????????????????, ????????? ???????????? ??????, ????????? ???116?????? ?????? ?????????, ??????????????? ???2?????? 1??? ??????????????? ??? ???????????? ??? ???????????? ???????????? ??? ??? ???????????????????????????????.
??? ?????? ??? ??????????????? ?????????????????????? ??????
-  ????????? ?????? ??? ??????????????? ????????????????????????? ?????? ??????????????? ????????? ?????? ???????????? ?????????????? ????????? ???????????? ?????? ????????? ???????????????????????????????.
-  ????????? ?????? ??? ??????????????? ?????????????????????? ????????? ???????????? ?????? ??? ???????????????.
??? ????????? ????????? ?????? ??? ????????? ????????? ????????? ?????????
-  ????????? ?????? ??? ??????????????? ????????????????????????? ????????? ??? ?????? ????????? ?????? ?????????????????? ?????? ??????????????? ?????? ????????? ????????? ??? ????????????.
-  ????????? ?????? ??? ??????????????? ????????????????????????? ?????? ????????? ???????????? ??? ?????????, ?????? ???????????? ???????????? ?????? ??? ?????? ????????? ???????????????.
							</textarea></td>
							<td style="width:140px; padding-left: 20px"><label name="admit4" style="font-size: 15px; font-weight: normal;">
							<input type="checkbox" name='admit' id='admit2' style="width: 15px;"> ?????? ??????</label></td>
						</tr>
					</table>
					<div style="margin: 0px auto; text-align: center; margin-bottom: 10px;"><label name="admitAll" style="font-size: 15px; font-weight: normal;">
					<input type="checkbox" name='admit' value='selectall' onclick='selectAll(this)' style="width: 15px;">?????? ?????? ????????????</label></div>
                    <div style="margin: 0px auto; text-align: center; margin-bottom:30px;">
                    <button onclick="admit_check()" onclick="location.href='${ pageContext.servletContext.contextPath }/user/select/adsubmit2'">????????????</button></div>
				</div>
            </section>

            
            <!-- ????????? ?????? -->
            <jsp:include page="../../common/banner.jsp"/>

			<!-- ?????? -->
            <jsp:include page="../common/footer.jsp"/>
            
        </div>
            

        <!-- JS includes -->
        <script>
        function selectAll(selectAll)  {
		  const checkboxes = document.getElementsByName('admit');
		  
		  checkboxes.forEach((checkbox) =>  {
		    checkbox.checked = selectAll.checked;
		  })
		}
        
        <!-- ???????????? ????????? -->
        function admit_check() {

        	if (!$("input:checked[id='admit0']").is(":checked")){ 
        		alert("????????? ?????? ???????????? ????????? ?????? ????????? ???????????????.");
        		return false;
        	} else if (!$("input:checked[id='admit1']").is(":checked")){ 
        		alert("????????? ?????? ???????????? ????????? ?????? ????????? ???????????????.");
        		return false;
        	} else if (!$("input:checked[id='admit2']").is(":checked")){ 
        		alert("????????? ?????? ???????????? ????????? ?????? ????????? ???????????????.");
        		return false;
        	} else {
        		return location.href='${ pageContext.servletContext.contextPath }/user/select/adsubmit2';
        	}
        }
        </script>
        

        <script src="${ pageContext.servletContext.contextPath }/resources/js/vendor/jquery-1.11.2.min.js"></script>
        <script src="${ pageContext.servletContext.contextPath }/resources/js/vendor/bootstrap.min.js"></script>

        <script src="${ pageContext.servletContext.contextPath }/resources/js/owl.carousel.min.js"></script>
        <script src="${ pageContext.servletContext.contextPath }/resources/js/jquery.magnific-popup.js"></script>
        <script src="${ pageContext.servletContext.contextPath }/resources/js/jquery.easing.1.3.js"></script>
        <script src="${ pageContext.servletContext.contextPath }/resources/css/slick/slick.js"></script>
        <script src="${ pageContext.servletContext.contextPath }/resources/css/slick/slick.min.js"></script>
        <script src="${ pageContext.servletContext.contextPath }/resources/js/jquery.collapse.js"></script>
        <script src="${ pageContext.servletContext.contextPath }/resources/js/bootsnav.js"></script>



        <script src="${ pageContext.servletContext.contextPath }/resources/js/plugins.js"></script>
        <script src="${ pageContext.servletContext.contextPath }/resources/js/main.js"></script>
</html>