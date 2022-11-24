<%@ page contentType = "text/html;charset=utf-8" %>
<%@ page import="java.sql.*"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="dto.Member"%>
<%@ page import="../db/db_conn.jsp"%>


<%
	request.setCharacterEncoding("UTF-8");

 	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, policy);

	String id = multi.getParameter("id");
	String password = multi.getParameter("password");
	String name = multi.getParameter("name");
	String gender = multi.getParameter("gender");
	String birth = multi.getParameter("birth");
	String mail = multi.getParameter ("mail");
	String phone = multi.getParameter("phone");
	String address = multi.getParameter("address");	

	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);

    String sql = "insert into member values(?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, password);
	pstmt.setInt(3, name);
	pstmt.setString(4, gender);
	pstmt.setString(5, birth);
	pstmt.setString(6, mail);
	pstmt.setLong(7, phone);
	pstmt.setString(8, address);
	pstmt.executeUpdate();
	
	if (pstmt != null)
 		pstmt.close();
 	if (conn != null)
		conn.close();

	response.sendRedirect("index_ad.jsp");
%>
