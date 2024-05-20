<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"
 %>
 <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <style>
      #container {
        width: 100%;
        margin: 0px auto;
          text-align:center;
        border: 0px solid #bcbcbc;
      }
      #header {
        padding: 5px;
        margin-bottom: 5px;
        border-bottom: 2px solid #bcbcbc;
        background-color: white;
         
      }
      #sidebar-left {
        width: 15%;
        height:420px;
        padding: 15px 5px 15px 5px;
        margin-right: 5px;
        margin-bottom: 15px;
        float: left;
        border-right: 2px solid #bcbcbc;
        font-size:15px;
      }
	      #content {
        width: 75%;
        padding: 5px;
        margin-right: 5px;
        float: left;
        border: 0px solid #bcbcbc;
      }
      #footer {
        clear: both;
        padding: 5px;
        border: 0px solid #bcbcbc;
        background-color: #bcbcbc;
      }
     #head {
  		text-decoration-line: none;
  		color:black;
  		font-size:30px;
  		padding-bottom: 20px;
	  }
	  #loginT {
		  border : 2px solid black;
		  border-collapse : collapse;
		};
    </style>
    <title><tiles:insertAttribute name="title" /></title>
  </head>
    <body>
    <div id="container">
      <div id="header">
         <tiles:insertAttribute name="header"/>
      </div>
      <div id="sidebar-left">
          <tiles:insertAttribute name="side"/> 
      </div>
      <div id="content">
          <tiles:insertAttribute name="body"/>
      </div>
      <div id="footer">
          <tiles:insertAttribute name="footer"/>
      </div>
    </div>
  </body>
</html>