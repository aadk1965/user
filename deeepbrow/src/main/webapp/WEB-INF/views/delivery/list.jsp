<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deeepbrow</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/paginate.css" type="text/css">
<style type="text/css">
.title-body {
	padding: 50px 0; text-align: center;
}

.title-body .article-title {
	font-size: 20px;
}

a {
  color: #fff;
  text-decoration: none;
  cursor: pointer;
}
a:active, a:hover {
	text-decoration: underline;
	color: #F28011;
}

.box{
	width: 700px;
	margin: 30px auto;
}

.table-stock {
	width: 80%;
	margin: 0 auto;
	border-spacing: 0;
	border-collapse: collapse;
}


.table-stock th, .table-stock td{
	padding: 7px 0;
}

.table-stock thead tr:first-child{
	background: none;
	border-top: 2px solid #ccc;
	line-height: 30px;
	font-weight: 600;
}

.table-stock thead th{
	border: 1px solid #ccc;
	background: none;
}

.table-stock thead span{
	font-size: 10px;
	vertical-align: baseline;
	font-weight: 500;
}

.table-stock tr, .table-stock td {
	height: 30px;
	border: 1px solid #ccc;
	text-align: center;
}

.table-stock tbody span {
	cursor: pointer;
}

.add{
	color: #fff;
	float: right;
}

i{
	width: 40px;
	height: 40px;
}

.clickable { cursor: pointer; }
.hover { color: darkblue; }

</style>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
function cancelOrder(orderNo) {
	if(confirm("해당 주문건을 취소하시겠습니까?")) {
		var query = "orderNo=${dto.orderNo}";
		var url = "${pageContext.request.contextPath}/delivery/canceled_order.do?orderNo="+orderNo;
	    location.href = url;
	    alert("주문번호 "+orderNo+"번의 주문건이 정상적으로 취소되었습니다.");
	   }
}
	
function deliverOrder(orderNo) {
    if(confirm("해당 주문건을 발송 처리하시겠습니까?")) {
    	var query = "orderNo=${dto.orderNo}";
	    var url = "${pageContext.request.contextPath}/delivery/delivered_order.do?orderNo="+orderNo;
    	location.href = url;
    	alert("주문번호 "+orderNo+"번의 주문건이 발송 처리되었습니다.")
    }   
}

function showDetails(orderNo) {
	var url = "${pageContext.request.contextPath}/delivery/orderDetails.do?orderNo="+orderNo;
	location.href = url;
}

</script>

</head>
<body>
<header>
	<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
</header>
<main>
<div class="container">
 	<div class="title-body">
      <span class="article-title">주문 관리</span>
   </div>
	<table class="table-stock paginated">
		<thead style="clear: both;">
			<tr>
				<th width="100" class="stockclass">주문번호</th>
				<th width="100" class="stockclass">주문일자</th>
				<th width="100" class="stockclass">결제일자</th>
				<th width="100" class="stockclass">결제금액</th>
				<th width="100" class="stockclass">아이디</th>
				<th width="100" class="stockclass">이름</th>
				<th width="200" class="stockclass">전화번호</th>
				
				<th width="100" class="stockclass">송장번호</th>
				<th width="100" class="stockclass">주문상태</th>
				<th width="100" class="stockclass">주문취소</th>
				<th width="100" class="stockclass">발송처리</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach var="dto" items="${list}">
				<tr>
					<td style="text-decoration:underline; color: purple;"><a href="javascript:showDetails('${dto.orderNo}');">${dto.orderNo}</a></td>
					<td>${dto.order_date}</td>
					<td>${dto.pay_date}</td>
					<td><fmt:formatNumber value="${dto.pay_price}" pattern="#,###"/>원</td>
					<td>${dto.mId}</td>
					<td>${dto.dName}</td>
					<td>${dto.dTel}</td>
					
					<td>${dto.delNo}</td>
					
					<td>${empty dto.ds_manage ? '배송준비중' : dto.ds_manage}</td>
					
					<td>
						<c:if test="${empty dto.ds_manage}">
							<a href="javascript:cancelOrder('${dto.orderNo}');">
								<img src="${pageContext.request.contextPath}/resource/images/cancel.png" style="width: 20px">
							</a>
						</c:if>
					</td>
					<td>
						<c:if test="${empty dto.ds_manage}">
							<a href="javascript:deliverOrder('${dto.orderNo}');">
								<img src="${pageContext.request.contextPath}/resource/images/parcel3.png" style="width: 30px;">
							</a>
						</c:if>		
					</td>
					
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<div class="page-box">
		${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
	</div>
</div>

</main>
<footer>
    <jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</footer>

</body>
</html>