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
    int result = CustomerDAO.updateCustomer(customerId, customerPw, customerName, customerBirth, customerGender);
%>

<%
    if (result == 1) {
        response.sendRedirect("/shop/customer/customerOne.jsp?customerId=" + customerId);
        return;
    } else {
        String errMsg = URLEncoder.encode("개인정보 수정에 실패했습니다.", "utf-8");
        response.sendRedirect("/shop/customer/customerOne.jsp?customerId=" + customerId + "errMsg=" + errMsg);
    }
%>