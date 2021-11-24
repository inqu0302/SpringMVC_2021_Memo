<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}"/>

<form>
    <div class="input_box">
        <ul>작성자 <input type="text" name="email" value="inqu0302@naver.com" /></ul>
        <ul>작성일자 <input type="date" id="date" value="${DATE}"/></ul>
        <ul>작성시각 <input type="time" id="time" value="${TIME}"/></ul>
        <ul>메모 <input type="text" value="" class="m_memo"/></ul>
        <ul>이미지파일 <input type="file" value=""/></ul>
    </div>
    <div class="btn_box">
        <button class="btn_save">저장</button>
        <button class="btn_reset" type="reset">새로작성</button>
        <button class="btn_list" type="button">리스트로</button>
    </div>
</form>


<script>

    document.querySelector("div.btn_box").addEventListener("click",(e)=>{
        let target = e.target

        alert(target.className)

        if(target.className === "btn_save"){

        }
        if(target.className === "btn_list"){

            location.href = "${rootPath}/list"
        }

    })
</script>