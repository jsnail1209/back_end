<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style>
    .table1 {
    border: 2px solid black;

    background: #eee;
    }
    .table1 td {
    border: 1px dotted black;
    
    }
    
    </style>
<table class="table1" width="15%" align="center"> 
    <tr>
        <td align="center">
        <!-- 로그인 여부에 따른 메뉴 변화 -->
        <% if (session.getAttribute("UserId") == null) { %>
            <a href="../Post/LoginForm.jsp">로그인</a>
        <% } else { %>
            <a href="../Post/Logout.jsp">로그아웃</a>
        <% } %>
            <!-- 8장과 9장의 회원제 게시판 프로젝트에서 사용할 링크 -->          	
			<%-- <a href="../09PagingBoard/List.jsp">게시판(페이징O)</a> --%>
        </td>
        <td align="center">
                 <a href="../Post/List.jsp">게시판</a>
        </td>
        
    </tr>
</table>
