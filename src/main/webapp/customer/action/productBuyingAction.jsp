<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/customer/include/sessionOn.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="shop.dao.ProductDAO"%>
<%@ page import="shop.dao.OrderDAO"%>
<%
    String mail = "";

    if (request.getParameter("mail") != null) {
        mail = request.getParameter("mail");
    }

    int productNo = 0;
    
    if (request.getParameter("productNo") != null) {
        productNo = Integer.parseInt(request.getParameter("productNo"));
    }
    
    int productAmount = 0;
    int totalAmount = 0;
    
    if (request.getParameter("productAmount") != null) {
        productAmount = Integer.parseInt(request.getParameter("productAmount"));
        totalAmount = productAmount;
    }
    
    int productPrice = 0;
    int totalPrice = 0;
    
    if (request.getParameter("productPrice") != null) {
        productPrice = Integer.parseInt(request.getParameter("productPrice"));
        totalPrice = productPrice * productAmount;
    }
    
    String state = "";
    if (request.getParameter("state") != null && !(request.getParameter("state")).equals("")) {
        state = "구매요청";
    }
%>

<%
    // System.out.println("productNo : " + productNo);
    // System.out.println("productAmount : " + productAmount);
    // System.out.println("mail : " + mail);
    // System.out.println("totalAmount : " + totalAmount);
    // System.out.println("totalPrice : " + totalPrice);
    // System.out.println("state : " + state);
    
    int result = ProductDAO.updateProductAmount(productNo, productAmount);
    if (result == 1) {
        // 구매 성공시 shop_orders에 구매한 내용을 기록 
        OrderDAO.insertOrder(mail, productNo, totalAmount, totalPrice, state);
        String msg = "success";
        response.sendRedirect("/shop/customer/productOne.jsp?productNo=" + productNo + "&msg=" + msg);
        return;
    } else {
        String errMsg = URLEncoder.encode("구매 과정에 오류가 발생했습니다.", "utf-8");
        response.sendRedirect("/shop/customer/productList.jsp?errMsg=" + errMsg);
    }
%>
