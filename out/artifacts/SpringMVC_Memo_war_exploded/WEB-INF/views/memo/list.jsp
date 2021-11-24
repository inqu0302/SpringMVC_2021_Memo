<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}"/>

<h1>여기는 list</h1>

<table>
    <tr>
        <th>일련번호</th>
        <th>메모내용</th>
        <th>작성자</th>
        <th>작성일자</th>
        <th>작성시각</th>
    </tr>
</table>
<div class="btn_box">
    <button class="btn_insert">추가</button>
</div>

<script>
    document.querySelector("button.btn_insert").addEventListener("click",()=>{
        location.href="${rootPath}/write"
    })
</script>