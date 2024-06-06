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
 <style>
   .no-underline{
      text-decoration:none;
   }
 </style>
  <meta charset="UTF-8">
  <title>사이드 메뉴</title>
</head>
<body>
	<h1>
		<a id="head" href="${contextPath}/member/listMembers.do"  class="no-underline">인사정보</a><br><br>
		<a id="head" href="${contextPath}/board/listArticles.do"  class="no-underline">게시판</a><br><br>
		<a id="head" href="${contextPath}/board/listFees.do"  class="no-underline">장부출납내역</a><br><br>
	</h1>
</body>
</html>