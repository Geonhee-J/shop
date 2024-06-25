<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/customer/include/jdbcConn.jsp"%>
<%@ page import="java.net.*"%>
<%@ page import="shop.dao.CustomerDAO"%>

<%
    String customerId = "";
    if (request.getParameter("customerId") != null) {
        customerId = request.getParameter("customerId");
    }
    
    boolean customerIdCheck = CustomerDAO.customerIdCheck(customerId);
    
    if (!customerIdCheck) {
        String errMsg = URLEncoder.encode("이미 존재하는 아이디입니다.", "UTF-8");
        response.sendRedirect("/shop/customer/addCustomerForm.jsp?errMsg=" + errMsg);
    } else {
        String errMsg = URLEncoder.encode("회원가입이 가능한 아이디입니다.", "UTF-8");
        response.sendRedirect("/shop/customer/addCustomerForm.jsp?errMsg=" + errMsg + "&customerId=" + customerId);
        return;
    }
%>