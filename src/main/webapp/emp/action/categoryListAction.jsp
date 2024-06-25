<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/emp/include/sessionOn.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="shop.dao.CategoryDAO"%>
<%
    int currentPage = 1;
    if (request.getParameter("currentPage") != null) {
        currentPage = Integer.parseInt(request.getParameter("currentPage"));
    }
%>

<%
    String searchWord = "";
    if (request.getParameter("searchWord") != null) {
        searchWord = request.getParameter("searchWord");
    }
    
    String selectCategory = "";
    if (request.getParameter("category") != null) {
        selectCategory = request.getParameter("category");
    }
%>

<%
    ArrayList<HashMap<String, Object>> categoryList = CategoryDAO.selectCategoryList();
    ArrayList<HashMap<String, Object>> category = CategoryDAO.selectCategory(selectCategory, searchWord);
%>