<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deeepbrow</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">

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
.btn{
	border: none;
    background: white;
    width: 80px;
    height: 30px;
    border-radius: 30px;
    cursor: pointer;
    margin: 0 10px;
}
.btn:hover {
	background-color: #e6e6e6;
	border-color: #adadad;
	color:#333;
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
.table input[type=text], .table textarea {
	width: 80%;
}
.table td:nth-child(2) {
	text-align: left;
}
.modalSearch{
	border: none;
    background: #eee;
    width: 80px;
    height: 30px;
    border-radius: 30px;
    cursor: pointer;
    margin: 0 10px;
}
.modalSearch:hover {
	background-color: #dfdddd;
	border-color: #adadad;
	color:#333;
}
.searchList{
	padding-top: 10px;
	line-height: 40px;
}
</style>



<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/jquery/css/jquery-ui.min.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/jquery/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/jquery/js/jquery-ui.min.js"></script>

</head>
<body>

<header>
    <jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
</header>


<main>

<script type="text/javascript">
function ajaxFun(url, method, query, dataType, fn) {
	$.ajax({
		type:method,
		url:url,
		data:query,
		dataType:dataType,
		success:function(data) {
			fn(data);
		},
		beforeSend:function(jqXHR) {
			jqXHR.setRequestHeader("AJAX", true);
		},
		error:function(jqXHR) {
			if(jqXHR.status === 403) {
				login();
				return false;
			} else if(jqXHR.status === 405) {
				alert("????????? ???????????? ????????????.");
				return false;
			}
	    	
			console.log(jqXHR.responseText);
		}
	});
}

$(function(){
	$(".productPick").click(function() {
		$(".popup-dialog").dialog({
			title:"????????????",
			modal:true,
			width: 600,
			height: 500
		});
	});
});

$(function(){
	$(".modalSearch").click(function(){
		$(".searchList").empty();
		var keyword = $("#keyword").val().trim();
		if(! keyword) {
			$("#keyword").focus();
			return false;
		}
		keyword = encodeURIComponent(keyword);
		var url = "${pageContext.request.contextPath}/qna/search.do";
		var query = "keyword=" + keyword;
		
		var fn = function(data){
			$("#keyword").val("");
			
			var out = "";
			for(var idx=0; idx<data.list.length; idx++){
				var pNo = data.list[idx].pNo;
				var pName = data.list[idx].pName;
				
				out += "<tr><td><span> ?????? ?????? : "+pNo+"</span>&nbsp;&nbsp;";
				out += "<span> ?????? ?????? : "+pName+"</span></td>";
				out += "<td><button type='button' class='modalSearch pickdone' value="+pNo+">??????</button></td></tr>";
			}
			$(".searchList").append(out);
		};
		
		ajaxFun(url, "post", query, "json", fn);
	});
	
	
	$(document).on("click",".pickdone",function(){
		console.log(this.value);
		//$('[name="pNo"]').val(this.value);
		$("#modal-data").val(this.value);
		$(".popup-dialog").dialog("close");
	});
	
});
</script>
<script type="text/javascript">
function sendOk() {
    var f = document.noticeForm;
	var str;
	
    str = f.qSubject.value.trim();
    if(!str) {
        alert("????????? ???????????????. ");
        f.qSubject.focus();
        return;
    }

    str = f.qContent.value.trim();
    if(!str) {
        alert("????????? ???????????????. ");
        f.qContent.focus();
        return;
    }
    
	str = f.pNo.value.trim();
    if(!str) {
        alert("????????? ???????????????. ");
        return;
    }
    
    str = f.qCategory.value.trim();
    if(!str) {
        alert("??????????????? ???????????????. ");
        f.qCategory.focus();
        return;
    }

    f.action = "${pageContext.request.contextPath}/qna/${mode}_ok.do";
    f.submit();
}
</script>

<div class="container">
	<div class="title-body">
			<span class="article-title">QnA</span>
	</div>
	<form name="noticeForm" method="post">
		<table class="table table-list">
			<tr>
				<td>???&nbsp;&nbsp;&nbsp;&nbsp;???</td>
				<td> 
					<input type="text" name="qSubject" maxlength="100" class="boxTF" value="${dto.qSubject}">
				</td>
			</tr>

			<tr> 
				<td>?????????</td>
				<td> 
					<p>${sessionScope.member.userName}</p>
				</td>
			</tr>
			
			<tr> 
				<td>?????? ????????????</td>
				<td> 
					<select name="qCategory" class="selectField" >
						<option value="" selected="selected" hidden="hidden">??????????????? ????????? ?????????</option>
						<option value="product"      ${qCategory=="product"?"selected='selected'":"" }>????????????</option>
						<option value="delivery"  ${qCategory=="delivery"?"selected='selected'":"" }>????????????</option>
						<option value="change"  ${qCategory=="change"?"selected='selected'":"" }>??????/??????/??????</option>
						<option value="etc"  ${qCategory=="etc"?"selected='selected'":"" }>????????????</option>
					</select>
				</td>
			</tr>
				
			<tr> 
				<td>?????? ??????</td>
				<td> 
					<button type="button" class="btn productPick">?????? ??????</button>
					<input type="text" class="boxTF" id="modal-data" name="pNo" value="" readonly="readonly" style="width: 5%;">
				</td>
			</tr>
				
			<tr> 
				<td>???&nbsp;&nbsp;&nbsp;&nbsp;???</td>
				<td> 
					<textarea name="qContent" class="boxTA" style="height: 200px;">${dto.qContent}</textarea>
				</td>
			</tr>
		</table>
		
		<table class="table">
			<tr> 
				<td align="center">
					<button type="button" class="btn" onclick="sendOk();">${mode=='update'?'????????????':'????????????'}</button>
					<button type="reset" class="btn">????????????</button>
					<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/qna/list.do?rows=${rows}';">${mode=='update'?'????????????':'????????????'}</button>
					<input type="hidden" name="rows" value="${rows}">
					<c:if test="${mode=='update'}">
						<input type="hidden" name="qNo" value="${dto.qNo}">
						<input type="hidden" name="page" value="${page}">
					</c:if>
				</td>
			</tr>
		</table>
	</form>
</div>

<div class="popup-dialog" style="display: none;">
	<div style="padding: 10px 0 20px 0;" align="center">
		<input type="text" id="keyword" class="boxTF" style="width: 60%;" placeholder="??????????????? ???????????????">
		<button type="button" class="modalSearch" >??????</button>
	</div>
	<hr>
	<div align="center">
		<table class="searchList">
		</table>
	</div>
	
	
</div>

</main>

<footer>
	<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
</footer>

</body>
</html>