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
                            <a href="/shop/emp/productOne.jsp?productNo=<%=request.getParameter("productNo")%>">돌아가기</a>
                        </div>
                        <div class="productone-category"></div>
                        <div class="productone-item-container">
                            <div class="productone-item-wrap">
                                <div class="productone-item">
                                    <div class="productone-info">
                                        <form method="post" action="/shop/emp/action/productOneModifyAction.jsp" enctype="multipart/form-data">
                                            <div class="productone-image">
                                                <img src="/shop/upload/<%=(String)(map.get("productImg"))%>">
                                                <input type="file" name="productImg">
                                            </div>
                                            <div>
                                                <label>상품 이름 :</label>
                                                <input type="text" name="productTitle" value="<%=(String)(map.get("productTitle"))%>">
                                            </div>
                                            <div>
                                                <label>상품 가격 :</label>
                                                <input type="number" name="productPrice" value="<%=(Integer)(map.get("productPrice"))%>">
                                            </div>
                                            <div>
                                                <label>상품 수량 :</label>
                                                <input type="number" name="productAmount" value="<%=(Integer)(map.get("productAmount"))%>">
                                            </div>
                                            <div>
                                                <label>상품 설명 :</label>
                                                <textarea rows="5" cols="50" name="productContent"><%=(String)(map.get("productContent"))%></textarea>
                                            </div>
                                            <div>
                                                <label>수정일 :</label>
                                                <div><%=(String)(map.get("updateDate"))%></div>
                                            </div>
                                            <div>
                                                <label>등록일 :</label>
                                                <div><%=(String)(map.get("createDate"))%></div>
                                            </div>
                                            <div class="productone-update-btn">
                                                <input type="hidden" name="productNo" value="<%=request.getParameter("productNo")%>">
                                                <button type="submit">저장</button>
                                            </div>
                                        </form>
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