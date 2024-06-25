<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
    HashMap<String, Object> sessionArea = null;
    if (session.getAttribute("loginEmp") != null) {
        sessionArea = (HashMap<String, Object>)(session.getAttribute("loginEmp"));
        if (sessionArea.get("empActive").equals("ON")) {
            response.sendRedirect("/shop/emp/empList.jsp");
            return;
        }
    }
%>