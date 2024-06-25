<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/customer/include/sessionCheck.jsp"%>
<%@ include file="/customer/include/css.jsp"%>

<%
    String errMsg = request.getParameter("errMsg");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SHOP</title>
</head>
<body>
    <div class="login-container">
        <div class="login-wrap">
            <div class="login-error-message">
                <%
                    if (errMsg != null) {
                        %>
                            <div><%=errMsg%></div>
                        <%
                    } else {
                        %>
                            <div>로그인</div>
                        <%
                    }
                %>
            </div>
            <form class="login-form" method="post" action="/shop/customer/action/customerLoginAction.jsp">
                <div class="login-input-wrap">
                    <div class="login-input-content">
                        <label for="customerId">아이디</label>
                        <input type="text" name="customerId" id="customerId">
                    </div>
                    <div class="login-input-content">
                        <label for="customerPw">비밀번호</label>
                        <input type="password" name="customerPw" id="customerPw">
                    </div>
                    <div class="login-input-content">
                        <button type="submit">로그인</button>
                        <a href="/shop/customer/addCustomerForm.jsp">회원가입</a>
                    </div>
                </div>
            </form>
        </div>
        <div class="login-emp">
            <a href="/shop/emp/loginForm.jsp">관리자 로그인</a>
            <span>으로 이동하기</span>
        </div>
    </div>
</body>
</html>