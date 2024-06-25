<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.nio.file.Files"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.UUID"%>

<%
    /*
        Part part = request.getPart("file"); // <-- 업로드된 원본 파일
        String originalName = part.getSubmittedFileName(); // <- 업로드된 원본 파일 이름
        String ext = originalName.substring(originalName.lastIndexOf(".")); // <-- 원본 이름에서 확장자 추출
        String txt = (UUID.randomUUID().toString()).replace("-", ""); // <-- 파일 이름 : 중복방지를 위한 UUID 클래스 사용
        String saveName = txt+ext; // (txt: 원본이름).(ext: 확장자)
        System.out.println(saveName);
        
        String uploadPath = request.getServletContext().getRealPath("upload"); // <-- 저장될 위치를 현재 프로젝트(톰켓 컨텍스트) 안으로 지정
        System.out.println(uploadPath);
        File file = new File(uploadPath, saveName);
        InputStream inputStream = part.getInputStream();
        OutputStream outputStream = Files.newOutputStream(file.toPath());
        inputStream.transferTo(outputStream);
        
        inputStream.close();
        outputStream.close();
        
        ---------------------------------------------------------------------------------------------------------------------------------------
        
        업로드 된 이미지의 이름을 가공하는 방법
        1) String originalName = part.getSubmittedFileName();
        2) int dotIdx = originalName.lastIndexOf("."); <-- 확장자만 분리 하기 위해 확장자 앞에 붙는 마지막 점의 문자열 인덱스 찾기
        3) String ext = originalName.substring(dotIdx); <-- 업로드된 이미지 파일의 이름에서 확장자 앞에 붙는 점을 찾고 점부터 제거
        
        4) UUID uuid = UUID.randomUUID();
        5) String filename = (uuid.toString()).replace("-", "");
        6) filename = txt + ext;
        
        첫번째 -> 업로드된 파일의 이름만 저장
        두번째 -> 파일의 이름에서 마지막 점의 위치를 찾음
        세번째 -> 파일의 이름에서 마지막 점의 위치부터 남김
        네번째 -> 중복되지 않을 문자열 만들기
        다섯번째 -> 중복되지 않을 문자열에 "-", "" 하이픈과 공백 제거
        여섯번째 -> 중복되지 않을 문자열 + 확장자를 합친 이름을 저장
    */
%>