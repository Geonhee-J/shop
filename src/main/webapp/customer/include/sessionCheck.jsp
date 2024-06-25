<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
    HashMap<String, Object> sessionArea = null;
    if (session.getAttribute("loginCustomer") != null) {
        sessionArea = (HashMap<String, Object>)(session.getAttribute("loginCustomer"));
        response.sendRedirect("/shop/customer/productList.jsp");
    }
%>