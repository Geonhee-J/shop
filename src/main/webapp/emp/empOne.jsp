<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/emp/action/empOneAction.jsp"%>
<%@ include file="/emp/include/css.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SHOP</title>
</head>
<body>
    <div class="empone-container">
        <jsp:include page="/emp/include/sidebar.jsp"></jsp:include>
        <div class="empone-wrap">
            <%
                for (HashMap<String, Object> map : empOne) {
                    %>
                        <div class="empone-link">
                            <a href="/shop/emp/empList.jsp">돌아가기</a>
                        </div>
                        <div class="empone-category">
                            <%
                                // 사원정보 수정 권한 empGrade -> 3
                                // System.out.println("<empOne> empGrade : " + sessionArea.get("empGrade"));
                                if ((sessionArea.get("empGrade")).equals(3)) {
                                    %>
                                        <div class="empone-update-btn">
                                            <form action="/shop/emp/empOneModifyForm.jsp">
                                                <input type="hidden" name="empId" value="<%=(String)(map.get("empId"))%>">
                                                <button type="submit">수정</button>
                                            </form>
                                        </div>
                                        <div class="empone-delete-btn">
                                            <form action="/shop/emp/action/empOneDeleteAction.jsp">
                                                <input type="hidden" name="empId" value="<%=(String)(map.get("empId"))%>">
                                                <button type="submit">삭제</button>
                                            </form>
                                        </div>
                                    <%
                                }
                            %>
                        </div>
                        <div class="empone-item-container">
                            <div class="empone-item-wrap">
                                <div class="empone-item">
                                    <div class="emplist-image">
                                        <img src="/shop/upload/<%=(String)(map.get("empImg"))%>">
                                    </div>
                                    <div class="emplist-info">
                                        <div><%=(String)(map.get("empName"))%></div>
                                        <div><%=(String)(map.get("empJob"))%></div>
                                        <div><%=(String)(map.get("empGrade"))%></div>
                                        <div><%=(String)(map.get("empActive"))%></div>
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