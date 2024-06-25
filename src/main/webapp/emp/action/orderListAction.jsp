<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/emp/include/sessionOn.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="shop.dao.OrderDAO"%>

<%
    String mail = "";
    if (request.getParameter("customerId") != null) {
        mail = request.getParameter("customerId");
    }
%>

<%
    // System.out.println("mail : " + mail);
    ArrayList<HashMap<String, Object>> orderList = OrderDAO.selectOrderList(mail);
%>