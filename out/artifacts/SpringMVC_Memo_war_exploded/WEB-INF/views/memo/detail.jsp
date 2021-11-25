<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}"/>

<section class="memo_detail">
    <div>
        <h3>일변번호 : ${M_LIST.m_seq}
        <h3>작성자 : ${M_LIST.m_author}</h3>
        <h3>작성 일자 : ${M_LIST.m_date}</h3>
        <h3>작성 시각 : ${M_LIST.m_time}</h3>
        <h3>작성 내용 : ${M_LIST.m_memo}</h3>
        <h3>첨부 이미지 ${M_LIST.m_image}</h3>
    </div>

    <div class="btn_box">
        <button class="btn_update">수정</button>
        <button class="btn_delete">삭제</button>
        <button class="btn_list">리스트로</button>
    </div>
</section>
<script>
    document.querySelector("div.btn_box").addEventListener("click",(e)=>{
        let target = e.target
        if(target.className === "btn_update") {
            if(confirm("해당 메모를 수정하시겠습니까?")){
                location.href="${rootPath}/update?seq=" + ${M_LIST.m_seq}
            }
        }
        if(target.className === "btn_delete"){
            if(confirm("해당 메모를 삭제하시겠습니까?")){
                location.href="${rootPath}/delete?seq=" + ${M_LIST.m_seq}
            }
        }
        if(target.className === "btn_list"){
            location.href="${rootPath}/list"
        }
    })
</script>