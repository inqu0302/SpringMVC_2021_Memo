<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}"/>

<section class="memo_list">
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
            <tr data-seq="${M_LIST.m_seq}" >
                <td>${M_LIST.m_seq}</td>
                <td>${M_LIST.m_memo}</td>
                <td>${M_LIST.m_author}</td>
                <td>${M_LIST.m_date}</td>
                <td>${M_LIST.m_time}</td>
                <td>${M_LIST.m_image}</td>
            </tr>
        </tbody>
    </table>
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