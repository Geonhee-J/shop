<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/customer/action/orderListAction.jsp"%>
<%@ include file="/customer/include/css.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SHOP</title>
</head>
<body>
    <div class="orderlist-container">
        <jsp:include page="/customer/include/sidebar.jsp"></jsp:include>
        <div class="orderlist-wrap">
            <div class="orderlist-link">
                <span>SPORTS NFT TRADING CARDS</span>
            </div>
            <div class="orderlist-category"></div>
            <div>
                <table border="1">
                    <tr>
                        <th>상품</th>
                        <th>주문번호</th>
                        <th>상품번호</th>
                        <th>주문수량</th>
                        <th>주문금액</th>
                        <th>주문상태</th>
                        <th>구매일자</th>
                        <th>상태</th>
                    </tr>
                    <%
                        for (HashMap<String, Object> map : orderList) {
                            %>
                                <tr>
                                    <td><a href="/shop/customer/productOne.jsp?productNo=<%=map.get("productNo")%>">바로가기</a></td>
                                    <td><%=map.get("orderNo")%></td>
                                    <td><%=map.get("productNo")%></td>
                                    <td><%=map.get("totalAmount")%></td>
                                    <td><%=map.get("totalPrice")%></td>
                                    <td><%=map.get("state")%></td>
                                    <td><%=map.get("createDate")%></td>
                                    <%
                                        if (map.get("state").equals("구매완료")) {
                                            %>
                                                <td>구매완료</td>
                                            <%
                                        } else if (map.get("state").equals("구매요청")) {
                                            %>
                                                <td>
                                                    <form action="/shop/customer/action/productBuyCancelAction.jsp">
                                                        <input type="hidden" name="mail" value="<%=request.getParameter("customerId")%>">
                                                        <input type="hidden" name="orderNo" value="<%=map.get("orderNo")%>">
                                                        <input type="hidden" name="productNo" value="<%=map.get("productNo")%>">
                                                        <button type="submit">구매취소</button>
                                                    </form>
                                                </td>
                                            <%
                                        } else if (map.get("state").equals("구매취소")) {
                                            %>
                                                <td>취소완료</td>
                                            <%
                                        }
                                    %>
                                </tr>
                            <%
                        }
                    %>
                </table>
            </div>
        </div>
    </div>
</body>
</html>