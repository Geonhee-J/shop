<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/customer/include/sessionOn.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="shop.dao.ProductDAO"%>

<%
    String searchWord = "";
    if (request.getParameter("searchWord") != null) {
        searchWord = request.getParameter("searchWord");
    }
    
    String category = "";
    if (request.getParameter("category") != null) {
        category = request.getParameter("category");
    }
    // System.out.println("category : " + category);
%>

<%
    String orderBy = "category ASC";
    String sort = "";
    
    if (request.getParameter("sort") != null) {
        sort = request.getParameter("sort");
    };
    // System.out.println("sort : " + sort);
    
    if (sort.equals("min")) {
        orderBy = "product_price ASC";
    } else if (sort.equals("max")) {
        orderBy = "product_price DESC";
    } else if (sort.equals("new")) {
        orderBy = "update_date DESC";
    }
%>

<%
    int currentPage = 1;
    if (request.getParameter("currentPage") != null) {
        currentPage = Integer.parseInt(request.getParameter("currentPage"));
    }
    
    int rowPerPage = 12;
    int startRow = (currentPage - 1) * rowPerPage;
    int totalRow = 0;
%>

<%
    ArrayList<HashMap<String, Object>> categoryList = ProductDAO.selectCategoryList();
    int categoryCnt = ProductDAO.selectCategoryCnt();
    totalRow += categoryCnt;
%>

<%
    int lastPage = totalRow / rowPerPage;
    if (totalRow % rowPerPage != 0) {
        lastPage = lastPage + 1;
    }
%>

<%
    // System.out.println("orderBy : " + orderBy);
    ArrayList<HashMap<String, Object>> product = ProductDAO.selectProduct(category, orderBy, searchWord, startRow, rowPerPage);
%>