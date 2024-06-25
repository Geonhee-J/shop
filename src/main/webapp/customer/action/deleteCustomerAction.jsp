<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/customer/include/jdbcConn.jsp"%>
<%@ page import="java.net.*"%>
<%@ page import="shop.dao.CustomerDAO"%>

<%
    request.setCharacterEncoding("UTF-8");
%>

<%
    String customerId = "";

    if (request.getParameter("customerId") != null) {
        customerId = request.getParameter("customerId");
    }
    
    int result = CustomerDAO.deleteCustomer(customerId);
    System.out.println("result : " + result);
    
    if (result == 1) {
        String sucMsg = URLEncoder.encode("계정 삭제에 성공했습니다.", "utf-8");
        response.sendRedirect("/shop/customer/loginForm.jsp?sucMsg=" + sucMsg);
        return;
    } else {
        String errMsg = URLEncoder.encode("계정 삭제에 실패했습니다.", "utf-8");
        response.sendRedirect("/shop/customer/customerOne.jsp?customerId=" + customerId + "&errMsg=" + errMsg);
    }
%>