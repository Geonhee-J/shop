<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/customer/include/jdbcConn.jsp"%>
<%@ page import="java.net.*"%>
<%@ page import="shop.dao.CustomerDAO"%>

<%
    request.setCharacterEncoding("UTF-8");
%>

<%
    String customerId = request.getParameter("customerId");
    String customerPw = request.getParameter("customerPw");
    String customerName = request.getParameter("customerName");
    String customerBirth = request.getParameter("customerBirth");
    String customerGender = request.getParameter("customerGender");
    int result = CustomerDAO.insertCustomer(customerId, customerPw, customerName, customerBirth, customerGender);
%>

<%
    if (result == 1) {
        response.sendRedirect("/shop/customer/loginForm.jsp");
    } else {
        String errMsg = URLEncoder.encode("잘못된 접근입니다.", "utf-8");
        response.sendRedirect("/shop/customer/loginForm.jsp?errMsg=" + errMsg);
    }
%>