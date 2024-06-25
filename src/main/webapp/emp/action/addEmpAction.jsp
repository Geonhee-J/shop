<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/emp/include/sessionOn.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="java.nio.file.*"%>
<%@ page import="java.io.*"%>
<%@ page import="shop.dao.EmpDAO"%>

<%
    request.setCharacterEncoding("UTF-8");
%>

<%
    Part part = request.getPart("empImg");
    String originalName = part.getSubmittedFileName();
    String ext = originalName.substring(originalName.lastIndexOf("."));
    String txt = (UUID.randomUUID().toString()).replace("-", "");
    String saveName = txt+ext; // (txt: 원본이름).(ext: 확장자)
    
    String uploadPath = request.getServletContext().getRealPath("upload");
    File file = new File(uploadPath, saveName);
    InputStream inputStream = part.getInputStream();
    OutputStream outputStream = Files.newOutputStream(file.toPath());
    inputStream.transferTo(outputStream);
%>

<%
    String empId = request.getParameter("empId");
    String empPw = request.getParameter("empPw");
    String empName = request.getParameter("empName");
    String empJob = request.getParameter("empJob");
    String empImg = saveName;
    String hireDate = request.getParameter("hireDate");
    String empGrade = request.getParameter("empGrade");
    String empActive = request.getParameter("empActive");
    int result = EmpDAO.insertEmp(empId, empPw, empName, empJob, empImg, hireDate, empGrade, empActive);
%>

<%
    
    if (result == 1) {
        response.sendRedirect("/shop/emp/empList.jsp");
    } else {
        String errMsg = URLEncoder.encode("잘못된 접근입니다.", "utf-8");
        response.sendRedirect("/shop/emp/addEmpForm.jsp?errMsg=" + errMsg);
        return;
    }
%>