<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> 
<%
  request.setCharacterEncoding("UTF-8");
  Calendar cal = Calendar.getInstance();
%> 

<head>
<meta charset="UTF-8">
<title>작부작성 창</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
  function backToList(obj){
    obj.action="${contextPath}/board/listFees.do";
    obj.submit();
  }

</script>
 <title>작부작성 창</title>
</head>
<body>
<h1 style="text-align:center"><%= cal.get(Calendar.MONTH)+1 %>월 장부작성</h1>
  <form name="articleForm" method="post"   action="${contextPath}/board/addNewFee.do"   enctype="multipart/form-data">
    <table id="loginT" align="center" border="1"  width="80%"  >
  <tr height="10" align="center"  bgcolor="lightgray">
     <td >글번호</td>
     <td >납부자</td>              
     <td >납부금액</td>
     <td >비고</td>
     <td >작성일</td>
  </tr>
<c:choose>
  <c:when test="${feeForm ==null }" >
    <tr  height="10">
      <td colspan="4">
         <p align="center">
            <b><span style="font-size:9pt;">등록된 글이 없습니다.</span></b>
        </p>
      </td>  
    </tr>
  </c:when>
  <c:when test="${feeForm !=null }" >
	<c:forEach  var="fee" items="${feeForm }" varStatus="feeNum" >
		<tr align="center">
			<td width="5%">${feeNum.count}</td>
			<td width="10%"><input type="text" style="background-color:light-gray;" name="${fee.name }" value="${fee.name }" readonly/></td>
			<td width="10%">
			  <c:if test="${fee.feeMonthly == 0}">
				<input type="number" name="${fee.feeMonthly }" value="${fee.feeMonthly }" />
			  </c:if>
			  <c:if test="${fee.feeMonthly != 0}">
			    ${fee.feeMonthly }
			  </c:if>
			</td>
			<td width="40%">
			  <c:if test="${fee.feeRemark==null}">
				<input type="text" size="40" value="${fee.feeRemark}"/>
			  </c:if>
			  <c:if test="${fee.feeRemark!=null }">
			    ${fee.feeRemark }
			  </c:if>
			</td> 
			<td width="20%">
			  <c:if test="${fee.feeDate==null}">
				<input type="date" value="${fee.feeDate}"/>
			  </c:if>
			  <c:if test="${fee.feeRemark!=null}">
			  	${fee.feeDate }
			  </c:if>	
			</td>
		</tr>
		</c:forEach>
     </c:when>
    </c:choose>	
	<tr>
		<td colspan="5">
		<br>
			<input type="submit" value="저장" />
	       <input type=button value="장부 목록보기"onClick="backToList(this.form)" />
		</td>
	</tr>
</table>
  </form>
</body>
</html>
