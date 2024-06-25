<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/emp/include/jdbcConn.jsp"%>
<%@ include file="/emp/include/sessionOn.jsp"%>
<%@ include file="/emp/include/css.jsp"%>
<%@ page import="java.util.*"%>

<%
    PreparedStatement addGoodsFormStmt = null;
    ResultSet addGoodsFormRs = null; 
    String categoryListSQL = "SELECT category FROM category;";
    addGoodsFormStmt = jdbcConn.prepareStatement(categoryListSQL);
    addGoodsFormRs = addGoodsFormStmt.executeQuery();
    ArrayList<String> categoryList = new ArrayList<String>();
    while (addGoodsFormRs.next()) {
        categoryList.add(addGoodsFormRs.getString("category"));
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SHOP</title>
</head>
<body>
    <div class="addGoodsForm-container">
        <jsp:include page="/emp/include/sidebar.jsp"></jsp:include>
        <div class="addGoodsForm-wrap">
            <form method="post" action="/shop/emp/action/addProductAction.jsp" enctype="multipart/form-data">
                <div>
                    <label>category : </label>
                    <select name="category">
                        <option value="">선택</option>
                        <%
                            for (String option : categoryList) {
                                %>
                                    <option value="<%=option%>"><%=option%></option>
                                <%
                            }
                        %>
                    </select>
                </div>
                <div>
                    <label>상품 이름 :</label>
                    <input type="text" name="productTitle">
                </div>
                <div>
                    <label>상품 이미지 :</label> 
                    <input type="file" name="productImg">
                </div>
                <div>
                    <label>상품 가격 :</label>
                    <input type="number" name="productPrice">
                </div>
                <div>
                    <label>수량 :</label>
                    <input type="number" name="productAmount">
                </div>
                <div>
                    <label>상품 설명 :</label>
                    <textarea rows="5" cols="50" name="productContent"></textarea>
                </div>
                <div>
                    <button type="submit">등록</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>