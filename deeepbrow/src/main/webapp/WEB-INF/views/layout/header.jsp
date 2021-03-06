<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/style.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/layout.css" type="text/css">
<script src="https://kit.fontawesome.com/42044ce0be.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/jquery/css/jquery-ui.min.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/jquery/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/jquery/js/jquery-ui.min.js"></script>

<script type="text/javascript">
$(function() {
	$("#hideaction").click(function() {
		var x = $(".hidemenu").is(":visible");
		
		if(!x) {
			$(".hidemenu").show(500);
		} else {
			$(".hidemenu").hide(500);
		}
	});
	
	$("#hideaction2").click(function() {
		var x = $(".hidemenu2").is(":visible");
		
		if(!x) {
			$(".hidemenu2").show(500);
		} else {
			$(".hidemenu2").hide(500);
		}
	});
});

function searchItem() {
	var f = document.searchForm;
	f.submit();	
}
</script>

<div class="header-left">
	<div class="logo">
		<a href="${pageContext.request.contextPath }/main.do">
			<img src="${pageContext.request.contextPath}/resource/images/logo1.png">
		</a>
	</div>
	
	<div class="menu user">
		<c:if test="${empty sessionScope.member}">
			<a href="${pageContext.request.contextPath }/member/login.do">로그인</a> / 
			<a href="${pageContext.request.contextPath }/member/member.do">회원가입</a>
		</c:if>
		<c:if test="${not empty sessionScope.member}">
			<span>${sessionScope.member.userName}</span>님
				&nbsp;/&nbsp;
				<a href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a>
				<br><br>
				<c:if test="${sessionScope.member.userId != 'admin'}">
				<a href="${pageContext.request.contextPath}/member/pwd.do?mode=update">정보수정</a>
				&nbsp;/&nbsp;
				<a href="${pageContext.request.contextPath}/basket/basket.do">장바구니</a>
				<br><br>
				<a href="${pageContext.request.contextPath}/buy/buyList.do?mid=${sessionScope.member.userId}">주문내역</a>
				</c:if>
		</c:if>
	</div>
	<div class="menu">
		<ul class="category">
			<li><a id="hideaction">카테고리</a>
				<ul class="hidemenu">
					<li><a href="${pageContext.request.contextPath}/product/list.do">전체보기</a></li>
					<li><a href="${pageContext.request.contextPath}/product/list.do?pCategory_code=earring">귀걸이</a></li>
					<li><a href="${pageContext.request.contextPath}/product/list.do?pCategory_code=necklace">목걸이</a></li>
					<li><a href="${pageContext.request.contextPath}/product/list.do?pCategory_code=ring">반지</a></li>
					<li><a href="${pageContext.request.contextPath}/product/list.do?pCategory_code=bracelet">팔찌</a></li>
				</ul>
			</li>
		</ul>
		
		<ul class="category">
			<li><a id="hideaction2">게시판</a>
				<ul class="hidemenu2">
					<li><a href="${pageContext.request.contextPath }/notice/list.do">공지사항</a></li>
					<li style="margin-bottom: 10px;"><a href="${pageContext.request.contextPath }/qna/qna_list.do">QnA</a></li>
				</ul>
			</li>
		</ul>
		<c:if test="${sessionScope.member.userId=='admin'}">
			<ul class="category admin">
				<li><a href="${pageContext.request.contextPath}/member/list.do">회원관리</a></li>
				<li><a href="${pageContext.request.contextPath}/product/manage.do">재고관리</a></li>
				<li><a href="${pageContext.request.contextPath}/asale/list.do">판매현황</a></li>
				<li><a href="${pageContext.request.contextPath}/delivery/list.do">주문관리</a></li>
			</ul>
		</c:if>
	</div>
</div>

<form name="searchForm" action="${pageContext.request.contextPath}/product/list.do" method="post">
	<div class="search">
		<a href="javascript:searchItem();"><img src="${pageContext.request.contextPath}/resource/images/search.png" style="width: 20px;"></a>
		<input type="text" name="keyword" value="${keyword}" class="search-input">
	</div>
</form>

