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
		                	<div style="color: #45B99C; font-size: 25px; font-weight: 600; float:left; ">동물의 정보는 어떻게 되나요?
		                	<hr style="border: 1px solid #000000; width: 1066px;height: 0px;left: 177.5px;">
		                	</div>
		                	
								<tr>
									<td>품종</td>
									<td>
										<label style="font-size: 15px; font-weight: normal; padding-right: 30px;"><input type="radio" name="dogOrcat" value="C" checked> 고양이</label>
										<label style="font-size: 15px; font-weight: normal; padding-right: 30px;"><input type="radio" name="dogOrcat" value="D" > 강아지</label>
										<input type="text" id="ownerName" name ="adoptBreed" style="width: 130px; background: #F1FAF8;"placeholder=" 예시) 닥스훈트" required >								
									</td>
								</tr>	
								<tr>
									<td>성별</td>
									<td>
										<label style="font-size: 15px; font-weight: normal; padding-right: 30px;"><input type="radio" name="adoptGender" value="F" checked> 암컷</label>
										<label style="font-size: 15px; font-weight: normal; padding-right: 30px;"><input type="radio" name="adoptGender" value="M" > 수컷</label>								
									</td>
								</tr>
								<tr>
									<td>나이</td>
									<td><input type="text" name="adoptAge" id="adoptAge" style="width: 80px; background: #F1FAF8;" required>  살</td>
								</tr>
								<tr>
									<td>몸무게</td>
									<td><input type="text" name="adoptWeight" id="adoptWeight" style="width: 80px; background: #F1FAF8;" required>  KG</td>
								</tr>
								<tr>
									<td>색상</td>
									<td><input type="text" name="adoptColor" id="adoptColor" style="width: 180px; background: #F1FAF8;" required>  </td>
								</tr>
								<tr>
									<td>사는곳</td>
									<td><input type="text" name="address" id="address" style="width: 180px; background: #F1FAF8;" placeholder="예시) 서울시 강남구" required></td>
								</tr>
								<tr>
									<td>소개</td>
									<td><textarea rows="3" name="adoptIntroduce" id="textArea" class="input-xlarge" style="background: #F1FAF8;"
									placeholder=" 예시) 소심하지만 사람을 좋아하는 아이입니다. 부디 이 아이의 평생 가족을 찾을 수 있게 해주세요. 현재 곰팡이 질환을 앓고 있어요 지금 치료중이지만 피부가 약해진 아이니 꼭 유의해주셔야해요 &#13;&#10;입양신청때 제가 더 필요로 하는 서류가 있어서 모두 충족시킬 수 있는 책임감 있으신 분을 찾고있어요!"
									required></textarea></td>
									
								</tr>
								<tr>
									<td>사진</td>
									<td>
										<div class="mb-3" style="border-color: none;">
										  <input type="file" name="picture" id="file" onchange="fileChange(this);" multiple="multiple" style="width: 300px; background: #F1FAF8;" required>
										</div>
									</td>
								</tr>
								
								</table>
								<table style="width: 80%; margin-left: 30px; margin-top: 20px; margin-bottom: 20px;  ">
								<div style="color: #45B99C; font-size: 25px; font-weight: 600; float:left; ">보호자님 연락은 어떻게 할까요?
		                			                	<hr style="border: 1px solid #000000; width: 1066px;height: 0px;left: 177.5px;">
		                	</div>
								
								<tr>
									<td>연락처</td>
									<td><input type="text" name="adoptPhone" id="adoptPhone" style="width: 240px; background: #F1FAF8;" placeholder=" 예시) 010-1234-5678" required></td>
								</tr>
								<tr>
									<td>주의사항</td>
									<td><input type="text" name="adoptCaution" id="adoptCaution" style="width: 330px; background: #F1FAF8;" placeholder=" 예시) 밤 8시이후는 문자로 부탁드립니다." required></td>
								</tr>
									
						</table>
                    	<div style="margin: 0px auto; text-align: center; margin-bottom: 50px"><button type="button" id="registAdopt" onclick="submitAdoptWrite();">글올리기</button></div>
	                	</div>
	                	</form>
            </section>

            
            <!-- 오른쪽 배너 -->
            <jsp:include page="../../common/banner.jsp"/>
            
            <script>
            
            var imageData = {};
            
       			function fileChange(a){
       				
       				var formdata = new FormData();
       				
       				// 사진 4장 limit로  4장 이상 이하 분기문 처리
       				if(a.files.length == 0){
       					alert("0개 이상의 파일이 입력 되었습니다. 최소 한장은 넣어주세요!");
       				};
       				
       				if(a.files.length > 4){
       					alert("4장 초과로 사진이 첨부되었습니다. 4장만 추가해주세요!");
       					$j3("#file").val('');
       				};
       				
       				if(a.files.length>0 && a.files.length<5){
       				
	       				//사진이 여러개일 수 있어서 반복문 실행
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
								
								// imageData는 전역변수
				            	imageData = data;
							}
						});
       				};
       			};
       			
       			//serializeObject function을 사용하기위해 만든 함수
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
       			
				// 게시글 최종 저장 function
       			function submitAdoptWrite(){
					
       				var formMap = new Map();
       				var jsonObject = {};
       				var formData = $j3('#adoptInfo').serializeObject();
       				
					// input tag에 있는 글과 json type으로 있는 image 정보를 한번에 Map에 담는다
       				formMap.set("formData", formData);
       				formMap.set("imageData", imageData);
       				
       				formMap.forEach((value,key)=>{
       					jsonObject[key] = value;
       				});
       				
       				//JsonStringify로 변환할때 Map 객체 불가 => Array로 변환 필수 
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
			            		
			            		alert("게시글 등록이 완료되었습니다.");
			            		//저장 후 상세페이지로 이동
			            		location.href="${ pageContext.servletContext.contextPath }/user/adopt/detail/"+boardCode;
			            	}else{
			            		alert("게시글 등록에 실패하였습니다. 다시 등록 부탁드리겠습니다.");
			            	}
						}
					});
       				
       			};
       			
            </script>

            <!-- 푸터 -->
            <jsp:include page="../common/footer.jsp"/>
        </div>
        
</html>