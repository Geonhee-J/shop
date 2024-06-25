<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/emp/include/sessionOn.jsp"%>
<%@ page import="java.util.*"%>

<div class="sidebar-container">
    <div class="sidebar-profile-wrap">
        <div class="sidebar-profile-image"></div>
        <div class="sidebar-profile-info">
            <div><%=(String)(sessionArea.get("empId"))%>님</div>
        </div>
    </div>
    <div class="sidebar-link-wrap">
        <p class="sidebar-line"></p>
        <a href="/shop/emp/empList.jsp">사원관리</a>
        <a href="/shop/emp/categoryList.jsp">카테고리관리</a>
        <a href="/shop/emp/productList.jsp">상품관리</a>
        <p class="sidebar-line"></p>
        <a href="/shop/emp/orderList.jsp">구매관리</a>
        <a href="/shop/emp/customerList.jsp">고객관리</a>
        <p class="sidebar-line"></p>
        <a href="/shop/emp/include/sessionOff.jsp">로그아웃</a>
        <p class="sidebar-line"></p>
    </div>
</div>