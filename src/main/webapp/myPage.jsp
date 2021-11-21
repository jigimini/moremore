<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 임시</title>
<style>
	.wishContainer {
		margin: 0;
		padding: 0;
		border: 0;
		font: inherit;
		vertical-align: middle;
	}
	.wishtitle {
		font-size: 14px;
	}
	table {
		border-collapse: collapse;
		border-spacing: 0;
		position: relative;
		margin: 10px 0 0;
		border: 1px solid #d7d5d5;
		border-top-color: #d7d5d5;
		line-height: 1.5;
	}
	th {
		padding: 10px 0 10px;
		border-left: 1px solid #dfdfdf;
		border-bottom: 1px solid #dfdfdf;
		vertical-align: middle;
		font-weight: normal;
		font-size: 16px;
		background-color: #fbfafa;
	}
	.wish {
		text-align: center;
	}
	.wishleft {
		text-align: left;
		padding-left: 10px;
		font-size: 17px;
	}
	.date {
		margin: 9px 0 0;
		color: #757575;
		line-height: 12px;
		font-size: 14px;
	}
	td {
		padding: 11px 10px 10px;
		border-top: 1px solid #dfdfdf;
		vertical-align: middle;
	}
</style>
<style>
	.orderContainer {
		margin: 0;
		padding: 0;
		border: 0;
		font: inherit;
		vertical-align: middle;
	}
	.ordertitle {
		font-size: 14px;
	}
	table {
		border-collapse: collapse;
		border-spacing: 0;
		position: relative;
		margin: 10px 0 0;
		border: 1px solid #d7d5d5;
		border-top-color: #d7d5d5;
		line-height: 1.5;
	}
	th {
		padding: 10px 0 10px;
		border-left: 1px solid #dfdfdf;
		border-bottom: 1px solid #dfdfdf;
		vertical-align: middle;
		font-weight: normal;
		font-size: 16px;
		background-color: #fbfafa;
	}
	.orderlist {
		text-align: center;
	}
	.orderleft {
		text-align: left;
		padding-left: 10px;
		font-size: 17px;
	}
	.option {
		display: flex;
		margin: 9px 0 0;
		color: #757575;
		line-height: 12px;
		font-size: 14px;
		justify-content: space-between;
	}
	td {
		padding: 11px 10px 10px;
		border-top: 1px solid #dfdfdf;
		vertical-align: middle;
	}
	.orderright {
		padding-left: 0;
		padding-right: 0;
	}
</style>
</head>
<body>

	<form action="myPage.do" method="post">
	
	</form>
	<p><button onclick="getWishlistData()">관심 프로젝트</button></p> 
	<p>제작 펀딩</p>
	<p><button onclick="getOrderListData()">참여 펀딩</button></p>
	<p>구매 목록</p><br>

	<hr>
	
	<!-- 좋아요 리스트 조회 -->
	<!-- 참여 펀딩 리스트 조회 -->
	<form action="getWishList.do" method="post"></form>
	<form action="getOrderList.do" method="post"></form>
	<div class="wishContainer">
	<div>
	
	</div>	
	</div>

</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" language="javascript">
	
</script>

<script>
	// 좋아요 목록 띄우기 
	function getWishlistData() {
		//좋아요 목록을 불러오기 위해 필요한 작업 
		//1.user_no 받아서 controller로 전달해야한다
		// 주석 1: ajax의 기본 값이 async작동이 true로 되어있으므로 이걸 false로 적용 => 에러ㅠㅠ
		// 주석2: ajax코드로 접속시에 data타입이 맞지않아 파스 에러가 떴다 해결방법은 data타입을 text로 바꾸는것 원래는 json이었음 
		const user_no = 5;//데이터를 화면으로 불러오기 위해 필요한 임시 데이터
		console.log("getWishlistData : "+user_no);
		var param={
				user_no: user_no
		} 
		console.log(param.user_no);
		
		$.ajax("getWishList.do",{
			type: "get",
			contentType:"application/json",
			data: param	
		}).done(function(data, status, xhr) {
			alert("성공~~~");
			console.log("data");
			console.log(data);
			//주석3: 여기 데이터가 안들어오는 상태다. -> 이제 들어옴!
			// var dispHtml=''	

			let dispHtml = "<div>";
			dispHtml += '<div class="wishtitle">';
			dispHtml += "<p>관심 프로젝트</p>";
			dispHtml += "</div>";
			if(data.length!==0){
				dispHtml += '<table border="1" summary>';
				
				dispHtml += "<colgroup>";
				dispHtml += '<col style="width: 135px;">';
				dispHtml += '<col style="width: auto;">'; 
				dispHtml += '<col style="width: 111px;">';
				dispHtml += "</colgroup>";	
				
				dispHtml += "<thead>";
				dispHtml += "<tr>";
				dispHtml += '<th scope="col">이미지</th>';
				dispHtml += '<th scope="col">펀딩 정보</th>';
				dispHtml += '<th scope="col">진행 상황</th>';
				dispHtml += "</tr>";
				dispHtml += "</thead>"; 
			}
			else{
				dispHtml += "<h2>관심있는 프로젝트가 없습니다.</h2>"
			}
			$.each(data, function(index, obj) {
 
					
				dispHtml += '<tbody class="wish">';
				dispHtml += '<tr class="wishinfo">';
				dispHtml += '<td class="thumb">';
				dispHtml += '<a href="project.jsp">'; <%-- 프로젝트로 연결 --%>
				dispHtml += this.pro_thumbnail_path; 
				dispHtml += "</a>";
				dispHtml += "</td>";
				dispHtml += '<td class="wishleft">';
				dispHtml += '<a href="project.jsp">'; <%-- 프로젝트로 연결 --%>
				dispHtml += "<strong>";
				dispHtml += this.pro_title; 
				dispHtml += "</strong>";
				dispHtml += "<br><br>";
				dispHtml += "</a>";
				dispHtml += '<div class="date">';
				dispHtml += this.pro_close_dt; 
				dispHtml += "</div>";
				dispHtml += "</td>";
				dispHtml += '<td class="state">';
				dispHtml += this.pro_status; 
				dispHtml += "</td>";
				dispHtml += "</tr>";
				dispHtml += "</tbody>";
			});
			if(data.length!==0){
				dispHtml += "</table>";	
			}
			dispHtml += "</div>";
			$(".wishContainer").html(dispHtml);
		}).fail(function(data, status, error){
			console.log("실패", data);
			//callback(data);
			
		});
	}

	// 참여한 펀딩 목록 띄우기
	function getOrderListData() {
		const user_no = 24; // 데이터 화면에 띄우기 위한 임시 데이터 (코드 통합할 떈 유저넘버 받아오도록 변경해야함)
		console.log("getOrderListData: " + user_no);
		var param = {
				user_no : user_no
		}
		console.log(param.user_no);
		
		$.ajax("getOrderList.do", {
			type: "get",
			contentType: "application/json",
			data: param
		}).done(function(data, status, xhr) {
			alert("성공!!!");
			console.log(data); // 데이터 들어오는지 보기
			
			let dispHtml = "<div>";
			dispHtml += '<div class="ordertitle">';
			dispHtml += "<p>참여한 펀딩</p>";
			dispHtml += "</div>";
			if(data.length!==0){	
				dispHtml += '<table border="1" summary>';
				
				dispHtml += "<colgroup>";
				dispHtml += '<col style="width:135px;">';
				dispHtml += '<col style="width:auto;">';
				dispHtml += '<col style="width:65px;">';
				dispHtml += '<col style="width:111px;">';
				dispHtml += '<col style="width:111px;">';
				dispHtml += "</colgroup>";
				
				dispHtml += "<thead>";
				dispHtml += "<tr>";
				dispHtml += '<th scope="col">이미지</th>';
				dispHtml += '<th scope="col">펀딩 정보</th>';
				dispHtml += '<th scope="col">수량</th>';
				dispHtml += '<th scope="col">참여 일자<br>구매 번호</th>';
				dispHtml += '<th scope="col">결제금액<br>결제 현황</th>';
				dispHtml += "</tr>";
				dispHtml += "</thead>";
			}
			$.each(data, function(index, obj) {
				dispHtml += '<tbody class="orderlist">';
				dispHtml += '<tr class="orderinfo">';
				dispHtml += '<td class="thumb">';
				dispHtml += '<a href="project.jsp">'; /* 프로젝트로 연결 */
				dispHtml += this.pro_thumbnail_path;
				dispHtml += "</a>";
				dispHtml += "</td>";
				
				dispHtml += '<td class="orderleft">';
				dispHtml += '<a href="order.jsp">'; /* 결제정보로 연결 */
				dispHtml += "<strong>";
				dispHtml += this.pro_title;
				dispHtml += "</strong>";
				dispHtml += "</a>";
				dispHtml += '<div class="option">';
				dispHtml += '<div class="reward">';
				dispHtml += this.goods_title;
				dispHtml += "</div>";
				dispHtml += '<div class="state">';
				dispHtml += this.pro_status;
				dispHtml += "</div>";
				dispHtml += "</div>";
				dispHtml += "</td>";
				
				dispHtml += "<td>";
				dispHtml += this.order_ea;
				dispHtml += "</td>";
				
				dispHtml += '<td class="orderdate">';
				dispHtml += "<p>";
				dispHtml += this.order_date;
				dispHtml += "</p>";
				dispHtml += "<p>";
				dispHtml += this.order_no;
				dispHtml += "</p>";
				dispHtml += "</td>";
				
				dispHtml += '<td class="orderright">';
				dispHtml += "<strong>[";
				dispHtml += this.payment_price;
				dispHtml += "]</strong>";
				dispHtml += "<p class='order_status'>";
				dispHtml += this.order_status;
				dispHtml += "</p>";
				if(this.order_status!=='반품완료'){
					dispHtml += "<button class='requestCancelBtn' data-order_no='"
					dispHtml += this.order_no
					dispHtml += "'>취소요청</button>";
				}
				dispHtml += "</td>";
				dispHtml += "</tr>";
				dispHtml += "</tbody>";
			});
			
			if(data.length!==0){
				dispHtml +=	"</table>";	
			}
			
			dispHtml += "</div>";
			$(".wishContainer").html(dispHtml);
		}).fail(function(data, status, error) {
			console.log("실패,,", data);
			
		});
		
		$(document).on("click",".requestCancelBtn",function (){
			const data = this.dataset;
			const btn=this;
			console.log(btn);
			console.log(data);
			$.ajax("requestOrderCancel.do", {
				type: "get",
				contentType: "application/json",
				data: data,
				success : function(data) {
					console.log("수정 완.");
					btn.previousSibling.innerText=data.order_status;
				},error : function() {
					console.log("에러난다잉...");
				}
			
			});
			
		});
		
	}
</script>
</html>