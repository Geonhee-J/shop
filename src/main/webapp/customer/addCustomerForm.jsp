<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/customer/include/sessionCheck.jsp"%>
<%@ include file="/customer/include/css.jsp"%>

<%
    String customerId = "";
    if (request.getParameter("customerId") != null) {
        customerId = request.getParameter("customerId");
    }
    
    String errMsg = "";
    if (request.getParameter("errMsg") != null) {
        errMsg = request.getParameter("errMsg");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SHOP</title>
</head>
<body>
    <div class="add-customer-container">
        <div class="add-customer-wrap">
            <div class="add-customer-input-content-wrap">
                <form method="post" action="/shop/customer/action/customerIdCheckAction.jsp">
                    <div class="add-customer-input-content">
                        <%
                            if (!errMsg.equals("") && errMsg != null) {
                                %>
                                    <span><%=errMsg%></span>
                                <%
                            } else {
                                %>
                                    <span>아이디를 입력 후 중복 확인을 눌러주세요.</span>
                                <%
                            }
                        %>
                    </div>
                    <div class="add-customer-input-content">
                        <label>아이디 : </label>
                        <input type="text" name="customerId" id="customerId" value="<%=customerId%>">
                    </div>
                    <div class="add-customer-input-content">
                        <button type="submit">중복 확인</button>
                    </div>
                </form>
                <form method="post" action="/shop/customer/action/addCustomerAction.jsp">
                    <div class="add-customer-input-content">
                        <input type="hidden" name="customerId" id="customerId" value="<%=customerId%>">
                    </div>
                    <div class="add-customer-input-content">
                        <label for="customerPw">비밀번호 : </label>
                        <input type="password" name="customerPw" id="customerPw">
                    </div>
                    <div class="add-customer-input-content">
                        <label for="customerName">이름 : </label>
                        <input type="text" name="customerName" id="customerName">
                    </div>
                    <div class="add-customer-input-content">
                        <label for="customerBirth">생년월일 : </label>
                        <input type="date" name="customerBirth" id="customerBirth">
                    </div>
                    <div class="add-customer-input-content">
                        <label for="customerGender">성별 : </label>
                        <select name="customerGender" id="customerGender">
                            <option value="">선택</option>
                            <option value="남">남</option>
                            <option value="여">여</option>
                        </select>
                    </div>
                    <div class="add-customer-input-content">
                        <button type="submit">가입</button>
                    </div>
                </form>
            </div>
        </div>
        <div class="before-btn">
            <a href="/shop/customer/loginForm.jsp">이전으로</a>
        </div>
    </div>
</body>
</html>