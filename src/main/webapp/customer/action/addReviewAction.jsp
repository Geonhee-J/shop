<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/customer/include/jdbcConn.jsp"%>
<%@ page import="java.net.*"%>
<%@ page import="shop.dao.ReviewDAO"%>

<%
    request.setCharacterEncoding("UTF-8");
%>

<%
    String orderNo = request.getParameter("orderNo");
    String productNo = request.getParameter("productNo");
    String customerId = request.getParameter("customerId");
    String rating = request.getParameter("rating");
    String reviewContent = request.getParameter("reviewContent");
    int result = ReviewDAO.insertReview(orderNo, productNo, customerId, rating, reviewContent);
%>

<%
    if (result == 1) {
        response.sendRedirect("/shop/customer/productOne.jsp?productNo=" + productNo);
    } else {
        String errMsg = URLEncoder.encode("리뷰 추가가 실패했습니다.", "utf-8");
        response.sendRedirect("/shop/customer/productOne.jsp?productNo=" + productNo + "errMsg=" + errMsg);
    }
%>