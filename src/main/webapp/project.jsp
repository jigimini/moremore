<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좋아요 테스트용</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<table>
	<tr>
		<th>프로젝트 테이블 영역</th>
		<td>${project.pro_no}</td>
		<td>${project.user_no}</td>
		<%--<td>${project.pro_cateno}</td>
		<td>${project.company_no}</td>
		<td>${project.pro_title}</td>
		<td>${project.pro_stitle}</td>
		<td>${project.pro_gprice}</td>
		<td>${project.pro_thumbnail_path}</td>
		<td>${project.pro_img_path}</td>
		<td>${project.pro_start_dt}</td>
		<td>${project.pro_close_dt}</td>
		<td>${project.pro_hashtag}</td>
		<td>${project.pro_status}</td>
		<td>${project.pro_count}</td>
		<td>${project.pro_type}</td> --%>
	</tr>
</table>
	<p id="add" class="addToWish">
		<button type="button" class="addWish_btn">좋아요♡</button>
	</p>
	
	<p id="del" class="delToWish"
		style="display: none;">
		<button type="button" class="delWish_btn">좋아요 취소♥</button>
	</p>

</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script>

	//화면이 로딩될때 조회할 함수 작성
		const pro_no=1; /* !임시 데이터, 지워야 함! */
		const user_no=24; /* !임시 데이터, 지워야 함! */
	 /*	var pro_no = $("#pro_no").val();
		var user_no = $("#user_no").val(); */  /* <- 여기 살리기 */
		
		var sendData = {
			pro_no : pro_no,
			user_no : user_no
		};
		
		function addtodelWishButton() { // ♡ -> ♥ 
			$("#add").fadeOut(function() {
				$("#del").fadeIn();
			});
		}
		
		function deltoaddWishButton() { //  ♥->♡ 
			$("#del").fadeOut(function() {
				$("#add").fadeIn();
			});
		}
		//여기서 바로 그냥 조회하는 함수
		$.ajax({
			url: "getOneWishList.do",
			type : "post",
			data : sendData,
			success : function(responseData) {
				console.log("데이터 있음", responseData);
				if(responseData!==''){
					addtodelWishButton();
				}else{
					deltoaddWishButton();
				}
			},
			error : function() {
				console.log("일단 에러");
			}
		})
	
	// 좋아요 등록 function
	$(".addWish_btn").click(function() {

		$.ajax({
			url : "/more/wishlistInsert.do",
			type : "post",
			data : sendData,
			success : function() {
				alert("관심 프로젝트에 등록되었습니다.\n마이페이지에서 확인하세요.");
				addtodelWishButton();
			},
			error : function() {
				alert("좋아요 실패");
			}
		}); 
 	});
	
	// 좋아요 취소 function
	$(".delWish_btn").click(function() {

		$.ajax({
			url : "/more/wishlistDelete.do",
			type : "post",
			data : sendData,
			success : function() {
				alert("관심 프로젝트에서 삭제되었습니다.");
				deltoaddWishButton();
			},
			error : function() {
				alert("삭제 실패");
			}
		});
	});
</script>

</html>