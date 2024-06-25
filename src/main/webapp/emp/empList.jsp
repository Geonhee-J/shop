<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/emp/action/empListAction.jsp"%>
<%@ include file="/emp/include/css.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SHOP</title>
</head>
<body>
    <div class="emplist-container">
        <jsp:include page="/emp/include/sidebar.jsp"></jsp:include>
        <div class="emplist-wrap">
            <div class="emplist-link">
                <a href="/shop/emp/addEmpForm.jsp">직원등록</a>
            </div>
            <div class="emplist-category">
                <div class="emplist-category-btn">
                    <%
                        for (HashMap map : activeList) {
                            %>
                                <a href="/shop/emp/empList.jsp?empActive=<%=(String)(map.get("empActive"))%>">
                                    <%=(String)(map.get("empActive"))%>
                                </a>
                            <%
                        }
                    %>
                </div>
                <div class="emplist-category-btn">
                    <form method="get" action="/shop/emp/empList.jsp">
                        <label for="searchWord">사원: </label>
                        <input type="text" name="searchWord" id="searchWord" value="<%=searchWord%>">
                        <button type="submit">검색</button>
                        <span>ex) 계정, 이름 검색</span>
                    </form>
                </div>
            </div>
            <div>
                <div class="emplist-sort-container">
                    <ul class="emplist-sort-wrap">
                        <li class="emplist-sort">
                            <a href="/shop/emp/empList.jsp?sort=name">
                                이름순
                            </a>
                        </li>
                        <li class="emplist-sort">
                            <a href="/shop/emp/empList.jsp?sort=job">
                                직책순
                            </a>
                        </li>
                        <li class="emplist-sort">
                            <a href="/shop/emp/empList.jsp?sort=hireDate">
                                고용순
                            </a>
                        </li>
                        <li class="emplist-sort">
                            <a href="/shop/emp/empList.jsp?sort=active">
                                권한순
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="emplist-content-container">
                    <ul class="emplist-content-wrap">
                        <%
                            for (HashMap<String, Object> map : empList) {
                                %>
                                    <a href="/shop/emp/empOne.jsp?empId=<%=(String)(map.get("empId"))%>">
                                        <li class="emplist-content">
                                            <div class="emplist-image">
                                                <img src="/shop/upload/<%=(String)(map.get("empImg"))%>">
                                            </div>
                                            <div class="emplist-info">
                                                <div>
                                                    <span>계정 : </span>
                                                    <span><%=(String)(map.get("empId"))%></span>
                                                </div>
                                                <div>
                                                    <span>이름 : </span>
                                                    <span><%=(String)(map.get("empName"))%></span>
                                                </div>
                                                <div>
                                                    <span>직책 : </span>
                                                    <span><%=(String)(map.get("empJob"))%></span>
                                                </div>
                                                <div>
                                                    <span>활성화 : </span>
                                                    <span><%=(String)(map.get("empActive"))%></span>
                                                </div>
                                            </div>
                                        </li>
                                    </a>
                                <%
                            }
                        %>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</body>
</html>