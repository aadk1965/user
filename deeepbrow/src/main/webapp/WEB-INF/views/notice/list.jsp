<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
.table{
	width: 80%;
	margin: 0 auto;
	border-spacing: 0;
	border-collapse: collapse;
}
.table-list{
	border-top: 2px solid white;
    border-bottom: 2px solid white;
    margin-bottom: 50px;
}

.table-list tr{
	line-height: 30px;
	border-bottom: 1px solid white;
}
.table-list tr:first-child{
	line-height: 60px;
	font-weight: 600;
}
.subject {
	width: 70%;
}
.table-list td:nth-child(2) {
	text-align: left;
	padding-left: 20px;
}
.btn{
	border: none;
    background: white;
    width: 80px;
    height: 30px;
    border-radius: 30px;
    cursor: pointer;
}
.btn:hover {
	background-color: #e6e6e6;
	border-color: #adadad;
	color:#333;
}
#condition{
	background: black;
	border: none;
	color: white;
}
#keyword{
	background: black;
	border: none;
	border-bottom: 1px solid white;
	color: white;
}
</style>
<script type="text/javascript">

function searchList() {
	var f = document.searchForm;
	f.submit();
}
</script>
</head>
<body>

<header>
    <jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
</header>

<main>
<div class="container">
<<<<<<< HEAD
	<div id="content">
		<table class="table">
				<thead class="">
					<tr class="tablepadd">
						<th> No</th>
						<th>SUBJECT</th>
						<th>NAME</th>
						<th>DATE</th>
					</tr>
				</thead>
			<tbody class="test">
				<tr class="tablepadd2">
					<td>공지</td>
					<td>[필독] Notice</td>
					<td>딥브로우</td>
					<td>2021-11-02</td>
				</tr>
				
				<tr class="tablepadd2">
					<td>7</td>
					<td>[이벤트] 여름 휴가</td>
					<td>딥브로우</td>
					<td>2021-11-02</td>
				</tr>
			</tbody>
		</table>
		
		<div style="min-height: 50px;">
			<form action="">
				<div class="second">
						<div>
						<select>
							<option>전체</option>
						</select>
						<select>
							<option>제목 + 내용</option>
						</select>
						<input class="textstyle" type="text" placeholder=" &nbsp;&nbsp;&nbsp;&nbsp;내용 입력">
						<a style="font-weight: 50px;">SEARCH</a>
					</div>
				</div>
				<div class="third">
					<a href="#"><i>Previous</i></a>
					&nbsp;
					<a href="#">1</a>
					&nbsp;
					<a href="#"><i>Next</i></a>
				</div>
			</form>
		</div>
=======
	<div class="title-body">
		<span class="article-title">공지사항</span>
>>>>>>> branch 'main' of https://github.com/aadk1965/user.git
	</div>
	<table class="table" style="text-align: left;">
		<tr>
		<td>
			ALL - ${dataCount} (${page}/${total_page} PAGE)
		</td>
		</tr>
	</table>
	<form name="noticelistForm">
		<table class="table table-list">
			<tr>
				<th>No</th>
				<th class="subject">SUBJECT</th>
				<th>NAME</th>
				<th>DATE</th>
			</tr>
			<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.listNum}</td>
				<td>
					<a href="${articleUrl}&nNo=${dto.nNo}">${dto.nSubject}</a>
				</td>
				<td>관리자</td>
				<td>${dto.nReg_date}</td>
			</tr>
			</c:forEach>
			
		</table>
	</form>
	<div class="page-box">
		${dataCount == 0 ? "등록된 게시물이 없습니다." : paging}
	</div>
			
	<table class="table">
			<tr>
				<td align="left">
					<form name="searchForm" action="${pageContext.request.contextPath}/notice/list.do" method="post">
						<select name="condition" class="selectField">
							<option value="all"      ${condition=="all"?"selected='selected'":"" }>제목+내용</option>
							<option value="reg_date"  ${condition=="reg_date"?"selected='selected'":"" }>등록일</option>
							<option value="subject"  ${condition=="subject"?"selected='selected'":"" }>제목</option>
							<option value="content"  ${condition=="content"?"selected='selected'":"" }>내용</option>
						</select>
						<input type="text" name="keyword" value="${keyword}" class="boxTF">
						<input type="hidden" name="rows" value="${rows}">
						<button type="button" class="btn" onclick="searchList();">검색</button>
					</form>
				</td>
				<td align="right" width="100">
					<c:if test="${sessionScope.member.userId == 'admin'}">
						<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/notice/write.do?rows=${rows}';">글올리기</button>
					</c:if>
				</td>
			</tr>
		</table>	
</div>

</main>

<footer>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</footer>


</body>
</html>