<%@ page contentType = "text/html;charset=utf-8" %>

<%! String greeting = "welcome_coupang";
    String tagline = "하단 페이지 : 확인";
%>
    <div class = "jumbotron">
        <div class = "container">
            <h1 class = "display-3">
                <%=greeting%>
            </h1>
        </div>
    </div>
    
    <div class = "card bg-dark text-white">
        <img src = "img/top.jpg" class = "card-img" alt = "top_img">
        <div class = "card-img-overlay">
            <h5 class = "card-title">쿠팡 이벤트</h5>
            <p class = "card-text">출처 : 쿠팡</p>
        </div>
	</div>

	<div class="list-group">
     	<a href="#" class="list-group-item list-group-item-action active" aria-current="true">메이블린 뉴욕</a>
      	<a href="#" class="list-group-item list-group-item-action">메이블린 뉴욕</a>
    	<a href="#" class="list-group-item list-group-item-action">메이블린 뉴욕</a>
        <a href="#" class="list-group-item list-group-item-action">메이블린 뉴욕</a>
      
    </div>
