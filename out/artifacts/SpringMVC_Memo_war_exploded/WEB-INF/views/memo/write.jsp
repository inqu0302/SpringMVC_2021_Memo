<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}"/>

<form method="POST">
    <div class="input_box">
        <ul>일련번호<input type="text" name="m_seq" value="${M_LIST.m_seq}" readonly/></ul>
        <ul>작성자 <input type="text" name="m_author" value="inqu0302@naver.com" /></ul>
        <ul>작성일자 <input type="date" name="m_date" id="date" value="${M_LIST.m_date}"/></ul>
        <ul>작성시각 <input type="time" name="m_time" id="time" value="${M_LIST.m_time}"/></ul>
        <ul>메모 <input type="text" name="m_memo" value="${M_LIST.m_memo}"/></ul>
        <ul>이미지파일 <input type="file" name="m_image" value="${M_LIST.m_image}"/></ul>
    </div>
    <div class="btn_box">
        <button class="btn_save">저장</button>
        <button class="btn_reset" type="reset">새로작성</button>
        <button class="btn_list" type="button">리스트로</button>
    </div>
</form>

<script>

    if ("!${M_LIST.m_date}"){
        document.getElementById("date").value = "${DATE}"
        document.getElementById("time").value = "${TIME}"
    }

    document.querySelector("div.btn_box").addEventListener("click",(e)=>{
        let target = e.target
        if(target.className === "btn_save"){

            let seq = document.querySelector("input[name='m_seq']").value
            let author = document.querySelector("input[name='m_author']").value
            let date = document.querySelector("input[name='m_date']").value
            let time = document.querySelector("input[name='m_time']").value
            let memo = document.querySelector("input[name='m_memo']").value
            let image = document.querySelector("input[name='m_image']").value

            let json = { seq, author, date, time, memo, image}

            let jsonString = JSON.stringify(json)

            fetch("${rootPath}/fetch",{
                method:"POST",
                body:jsonString,
                headers:{
                    "content-Type" : "application/json; charset=UTF-8"
                }
            })

        }
        if(target.className === "btn_list"){

            location.href = "${rootPath}/list"
        }

    })
</script>