<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/emp/include/sessionOn.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="shop.dao.ProductDAO"%>

<%
    int productNo = Integer.parseInt(request.getParameter("productNo"));
    
    int result = ProductDAO.deleteProduct(productNo);
    
    if (result == 1) {
        response.sendRedirect("/shop/emp/productList.jsp");
    } else {
        String errMsg = URLEncoder.encode("삭제에 실패했습니다.", "utf-8");
        response.sendRedirect("/shop/emp/productOne.jsp?productNo=" + productNo + "&errMsg=" + errMsg);
    }
%>