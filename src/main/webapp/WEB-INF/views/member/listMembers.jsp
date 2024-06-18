<%@page import="com.myspring.pro30.member.vo.MemberVO"%>
<%@page import="java.lang.reflect.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
	MemberVO member = new MemberVO();
%>    


<html>
<head>
<meta charset=UTF-8">
<title>회원 정보 출력창</title>
</head>
<body>

<c:choose>
  <c:when test="${member.id ==null }" >
  	<h1>로그인 후 이용 바랍니다.</h1>
  </c:when>
  <c:when test="${member.id !=null }" >
 	<table id="loginT" border="1"  align="center"  width="80%">
	    <tr align="center"   bgcolor="lightgray">
	      <td ><b>아이디</b></td>
	      <td><b>비밀번호</b></td>
	      <td><b>이름</b></td>
	      <td><b>이메일</b></td>
	      <td><b>가입일</b></td>
	      <td><b>관리</b></td>
	   </tr>
	 <c:forEach var="member" items="${membersList}" >
	  <tr align="center">
	      <td>${member.id}</td>
	      <td>${member.pwd}</td>
	      <td>${member.name}</td>
	      <td>${member.email}</td>
	      <td>${member.joinDate}</td>
	      
	      
	      
	      
	      
	      
	      
	      
	      
	      <td>
	      	<a href="${contextPath}/member/modMember.do?id=${member.id}">수정</a>
	      	<a href="${contextPath}/member/removeMember.do?id=${member.id }">삭제</a>
	      </td>
	   </tr>
	  </c:forEach>   
	</table>
  </c:when>
</c:choose>
<a  href="${contextPath}/member/memberForm.do"><h1 style="text-align:center">회원가입</h1></a>
</body>
</html>
