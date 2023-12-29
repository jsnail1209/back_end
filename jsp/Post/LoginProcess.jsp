<%@ page import="utils.CookieManager"%>
<%@ page import="membership.MemberDTO"%>
<%@ page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String user_id = request.getParameter("user_id"); 
String user_pw = request.getParameter("user_pw");
String save_check = request.getParameter("save_check");
// 로그인 폼으로부터 받은 아이디와 패스워드
String userId = request.getParameter("user_id"); 
String userPwd = request.getParameter("user_pw");  

// web.xml에서 가져온 데이터베이스 연결 정보
String oracleDriver = application.getInitParameter("OracleDriver");
String oracleURL = application.getInitParameter("OracleURL");
String oracleId = application.getInitParameter("OracleId");
String oraclePwd = application.getInitParameter("OraclePwd");

// 회원 테이블 DAO를 통해 회원 정보 DTO 획득
MemberDAO dao = new MemberDAO(oracleDriver, oracleURL, oracleId, oraclePwd);
MemberDTO memberDTO = dao.getMemberDTO(userId, userPwd);
dao.close();

// 로그인 성공 여부에 따른 처리
if (memberDTO.getId() != null) {
    // 로그인 성공
    session.setAttribute("UserId", memberDTO.getId()); 
    session.setAttribute("UserName", memberDTO.getName());
    if (save_check != null && save_check.equals("Y")) { 
        CookieManager.makeCookie(response, "loginId", user_id, 86400); 
    } 
    else {
        CookieManager.deleteCookie(response, "loginId"); 
    }
    response.sendRedirect("LoginForm.jsp");
}
else {
    // 로그인 실패
    request.setAttribute("LoginErrMsg", "로그인 오류입니다."); 
    request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
}
%>