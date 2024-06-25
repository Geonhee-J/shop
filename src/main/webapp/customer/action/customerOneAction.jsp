<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/customer/include/jdbcConn.jsp"%>
<%@ page import="java.net.*"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="shop.dao.CustomerDAO"%>

<%
    request.setCharacterEncoding("UTF-8");
%>

<%
    String customerId = request.getParameter("customerId");
    // System.out.println("customerId : " + customerId);
    ArrayList<HashMap<String, String>> selectCustomer = CustomerDAO.selectCustomer(customerId);
%>
