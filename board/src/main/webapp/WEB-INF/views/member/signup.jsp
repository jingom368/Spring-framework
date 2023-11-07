<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>회원 등록</title>
    <link href="/resources/css/style.css" rel="stylesheet">
    
</head>
<body>
	<div class="main">
		<h1>회원 등록</h1><br>
		<div class="WriteForm">
			<form id="RegistryForm" name="RegistryForm" method="POST" enctype="multipart/form-data">
				<br><br>
				<input type="file" name="fileUpload" id="imageFile" style="display:none">
				<div class="imageZone" id="imageZone">클릭 후 탐색창에서 사진을 <br>선택해 주세요</div>
				<input type="text" class="input_field" id="userid" name="userid" placeholder="여기에 아이디를 입력해 주세요." onchange="idCheck()">
				<span id="idCheckNotice"></span>
				<input type="text" class="input_field" id="username" name="username" placeholder="여기에 이름을 입력해 주세요.">
				<input type="password" class="input_field" id="password" name="password" placeholder="여기에 패스워드를 입력해 주세요.">
				<input type="password" class="input_field" id="password1" name="password1" placeholder="여기에 패스워드를 한 번 더 입력해 주세요.">
				<div style="width:90%; text-align:left; position:relative; left: 35px; border-bottom: 2px solid #adadad; margin: 10px; padding:10px;">
					성별 : 
					<label><input type="radio" name="gender" value="남성">남성</label>
					<label><input type="radio" name="gender" value="여성">여성</label><br>
					취미 :
					<label><input type="checkbox" id="all" name="all" onclick="selectAll(this)">전체선택</label>
					<label><input type="checkbox" name="hobby" value="음악감상">음악감상</label>
					<label><input type="checkbox" name="hobby" value="영화보기">영화보기</label>
					<label><input type="checkbox" name="hobby" value="스포츠">스포츠</label><br>
					직업 :
					<select name="job" id="">
						<option value="all" disabled selected>-- 아래의 내용 중에서 선택 --</option>
						<option value="회사원">회사원</option>
						<option value="공무원">공무원</option>
						<option value="자영업">자영업</option>
					</select>
					<br>
				</div>
				<input type="text" id="addrSearch" name="addrSearch" class="addrSearch" placeholder="주소를 검색합니다.">
				<input type="button" id="btn_addrSearch" class="btn_addrSearch" value="주소검색"  onclick="searchAddr()">
				<input type="text" id="zipcode" class="input_field" name="zipcode" placeholder="우편번호가 검색되어 입력합니다." readonly>
				<input type="text" id="addr1" class="input_field" name="addr1" placeholder="주소가 검색되어 입력합니다." readonly>
				<input type="text" id="addr2" class="input_field" name="addr2" placeholder="상세주소를 입력하세요.">
				<input type="hidden" id="address" name="address">
				<input type="text" id="telno" class="input_field" name="telno" placeholder="전화번호를 입력하세요.">
				<input type="text" id="email" class="input_field" name="email" placeholder="이메일 주소를 입력하세요.">
				<p style="color:red">일반 사용자 권한으로 등록합니다.</p><br>
				<textarea class="input_content" id="description" cols="100" rows="500" name="description" placeholder="자기 소개를 입력해 주세요">
				</textarea><br>
				<input type="button" id="btnRegister" class="btn_write" value="여기를 클릭하세요." onclick="SignUp()"><br><br>
			</form>
		</div>
	</div>
</body>
	<script>
    	// 전처리 작업이 실무의 40% 차지함
    	window.onload = () => {
   			var imgCheck = "N";
   			var imgZone = document.querySelector('#imageZone');
   			var fileEvent = document.querySelector('#imageFile');
   			console.log(imgZone)
   			
   			console.log(fileEvent)
   			
   			// imageZone 영역 클릭 시 파일이벤트 처리, 자바스크립트에선 이벤트 발생 시에 이벤트 정보를 담고 있는 event(e)라는 객체를 자동 생성.
   			imgZone.addEventListener('click', (e) => {
   				fileEvent.click(e); // 사용자가 만든 UI를 통해 <input type="file">을 클릭하는 것과 같은 효과를 내게 됨.
   				//console.log(e)
   			});
   			
   			fileEvent.addEventListener('change', (e) => {
   				const files = e.target.files; // 선택한 파일 정보가 e.target.files(배열)에 저장
   				showImage(files);
   				//console.log(e)
   			});
   			
   			const showImage = (files) => {
   				imgZone.innerHTML = "";
   				const imgFile = files[0];
   				console.log(imgFile)
   				// console.log(imgFile.type)
   				// console.log(imgFile.type.indexOf("image"))
   				
   				if(imgFile.type.indexOf("image") < 0) {
   					alert("이미지 파일만 올려 주세요");
   					return false;
   				}
   				
   				const reader = new FileReader(); // new 연산자를 통해서 FileReader 객체를 reader가 참조(상속)
   				// console.log("reader : " + reader)
   				reader.onload = function(event) { // reader.readAsDataURL(imgFile)로 이미지를 읽고 나서 해야 할 일
   					// console.log("onload event : " + event)
   					// console.log(reader)
   					// console.log(reader.onload)
   					// console.log(event)
   					
   					imgZone.innerHTML = "<img src=" + event.target.result + " id='uploadImg' style='width:350px; height=auto';>"
   					console.log(event.target.result);
   					console.log(event.target.result.length)
   					// data:image/jpeg;base64,/9j/4v//SUNDX1BST0ZJTEUAA ~
   				};
   				
   				reader.readAsDataURL(imgFile) // 실제로 이미지 파일을 읽는 부분
   				// console.log(reader.readAsDataURL(imgFile))
   				imgCheck = "Y";
   			}
   			
   			btnRegister.addEventListener('click', () => {
   				
   				// 유효성 검사
   				if(imgCheck == 'N') {
   					alert('프로필 이미지를 등록하세요');
   					return false;
   				}
   				
   				// userid.value.trim().replace(/\ /,""); // 실무에는 활용
   				if(userid.value == '' || userid.value == undefined || userid.value == null) {
   					alert('아이디를 입력하세요');
   					userid.focus();
   					return false; 
   				}
   				if(username.value == '') {
   					alert('이름을 입력하세요');
   					username.focus();
   					return false
   				}
   				
   				const Pass = password.value;
   				const Pass1 = password1.value;
   				if(Pass == '') {
   					alert('암호를 입력하세요');
   					password.focus();
   					return false; 
   				}
   				if(Pass1 == '') {
   					alert('암호를 다시 한 번 입력하세요');
   					password1.focus();
   					return false; 
   				}
   				if(Pass != Pass1) {
   					alert('암호를 제대로 입력하세요');
   					password1.focus();
   					return false; 
   				}
   				
   				// 자바스크립트의 정규식(Regular Expression)을 이용해서 암호 규칙 확인
   				// 암호 규칙 1. 8-20자리 내의 영문, 숫자, 특수문자를 조합 
   				
   				
   				// 암호 유효성 검사
   				let num = Pass.search(/[0-9]/g); // 0-9 자리의 숫자가 들어 있는지 검색, 검색해서 값이 없으면 -1을 리턴 / g는 global
   				let eng = Pass.search(/[a-z]/ig); // i : 알파벳 대소문자 구분 없이 검색
   				let spe = Pass.search(/[`~!@#$%^&*|\\\'\";:\/?]/ig); // 특수문자가 포합되어 있는지 검색
   				if(Pass.length < 8 || Pass.length > 20) {
   					alert("암호는 8자리 ~ 20자 이내로 입력해 주세요");
   					return false;
   				} else if (Pass.search(/\s/) != -1 ) {
   					alert("암호는 공백 없이 입력해 주세요.");
   					return false;
   				} else if (num < 0 || eng < 0 || spe < 0) {
   					alert("암호는 영문, 숫자, 특수문자를 혼합하여 입력해 주세요."); 
   					return false;
   				}
   				
   				// const gender = document.querySelectorAll('input[name=gender]:checked');
   				const gender = document.getElementsByName('gender');
   				let genderValue = '';
   				for(i=0; i<gender.length; i++) {
   					if(gender[i].checked === true)
   						genderValue = gender[i].value
   				}
   				
   				if(genderValue == '') {
   					alert('성별을 선택하세요');
   					return false;
   				}
   				
   				const hobby = document.querySelectorAll('input[name=hobby]:checked'); // 유사 배열 // querySelectorAll : 배열 형태
   				// const hobby = document.getElementsByName('hobby');
   				let hobbyArray = []; // ES6+ 문법 : let hobbyArray = new Array
   				for(let i=0; i<hobby.length; i++) {
   					hobbyArray.push(hobby[i].value);
   				}
   				
   				// if(hobbyArray.length == 0) {
   				if(hobbyArray.length == 0) {
   					alert('취미를 선택하세요');
   					return false;
   				}
   				
   				// const job = document.querySelectorAll('select[name=job] option:checked');
   				const job = document.querySelector('select[name=job] option:checked');
   				
   				if(job.value == 'all') {
   					alert('직업을 선택하세요');
   					return false;
   				}
   				
   				if(zipcode.value == '') {
 	   				alert('우편번호를 입력하세요');
 	   				zipcode.focus();
 	   				return false;
 	   			}
   				
   				if(addr2.value == '') {
   					alert('상세 주소를 입력하세요');
   					addr2.focus();
   					return false;
   				}
   				
   				address.value = addr1.value + " " + addr2.value;
   				
   				if(telno.value == '') {
   					alert('전화번호를 입력하세요');
   					telno.focus();
   					return false
   				}
   				const beforeTelno = telno.value;
   				const afterTelno = beforeTelno.replace(/\-/ig,"").replace(/\ /ig,"").trim(); // -가 있으면 ""로 대체, 공백이 있으면 ""로 대체, 문자열 좌우의 공백 없애기.
   				telno.value = afterTelno;
   				
   				if(email.value == '') {
 	   				alert('이메일 주소를 입력하세요');
  	   				email.focus();
  	   				return false
  	   			}
   				
   				// 숙제 = 이메일 유효성 검사 로직 만들기
   				
   				if(description.value == '') {
   					alert('자기소개를 입력하세요');
   					description.focus();
   					return false
   				}
   				
   				// document.RegistryForm.action = '/member/signup';
   				// document.RegistryForm.submit();
   				

   			});	
    	}
    		
		const SignUp = async () => { 
		   	const formData = new FormData(RegistryForm);

			await fetch('/member/signup', {
				method: 'POST',
				body: formData
			}).then((response) => response.json())
				.then((data) => {
				if(data.message == 'GOOD') {
					alert(decodeURIComponent(data.username) + '님, 회원 가입을 축하 드립니다.');
					document.location.href='/board/list?page=1';
				} else {
					alert("서버 장애로 회원 가입에 실패했습니다")
				}
			}).catch((error) => {
				console.log("error = " + error);
			})
		}
   			
    	/* const SignUp = async () => { 
		
		const formData = new FormData();
		const genderValue = document.querySelector('input[name="gender"]:checked').value;
		const hobbyValue = [...document.querySelectorAll('input[name="hobby"]:checked')].map(input => input.value);
		const job = document.querySelector('select[name=job] option:checked');
		address.value = addr1.value + " " + addr2.value;
		formData.append("userid", userid.value);
		formData.append("username", username.value);
		formData.append("password", password.value);
		formData.append("job", job.value);
		formData.append("gender", genderValue);
		formData.append("hobby", hobbyValue);
		formData.append("telno", telno.value);
		formData.append("email", email.value);
		formData.append("zipcode", zipcode.value);
		formData.append("address", address.value);
		formData.append("description", description.value);
		formData.append("pwcheck", 1);
		formData.append("role", 'USER');
		formData.append("fileUpload", document.querySelector('#imageFile').files[0]);
			
			await fetch('/member/signup', { 
				method: "POST",	
				body: formData
			}).then((response) => response.json())
				.then((data) => {
					if(data.message === 'GOOD') {
						document.location.href='/board/list?page=1';
					}else {
						alert("1234");
					}
				}).catch((error) => { 
					console.log("error = " + error);
				})
		} */
   			
		const selectAll = (checkElement) => {
			
			/* if(document.getElementById('all').checked == true)
				for(var i=0; i<document.getElementsByName('hobby').length; i++)
					document.getElementsByName('hobby')[i].checked = true
			if(document.getElementById('all').checked == false)
				for(var i=0; i<document.getElementsByName('hobby').length; i++)
					document.getElementsByName('hobby')[i].checked = false */
					
			const checkboxes = document.getElementsByName('hobby');
			checkboxes.forEach((checkbox) => {
				checkbox.checked = checkElement.checked;
			});
		}
		
		const searchAddr = () => {
			if(addrSearch.value == '') {
				alert('검색할 주소를 입력하세요');
				addrSearch.focus();
				return false;
			}
			
			window.open(
				"/member/addrSearch?page=1&addrSearch=" +addrSearch.value,
				"주소검색",
				"width=900, height=540, top=50, left=50"
			);
		}
		
		const idCheck = async () => { // function async idCheck()			
			const userid = document.querySelector('#userid');

			await fetch('/member/idCheck', {
				method: "POST",
				body: userid.value
			}).then((response) => response.text())
				.then((data) => { 
					console.log(data)
					const idCheckNotice = document.querySelector('#idCheckNotice');
					if(data == 0) {
						idCheckNotice.innerHTML = "사용 가능한 아이디입니다."
					}
					else {
						idCheckNotice.innerHTML = "이미 사용중인 아이디입니다.";	
						userid.value = '';
						userid.focus();
					}
				});
		}
		
		
    </script>
</html>