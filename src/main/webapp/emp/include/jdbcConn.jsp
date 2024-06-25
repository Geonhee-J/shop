<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
    Class.forName("org.mariadb.jdbc.Driver");
    Connection jdbcConn = null;
    jdbcConn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/shop", "root", "dreamon");
%>
