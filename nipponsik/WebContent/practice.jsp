<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.btn-collect > table, td {border-collapse: collapse; border-spacing: 0; padding: 0;}
.but-amount {width: 61px; height: 40px; border: 1px solid #eee; text-align: center; font-size: 16px; font-weight: bold; bor}
.amount-updown > button {width: 20px; height: 22px; color: transparent; border: 1px solid #eee; background-color: #fff; position: relative;}
.amount-up:after {content: ""; position: absolute; background: url("logo/cupangimage.png"); background-repeat: no-repeat; background-position: -378px -189px; width: 8px; height: 4px; top: 8px; left: 4px;}
.amount-down:after {content: ""; position: absolute; background: url("logo/cupangimage.png"); background-repeat: no-repeat; background-position: -378px -197px; width: 8px; height: 4px; top: 8px; left: 4px;}
.space-col {width: 10px;}
.cart-btn{width: 190px; height: 42px; border: 1px solid #23C6A9; line-height: 42px; font-size: 16px; font-weight: bold; color: #23C6A9; transition:0.5s; margin: 0 5px; background-color: transparent;}
.buy-btn{width: 190px; height: 42px; border: 1px solid #23C6A9; line-height: 42px; font-size: 16px; font-weight: bold; color: #fff; background-color: #23C6A9; transition:0.5s; margin: 0 5px;}
.cart-btn:hover{border: 1px solid #079685; color: #079685;}
.buy-btn:hover{background-color: #079685; border: 1px solid #079685;}
</style>
<body>
<div class="btn-collect">
	<table>
		<tr>
			<td rowspan="2">
				<div class="amount-box">
					<input type="text" name="amount" class="but-amount" value="1" min="1">
				</div>
			</td>  <!-- input 수량 -->
			<td>
				<div class="amount-updown">
					<button type="button" class="amount-up">수량 더하기</button>
				</div>
			</td>  <!-- 업 앤 다운 -->
			<td rowspan="2" class="space-col"></td>  <!-- 띄기 -->
			<td rowspan="2">
				<div class="cart-btn-box">
					<button type="submit" class="cart-btn">장바구니 담기</button>
				</div>
			</td>   <!-- 장바구니 담기 -->
			<td rowspan="2" class="space-col"></td>  <!-- 띄기 -->
			<td rowspan="2">
				<div class="cart-btn-box">
					<button type="submit" class="buy-btn">바로 구매</button>
				</div>
			</td>  <!-- 바로구매 -->
		</tr>
		<tr>
			<td>
				<div class="amount-updown">
					<button type="button" class="amount-down">수량 빼기</button>
				</div>
			</td> 
		</tr>
	</table>
</div>

</body>
</html>