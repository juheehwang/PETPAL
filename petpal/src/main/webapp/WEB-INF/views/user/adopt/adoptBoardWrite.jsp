<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
			td > button {
				background-color: #45B99C; 
                color: white;
                border-color: #45B99C; 
                border: 1px solid; 
                width: 10px; 
                height: 15px;
                border-radius: 10px;
				margin-left: 5px;
			}
			td > button:hover {
				background-color: white; 
                color: #45B99C;
                border-color: white; 
                border: 1px solid;
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
                width: 130px;
                margin-right: 20px;
            }
            tr, td {
            	font-size: 17px;
				height: 70px;
				text-align: left;
			}
			td > input {
            	height: 40px;
                width: 95%;
                border-radius: 10px;
                border: 1px solid rgb(175, 175, 175);
            }
            td > textarea {
            	height: 130px;
                width: 95%;
                border-radius: 10px;
                border: 1px solid rgb(175, 175, 175);
                resize: vertical;
            }
            input::placeholder {
			  color: #A5A5A5;
			}
			textarea::placeholder {
			  color: #A5A5A5;
			}
			
			.box-file-input label{
			  display:inline-block;
			  background:#45B99C;
			  color:#fff;
			  padding:0px 15px;
			  line-height:35px;
			  cursor:pointer;
			}
        </style>
        


        <script src="${ pageContext.servletContext.contextPath }/resources/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
    	
	   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	   <script>
         var $j3 = jQuery.noConflict();
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
                
            </section> <!--End off Home Sections-->
            <section id="menutable" class="menutable">
	            		<form id="adoptInfo" method="post">
	            		<input type="hidden" name = "userCode" id="userCode" value = ${sessionScope.loginUser.code}>
						<div style="width: 55%;  margin: 0px auto;  margin-bottom: 50px; ">
		                	<table style="width: 80%; margin-left: 30px; margin-top: 20px; margin-bottom: 20px; ">
		                	<div style="color: #45B99C; font-size: 25px; font-weight: 600; float:left; ">????????? ????????? ????????? ??????????
		                	<hr style="border: 1px solid #000000; width: 1066px;height: 0px;left: 177.5px;">
		                	</div>
		                	
								<tr>
									<td>??????</td>
									<td>
										<label style="font-size: 15px; font-weight: normal; padding-right: 30px;"><input type="radio" name="dogOrcat" value="C" checked> ?????????</label>
										<label style="font-size: 15px; font-weight: normal; padding-right: 30px;"><input type="radio" name="dogOrcat" value="D" > ?????????</label>
										<input type="text" id="ownerName" name ="adoptBreed" style="width: 130px; background: #F1FAF8;"placeholder=" ??????) ????????????" required >								
									</td>
								</tr>	
								<tr>
									<td>??????</td>
									<td>
										<label style="font-size: 15px; font-weight: normal; padding-right: 30px;"><input type="radio" name="adoptGender" value="F" checked> ??????</label>
										<label style="font-size: 15px; font-weight: normal; padding-right: 30px;"><input type="radio" name="adoptGender" value="M" > ??????</label>								
									</td>
								</tr>
								<tr>
									<td>??????</td>
									<td><input type="text" name="adoptAge" id="adoptAge" style="width: 80px; background: #F1FAF8;" required>  ???</td>
								</tr>
								<tr>
									<td>?????????</td>
									<td><input type="text" name="adoptWeight" id="adoptWeight" style="width: 80px; background: #F1FAF8;" required>  KG</td>
								</tr>
								<tr>
									<td>??????</td>
									<td><input type="text" name="adoptColor" id="adoptColor" style="width: 180px; background: #F1FAF8;" required>  </td>
								</tr>
								<tr>
									<td>?????????</td>
									<td><input type="text" name="address" id="address" style="width: 180px; background: #F1FAF8;" placeholder="??????) ????????? ?????????" required></td>
								</tr>
								<tr>
									<td>??????</td>
									<td><textarea rows="3" name="adoptIntroduce" id="textArea" class="input-xlarge" style="background: #F1FAF8;"
									placeholder=" ??????) ??????????????? ????????? ???????????? ???????????????. ?????? ??? ????????? ?????? ????????? ?????? ??? ?????? ????????????. ?????? ????????? ????????? ?????? ????????? ?????? ?????????????????? ????????? ????????? ????????? ??? ???????????????????????? &#13;&#10;??????????????? ?????? ??? ????????? ?????? ????????? ????????? ?????? ???????????? ??? ?????? ????????? ????????? ?????? ???????????????!"
									required></textarea></td>
									
								</tr>
								<tr>
									<td>??????</td>
									<td>
										<div class="mb-3" style="border-color: none;">
										  <input type="file" name="picture" id="file" onchange="fileChange(this);" multiple="multiple" style="width: 300px; background: #F1FAF8;" required>
										</div>
									</td>
								</tr>
								
								</table>
								<table style="width: 80%; margin-left: 30px; margin-top: 20px; margin-bottom: 20px;  ">
								<div style="color: #45B99C; font-size: 25px; font-weight: 600; float:left; ">???????????? ????????? ????????? ??????????
		                			                	<hr style="border: 1px solid #000000; width: 1066px;height: 0px;left: 177.5px;">
		                	</div>
								
								<tr>
									<td>?????????</td>
									<td><input type="text" name="adoptPhone" id="adoptPhone" style="width: 240px; background: #F1FAF8;" placeholder=" ??????) 010-1234-5678" required></td>
								</tr>
								<tr>
									<td>????????????</td>
									<td><input type="text" name="adoptCaution" id="adoptCaution" style="width: 330px; background: #F1FAF8;" placeholder=" ??????) ??? 8???????????? ????????? ??????????????????." required></td>
								</tr>
									
						</table>
                    	<div style="margin: 0px auto; text-align: center; margin-bottom: 50px"><button type="button" id="registAdopt" onclick="submitAdoptWrite();">????????????</button></div>
	                	</div>
	                	</form>
            </section>

            
            <!-- ????????? ?????? -->
            <jsp:include page="../../common/banner.jsp"/>
            
            <script>
            
            var imageData = {};
            
       			function fileChange(a){
       				
       				var formdata = new FormData();
       				
       				// ?????? 4??? limit???  4??? ?????? ?????? ????????? ??????
       				if(a.files.length == 0){
       					alert("0??? ????????? ????????? ?????? ???????????????. ?????? ????????? ???????????????!");
       				};
       				
       				if(a.files.length > 4){
       					alert("4??? ????????? ????????? ?????????????????????. 4?????? ??????????????????!");
       					$j3("#file").val('');
       				};
       				
       				if(a.files.length>0 && a.files.length<5){
       				
	       				//????????? ???????????? ??? ????????? ????????? ??????
	       				for(var i =0; i<a.files.length;i++){
	       					formdata.append('file', a.files[i]);
	       				}
						
	       				$j3.ajax({
							data : formdata,
							type : "POST",
							url : "${ pageContext.servletContext.contextPath }/api/adopt/changeImg",
							contentType : false,
							processData : false,
							enctype:'multipart/form-data',
							success : function(data) {
								
								// imageData??? ????????????
				            	imageData = data;
							}
						});
       				};
       			};
       			
       			//serializeObject function??? ?????????????????? ?????? ??????
       			$j3.fn.serializeObject = function() {
					var o = {};
					var a = this.serializeArray();
					$.each(a, function() {
						if (o[this.name]) {
							if (!o[this.name].push) {
								o[this.name] = [o[this.name]];
							}
							o[this.name].push(this.value || '');
						} else {
							o[this.name] = this.value || '';
						}
					});
					return o;
				};
       			
				// ????????? ?????? ?????? function
       			function submitAdoptWrite(){
					
       				var formMap = new Map();
       				var jsonObject = {};
       				var formData = $j3('#adoptInfo').serializeObject();
       				
					// input tag??? ?????? ?????? json type?????? ?????? image ????????? ????????? Map??? ?????????
       				formMap.set("formData", formData);
       				formMap.set("imageData", imageData);
       				
       				formMap.forEach((value,key)=>{
       					jsonObject[key] = value;
       				});
       				
       				//JsonStringify??? ???????????? Map ?????? ?????? => Array??? ?????? ?????? 
       				var finalData = JSON.stringify(jsonObject);
       				
       				$j3.ajax({
						data : finalData,
						type : "POST",
						dataType:'json',
						url : "${ pageContext.servletContext.contextPath }/api/adopt",
						contentType : 'application/json; charset=utf-8',
						processData : false,
						success : function(data) {
							if(data.message=="OK"){
			            		console.log(data);
			            		var boardCode = data.data.result.adoptDTO.boardCode;
			            		
			            		alert("????????? ????????? ?????????????????????.");
			            		//?????? ??? ?????????????????? ??????
			            		location.href="${ pageContext.servletContext.contextPath }/user/adopt/detail/"+boardCode;
			            	}else{
			            		alert("????????? ????????? ?????????????????????. ?????? ?????? ????????????????????????.");
			            	}
						}
					});
       				
       			};
       			
            </script>

            <!-- ?????? -->
            <jsp:include page="../common/footer.jsp"/>
        </div>
        
</html>