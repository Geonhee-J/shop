<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/customer/include/sessionOn.jsp"%>
<%@ page import="java.util.*"%>

<div class="sidebar-container">
    <div class="sidebar-profile-wrap">
        <div class="sidebar-profile-image"></div>
        <div class="sidebar-profile-info">
            <div><%=(String)(sessionArea.get("customerName"))%>님</div>
            <form action="/shop/customer/customerOne.jsp">
                <input type="hidden" name="customerId" value="<%=(String)(sessionArea.get("customerId"))%>">
                <button type="submit">비밀번호수정</button>
            </form>
        </div>
    </div>
    <div class="sidebar-link-wrap">
        <p class="sidebar-line"></p>
        <a href="/shop/customer/productList.jsp">상품목록</a>
        <a href="/shop/customer/orderList.jsp?customerId=<%=(String)(sessionArea.get("customerId"))%>">구매목록</a>
        <p class="sidebar-line"></p>
        <a href="/shop/customer/include/sessionOff.jsp">로그아웃</a>
        <p class="sidebar-line"></p>
    </div>
</div>