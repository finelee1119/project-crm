	<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>고객정보 관리</title>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>
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
							<button class="btn btn-primary" id="search">조건 검색</button>
							<button class="btn btn-secondary" id="searchAll">전체 검색</button>
							<div id="searchResults">
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
							<div class="history" id="content">
								
							</div>
							<div class="buttons">
								<div class="d-flex flex-wrap mb-1">
									<button class="btn btn-primary">등록</button>
									<button class="btn btn-primary">변경</button>
									<button class="btn btn-primary">삭제</button>
									<button class="btn btn-primary" id="res">신규</button>
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
			
			
			var allData;
			$(document).ready(function() {		
				let now = new Date();
			    let year = now.getFullYear();
			    let month = now.getMonth() + 1;
			    let day = now.getDate();
				$("#FRST_REG_DT").val(
						year + '-' + (month < 10 ? '0' + month : month) + '-' + (day < 10 ? '0' + day : day)
						);
				
				$(document).on("click", "input:radio[name='result']", function(){
					var targetValue = $(this).val(); // 라디오 버튼의 값(value)을 가져옵니다.
				    var keyname = "keyword";
				    var obj = {};
				    obj[keyname] = targetValue; // 가져온 값을 객체에 설정합니다.
				
				    $.ajax({
				        url: "<c:url value='/TextLogAjax' />",
				        type: "post",
				        data: JSON.stringify(obj), // 객체를 JSON 문자열로 변환하여 전송합니다.
				        dataType: "json",
				        contentType: "application/json", // Content-Type을 JSON으로 설정합니다.
				        success: function(data) {
				        	 var content = "";
				        	    data.forEach(function(dto) {
				        	        content += "날짜: " + dto.date + "<br>";
				        	        content += "내용: " + dto.content + "<br><br>";
				        	    });
				        	    $("#content").html(content);
				        	},
				        error: function(errorThrown) {
				            alert(errorThrown.statusText);
				        }
				    });
				});
				
				$("#search").on("click", function() {
				    var keyword = $("#searchInput").val().trim();
				    if (keyword == "") {
				      alert('아이디를 입력하세요')
				    } else {
				      var keyname = "keyword";
				      var obj = {};
				      obj[keyname] = keyword;
				      $.ajax({
				        url : "<c:url value='/searchAjax' />",
				        type : "post",
				        data : JSON
				            .stringify(obj),
				        dataType : "json",
				        contentType : "application/json",
				        success : function(data) {
				          $("#searchResults").empty();
				          for (var i = 0; i < data.length; i++) {
				            if(i == 0){
				            	var str = "<label><input type='radio' value='" + data[i].cust_NM + "' name='result' class='result' checked>"
				                + data[i].cust_NM
				                + "</label><br>";
				                + "</label><br>";
					            console.log(str);
					            $("#searchResults").append(str);
				            	var strContent = "<td>" + data[i].a_name + "</td><td>" + data[i].a_phone + "</td>"
				            	$("#content").html(strContent);
				            } else {
				            	var item = data[i].cust_NM;
				            	console.log(data[i].cust_NM)
				            	var str = "<label><input type='radio' id='" + data[1].cust_SN + "' name='result'>"
				                + data[i].cust_NM
				                + "</label><br>";
					            $("#searchResults").append(str);
				            }
				          }
				        },
				        error : function(
				            errorThrown) {
				          alert(errorThrown.statusText);
				        }
				      });
					}
				    });
				
				$("#searchAll").on("click", function() {
				      var obj = {};
				      $.ajax({
				        url : "<c:url value='/searchAllAjax' />",
				        type : "post",
				        data : JSON
				            .stringify(obj),
				        dataType : "json",
				        contentType : "application/json",
				        success : function(data) {
				          $("#searchResults").empty();
				          for (var i = 0; i < data.length; i++) {
				            if(i == 0){
				            	var str = "<label><input type='radio' value='" + data[i].cust_NM + "' name='result' class='result' checked>"
				                + data[i].cust_NM
				                + "</label><br>";
					            console.log(str);
					            $("#searchResults").append(str);
				            	var strContent = "<td>" + data[i].a_name + "</td><td>" + data[i].a_phone + "</td>"
				            	$("#content").html(strContent);
				            } else {
				            	var item = data[i].cust_NM;
				            	console.log(data[i].cust_NM)
				            	var str = "<label><input type='radio' value='" + data[i].cust_NM + "' name='result'>"
				                + data[i].cust_NM
				                + "</label><br>";
					            $("#searchResults").append(str);
				            }
				          }
				        },
				        error : function(
				            errorThrown) {
				          alert(errorThrown.statusText);
				        }
				      });
				    });
				
				$("#res").on("click",function(){
					$("#frm_update").each(function() {
					    this.reset();
					});
					let now = new Date();
				    let year = now.getFullYear();
				    let month = now.getMonth() + 1;
				    let day = now.getDate();
					$("#FRST_REG_DT").val(
							year + '-' + (month < 10 ? '0' + month : month) + '-' + (day < 10 ? '0' + day : day)
							);
				});
				
				$(document).on("click", "input:radio[name='result']", function(){
					var targetId = $(this).val();
				    var keyname = "keyword";
				    var obj = {};
				    var cust_SN;
				    var cust_NM;
				    var vbrdt;
				    var home_TELNO;
				    var mbl_TELNO ;
				    var pridtf_NO;
				    var cr_NM;
				    var road_NM_ADDR;
				    var pic_SN_VL;
				    var tkcg_DEPT_NM;
				    var frst_REG_DT;
				    var last_MDFCN_DT;
				    var use_YN;
				    obj[keyname] = targetId;
						$.ajax({
				      url : "<c:url value='/searchOneAjax' />",
				      type : "post",
				      data : JSON
				          .stringify(obj),
				      dataType : "json",
				      contentType : "application/json",
				      success : function(data) {
				        // var strContent = "<td>" + data[0].a_name + "</td><td>" + data[0].a_phone + "</td>" 
				        cust_SN =  data.cust_SN;
				        cust_NM =  data.cust_NM;
				        vbrdt =  data.vbrdt;
				        home_TELNO =  data.home_TELNO;
				        mbl_TELNO =  data.mbl_TELNO;
				        pridtf_NO =  data.pridtf_NO;
				        cr_NM =  data.cr_NM;
				        road_NM_ADDR =  data.road_NM_ADDR;
				        pic_SN_VL =  data.pic_SN_VL;
				        tkcg_DEPT_NM =  data.tkcg_DEPT_NM;
				        frst_REG_DT =  data.frst_REG_DT;
				        last_MDFCN_DT =  data.last_MDFCN_DT;
				        use_YN =  data.use_YN;
				        $("#CUST_NM").val(cust_NM);
						$("#FRST_REG_DT").val(frst_REG_DT);
						$("#PRIDTF_NO").val(pridtf_NO);
						$("#CUST_SN").val(cust_SN);
						$("#VBRDT").val(vbrdt);
						$("#CR_NM").val(cr_NM);
						$("#MBL_TELNO").val(mbl_TELNO);
						$("#HOME_TELNO").val(home_TELNO);
						$("#ROAD_NM_ADDR").val(road_NM_ADDR);
						$("#FRST_RGTR_SN").val(frst_RGTR_SN);
						$("#EML_ADDR").val(eml_ADDR);

						
						$("#PIC_SN_VL").val(pic_SN_VL);
						$("#LAST_MDFCN_DT").val(last_MDFCN_DT);
						$("#USE_YN").val(use_YN);
						
				      },
				      error : function(
				          errorThrown) {
				        alert(errorThrown.statusText);
				      }
				    });
				});
				
			});
		</script>
	</body>
	</html>