<%--
  Created by IntelliJ IDEA.
  User: 82102
  Date: 2021-11-23
  Time: 오후 2:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${rootPath}/static/main.css?var=2021-11-23-001" rel="stylesheet">
    <title>MEMO List</title>
</head>
<body>
    <header>
        <h1>MEMOList 2021</h1>
    </header>
    <section>
        <tiles:insertAttribute name="content"/>
    </section>
    <footer>
        <address>&copy; inqu0302@naver.com</address>
    </footer>
</body>
</html>
