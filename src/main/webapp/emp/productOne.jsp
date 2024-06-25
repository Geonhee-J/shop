<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/emp/action/productOneAction.jsp"%>
<%@ include file="/emp/include/css.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SHOP</title>
</head>
<body>
    <div class="productone-container">
        <jsp:include page="/emp/include/sidebar.jsp"></jsp:include>
        <div class="productone-wrap">
            <%
                for (HashMap<String, Object> map : productOne) {
                    %>
                        <div class="productone-link">
                            <a href="/shop/emp/productList.jsp">돌아가기</a>
                        </div>
                        <div class="productone-category">
                            <%
                                if ((map.get("empId")).equals(sessionArea.get("empId"))) {
                                    %>
                                        <div class="productone-update-btn">
                                            <form action="/shop/emp/productOneModifyForm.jsp">
                                                <input type="hidden" name="productNo" value="<%=(Integer)(map.get("productNo"))%>">
                                                <button type="submit">수정</button>
                                            </form>
                                        </div>
                                        <div class="productone-delete-btn">
                                            <form action="/shop/emp/action/productOneDeleteAction.jsp">
                                                <input type="hidden" name="productNo" value="<%=(Integer)(map.get("productNo"))%>">
                                                <button type="submit">삭제</button>
                                            </form>
                                        </div>
                                    <%
                                }
                            %>
                        </div>
                        <div class="productone-item-container">
                            <div class="productone-item-wrap">
                                <div class="productone-item">
                                    <div class="productone-image">
                                        <img src="/shop/upload/<%=(String)(map.get("productImg"))%>">
                                    </div>
                                    <div class="productone-info">
                                        <div>
                                            <label>상품 이름 :</label>
                                            <div><%=(String)(map.get("productTitle"))%></div>
                                        </div>
                                        <div>
                                            <label>상품 가격 :</label>
                                            <div><%=(Integer)(map.get("productPrice"))%></div>
                                        </div>
                                        <div>
                                            <label>상품 수량 :</label>
                                            <div><%=(Integer)(map.get("productAmount"))%></div>
                                        </div>
                                        <div>
                                            <label>상품 설명 :</label>
                                            <div><%=(String)(map.get("productContent"))%></div>
                                        </div>
                                        <div>
                                            <label>수정일 :</label>
                                            <div><%=(String)(map.get("updateDate"))%></div>
                                        </div>
                                        <div>
                                            <label>등록일 :</label>
                                            <div><%=(String)(map.get("createDate"))%></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <%
                }
            %>
        </div>
    </div>
</body>
</html>