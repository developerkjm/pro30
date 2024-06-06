<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>  
<!DOCTYPE html>
<html>
<head>
 <style>
   .cls1 {text-decoration:none;}
   .cls2{text-align:center; font-size:30px;}
   @media print {
		#header, #footer, #sidebar-left, .no-print, a { display:none }
	}
  </style>
  <meta charset="UTF-8">
  <title>글목록창</title>
</head>
<script>
	function fn_articleForm(isLogOn,articleForm,loginForm){
	  if(isLogOn != '' && isLogOn != 'false'){
	    location.href=articleForm;
	  }else{
	    alert("로그인 후 글쓰기가 가능합니다.")
	    location.href=loginForm+'?action=/board/articleForm.do';
	  }
	}
</script>
<body>
<table id="loginT" align="center" border="1"  width="80%"  >
  <tr height="10" align="center"  bgcolor="lightgray">
     <td >글번호</td>
     <td >납부자</td>              
     <td >납부금액</td>
     <td >비고</td>
     <td >작성일</td>
  </tr>
<c:choose>
  <c:when test="${feesList ==null }" >
    <tr  height="10">
      <td colspan="4">
         <p align="center">
            <b><span style="font-size:9pt;">등록된 글이 없습니다.</span></b>
        </p>
      </td>  
    </tr>
  </c:when>
  <c:when test="${feesList !=null }" >
    <c:forEach  var="fee" items="${feesList }" varStatus="feeNum" >
     <tr align="center">
		<td width="5%">${feeNum.count}</td>
		<td width="10%">${fee.feeId }</td>
		<td width="10%">${fee.feeMonthly }</td>
		<td width="40%">${fee.feeRemark}</td> 
		<td width="20%">${fee.feeDate}</td>
	</tr>
    </c:forEach>
     </c:when>
    
    </c:choose>
     <tr>
     	<td class="no-print" colspan=5><input class="no-print" type="button" value="인쇄하기" id="print" onclick="window.print()"/></td>
     </tr>
</table>
<!-- <a  class="cls1"  href="#"><p class="cls2">글쓰기</p></a> -->

<a  class="cls1"  href="javascript:fn_articleForm('${isLogOn}','${contextPath}/board/feeForm.do', 
                                                    '${contextPath}/member/loginForm.do')"><p class="cls2">장부작성</p></a>
</body>
</html>