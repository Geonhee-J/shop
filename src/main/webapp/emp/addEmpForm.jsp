<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            <form method="post" action="/shop/emp/action/addEmpAction.jsp" enctype="multipart/form-data">
                <div>
                    <label for="empId">아이디 : </label>
                    <input type="text" name="empId" id="empId">
                </div>
                <div>
                    <label for="empPw">비밀번호 : </label>
                    <input type="password" name="empPw" id="empPw" value="1234">
                </div>
                <div>
                    <label for="empName">이름 : </label>
                    <input type="text" name="empName" id="empName">
                </div>
                <div>
                    <label for="empJob">직급 : </label>
                    <select name="empJob" id="empJob">
                        <option value="0">직급 선택</option>
                        <option value="1010">사원</option>
                        <option value="1020">대리</option>
                        <option value="2010">팀장</option>
                        <option value="2020">실장</option>
                        <option value="0010">사장</option>
                    </select>
                </div>
                <div>
                    <label>사진 : </label>
                    <input type="file" name="empImg">
                </div>
                <div>
                    <label for="hireDate">고용일 : </label>
                    <input type="date" name="hireDate" id="hireDate">
                </div>
                <div>
                    <label for="empGrade">권한 등급 : </label>
                    <select name="empGrade" id="empGrade">
                        <option value="0">등급 선택</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                    </select>
                </div>
                <div>
                    <label for="empName">계정 활성화 : </label>
                    <input type="radio" name="empActive" value="ON" id="empActive">ON
                    <input type="radio" name="empActive" value="OFF" id="empActive" checked="checked">OFF
                </div>
                <div>
                    <button type="submit">등록</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>