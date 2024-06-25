<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/emp/include/sessionOn.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="java.nio.file.*"%>
<%@ page import="java.io.*"%>
<%@ page import="shop.dao.CategoryDAO"%>

<%
    request.setCharacterEncoding("UTF-8");
%>

<%
    Part part = request.getPart("categoryImg");
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
    String category = request.getParameter("category");
    String categoryImg = saveName;
    
    int result = CategoryDAO.insertCategory(empId, category, categoryImg);
    
    if (result == 1) {
        response.sendRedirect("/shop/emp/categoryList.jsp");
    }
%>
