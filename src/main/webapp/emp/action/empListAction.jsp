<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/emp/include/sessionOn.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="shop.dao.EmpDAO"%>
<%
    String searchWord = "";
    if (request.getParameter("searchWord") != null) {
        searchWord = request.getParameter("searchWord");
    }
    
    String empActive = "";
    if (request.getParameter("empActive") != null) {
        empActive = request.getParameter("empActive");
    }
%>

<%
    ArrayList<HashMap<String, Object>> empList = EmpDAO.empList(empActive, searchWord);
    ArrayList<HashMap<String, Object>> activeList = EmpDAO.activeList();
%>
