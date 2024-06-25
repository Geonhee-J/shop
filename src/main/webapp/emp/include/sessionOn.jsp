<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.*"%>

<%
    HashMap<String, Object> sessionArea = null;

    if (session.getAttribute("loginEmp") == null) {
        String errMsg = URLEncoder.encode("잘못된 접근입니다.", "utf-8");
        response.sendRedirect("/shop/emp/loginForm.jsp?errMsg=" + errMsg);
    } else {
        sessionArea = (HashMap<String, Object>)(session.getAttribute("loginEmp"));
        if (sessionArea.get("empActive").equals("OFF")) {
            String errMsg = URLEncoder.encode("잘못된 접근입니다.", "utf-8");
            response.sendRedirect("/shop/emp/loginForm.jsp?errMsg=" + errMsg);
        }
        
    }
%>
