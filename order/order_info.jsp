<%@ page contentType = "text/html;charset=utf-8" %>

<html>
<head>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
<!-- 달력 -->
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>>
    
<!-- 우편번호 -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
<title>배송 정보</title>
</head>
<body>
	<jsp:include page="../top_menu.jsp" />
	<div class="jumbotron">
	   <div class="container">
		<h1 class="display-3">배송 정보</h1>
	   </div>
	</div>
	<div class="container">
	   <form action="order_info_process.jsp" class="form-horizontal" method="post">
	     <input type="hidden" name="cartId" value="<%=request.getParameter("cartId")%>" />
	     <div class="form-group row">
	       <label class="col-sm-2">성명</label>
	          <div class="col-sm-3">
	      	<input name="name" type="text" class="form-control" />
	          </div>
	    </div>
           <div class="form-group row">
	<label class="col-sm-2">배송일</label>
	<div class="col-sm-3">
        <input name = "shippingDate" id = "datepicker" type = "date" class = "form-control" placeholder = "yyyy/mm/dd"/>
        <script>
              $(function(){
                 $('#datepicker').datepicker({
                     dateFormat: 'yy-mm-dd',
                     minDate: 1 });
              });
		</script>
	</div>
	  </div>
	 <div class="form-group row">
	   <label class="col-sm-2">국가명</label>
	     <div class="col-sm-3">
             <select name = "country" class="form-control" id = "country" class="form-control">
                 <option value = "한국">한국</option>
                 <option value = "중국">중국</option>
                 <option value = "일본">일본</option>
                 <option value = "미국">미국</option>
             </select>

	    </div>
	 </div>
	<div class="form-group row">
	   <label class="col-sm-2">우편번호</label>
	     <div class="col-sm-3">
            <input type="text" id="sample3_postcode" name="zipCode" placeholder="우편번호" class="form-control">
            <input type="button" onclick="sample3_execDaumPostcode()" value="우편번호 찾기"><br>
            <input type="text" id="sample3_address" name = "addressName" placeholder="주소"><br>
            <input type="text" id="sample3_detailAddress" placeholder="상세주소">
            <input type="text" id="sample3_extraAddress" placeholder="참고항목">

            <div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
            <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
            </div>

            <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
            <script>
                // 우편번호 찾기 찾기 화면을 넣을 element
                var element_wrap = document.getElementById('wrap');

                function foldDaumPostcode() {
                    // iframe을 넣은 element를 안보이게 한다.
                    element_wrap.style.display = 'none';
                }

                function sample3_execDaumPostcode() {
                    // 현재 scroll 위치를 저장해놓는다.
                    var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
                    new daum.Postcode({
                        oncomplete: function(data) {
                            // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                            var addr = ''; // 주소 변수
                            var extraAddr = ''; // 참고항목 변수

                            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                                addr = data.roadAddress;
                            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                                addr = data.jibunAddress;
                            }

                            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                            if(data.userSelectedType === 'R'){
                                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                                    extraAddr += data.bname;
                                }
                                // 건물명이 있고, 공동주택일 경우 추가한다.
                                if(data.buildingName !== '' && data.apartment === 'Y'){
                                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                                }
                                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                                if(extraAddr !== ''){
                                    extraAddr = ' (' + extraAddr + ')';
                                }
                                // 조합된 참고항목을 해당 필드에 넣는다.
                                document.getElementById("sample3_extraAddress").value = extraAddr;

                            } else {
                                document.getElementById("sample3_extraAddress").value = '';
                            }

                            // 우편번호와 주소 정보를 해당 필드에 넣는다.
                            document.getElementById('sample3_postcode').value = data.zonecode;
                            document.getElementById("sample3_address").value = addr;
                            // 커서를 상세주소 필드로 이동한다.
                            document.getElementById("sample3_detailAddress").focus();

                            // iframe을 넣은 element를 안보이게 한다.
                            // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                            element_wrap.style.display = 'none';

                            // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                            document.body.scrollTop = currentScroll;
                            },
                            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
                            onresize : function(size) {
                                element_wrap.style.height = size.height+'px';
                            },
                            width : '100%',
                            height : '100%'
                            }).embed(element_wrap);

                            // iframe을 넣은 element를 보이게 한다.
                             element_wrap.style.display = 'block';
                            }
            </script>
                    </div>
                </div>
<!-- <div class="form-group row">
	   <label class="col-sm-2">주소</label>
	     <div class="col-sm-5">
		<input name="addressName" type="text" class="form-control" />
	     </div>
	</div> -->
	<div class="form-group row">
	   <div class="col-sm-offset-2 col-sm-10 ">
	     <a href="../cart/product_cart.jsp?cartId=<%=request.getParameter("cartId")%>" class="btn btn-secondary" role="button"> 이전 </a> 
		<input type="submit" class="btn btn-primary" value="등록" />
		<a href="order_cancelled.jsp" class= "btn btn-secondary" role="button"> 취소 </a>
	   </div>
	</div>
  </form>
  </div>
</body>
</html>

