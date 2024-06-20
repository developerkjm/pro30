<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.myspring.pro30.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />



<%
  request.setCharacterEncoding("UTF-8");
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정창</title>
<style>
   .text_center{
     text-align:center;
   }
</style>
<c:choose>
	<c:when test="${result=='modFailed' }">
	  <script>
	    window.onload=function(){
	      alert("그런 아이디는 없다.");
	    }
	  </script>
	</c:when>
</c:choose> 


</head>
<body>
	<form method="post"   action="${contextPath}/member/modMember.do">
	<h1  class="text_center">회원 정보 수정창</h1>
	
	
		
	
	
	<table  align="center">
	   <tr>
	      <td width="200"><p align="right">아이디</td>
	      <td width="400">
  			<c:forEach var="member" items="${memberMap }">
		      	<input type="text" value="${member.id }" disabled />
		      	<input type="hidden" name="id" value="${member.id}"  />
			</c:forEach>
	      </td>
	   </tr>
	   <tr>
	      <td width="200"><p align="right">비밀번호</td>
	      <td width="400">
	      	<c:forEach var="member" items="${memberMap }">
		      	<input type="password" name="pwd" value="${member.pwd}">
			</c:forEach>
		  </td>
	    </tr>
	    <tr>
	       <td width="200"><p align="right">이름</td>
	       <td width="400"><p>
	       	 <c:forEach var="member" items="${memberMap }">
	       	 	<input type="text" name="name" value="${member.name }">
			 </c:forEach>
	       	</td>
	    </tr>
	    <tr>
	       <td width="200"><p align="right">이메일</td>
	       <td width="400"><p>
	         <c:forEach var="member" items="${memberMap }">
	       	 	<input type="text" name="email" value="${member.email }">
	       	 </c:forEach>
	       </td>
	    </tr>
	    <tr>
	       <td width="200"><p>&nbsp;</p></td>
	       <td width="400"><input type="submit" value="수정하기"><input type="reset" value="다시입력"></td>
	    </tr>
	</table>
	</form>
</body>
</html>