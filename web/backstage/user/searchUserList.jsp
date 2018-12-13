<%--
  Created by IntelliJ IDEA.
  User: Slacker
  Date: 2018/11/26
  Time: 14:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>音乐客栈</title>
    <link rel="icon" href="${pageContext.request.contextPath}/image/music.ico">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/APlayer.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/bootstrap-3.3.7/bootstrap-3.3.7/dist/css/bootstrap.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/bootstrap-3.3.7/bootstrap-3.3.7/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/sign.css">

    <script src="${pageContext.request.contextPath}/bootstrap-3.3.7/bootstrap-3.3.7/dist/js/bootstrap.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js"></script>
    <style>
        body{
            background-image: url("${pageContext.request.contextPath}/image/con_bg.jpg");
        }
    </style>
</head>
<body>
    <table>
        <thead>
        </thead>
        <tbody>
             ${msg}
         <c:forEach items="userList" var="user">
             <tr>
                 <td>${user.userId}</td>
                 <td>${user.userName}</td>
                 <td>${user.countName}</td>
                 <td>${user.userSex}</td>
                 <td>${user.userEmail}</td>
                 <td>${user.userImage}</td>
                 <td>${user.createDate}</td>
                 <td>${user.userTypeId}</td>

             </tr>
         </c:forEach>
        </tbody>
    </table>
</body>
</html>
