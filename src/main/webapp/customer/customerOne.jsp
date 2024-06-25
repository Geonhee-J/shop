<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/customer/action/customerOneAction.jsp"%>
<%@ include file="/customer/include/css.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SHOP</title>
</head>
<body>
    <div class="customerone-container">
        <jsp:include page="/customer/include/sidebar.jsp"></jsp:include>
        <div class="customerone-wrap">
            <div class="customerone-link">
                <span>SPORTS NFT TRADING CARDS</span>
            </div>
            <div class="customerone-category">
                <span>공지사항 : 이름, 생년월일, 성별 수정은 준비중입니다.</span>
            </div>
            <div class="customerone-modify-container">
                <div class="customerone-modify-wrap">
                    <div class="customerone-modify-input-content-wrap">
                        <%
                            for (HashMap<String, String> map : selectCustomer) {
                                %>
                                    <form method="post" action="/shop/customer/action/modifyCustomerAction.jsp">
                                        <div class="modify-customer-input-content">
                                            <label for="customerId">아이디 : </label>
                                            <input type="text" name="customerId" id="customerId" value="<%=map.get("mail")%>" disabled>
                                        </div>
                                        <div class="modify-customer-input-content">
                                            <label for="customerPw">비밀번호 : </label>
                                            <input type="text" name="customerPw" id="customerPw" value="<%=map.get("pw")%>">
                                        </div>
                                        <div class="modify-customer-input-content">
                                            <label for="customerName">이름 : </label>
                                            <input type="text" name="customerName" id="customerName" value="<%=map.get("name")%>" disabled>
                                        </div>
                                        <div class="modify-customer-input-content">
                                            <label for="customerBirth">생년월일 : </label>
                                            <input type="text" name="customerBirth" id="customerBirth" value="<%=map.get("birth")%>" disabled>
                                        </div>
                                        <div class="modify-customer-input-content">
                                            <label for="customerGender">성별 : </label>
                                            <%
                                                if ((map.get("gender")).equals("남")) {
                                                    %>
                                                        <input type="text" name="customerGender" id="customerGender" value="<%=map.get("gender")%>" disabled>
                                                    <%
                                                } else if ((map.get("gender")).equals("여")) {
                                                    %>
                                                        <input type="text" name="customerGender" id="customerGender" value="<%=map.get("gender")%>" disabled>
                                                    <%
                                                }
                                            %>
                                        </div>
                                        <div class="modify-customer-input-content">
                                            <button type="submit">수정</button>
                                        </div>
                                    </form>
                                    <div class="delete-customer-input-content">
                                        <form method="post" action="/shop/customer/action/deleteCustomerAction.jsp">
                                                <input type="hidden" name="customerId" value="<%=request.getParameter("customerId")%>">
                                                <button type="submit">삭제</button>
                                        </form>
                                    </div>
                                <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>