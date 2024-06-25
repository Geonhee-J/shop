<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/customer/include/sessionOn.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="shop.dao.ProductDAO"%>
<%@ page import="shop.dao.OrderDAO"%>
<%
    String mail = "";
    int orderNo = 0;
    int productNo = 0;

    if (request.getParameter("mail") != null) {
        mail = request.getParameter("mail");
    }

    if (request.getParameter("orderNo") != null) {
        orderNo = Integer.parseInt(request.getParameter("orderNo"));
    }
    
    if (request.getParameter("productNo") != null) {
        productNo = Integer.parseInt(request.getParameter("productNo"));
    }
%>

<%
    // System.out.println("mail : " + mail);
    // System.out.println("orderNo : " + orderNo);
    // System.out.println("productNo : " + productNo);
    
    int result = OrderDAO.cancelOrder(mail, orderNo, productNo);
    if (result == 1) {
        response.sendRedirect("/shop/customer/orderList.jsp?customerId=" + mail);
        return;
    } else {
        String errMsg = URLEncoder.encode("구매 취소에 오류가 발생했습니다.", "utf-8");
        response.sendRedirect("/shop/customer/orderList.jsp?errMsg=" + errMsg);
    }
%>
