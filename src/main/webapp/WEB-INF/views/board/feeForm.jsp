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
  
  function feeSave(textobj, feeNum){
	  var feeNo = $('#feeNo_' + feeNum).val();
	  var feeId = $('#feeId_' + feeNum).val();
	  var feeMonthly = $('#feeMonthly_' + feeNum).val();
	  var feeRemark = $('#feeRemark_' + feeNum).val();
	  var feeDate =  $('#feeDate_' + feeNum).val();
	  
	  $.ajax({
			url: "${contextPath}/board/addNewFee2.do",
			type: 'post',
			dataType: 'json',
			data: {
				feeNo:feeNo,
				feeId:feeId,
				feeMonthly:feeMonthly,
				feeRemark:feeRemark,
				feeDate:feeDate
			},
			error: function(rep) {
				console.log(rep);
			},
			success: function(data) {
				console.log(data);
				if (data.result) {
					alert('저장되었습니다.');
					$('#mko_savedate_' + recnum).html(strDate);
				} 
			}
		});
	}
	  
	  
  
  $(function(){
	  $("input:text").css({
		//"background-color" : "#e6e6e6"
	  });
  });
</script>
 <title>작부작성 창</title>
</head>
<body>
<h1 style="text-align:center"><%= cal.get(Calendar.MONTH)+1 %>월 장부작성</h1>
  <form name="articleForm" method="post"   action="${contextPath}/board/addNewFee.do"   enctype="multipart/form-data">
    <table id="loginT" align="center" border="1"  width="80%"  >
  <tr height="10" align="center"  bgcolor="lightgray">
     <td>글번호</td>
     <td>납부자</td>              
     <td>작성일</td>
     <td>납부금액</td>
     <td>비고</td>
     <td>저장</td>
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
			<td width="10%">${fee.name }</td>
							<input type="hidden" name="feeNo" 		id="feeNo_${feeNum.count}" 		value="${fee.feeNo }"/>
		  					<input type="hidden" name="feeId" 		id="feeId_${feeNum.count}" 		value="${fee.id }"/>
			<td width="20%"><input type="date"  name="feeDate" 		id="feeDate_${feeNum.count}" 	value="${fee.feeDate}"/></td>
		    <td width="10%"><input type="number" name="feeMonthly" 	id="feeMonthly_${feeNum.count}" value="${fee.feeMonthly }" /></td>
			<td width="40%"><input type="text" name="feeRemark" 	id="feeRemark_${feeNum.count}" 	 size="40" value="${fee.feeRemark}"/></td>
			<td><input type=button value="저장"onClick="feeSave(this,${feeNum.count})" /></td>
		</c:forEach>
     </c:when>
    </c:choose>	
	<tr>
		<td colspan="5">
			<br>
	        <input type=button value="장부 목록보기" onClick="backToList(this.form)" />
		</td>
	</tr>
</table>
  </form>
</body>
</html>
