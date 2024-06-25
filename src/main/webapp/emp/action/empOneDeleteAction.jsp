<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/emp/include/sessionOn.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="shop.dao.EmpDAO"%>

<%
    String empId = request.getParameter("empId");
    
    int result = EmpDAO.deleteEmp(empId);
    
    if (result == 1) {
        response.sendRedirect("/shop/emp/empList.jsp");
    } else {
        String errMsg = URLEncoder.encode("삭제에 실패했습니다.", "utf-8");
        response.sendRedirect("/shop/emp/empOne.jsp?empId=" + empId + "&errMsg=" + errMsg);
    }
%>