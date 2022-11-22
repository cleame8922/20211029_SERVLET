<%@ page contentType = "text/html;charset=utf-8" %>
<%@ page import = "java.util.ArrayList"%>
<%@ page import = "dto.Product"%>
<%@ page import = "dao.ProductRepository" %>
<%@ page import="java.sql.*"%>

<%! String greeting = "welcome_mejiwoo";
    String tagline = "하단 페이지 : 확인"; %>
    
<div class = "jumbotron" style = "padding : 0; background-color : white; margin-bottom : 12px">
        <hr style = "margin : 0">
        <div class = "container">
            <h3 class = "display-4" style = "font-size : 1rem; text-align : right; margin-top : 9px">
                <%=greeting%>
            </h3>
        </div>
    </div>

 <div>
    <div class = "card bg-dark text-white">
        <img src="https://jsp-main--jfjgw.run.goorm.io/img/top_banner.jpeg" class = "card-img" alt = "top_img">
        <div class = "card-img-overlay">
            <h5 class = "card-title">MEJIWOO</h5>
            <p class = "card-text">winter</p>
        </div>
    </div>
</div>

    <div class = "container">
        <div class = "row" align = "center">
            <%@ include file = "../db/db_conn.jsp"%>
            <%
                String sql = "select * from product"; // 조회
                pstmt = conn.prepareStatement(sql); // 연결 생성
                rs = pstmt.executeQuery(); // 쿼리 실행
                while (rs.next()) { // 결과 ResultSet 객체 반복
            %>
                
            <div class = "col-md-4">
                <img src = "../img/product/<%=rs.getString("p_fileName")%>" class = "card-img" alt = "...">
                <h3><%=rs.getString("p_name")%></h3>
                <p><%=rs.getString("p_description")%>
                <p><%=rs.getString("p_UnitPrice")%>원
                <p><a href="product_detail_ad.jsp?id=<%=rs.getString("p_id")%>" class="btn btn-secondary" role="button"> 상세 정보 &raquo;></a>
            </div>

        
        <%
                } // 반복문 끝난 이후 db 연결 종료	
            if (rs != null)
                rs.close();
            if (pstmt != null)
                pstmt.close();
            if (conn != null)
                conn.close();
        %>
    </div>
