<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/emp/action/categoryListAction.jsp"%>
<%@ include file="/emp/include/css.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SHOP</title>
</head>
<body>
    <div class="categorylist-container">
        <jsp:include page="/emp/include/sidebar.jsp"></jsp:include>
        <div class="categorylist-wrap">
            <div class="categorylist-link">
                <a href="/shop/emp/addCategoryForm.jsp">카테고리등록</a>
            </div>
            <div class="categorylist-category">
                <div class="categorylist-category-btn">
                    <a href="/shop/emp/categoryList.jsp">전체</a>
                    <%
                        for (HashMap map : categoryList) {
                            %>
                                <a href="/shop/emp/categoryList.jsp?category=<%=(String)(map.get("category"))%>">
                                    <%=(String)(map.get("category"))%>
                                    <%=(String)(map.get("cnt"))%>
                                </a>
                            <%
                        }
                    %>
                </div>
                <div class="categorylist-category-btn">
                    <form class="categorylist-form" method="get" action="/shop/emp/categoryList.jsp">
                        <label for="searchWord">검색어: </label>
                        <input type="text" name="searchWord" id="searchWord" value="<%=searchWord%>">
                        <button type="submit">검색</button>
                    </form>
                </div>
            </div>
            <div class="categorylist-content-container">
                <ul class="categorylist-content-wrap">
                    <%
                        for (HashMap map : category) {
                            %>
                                <li class="categorylist-content">
                                    <div class="categorylist-image">
                                        <img src="/shop/upload/<%=(String)(map.get("categoryImg"))%>">
                                    </div>
                                    <div class="categorylist-info">
                                        <div><%=(String)(map.get("category"))%></div>
                                        <div><%=(String)(map.get("createDate"))%></div>
                                    </div>
                                    <form method="post" action="/shop/emp/action/deleteCategoryAction.jsp">
                                        <input type="hidden" name="category" value="<%=(String)(map.get("category"))%>">
                                        <button class="delete-btn" type="submit">삭제</button>
                                    </form>
                                </li>
                            <%
                        }
                    %>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>