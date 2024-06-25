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
                            <a href="/shop/emp/empOne.jsp?empId=<%=request.getParameter("empId")%>">돌아가기</a>
                        </div>
                        <div class="empone-category"></div>
                        <div class="empone-item-container">
                            <div class="empone-item-wrap">
                                <div class="empone-item">
                                    <div class="empone-info">
                                        <form method="post" action="/shop/emp/action/empOneModifyAction.jsp" enctype="multipart/form-data">
                                            <div class="empone-image">
                                                <img src="/shop/upload/<%=(String)(map.get("empImg"))%>">
                                                <input type="file" name="empImg">
                                            </div>
                                            <div>
                                                <label>계정 :</label>
                                                <div><%=(String)(map.get("empId"))%></div>
                                            </div>
                                            <div>
                                                <label>이름 :</label>
                                                <input type="text" name="empName" value="<%=(String)(map.get("empName"))%>">
                                            </div>
                                            <div>
                                                <label>직책 :</label>
                                                <input type="text" name="empJob" value="<%=(String)(map.get("empJob"))%>">
                                            </div>
                                            <div>
                                                <label>등급 :</label>
                                                <input type="text" name="empGrade" value="<%=(String)(map.get("empGrade"))%>">
                                            </div>
                                            <div>
                                                <label>활성화 :</label>
                                                <%
                                                    if (((String)(map.get("empActive"))).equals("ON")) {
                                                        %>
                                                            <span>
                                                                <label for="on">ON</label>
                                                                <input type="radio" name="empActive" value="ON" id="on" checked>
                                                            </span>
                                                            <span>
                                                                <label for="off">OFF</label>
                                                                <input type="radio" name="empActive" value="OFF" id="off">
                                                            </span>
                                                        <%
                                                    } else {
                                                        %>
                                                            <span>
                                                                <label for="on">ON</label>
                                                                <input type="radio" name="empActive" value="ON" id="on">
                                                            </span>
                                                            <span>
                                                                <label for="off">OFF</label>
                                                                <input type="radio" name="empActive" value="OFF" id="off" checked>
                                                            </span>
                                                        <%
                                                    }
                                                %>
                                            </div>
                                            <div class="empone-update-btn">
                                                <input type="hidden" name="empId" value="<%=request.getParameter("empId")%>">
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