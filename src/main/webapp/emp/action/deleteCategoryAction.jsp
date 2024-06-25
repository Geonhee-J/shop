<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/emp/include/sessionOn.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="shop.dao.CategoryDAO"%>

<%
    String category = request.getParameter("category");
    int result = CategoryDAO.deleteCategory(category);
    
    if (result == 1) {
        response.sendRedirect("/shop/emp/categoryList.jsp");
    }
%>