<%@ page contentType = "text/html;charset=utf-8" %>
<%@ page import = "java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ page import = "dao.ProductRepository"%>

<%! String greeting = "welcome_mejiwoo";
    String tagline = "하단 페이지 : 확인"; %>
   
	<div class = "jumbotron" style = "padding : 0; background-color : white; margin-bottom : 12px">
        <hr style = "margin : 0">
        <div class = "container">
            <h1 class = "display-4" style = "font-size : 1rem; text-align : right; margin-top : 9px">
                <%=greeting%>
            </h1>
        </div>
    </div>

<% 
    ProductRepository dao = ProductRepository.getInstance();
	ArrayList<Product> listOfProducts = dao.getAllProducts();
%>
    
    <div class = "card bg-dark text-white">
         <img src = "img/top_banner.jpeg" class = "card-img" alt = "top_img">
        <div class = "card-img-overlay" >
            <h5 class = "card-title">mejiwoo</h5>
            <p class = "card-text">winter</p>
        </div>
	</div>

    <div class="container" style = "margin-top : 30px">
            <div class="row" align="center" style = "font-size : 13px"> 
                <%
                    for (int i = 0; i < listOfProducts.size(); i++) {
                        Product product = listOfProducts.get(i);
                %>
                <div class="col-md-4">
                    <img src = "img/product/<%=product.getFilename()%>" class="card-img" alt="...">
                    <h3><%=product.getPname()%></h3>
                    <p><%=product.getDescription()%>
                    <p><%=product.getUnitPrice()%>원
                    <p><a href="product_detail_ad.jsp?id=<%=product.getProductId()%>" class="btn btn-secondary" role="button"> 상품 상세 정보 &raquo;</a>

                </div>
                <%
                    }
                %>
            </div>
    </div>

	<div class="list-group">
     	<a href="#" class="list-group-item list-group-item-action active" aria-current="true" style = "background-color : blanchedalmond; border-color : blanchedalmond">HOME</a>
      	<a href="#" class="list-group-item list-group-item-action">COMPANY</a>
    	<a href="#" class="list-group-item list-group-item-action">AGREEMENT</a>
        <a href="#" class="list-group-item list-group-item-action">PRIVACY</a>
        <a href="#" class="list-group-item list-group-item-action">GUIDE</a>
      
    </div>