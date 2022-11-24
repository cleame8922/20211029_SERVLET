<%@ page contentType = "text/html;charset=utf-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="../db/db_conn.jsp" %>

<%

    String productId = request.getParameter("id");

	String sql = "select * from product";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();

    while (rs.next()) {
        if (productId != null) {
        String sql = "delete from product where p_id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, productId);
        pstmt.executeUpdate();

           }
    }
                if (rs != null)
                rs.close();
                if (pstmt != null)
                    pstmt.close();
                if (conn != null)
                    conn.close();

	response.sendRedirect("product_edit.jsp?edit=delete");
%>