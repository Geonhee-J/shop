<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/customer/action/productOneAction.jsp"%>
<%@ include file="/customer/include/css.jsp"%>

<%
    String msg = "";

    if (msg != null && !msg.equals("")) {
        msg = request.getParameter("msg");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SHOP</title>
</head>
<body>
    <div class="productone-container">
        <jsp:include page="/customer/include/sidebar.jsp"></jsp:include>
        <div class="productone-wrap">
            <%
                for (HashMap<String, Object> map : productOne) {
                    %>
                        <div class="productone-link">
                            <span>SPORTS NFT TRADING CARDS</span>
                        </div>
                        <div class="productone-category">
                            <a href="/shop/customer/productList.jsp">돌아가기</a>
                        </div>
                        <div class="productone-item-container">
                            <div class="productone-item-wrap">
                                <div class="productone-item">
                                    <div class="productone-image">
                                        <img src="/shop/upload/<%=(String)(map.get("productImg"))%>">
                                    </div>
                                </div>
                                <div class="productone-info-item">
                                    <div class="productone-info">
                                        <div class="productone-info-content">
                                            <label>이름 : </label>
                                            <div><%=(String)(map.get("productTitle"))%></div>
                                        </div>
                                        <div class="productone-info-content">
                                            <label>가격 : </label>
                                            <div><%=(Integer)(map.get("productPrice"))%></div>
                                        </div>
                                        <div class="productone-info-content">
                                            <label>수량 : </label>
                                            <div><%=(Integer)(map.get("productAmount"))%></div>
                                        </div>
                                        <div class="productone-info-content">
                                            <label>설명 : </label>
                                            <div><%=(String)(map.get("productContent"))%></div>
                                        </div>
                                        <div class="productone-info-content">
                                            <label>작성일 : </label>
                                            <div><%=(String)(map.get("createDate"))%></div>
                                        </div>
                                        <div class="productone-info-content">
                                            <label>수정일 : </label>
                                            <div><%=(String)(map.get("updateDate"))%></div>
                                        </div>
                                    </div>
                                    <div class="productone-order">
                                        <form action="/shop/customer/action/productBuyingAction.jsp">
                                            <label>수량 :</label>
                                            <input type="hidden" name="mail" value="<%=sessionArea.get("customerId")%>">
                                            <input type="hidden" name="productNo" value="<%=(Integer)(map.get("productNo"))%>">
                                            <input type="hidden" name="productPrice" value="<%=(Integer)(map.get("productPrice"))%>">
                                            <input type="hidden" name="state" value="구매">
                                            <input type="text" name="productAmount" min="0" value="1" id="productAmount">
                                            <button type="button" onclick="plusBtn()">+</button>
                                            <button type="button" onclick="minusBtn()">-</button>
                                            <button class="orderSubmit" type="submit">구매</button>
                                        </form>
                                    </div>
                                    <div class="productone-review">
                                        <form action="/shop/customer/action/productAddReviewAction.jsp">
                                            <div class="productone-review-rating">
                                                <label>평점 :</label>
                                                <input type="radio" name="rating" value="1">1
                                                <input type="radio" name="rating" value="2">2
                                                <input type="radio" name="rating" value="3">3
                                                <input type="radio" name="rating" value="4">4
                                                <input type="radio" name="rating" value="5">5
                                            </div>
                                            <div class="productone-review-content">
                                                <label>상품평 :</label>
                                                <div class="">
                                                    <input type="hidden" name="mail" value="<%=sessionArea.get("customerId")%>">
                                                    <input type="hidden" name="productNo" value="<%=(Integer)(map.get("productNo"))%>">
                                                    <textarea rows="2" cols="40" name="reviewContent">리뷰를 작성해주세요.</textarea>
                                                    <button type="submit">등록</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="productone-review-wrap">
                                <div class="productone-review-item"></div>
                            </div>
                        </div>
                    <%
                }
            %>
        </div>
    </div>
    <script>
        let amount = 0;
        function plusBtn() {
            document.getElementById("productAmount").value = ++amount;
        }
        
        function minusBtn() {
            document.getElementById("productAmount").value = --amount;
        }
        
        function getParameter(name) {
            name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
            var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                results = regex.exec(location.search);
            return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
        }
        
        let msg = getParameter("msg");
        console.log(msg);
        
        if (msg == 'success') {
            alert("구매 성공 하셨습니다.");
        }
    </script>
</body>
</html>