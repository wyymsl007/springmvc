<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
		
        <!-- all css here -->
        <!-- bootstrap v3.3.6 css -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- animate css -->
        <link rel="stylesheet" href="css/animate.css">
        <!-- jquery-ui.min css -->
        <link rel="stylesheet" href="css/jquery-ui.min.css">
        <!-- meanmenu css -->
        <link rel="stylesheet" href="css/meanmenu.min.css">
        <!-- nivo slider css -->
        <link rel="stylesheet" href="lib/css/nivo-slider.css" type="text/css" />
        <link rel="stylesheet" href="lib/css/preview.css" type="text/css" />
        <!-- owl.carousel css -->
        <link rel="stylesheet" href="css/owl.carousel.css">
        <!-- font-awesome css -->
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <!-- style css -->
        <link rel="stylesheet" href="css/style1.css">
        <!-- responsive css -->
        <link rel="stylesheet" href="css/responsive.css">
        <!-- modernizr js -->
        <script src="js/vendor/modernizr-2.8.3.min.js"></script>
<title>Insert title here</title>
</head>
 <body>

        <!-- mobile-menu-area-start -->
        <div class="mobile-menu-area hidden-md hidden-lg" >
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="mobile-menu">
                            <nav id="mobile-menu-active">
                                <ul id="nav">
                                    <li><a href="index.html">Home</a></li>
									<li><a href="about-us.html">About</a></li>
									<li><a href="cart.html">Cart</a></li>
									<li><a href="list-view.html">List</a></li>
									<li><a href="my.account.html">Account</a></li>
									<li><a href="simple-product.html">Product</a></li>
									<li><a href="contact-us.html">Contact us</a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- mobile-menu-area-end -->
        <!--slider area start-->
        <section class="slider-area">
            <div class="container" >
                <div class="row">
                    <div class="col-md-12">
                        <div class="bend niceties preview-2">
                            <div id="ensign-nivoslider" class="slides">
                                <img src="img/slider/slider1_1-1.jpg" alt="" title="#slider-caption-1" />
                                <img src="img/slider/slider1_2.jpg" alt="" title="#slider-caption-2" />
                            </div>
                            <!-- direction 1 -->
                            <div id="slider-caption-1" class="t-cn slider-direction slider-one">
                                <div class="slider-progress"></div>
                                <div class="tld-f1">
                                    <div class="layer-1-1 animated fadeInDown">
                                        <h1> $320.00</h1>
                                    </div>
                                    <div class="layer-1-2 animated flipInX">
                                        <h2>$245.00</h2>
                                    </div>
                                    <div class="layer-1-3 animated rotateInUpLeft">
                                        <h1>NOKIA E600</h1>
                                    </div>
                                    <div class="layer-1-4  animated rotateInUpLeft">
                                        <h3>SALE UO TO 30%</h3>
                                    </div>
                                    <div class="layer-1-5 animated rotateInUpLeft">
                                        <a href="#">Shopping Now</a>
                                    </div>
                                </div>
                                <div class="tld-f2">
                                    <div class="layer-1-6 animated zoomIn">
                                        <img src="img/slider/slider_8.png" alt="">
                                    </div>
                                </div>
                            </div>
                            <!-- direction 2 -->
                            <div id="slider-caption-2" class="slider-direction slider-two">
                                <div class="slider-progress"></div>
                                <div class="sld-fl">
                                    <div class="layer-2-1 animated fadeInLeftBig">
                                        <h1> $320.00</h1>
                                    </div>
                                    <div class="layer-2-2 animated slideInLeft">
                                        <h2>$245.00</h2>
                                    </div>
                                    <div class="layer-2-3 animated slideInLeft">
                                        <h1>MEN'S </h1>
                                    </div>
                                    <div class="layer-2-4 animated slideInLeft">
                                        <h3>SALE UO TO 30%</h3>
                                    </div>
                                    <div class="layer-2-5 animated bounceInUp">
                                        <a href="#">Shopping Now</a>
                                    </div>
                                </div>
                                <div class="sld-fr">
                                    <div class="layer-2-6 animated zoomIn">
                                        <img src="img/slider/slider-9.png" alt="">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <!--slider area end-->
        <!--social design arae start-->
        
        <!--social design arae end-->
        <!--about us area-->

        <!--footer middle area end-->
        <!--footer bottom area start-->

        <form action = "ShowShoppingCart.jsp" action = "get">
    <input type = "submit" value = "查看购物车" style = "position:relative;left:100px;top:250px"/>
    <input type = "button" value = "切换用户" id = "changeUser" style= "position:relative;left:15px;top:300px;">
    <input type = "button" value = "查看订单" id = "showOrder" style = "position:relative;left:-64.5px;top:200px"/>
    <script>
    	document.getElementById("changeUser").onclick = function(){
    		window.location.href = "login.jsp";
    	}
    	document.getElementById("showOrder").onclick = function(){
    		window.location.href = "order.jsp?";
    	}
    	
    </script>
    <center>
    	<div>
	        <table style = "border-style:solid;">
	            <c:forEach var = "i" varStatus = "v" items = "${goodsList }" begin = "${4*(pageIndex-1) }" end = "${4*(pageIndex-1) }">
	                <tr>
	                    <td>
	                        <img src = "${goodsList[v.index].getGoodsImg() }"  style = "width:230px;height:200px;"/><br>
	                        <font color = "blue">${goodsList[v.index].getGoodsName() }</font><br>
	                        <font color = "red">商品价格：${goodsList[v.index].getPrice() } 元 </font><br>
	                        <a href = "AddShoppingCart?goodsName=${goodsList[v.index].getGoodsName() }&price= ${goodsList[v.index].getPrice() }&goodsImg=${goodsList[v.index].getGoodsImg() }">
	                            加入购物车
	                        </a>
	                        <a href = "pay.jsp?goodsImg=${goodsList[v.index].getGoodsImg() }&goodsName=${goodsList[v.index].getGoodsName() }&price=${goodsList[v.index].getPrice() }&paySum=1"><font color = "yellow">立即购买</font></a><br>
	                        产地： ${goodsList[v.index].getGoodsShop() }
	                    </td>
	                     <c:if test = "${!empty goodsList[v.index+1].getGoodsName() }">
	                    <td>
	                       
	                            <img src = "${goodsList[v.index+1].getGoodsImg() }" style = "width:230px;height:200px;" /><br>
	                            <font color = "blue">${goodsList[v.index+1].getGoodsName() }</font><br>
	                           <font color = "red">商品价格：${goodsList[v.index+1].getPrice() } 元 </font><br>
	                            <a href = "AddShoppingCart?goodsName=${goodsList[v.index+1].getGoodsName() }&price= ${goodsList[v.index+1].getPrice() }&goodsImg=${goodsList[v.index+1].getGoodsImg() }">
	                            加入购物车
	                            </a>
	                            <a href = "pay.jsp?goodsImg=${goodsList[v.index+1].getGoodsImg() }&goodsName=${goodsList[v.index+1].getGoodsName() }&price=${goodsList[v.index+1].getPrice() }&paySum=1"><font color = "yellow">立即购买</font></a><br>
	                            产地： ${goodsList[v.index+1].getGoodsShop() }                         
	                        
	
	                    </td>
	                    </c:if>
	                </tr>
	                <tr>
	                	<c:if test = "${!empty goodsList[v.index+2].getGoodsName() }">
	                    <td>
	                        
	                            <img src = "${goodsList[v.index+2].getGoodsImg() }" style = "width:230px;height:200px;" /><br>
	                           <font color = "blue">${goodsList[v.index+2].getGoodsName() }</font><br>
	                            <font color = "red">商品价格：${goodsList[v.index+2].getPrice() } 元 </font><br>
	                            <a href = "AddShoppingCart?goodsName=${goodsList[v.index+2].getGoodsName() }&price= ${goodsList[v.index+2].getPrice() }&goodsImg=${goodsList[v.index+2].getGoodsImg() }">
	                            加入购物车
	                            </a>
	                            <a href = "pay.jsp?goodsImg=${goodsList[v.index+2].getGoodsImg() }&goodsName=${goodsList[v.index+2].getGoodsName() }&price=${goodsList[v.index+2].getPrice() }&paySum=1"><font color = "yellow">立即购买</font></a><br>
	                            产地： ${goodsList[v.index+2].getGoodsShop() }
	                     
	                       
	                    </td>
	                     </c:if> 
	                     <c:if test = "${!empty goodsList[v.index+3].getGoodsName() }">
	                    <td>
	                       
	                            <img src = "${goodsList[v.index+3].getGoodsImg() }" style = "width:230px;height:200px;" /><br>
	                           <font color = "blue">${goodsList[v.index+3].getGoodsName() }</font><br>
	                            <font color = "red">商品价格：${goodsList[v.index+3].getPrice() } 元 </font><br>
	                            <a href = "AddShoppingCart?goodsName=${goodsList[v.index+3].getGoodsName() }&price= ${goodsList[v.index+3].getPrice() }&goodsImg=${goodsList[v.index+3].getGoodsImg() }">
	                            加入购物车
	                            </a>
	                            <a href = "pay.jsp?goodsImg=${goodsList[v.index+3].getGoodsImg() }&goodsName=${goodsList[v.index+3].getGoodsName() }&price=${goodsList[v.index+3].getPrice() }&paySum=1"><font color = "yellow">立即购买</font></a><br>
	                            产地： ${goodsList[v.index+3].getGoodsShop() }
	                        
	                    </td>
	                    </c:if> 
	                </tr>
	            </c:forEach>
	        </table>
	            <c:if test = "${pageIndex>1 }">
	                <a href = "PageDivide?pageIndex=1">首页</a>
	                <a href = "PageDivide?pageIndex=${pageIndex-1 }">上一页</a>
	            </c:if>
	            <c:if test = "${pageIndex<pageCount }">
	                <a href = "PageDivide?pageIndex=${pageIndex+1 }">下一页</a>
	                <a href = "PageDivide?pageIndex=${pageCount }">尾页</a>
	            </c:if>
            </div>     
    </center>
    </form>

        <!--footer bottom area end-->
        <!--modal content start-->
        <!-- Modal -->

        <div class="modal fade" id="myModal" role="dialog" >
            <div class="modal-dialog modal-dialog-2">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="modal-product">
                            <div class="row">
                                <div class="new_port new_port_2">
                                    <div class="port_pix">
                                        <img src="img/product-pic/product_pic_2.jpg" alt="">
                                    </div>
                                </div>
                                <div class="elav_titel elav_titel_2">
                                    <div class="elv_heading elv_heading_therteen">
                                        <h3>Donec non est at</h3>
                                    </div>
                                    <div class="elav_info">
                                        <div class="price_box price_box_pb">
                                            <span class="spical-price spical-price-nk">$250.00</span>
                                        </div>
                                        <form class="cart-btn-area cart-btn-area-dec" action="#">
                                            <a class="see-all" href="#">See all features</a><br>
                                            <input type="number" value="1">
                                            <button class="add-tocart add-tocart-2" type="submit">Add to cart</button>
                                        </form>
                                    </div>
                                    <div class="evavet_description evavet_description_dec">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce posuere metus vitae arcu imperdiet, id aliquet ante scelerisque. Sed sit amet sem vitae urna fringilla tempus.</p>
                                    </div>
                                    <div class="elavetor_social">
                                        <h3 class="widget-title">Share this product</h3>
                                        <br>
                                        <ul class="social-link social-link-bbt">
                                            <li><a class="fb" data-original-title="facebook" href="#" title="" data-toggle="tooltip"><i class="fa fa-facebook"></i></a></li>
                                            <li><a class="twit" data-original-title="twitter" href="#" title="" data-toggle="tooltip"><i class="fa fa-twitter"></i></a></li>
                                            <li><a class="pinter" data-original-title="pinterest" href="#" title="" data-toggle="tooltip"><i class="fa fa-pinterest"></i></a></li>
                                            <li><a class="google+" href="#" title="Google+" data-target="#productModal" data-toggle="tooltip"><i class="fa fa-google-plus"></i></a></li>
                                            <li><a class="lindin" href="#" title="LinkedIn" data-target="#productModal" data-toggle="tooltip"><i class="fa fa-linkedin"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--modal content end-->

		
		
		
		
        <!-- all js here -->
        <!-- jquery latest version -->
        <script src="js/vendor/jquery-1.12.0.min.js"></script>
        <!-- bootstrap js -->
        <script src="js/bootstrap.min.js"></script>
        <!-- nivo slider js -->
        <script src="lib/js/jquery.nivo.slider.js" type="text/javascript"></script>
        <script src="lib/home.js" type="text/javascript"></script>
        <!-- owl.carousel js -->
        <script src="js/owl.carousel.min.js"></script>
        <!-- meanmenu js -->
        <script src="js/jquery.meanmenu.js"></script>
        <!-- jquery-ui js -->
        <script src="js/jquery-ui.min.js"></script>
        <!-- easing js -->
        <script src="js/jquery.easing.1.3.js"></script>
        <!-- mixitup js -->
        <script src="js/jquery.mixitup.min.js"></script>
        <!-- jquery.countdown js -->
        <script src="js/jquery.countdown.min.js"></script>
        <!-- wow js -->
        <script src="js/wow.min.js"></script>
        <!-- popup js -->
        <script src="js/jquery.magnific-popup.min.js"></script> 
        <!-- plugins js -->
        <script src="js/plugins.js"></script>
        <!-- main js -->
        <script src="js/main.js"></script>
    </body>
</html>