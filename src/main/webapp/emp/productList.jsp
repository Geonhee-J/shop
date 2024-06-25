<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/emp/action/productListAction.jsp"%>
<%@ include file="/emp/include/css.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SHOP</title>
</head>
<body>
    <div class="productlist-container">
        <jsp:include page="/emp/include/sidebar.jsp"></jsp:include>
        <div class="productlist-wrap">
            <div class="productlist-link">
                <a href="/shop/emp/addProductForm.jsp">상품등록</a>
            </div>
            <div class="productlist-category">
                <div class="productlist-category-btn">
                    <a href="/shop/emp/productList.jsp">전체</a>
                    <%
                        for (HashMap map : categoryList) {
                            %>
                                <a href="/shop/emp/productList.jsp?category=<%=(String)(map.get("category"))%>">
                                    <%=(String)(map.get("category"))%>
                                    <%=(String)(map.get("cnt"))%>
                                </a>
                            <%
                        }
                    %>
                </div>
                <div class="productlist-category-btn">
                    <form class="productlist-form" method="get" action="/shop/emp/productList.jsp">
                        <div>
                            <label for="category">카테고리: </label>
                            <select name="category" id="category">
                                <option value="">선택</option>
                                <%
                                    for (HashMap map : categoryList) {
                                        if (((String)(map.get("category"))).equals(category)) {
                                            %>
                                                <option value="<%=(String)(map.get("category"))%>" selected><%=(String)(map.get("category"))%></option>
                                            <%
                                        } else {
                                            %>
                                                <option value="<%=(String)(map.get("category"))%>"><%=(String)(map.get("category"))%></option>
                                            <%
                                        }
                                    }
                                %>
                            </select>
                        </div>
                        <label for="searchWord">검색어: </label>
                        <input type="hidden" name="sort" value="<%=sort%>">
                        <input type="text" name="searchWord" id="searchWord" value="<%=searchWord%>">
                        <button type="submit">검색</button>
                    </form>
                </div>
            </div>
            <div>
                <div class="productlist-sort-container">
                    <ul class="productlist-sort-wrap">
                        <li class="productlist-sort">
                            <a href="/shop/emp/productList.jsp?sort=category">
                                카테고리순
                            </a>
                        </li>
                        <li class="productlist-sort">
                            <a href="/shop/emp/productList.jsp?sort=min">
                                낮은가격순
                            </a>
                        </li>
                        <li class="productlist-sort">
                            <a href="/shop/emp/productList.jsp?sort=max">
                                높은가격순
                            </a>
                        </li>
                        <li class="productlist-sort">
                            <a href="/shop/emp/productList.jsp?sort=new">
                                신상품순
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="productlist-item-container">
                    <ul class="productlist-item-wrap">
                        <%
                            for (HashMap map : product) {
                                %>
                                    <a href="/shop/emp/productOne.jsp?productNo=<%=(Integer)(map.get("productNo"))%>">
                                        <li class="productlist-item">
                                            <div class="productlist-image">
                                                <img src="/shop/upload/<%=(String)(map.get("productImg"))%>">
                                            </div>
                                            <div class="productlist-info">
                                                <div>선수: <%=(String)(map.get("productTitle"))%></div>
                                                <div>가격: <%=(Integer)(map.get("productPrice"))%></div>
                                                <div>수량: <%=(Integer)(map.get("productAmount"))%></div>
                                            </div>
                                        </li>
                                    </a>
                                <%
                            }
                        %>
                    </ul>
                </div>
                <div class="productlist-paging-btn">
                    <%
                        if (currentPage > 1) {
                            %>
                                <div>
                                    <a href="/shop/emp/productList.jsp?category=<%=category%>&sort=<%=sort%>">처음페이지</a>
                                    <a href="/shop/emp/productList.jsp?currentPage=<%=currentPage - 1%>&category=<%=category%>&sort=<%=sort%>">이전페이지</a>
                                </div>
                            <%
                        }
                        if (currentPage < lastPage) {
                            %>
                                <div>
                                    <a href="/shop/emp/productList.jsp?currentPage=<%=currentPage + 1%>&category=<%=category%>&sort=<%=sort%>">다음페이지</a>
                                    <a href="/shop/emp/productList.jsp?currentPage=<%=lastPage%>&category=<%=category%>&sort=<%=sort%>">마지막페이지</a>
                                </div>
                            <%
                        }
                    %>
                </div>
            </div>
        </div>
    </div>
</body>
</html>