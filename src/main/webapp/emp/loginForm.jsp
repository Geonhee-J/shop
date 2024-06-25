<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/emp/include/sessionCheck.jsp"%>
<%@ include file="/emp/include/css.jsp"%>

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
                            <div>관리자 로그인</div>
                        <%
                    }
                %>
            </div>
            <form class="login-form" method="post" action="/shop/emp/action/empLoginAction.jsp">
                <div class="login-input-wrap">
                    <div class="login-input-content">
                        <label for="empId">아이디</label>
                        <input type="text" name="empId" id="empId">
                    </div>
                    <div class="login-input-content">
                        <label for="empPw">비밀번호</label>
                        <input type="password" name="empPw" id="empPw">
                    </div>
                    <div class="login-input-content">
                        <button type="submit">로그인</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="login-customer">
            <a href="/shop/customer/loginForm.jsp">고객 로그인</a>
            <span>으로 이동하기</span>
        </div>
    </div>
</body>
</html>