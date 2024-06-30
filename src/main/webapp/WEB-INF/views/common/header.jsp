<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
<title>헤더</title>
</head>


<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
var loopSearch=true;
function memberSearch(){
	if(loopSearch==false)
		return;
 	var value=document.frmSearch.searchWord.value;
	$.ajax({
		type : "get",
		async : true, //false인 경우 동기식으로 처리한다.
		url : "${contextPath}/member/memberSearch.do",
		data : {keyword:value},
		success : function(data, textStatus) {
		    var jsonInfo = JSON.parse(data);
			displayResult(jsonInfo);
		},
		error : function(data, textStatus) {
			alert("에러가 발생했습니다."+data);
		},
		complete : function(data, textStatus) {
			//alert("작업을완료 했습니다"+data);
			
		}
	}); //end ajax	
	//alert("final "+ data);
}

function displayResult(jsonInfo){
	var count = jsonInfo.keyword.length;
	if(count > 0) {
	    var html = '';
	    for(var i in jsonInfo.keyword){
		   html += "<a href=\"javascript:select('"+jsonInfo.keyword[i]+"')\">"
		   			+jsonInfo.keyword[i]+"</a><br/>";
	    }
	    var listView = document.getElementById("suggestList");
	    listView.innerHTML = html;
	    show('suggest');
	}else{
	    hide('suggest');
	} 
}


function select(selectedKeyword) {
	 document.frmSearch.searchWord.value=selectedKeyword;
	 loopSearch = false;
	 hide('suggest');
}
	
function show(elementId) {
	 var element = document.getElementById(elementId);
	 if(element) {
	  element.style.display = 'block';
	 }
	}

function hide(elementId){
   var element = document.getElementById(elementId);
   if(element){
	  element.style.display = 'none';
   }
}
</script>

<body>
<table border=0  width="100%">
  <tr>
     <td style="text-align: left;">
		<a href="${contextPath}/main.do">
			<img src="${contextPath}/resources/image/home.png"  />
		</a>
     </td>
     <td style="text-align: left; margin-left: 30px; padding-left:100px;">
       <h1><font size=30>모임 게시판</font></h1>
     </td>
     <td>
     	<div id="search" >
			<form name="frmSearch" action="${contextPath}/member/memberSearch.do" >
				<input name="searchWord" class="main_input" type="text"  onKeyUp="memberSearch()"> 
				<input type="submit" name="search" class="btn1"  value="검 색" >
			</form>
			<br>
		</div>
		<div id="suggest">
	        	<div id="suggestList"></div>
	   	</div>
     </td>
     <td>
       <!-- <a href="#"><h3>로그인</h3></a> -->
       <c:choose>
          <c:when test="${isLogOn == true  && member!= null}">
            <h3>환영합니다. ${member.name }님!</h3>
            <a id="head" href="${contextPath}/member/logout.do"><h3>로그아웃</h3></a>
          </c:when>
          <c:otherwise>
	        <a id="head" href="${contextPath}/member/loginForm.do"><h3>로그인</h3></a>
	      </c:otherwise>
	   </c:choose>     
     </td>
  </tr>
</table>


</body>
</html>