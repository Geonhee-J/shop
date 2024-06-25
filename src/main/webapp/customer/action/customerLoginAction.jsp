<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.net.*"%>
<%@ page import="shop.dao.CustomerDAO"%>

<%
    String customerId = request.getParameter("customerId");
    String customerPw = request.getParameter("customerPw");
%>

<%
    HashMap<String, Object> loginCustomer = CustomerDAO.customerLogin(customerId, customerPw);
    // System.out.println("customerId : " + customerId);
    // System.out.println("customerPw : " + customerPw);
%>

<%
    HashMap<String, Object> sessionArea = null;
    // System.out.println("loginCustomer : " + loginCustomer);
    // System.out.println("loginCustomer.size() : " + loginCustomer.size());

    if (loginCustomer.size() != 0) {
        session.setAttribute("loginCustomer", loginCustomer);
        sessionArea = (HashMap<String, Object>)(session.getAttribute("loginCustomer"));
        response.sendRedirect("/shop/customer/productList.jsp");
    } else {
        String errMsg = URLEncoder.encode("등록된 회원정보가 없습니다.", "utf-8");
        response.sendRedirect("/shop/customer/loginForm.jsp?errMsg=" + errMsg);
    }
%>