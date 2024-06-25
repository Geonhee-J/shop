<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/emp/include/sessionOn.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="shop.dao.EmpDAO"%>
<%
    String empId = "";
    if (request.getParameter("empId") != null) {
        empId = request.getParameter("empId");
    }
%>

<%
    ArrayList<HashMap<String, Object>> empOne = EmpDAO.empOne(empId);
%>
