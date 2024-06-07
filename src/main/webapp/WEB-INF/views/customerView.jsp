<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객정보 관리</title>
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: #f8f9fa;
	margin: 0;
	padding: 0;
	height: 100vh;
	display: flex;
	flex-direction: column;
}

.navbar {
	background-color: #343a40;
	color: white;
	padding: 20px 20px; /* 패딩을 증가시켜 높이를 키움 */
}

.navbar a {
	color: white;
	text-decoration: none;
	font-size: 1.5rem;
}

.container-fluid {
	flex: 1;
	display: flex;
	flex-direction: column;
	padding: 10px 20px;
}

.row {
	display: flex;
	flex: 1;
}

.col {
	display: flex;
	flex-direction: column;
	padding: 10px;
}

.card {
	flex: 1;
	display: flex;
	flex-direction: column;
	border: 1px solid #ccc;
	border-radius: 5px;
	background-color: white;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.card-header {
	background-color: #343a40;
	color: white;
	padding: 5px 20px;
	border-bottom: 1px solid #ccc;
	border-radius: 5px 5px 0 0;
}

.card-body {
	flex: 1;
	padding: 20px;
	display: flex;
	flex-direction: column;
}

.card-body input[type="text"] {
	width: 100%;
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-sizing: border-box;
}

.card-body .form-group {
	display: flex;
	margin-bottom: 10px;
}

.card-body .form-group label {
	flex: 0 0 30%;
	padding: 10px;
	box-sizing: border-box;
}

.card-body .form-group input {
	flex: 1;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-sizing: border-box;
}

.card-body .form-group input[readonly] {
	background-color: #e9ecef;
}

.card-body .btn-primary {
	background-color: #007bff;
	color: white;
	padding: 7px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 1rem;
}

.card-body .btn-secondary {
	background-color: #6c757d;
	color: white;
	padding: 7px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 1rem;
}

.buttons {
	display: flex;
	flex-direction: column;
	margin-top: auto;
}

.buttons .btn {
	flex: 1;
	padding: 15px;
	margin: 5px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 1rem;
	width: calc(22% + 3px);
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 1rem;
}

.d-flex.flex-wrap {
	justify-content: space-between;
}

.buttons .btn-primary {
	background-color: #007bff;
	color: white;
}

.buttons .btn-danger {
	background-color: #dc3545;
	color: white;
}

.buttons .btn-secondary {
	background-color: #6c757d;
	color: white;
}

.history {
	flex: 1;
	border: 1px solid #ccc;
	border-radius: 5px;
	padding: 10px;
	overflow-y: auto;
	box-sizing: border-box;
}
</style>
</head>
<body>
	<nav class="navbar">
		<a href="#">고객정보 관리</a>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<div class="col" style="flex: 1;">
				<div class="card">
					<div class="card-header">
						<h2>고객 조회</h2>
					</div>
					<div class="card-body">
						<input type="text" id="searchInput" placeholder="고객 이름을 입력하세요">
						<button class="btn btn-primary">조건 검색</button>
						<button class="btn btn-secondary">전체 검색</button>
						<div id="searchResults">
							<div>
								<input type="radio" name="customer" id="customer1"> <label
									for="customer1">홍길동</label>
							</div>
							<div>
								<input type="radio" name="customer" id="customer2"> <label
									for="customer2">강해라</label>
							</div>
							<div>
								<input type="radio" name="customer" id="customer3"> <label
									for="customer3">나란다</label>
							</div>
							<div>
								<input type="radio" name="customer" id="customer4"> <label
									for="customer4">담나라</label>
							</div>
							<div>
								<input type="radio" name="customer" id="customer5"> <label
									for="customer5">라면다</label>
							</div>
							<div>
								<input type="radio" name="customer" id="customer6"> <label
									for="customer6">박석일</label>
							</div>
							<div>
								<input type="radio" name="customer" id="customer7"> <label
									for="customer7">이성경</label>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col" style="flex: 2;">
				<div class="card">
					<div class="card-header">
						<h2>고객 정보</h2>
					</div>
					<div class="card-body">
						<form action="" method="post" id="frm_update">
							<div class="form-group">
								<label for="FRST_REG_DT">작성일자</label> <input type="text"
									name="FRST_REG_DT" id="FRST_REG_DT">
							</div>
							<div class="form-group">
								<label for="CUST_NM">고객명</label> <input type="text"
									name="CUST_NM" id="CUST_NM">
							</div>
							<div class="form-group">
								<label for="PRIDTF_NO">실명번호</label> <input type="text"
									name="PRIDTF_NO" id="PRIDTF_NO">
							</div>
							<div class="form-group">
								<label for="EML_ADDR">E-mail</label> <input type="text"
									name="EML_ADDR" id="EML_ADDR">
							</div>
							<div class="form-group">
								<label for="HOME_TELNO">전화번호</label> <input type="text"
									name="HOME_TELNO" id="HOME_TELNO">
							</div>
							<div class="form-group">
								<label for="MBL_TELNO">휴대폰번호</label> <input type="text"
									name="MBL_TELNO" id="MBL_TELNO">
							</div>
							<div class="form-group">
								<label for="CR_NM">직업</label> <input type="text" name="CR_NM"
									id="CR_NM">
							</div>
							<div class="form-group">
								<label for="ROAD_NM_ADDR">주소</label> <input type="text"
									name="ROAD_NM_ADDR" id="ROAD_NM_ADDR">
							</div>
							<div class="form-group">
								<label for="FRST_RGTR_SN">관리담당자</label> <input type="text"
									name="FRST_RGTR_SN" id="FRST_RGTR_SN">
								<button type="button" id="searchManagerBtn">🔍</button>
							</div>
							<div class="form-group">
								<label>부서</label> <input type="text" readonly value="관리 2팀">
							</div>
							<div class="form-group">
								<label>직위</label> <input type="text" readonly value="사원">
							</div>
							<div class="form-group">
								<label>연락처</label> <input type="text" readonly
									value="010-2300-4100">
							</div>
						</form>
					</div>
				</div>
			</div>

			<div class="col" style="flex: 1.5;">
				<div class="card">
					<div class="card-header">
						<h2>상담 내역</h2>
					</div>
					<div class="card-body">
						<div class="history">
							<p>2023-09-12 오후 2시 통화 요청함</p>
							<p>2023-09-16 오후 4시 미팅 약속을 오전 10시로 변경</p>
							<p>2023-09-19 오후 2시 청약저축 가입 안내 미팅</p>
						</div>
						<div class="buttons">
							<div class="d-flex flex-wrap mb-1">
								<button class="btn btn-primary">등록</button>
								<button class="btn btn-primary">변경</button>
								<button class="btn btn-primary">삭제</button>
								<button class="btn btn-primary">신규</button>
							</div>
							<div class="d-flex flex-wrap justify-content-space-between">
								<button class="btn btn-danger">고객조회</button>
								<button class="btn btn-secondary">종료</button>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		document.getElementById('searchManagerBtn').addEventListener('click', function() {
		    var managerName = document.getElementById('FRST_RGTR_SN').value;
		    if(managerName) {
		        alert(managerName + " 검색합니다."); // 실제 검색 로직으로 교체 필요
		        // 검색 로직 추가
		    } else {
		        alert("관리담당자 이름을 입력하세요.");
		    }
		});
	</script>
</body>
</html>