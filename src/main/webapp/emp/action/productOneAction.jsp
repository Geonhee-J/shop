<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/emp/include/sessionOn.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="shop.dao.ProductDAO"%>
<%
    int productNo = 0;
    if (request.getParameter("productNo") != null) {
        productNo = Integer.parseInt(request.getParameter("productNo"));
    }
%>

<%
    ArrayList<HashMap<String, Object>> productOne = ProductDAO.productOne(productNo);
%>
