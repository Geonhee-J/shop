<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/emp/include/sessionOn.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="java.nio.file.*"%>
<%@ page import="java.io.*"%>
<%@ page import="shop.dao.ProductDAO"%>
<%
    request.setCharacterEncoding("UTF-8");
%>

<%
    Part part = request.getPart("productImg");
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
    String productTitle = request.getParameter("productTitle");
    String productImg = saveName;
    int productPrice = Integer.parseInt(request.getParameter("productPrice"));
    int productAmount = Integer.parseInt(request.getParameter("productAmount"));
    String productContent = request.getParameter("productContent");
    int productNo = Integer.parseInt(request.getParameter("productNo"));
    
    int result = ProductDAO.updateProduct(productTitle, productImg, productPrice, productAmount, productContent, productNo);
    
    if (result == 1) {
        response.sendRedirect("/shop/emp/productOne.jsp?productNo=" + productNo);
    } else {
        String errMsg = URLEncoder.encode("잘못된 접근입니다.", "utf-8");
        response.sendRedirect("/shop/emp/productList.jsp?errMsg=" + errMsg);
    }
%>