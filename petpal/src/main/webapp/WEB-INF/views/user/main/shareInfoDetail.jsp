<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <style>
            div > img {
                margin-bottom: 20px;
                text-align: center;
				width: 20%;
            }
            a > img {
                width: 50%;
                height: 50%;
                margin-top: 20px;
                margin-bottom: 10px;
                margin-left: 15px;
                margin-right: 15px;
                text-align: center;
            }
            .menutable > div > img {
                margin-bottom: 20px;
				width: 20%;
                margin: 0px auto;
                display: block;
            }
            .sendmessage > input {
                width: 87%;
                height: 50px;
                border-radius: 10px;
                border: 1px solid rgb(175, 175, 175);
                margin-bottom: 50px;
            }
            .sendmessage > button {
                background-color: #45B99C; 
                color: white;
                border-color: #45B99C; 
                border: 1px solid; 
                width: 10%;
                height: 45px; 
                font-size: 16px; 
                font-weight: 600;
                border-radius: 10px;
                margin-left: 2%;
            }
            .sendmessage > input::placeholder {
                color:#45B99C;
            }
            td > img, span > img{
            	cursor: pointer !important;
            }
            
            .overlay {
  				position: fixed;
				top: 0;
				bottom: 0;
				left: 0;
				right: 0;
				background: rgba(0, 0, 0, 0.7);
				transition: opacity 500ms;
				visibility: hidden;
				opacity: 0;
				z-index: 900;
				height: 150% !important;
			}
			.overlay:target {
				visibility: visible;
				opacity: 1;
			}
			.popup {
				position: fixed;
				width: 60%;
				padding: 10px;
				max-width: 500px;
				border-radius: 10px;
				top: 50%;
				left: 50%;
				transform: translate(-50%, -50%);
				background: rgba(255, 255, 255, .9);
				-webkit-transition: opacity .5s, visibility 0s linear .5s;
				transition: opacity .5s, visibility 0s linear .5s;
				z-index: 1;
			}
			.popup:target {
				visibility: visible;
				opacity: 1;
				-webkit-transition-delay: 0s;
				transition-delay: 0s;
			}
			.popup-close {
				position: absolute;
				padding: 10px;
				max-width: 500px;
				border-radius: 10px;
				top: 50%;
				left: 50%;
				transform: translate(-50%, -50%);
				background: rgba(255, 255, 255, .9);
			}
			.popup .close {
				position: absolute;
				right: 5px;
				top: 5px;
				padding: 5px;
				color: #000;
				transition: color .3s;
				font-size: 2em;
				line-height: .6em;
			}
			.popup .close:hover {
				color: #007a5c;
			}
            .btn_submit, .certification {
                background-color: #45B99C; 
                height: 45px;
                color: white;
                border-color: #45B99C; 
                border: 1px solid; 
                font-size: 16px; 
                font-weight: 500;
                border-radius: 10px;
                width: 100px;
            }
            td > button {
            	float: right;
    			border-radius: 5px;
    			border: 1px solid;
    			color: #45B99C;
    			background: white;
            }
            td > button:hover {
            	float: right;
    			border-radius: 10px;
    			background-color: #45B99C;
                color: white;
                border-color: #45B99C; 
                border: 1px solid;
            }
            #underline-btn {
            	float: right;
    			border: none;
    			color: #45B99C;
    			background: white;
    			height: 40px;
    			width: 100px;
                font-size: 15px;
            }
            #underline-btn:hover {
            	float: right;
    			border-radius: 15px;
    			background-color: white;
                color: #45B99C;
                border-color: #45B99C; 
                border: 1px solid;
                height: 40px;
                width: 100px;
                font-size: 15px;
            }
            .findpwd-content > div, .findpwd-content > form > div {
                margin: 0px auto;
            }
           
        </style>
        <meta charset="utf-8">
        <title>PET-PAL</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="image/png" href="favicon.ico">
		<script>
		    const message = '${ requestScope.message }';
		    if(message != null && message !== '') {
		    	alert(message);
		    }
		</script>
    </head>
            <jsp:include page="../common/userHeader.jsp"/>


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


            <!--Home Sections-->

            <section id="board" class="board" style="width: 70%; margin: 0px auto;  margin-bottom: 20px;">
                <div style="color: #45B99C; font-size: 25px; font-weight: 600; float: left">?????? ?????? ??????</div>
                <img src="${ pageContext.servletContext.contextPath }/resources/images/back.png" onclick="location.href='${ pageContext.servletContext.contextPath }/user/select/shareInfo/list'" style="width:50px; float: right; cursor: pointer !important;">
            </section>

			<div class="blog-list" style="position: absolute; top:25%; width: 15%; margin-top: 45px;">
				<nav>
					<ul style="margin-left: 30%;">
						<li style="text-align: center;" class="blog-list"><a href="${ pageContext.servletContext.contextPath }/user/select/shareInfo/list" style="color: #45B99C; font-size: 1.3em; font-weight: 600;">?????? ?????? ??????</a></li>
						<hr style="margin-right: 10%; margin-left: 10%; border-color: lightgray;">
						<li style="text-align: center;" class="blog-list"><a href="${ pageContext.servletContext.contextPath }/user/select/sharePlace/list" style="color: #979797;">???????????? ????????????</a></li>
					</ul>
				</nav>
			</div>

            <section id="menutable" class="menutable">
				<div style="width: 70%; border: 1px solid rgba(175, 175, 175, 0.616); margin: 0px auto; border-radius: 20px; margin-bottom: 10px;">
		            <table class="table" style="margin-bottom: 50px; border-collapse: separate;">
						<tr>
							<td style="text-align: center; background-color: #F1FAF8; border-radius: 21px 0px 0px 0px;"><b>??????</b></td>
							<td><c:out value="${ requestScope.shareInfoDetail.boardTitle }"/></td>
							<td style="text-align: center; background-color: #F1FAF8;"><b>?????????</b></td>
							<td style="border-radius: 0px 21px 0px 0px;"><c:out value="${ requestScope.shareInfoDetail.boardViews }"/>
							<span>
								<c:if test="${ requestScope.shareInfoDetail.userCode != sessionScope.loginUser.code && !empty sessionScope.loginUser.code }">
									<img onclick="location.href='#reportPost'" src="${ pageContext.servletContext.contextPath }/resources/images/report.jpg" style="width: 25px; float:right; margin-right: 10px;">
								</c:if>
							</span></td>
						</tr>
						<tr>
							<td style="text-align: center; background-color: #F1FAF8;"><b>?????????</b></td>
							<td><c:out value="${ requestScope.shareInfoDetail.userNickName }"/><button onclick="location.href='#directMessage'">???????????????</button></td>
							<td style="text-align: center; background-color: #F1FAF8;"><b>?????? ??????</b></td>
							<td><c:out value="${ requestScope.shareInfoDetail.boardPostDate }"/></td>
						</tr>
					</table>
					<div style="margin-bottom: 30px; text-align:center;">
						<c:out value="${ requestScope.shareInfoDetail.boardContent }" escapeXml="false"/>
					</div>
		        </div>
		        
		        <!-- ????????? ???????????? login ????????? ????????? ??? ???????????? ?????? ????????? -->
		        <div style="width: 70%; margin: 0px auto; margin-bottom: 50px; text-align:right;">
		        	<c:if test="${sessionScope.loginUser.code eq requestScope.shareInfoDetail.userCode}">
		        		<button style="margin-right:10px;" id="underline-btn" onclick="location.href='${ pageContext.servletContext.contextPath }/user/select/shareInfo/modify?boardCode=${ requestScope.shareInfoDetail.boardCode }'">????????????</button>
		        	</c:if>
		        </div>
		        
				<div style="color: #45B99C; width: 70%; margin: 0px auto; font-weight: 550; margin-top:40px; margin-bottom: 10px;">?????? ??????</div>
				<div style="margin-bottom: 40px;">
					<table class="table" style="margin-bottom: 50px; width: 70%; margin: 0px auto;">
				    	<tbody>
				    		<c:forEach var="arr" items="${ shareInfoReply }">
					            <c:if test="${ arr.replyDeleteYN eq 'N' }">
					            	<c:if test="${ arr.reportYN eq 'N' }">
			                        	<tr>
			                            	<td><c:out value="${ arr.userNickName }"/></td>
			                            	<td><c:out value="${ arr.replyContent }"/></td>
			                            	<td style="text-align: center;"><c:out value="${ arr.replyDate }"/></td>
			                            	<input type="hidden" value="${ arr.replyCode }" name="replyCode" class="replyCode"/>
			                            	<input type="hidden" value="${ arr.userCode }" name="userCode1" class="userCode1"/>
			                            	<%-- <td><img onclick="location.href='#reportComment'" src="${ pageContext.servletContext.contextPath }/resources/images/report.jpg" style="width: 25px" class="replyReport"></td> --%>
			                            	<td>
			                            		<c:if test="${ arr.userCode != sessionScope.loginUser.code && !empty sessionScope.loginUser.code }">
			                            			<img onclick="report(this)" class="${ arr.replyCode }" title="${ arr.userCode }" src="${ pageContext.servletContext.contextPath }/resources/images/report.jpg" style="width: 25px">
			                            		</c:if>
			                            	</td>
			                        	</tr>
		                        	</c:if>
		                        	<c:if test="${ arr.reportYN eq 'Y' }">
			                        	<tr>
			                            	<td><c:out value="${ arr.userNickName }"/></td>
			                            	<td><del>????????? ?????? ????????? ???????????????.</del></td>
			                            	<td style="text-align: center;"><c:out value="${ arr.replyDate }"/></td>
			                            	<td></td>
			                        	</tr>
	                        		</c:if>
	                        	</c:if>
	                        	<c:if test="${ arr.replyDeleteYN eq 'Y' }">
			                        <tr>
			                        	<td><c:out value="${ arr.userNickName }"/></td>
			                        	<td><del>????????? ???????????????.</del></td>
			                        	<td style="text-align: center;"><c:out value="${ arr.replyDate }"/></td>
			                        	<td></td>
			                        </tr>
	                        	</c:if>
				            </c:forEach>
				        </tbody>
				    </table>
			    </div>
            </section>
            
            <c:if test="${ !empty sessionScope.loginUser.code }">
	            <form action="${ pageContext.servletContext.contextPath }/user/insert/shareInfo/reply" method="post">
		            <section id="sendmessage" class="sendmessage" style="width: 70%; margin: 0px auto; margin-bottom: 50px;">
		                <input type="text" name="replyContent" id="messagecontent" placeholder="  message" required>
		                <input type="hidden" name="boardCode" value="${ requestScope.shareInfoDetail.boardCode }">
		                <button class="sendmessagecontent">?????? ??????</button>
		            </section>
		        </form>
	        </c:if>

            <!-- ????????? ?????? -->
            <jsp:include page="../../common/banner.jsp"/>

            
            <!-- ????????? ?????? ????????? -->
            <form action="${pageContext.servletContext.contextPath }/user/insert/shareInfo/report" method="post">
	            <div id="reportPost" class="overlay">
	                <div class="popup">
	                    <a href="" class="close">&times;</a>
	                    <p style="font-size: 20px; text-align: center; padding-bottom: 10px; margin-top: 10px;">????????? ??????</p>
	                    <div class="findpwd-content" id="contStep02" style="display: block;">
	                        <div class="cont-step_preface">
	                            <hr style="border:0.5px solid #A8A8A8;">
	                        </div>
	                        <!-- ?????? ?????? ?????? -->
	                        <div style="text-align: center; margin-top: 30px; width: 80%;"><input type="text" name="reportContent" placeholder="??????????????? ???????????????" required style="height: 200px; width: 100%; border-radius: 10px; border: 1px solid;"></div>
	                        <input type="hidden" value="${ requestScope.shareInfoDetail.boardCode }" name="boardCode">
	                        <div style="text-align: center; margin-top: 30px;"><button type="button" class="btn_submit" onclick="location.href='#completeReport'">????????????</button></div>
	                    </div>
	                </div>
	            </div>
	            <!-- ?????? ?????? ????????? -->
	            <div id="completeReport" class="overlay">
	                <div class="popup">
		                <img alt="warning" src="${ pageContext.servletContext.contextPath }/resources/images/warning.png" style="width: 120px; margin: 0px auto; margin-left: 220px; margin-bottom: -70px;">
		                <p style="font-size: 30px; text-align: center; font-weight:bold; margin-top: 50px;">
		                   	????????? ??????????????? ?????????????????????.<br>
		                </p>
		                <p style="font-size: 20px; text-align: center; padding-bottom: 10px; margin-top: 20px;">
		                   	????????? ?????? ????????? 1~2??? ????????? ??? ?????????<br>
		                   	?????? ???????????? ?????? ???????????????.
		                </p>
	                    <div style="text-align: center; margin-top: 30px;"><button class="btn_submit">??????</button></div>
	                </div>
	            </div>
	        </form>
			
			
			<!-- ?????? ?????? ????????? -->
            <form action="${pageContext.servletContext.contextPath }/user/insert/shareInfo/reportReply" method="post">
	            <div id="reportComment" class="overlay">
	                <div class="popup">
	                    <a href="" class="close">&times;</a>
	                    <p style="font-size: 20px; text-align: center; padding-bottom: 10px; margin-top: 10px;">?????? ??????</p>
	                    <div class="findpwd-content" id="contStep02" style="display: block;">
	                        <div class="cont-step_preface">
	                            <hr style="border:0.5px solid #A8A8A8;">
	                        </div>
	                        <!-- ?????? ?????? ?????? -->
	                        <div style="text-align: center; margin-top: 30px; width: 80%;"><input type="text" name="replyReportContent" placeholder="??????????????? ???????????????" required style="height: 200px; width: 100%; border-radius: 10px; border: 1px solid;"></div>
	                        <div style="text-align: center; margin-top: 30px;"><button type="button" class="btn_submit" onclick="location.href='#completeReport2'">????????????</button></div>
	                        <input type="hidden" name="inputReplyCode" id="inputReplyCode">
	                        <input type="hidden" name="inputuserCode1" id="inputuserCode1">
	                        <input type="hidden" value="${ requestScope.shareInfoDetail.boardCode }" name="boardCode">
	                    </div>
	                </div>
	            </div>
	            <!-- ?????? ?????? ????????? -->
	            <div id="completeReport2" class="overlay">
	                <div class="popup">
	                    <p style="font-size: 30px; text-align: center; font-weight:bold; margin-top: 50px;">
	                     	????????? ??????????????? ?????????????????????.<br>
	                    </p>
	                    <p style="font-size: 20px; text-align: center; padding-bottom: 10px; margin-top: 20px;">
	                     	????????? ?????? ????????? 1~2??? ????????? ??? ?????????<br>
	                     	?????? ???????????? ?????? ???????????????.
	                    </p>
	                    <div style="text-align: center; margin-top: 30px;"><button class="btn_submit">??????</button></div>
	                </div>
	            </div>
            </form>			
			
			<script>
				function report (reply) {
				
					let replyCode = reply.className;
					let userCode1 = reply.title;
					
					document.getElementById("inputReplyCode").value = replyCode;
					document.getElementById("inputuserCode1").value = userCode1;
					
					location.href = '#reportComment';
				}
			</script>
			
			
			<!-- ?????? ????????? -->
            <form action="${pageContext.servletContext.contextPath }/user/insert/shareInfo/message" method="post">
	            <div id="directMessage" class="overlay">
	                <div class="popup">
	                    <a href="" class="close">&times;</a>
	                    <p style="font-size: 20px; text-align: left; padding-bottom: 10px; margin-top: 10px;">????????? : <c:out value="${ requestScope.shareInfoDetail.userNickName }"/></p>
	                    <div class="findpwd-content" id="contStep02" style="display: block;">
	                        <!-- ?????? ?????? ?????? -->
	                        <div style="text-align: center; margin-top: 30px; width: 100%;"><input type="text" name="messageContent" placeholder="????????? ???????????????" required style="height: 200px; width: 100%; border-radius: 10px; border: 1px solid;"></div>
	                        <div style="text-align: center; margin-top: 30px;"><button class="btn_submit">?????????</button></div>
	                        <input type="hidden" value="${ requestScope.shareInfoDetail.userCode }" name="userCode1">
	                        <input type="hidden" value="${ requestScope.shareInfoDetail.boardCode }" name="boardCode">
	                        <input type="hidden" value="${ requestScope.shareInfoDetail.userNickName }" name="receiveUserNick">
	                    </div>
	                </div>
	            </div>
	            
	            <!-- ?????? ?????? ????????? -->
	            <!-- <div id="completeMessage" class="overlay">
	                <div class="popup">
	                    <p style="font-size: 30px; text-align: center; font-weight:bold; margin-top: 50px;">
	                     	?????? ????????? ?????????????????????.<br>
	                    </p>
	                    <p style="font-size: 20px; text-align: center; padding-bottom: 10px; margin-top: 20px;">
	                     	?????? ????????? ????????????????????? ?????? ???????????????.
	                    </p>
	                    <div style="text-align: center; margin-top: 30px;"><button class="btn_submit">??????</button></div>
	                </div>
	            </div> -->
            </form>
            
            
            <!-- ?????? -->
            <jsp:include page="../common/footer.jsp"/>
        </div>
        
</html>