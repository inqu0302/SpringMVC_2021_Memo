<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}"/>

<form method="POST" enctype="multipart/form-data">
    <div class="input_box">
        <ul>작성자 <input type="text" name="m_author" value="inqu0302@naver.com" /></ul>
        <ul>작성일자 <input type="date" name="m_date" id="date" value="${DATE}"/></ul>
        <ul>작성시각 <input type="time" name="m_time" id="time" value="${TIME}"/></ul>
        <ul>메모 <input type="text" name="m_memo" value="${M_LIST.m_memo}"/></ul>
        <ul>이미지파일 <input type="file" name="m_image" value="${M_LIST.m_image}"/></ul>
    </div>
    <div class="btn_box">
        <button class="btn_save" type="button">저장</button>
        <button class="btn_reset" type="reset">새로작성</button>
        <button class="btn_list" type="button">리스트로</button>
    </div>
</form>

<script>

    if ("${M_LIST.m_date}"){
        document.getElementById("date").value = "${M_LIST.m_date}"
        document.getElementById("time").value = "${M_LIST.m_time}"
    }

    document.querySelector("div.btn_box").addEventListener("click",(e)=>{
        let target = e.target
        if(target.className === "btn_save"){

            let author = document.querySelector("input[name='m_author']")
            let date = document.querySelector("input[name='m_date']")
            let time = document.querySelector("input[name='m_time']")
            let memo = document.querySelector("input[name='m_memo']")

            let m_seq = "${M_LIST.m_seq}"
            let m_author = author.value
            let m_date = date.value
            let m_time = time.value
            let m_memo = memo.value
            let m_image = document.querySelector("input[name='m_image']").value

            if(!m_seq){
                m_seq = 0
            }
            if(!m_author){
                alert("작성자를 입력해주세요")
                author.focus()
                return false
            }
            if(!m_date){
                alert("작성일자를 입력해주세요")
                date.focus()
                return false
            }
            if(!m_time){
                alert("작성시각을 입력해주세요")
                time.focus()
                return false
            }
            if(!m_memo){
                alert("메모내용을 작성해주세요")
                memo.focus()
                return false
            }
            if(m_memo.length > 40){
                alert("메모의 내용은 40자 미만입니다")
                memo.focus()
                return false
            }

            let json = { m_seq, m_author, m_date, m_time, m_memo, m_image}

            let jsonString = JSON.stringify(json)

            fetch("${rootPath}/writer",{
                method:"POST",
                body:jsonString,
                headers:{
                    "Accept" : "application/json",
                    "content-Type" : "application/json; charset=UTF-8"
                }
            })

            alert("저장 완료")

        }
        if(target.className === "btn_list"){

            location.href = "${rootPath}/list"
        }

    })
</script>