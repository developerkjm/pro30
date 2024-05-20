<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>


<%
  request.setCharacterEncoding("UTF-8");
%>    

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>메인 페이지</title>
  <script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
   <c:choose>
          <c:when test="${isLogOn == true  && member!= null}">
            <h3>환영합니다. ${member.name }님!</h3>
             <%@ include file="member/loginForm.jsp" %> 
          </c:when>
          <c:otherwise>
          <!-- 
	        <a href="${contextPath}/member/loginForm.do"><h3>로그인</h3></a>
           -->
            <%@ include file="member/loginForm.jsp" %> 
	      </c:otherwise>
	   </c:choose> 
	  
</body>
</html>