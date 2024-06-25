<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/emp/include/jdbcConn.jsp"%>
<%@ include file="/emp/include/sessionOn.jsp"%>
<%@ include file="/emp/include/css.jsp"%>
<%@ page import="java.util.*"%>

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
            <form method="post" action="/shop/emp/action/addCategoryAction.jsp" enctype="multipart/form-data">
                <div>
                    <label for="empId">등록인 : </label>
                    <input type="text" name="empId" id="empId" value="<%=sessionArea.get("empId")%>" readonly="readonly">
                </div>
                <div>
                    <label for="category">카테고리 : </label>
                    <input type="text" name="category" id="category">
                </div>
                <div>
                    <label>카테고리 대표 이미지 : </label>
                    <input type="file" name="categoryImg">
                </div>
                <div>
                    <button type="submit">등록</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>