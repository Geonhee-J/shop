<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.net.*"%>
<%@ page import="shop.dao.*"%>

<%
    String empId = request.getParameter("empId");
    String empPw = request.getParameter("empPw");
%>

<%
    HashMap<String, Object> loginEmp = EmpDAO.empLogin(empId, empPw);
%>

<%
    HashMap<String, Object> sessionArea = null;
    
    if (loginEmp != null) {
        session.setAttribute("loginEmp", loginEmp);
        sessionArea = (HashMap<String, Object>)(session.getAttribute("loginEmp"));
    } else {
        String errMsg = URLEncoder.encode("잘못된 접근입니다.", "utf-8");
        response.sendRedirect("/shop/emp/loginForm.jsp?errMsg=" + errMsg);
        return;
    }
    
    if (sessionArea.get("empActive").equals("ON")) {
        response.sendRedirect("/shop/emp/empList.jsp");
    }
%>