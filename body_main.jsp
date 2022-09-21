<%@ page contentType = "text/html;charset=utf-8" %>
<%@ page import = "java.util.ArrayList"%>
<%@ page import = "dto.Product"%>
<jsp:useBean id = "productDAO" class = "dao.ProductRepository" scope = "session"/>

<%! String greeting = "welcome_mejiwoo";
    String tagline = "하단 페이지 : 확인"; %>
   
	<div class = "jumbotron" style = "padding : 0; background-color : white">
        <hr style = "margin : 0">
        <div class = "container">
            <h1 class = "display-4" style = "font-size : 1rem; text-align : right; margin : 0">
                <%=greeting%>
            </h1>
        </div>
    </div>

<% ArrayList<Product> listOfProducts = productDAO.getAllProducts(); %>

<div class="container">
		<div class="row" align="center" style = "font-size : 13px"> 
			<%
				for (int i = 0; i < listOfProducts.size(); i++) {
					Product product = listOfProducts.get(i);
			%>
			<div class="col-md-4">
				<h3><%=product.getPname()%></h3>
				<p><%=product.getDescription()%>
				<p><%=product.getUnitPrice()%>원
			</div>
			<%
				}
			%>
		</div>
</div>

<hr>
    
    <div class = "card bg-dark text-white">
        <img src = "img/top_banner.jpeg" class = "card-img" alt = "top_img">
        <div class = "card-img-overlay">
            <h5 class = "card-title">mejiwoo</h5>
            <p class = "card-text">winter</p>
        </div>
	</div>

	<div class="list-group">
     	<a href="#" class="list-group-item list-group-item-action active" aria-current="true">HOME</a>
      	<a href="#" class="list-group-item list-group-item-action">COMPANY</a>
    	<a href="#" class="list-group-item list-group-item-action">AGREEMENT</a>
        <a href="#" class="list-group-item list-group-item-action">PRIVACY</a>
        <a href="#" class="list-group-item list-group-item-action">GUIDE</a>
      
    </div>
