<%@page import="shop.dao.OrderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/customer/include/sessionOn.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="shop.dao.ProductDAO"%>
<%
    int productNo = 0;
    if (request.getParameter("productNo") != null) {
        productNo = Integer.parseInt(request.getParameter("productNo"));
    }
    
    String customerId = null;
    if (sessionArea.get("customerId") != null) {
        customerId = (String)(sessionArea.get("customerId"));
    }
%>

<%
    // System.out.println("customerId : " + customerId);
    ArrayList<HashMap<String, Object>> productOne = ProductDAO.productOne(productNo);
    ArrayList<HashMap<String, Object>> orderCheck = OrderDAO.selectOrderCheck(customerId, productNo);
    // System.out.println("orderCheck : " + orderCheck);
%>
