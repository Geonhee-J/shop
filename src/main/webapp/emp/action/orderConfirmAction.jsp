<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/emp/include/sessionOn.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="shop.dao.OrderDAO"%>

<%
    int orderNo = 0;
    if (request.getParameter("orderNo") != null) {
        orderNo = Integer.parseInt(request.getParameter("orderNo"));
    }
%>

<%
    int result = OrderDAO.updateOrder(orderNo);
    if (result == 1) {
        response.sendRedirect("/shop/emp/orderList.jsp");
        return;
    } else {
        String errMsg = "구매확정에 실패했습니다.";
        response.sendRedirect("/shop/emp/orderList.jsp?errMsg=" + errMsg);
    }
%>