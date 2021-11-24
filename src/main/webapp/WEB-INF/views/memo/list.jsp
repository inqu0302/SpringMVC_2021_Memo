<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}"/>

<h1>여기는 list</h1>

<table>
    <thead>
        <tr>
            <th>일련번호</th>
            <th>메모내용</th>
            <th>작성자</th>
            <th>작성일자</th>
            <th>작성시각</th>
        </tr>
    </thead>
    <tbody>
        <c:if test="${empty M_LIST}">
            <tr>
                <td colspan="5">메모를 작성해주세요</td>
            </tr>
        </c:if>
        <c:forEach items="${M_LIST}" var="MEMO">
            <tr data-num="${MEMO.m_seq}">
                <td>${MEMO.m_seq}</td>
                <td>${MEMO.m_memo}</td>
                <td>${MEMO.m_author}</td>
                <td>${MEMO.m_date}</td>
                <td>${MEMO.m_time}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>
<div class="btn_box">
    <button class="btn_insert">추가</button>
</div>

<script>
    document.querySelector("button.btn_insert").addEventListener("click",()=>{
        location.href="${rootPath}/write"
    })
</script>