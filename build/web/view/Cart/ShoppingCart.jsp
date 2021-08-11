<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>DapurKue | Shopping Cart</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" media="all" href="css/960.css" />
        <link rel="stylesheet" type="text/css" media="all" href="css/reset.css" />
        <link rel="stylesheet" type="text/css" media="all" href="css/text.css" />
        <link rel="stylesheet" type="text/css" media="all" href="css/style.css" />
        <link rel="stylesheet" type="text/css" media="all" href="themes/brown/style.css" />
    </head>
    <script>
        function myFunction(val) {
            document.add.action = "Reload?quantity=" + val;
            document.add.submit();
            if(val >= ${productQuantity}){
            alert("The quantity can not be greater than " + ${productQuantity});
            location.reload(true);

        }else if(val==0){
            location.reload(true);
        }
        }


    </script>     
    <body>
        <div id="warp">
            <div id="main" class="container_16">
                <div id="header" class="grid_16">
                    <div id="logo" class="grid_4 alpha">
                        <h1 style="text-indent:-9999px;
                            background:transparent url(images/dapurkue.png) no-repeat">
                            <a href="" href="#" style="display:block;
                               height:105px;
                               width:220px;">DapurKue</a></h1>
                        <h2 style="display:none;" >Famously Delicious</h2>
                    </div>
                    <c:choose>
                        <c:when test="${sessionScope.user1 eq null}">
                            <div id="headright" class="grid_7 prefix_5 omega">
                                <h3 class="login"><a href="login">Sign up</a> / <a href="login">Login</a></h3>
                                <p>Subtotal: $ ${grandtotal}</p>
                                <p><span class="vChart"><a href="showCartController">View Cart</a></span> <span class="cOut"><a href="CheckOutController">Checkout</a></span></p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div id="headright" class="grid_7 prefix_5 omega">
                                <h3 class="login"><span class="hiUser"><c:if test="${not empty sessionScope.user1}"></c:if>Hi, ${sessionScope.user1.role} ${sessionScope.user1.account} |</span> <span class="myAccount"><a href="UpdateAccountController?id=${sessionScope.user1.id}">My Account</a></span> <a href="LogoutController">Logout</a></h3>
                                <p>Subtotal: $ ${grandtotal}</p>
                                <p><span class="vChart"><a href="showCartController">View Cart</a></span> <span class="cOut"><a href="CheckOutController">Checkout</a></span></p>
                            </div>
                        </c:otherwise>


                    </c:choose  >
                </div>

                <div id="mainMenu" class="grid_16">
                    <ul>
                        <li><a href="home" class="aActive">Home</a></li>
                        <li><a href="ProductOverviewController">Cakes</a></li>
                        <li><a href="#">Order &amp; Delivery</a></li>
                        <li><a href="#">Blog</a></li>
                        <li><a href="#">About</a></li>
                        <li><a href="#">Contact</a></li>
                            <c:if test="${sessionScope.user1.role == 'admin'}">
                            <li><a href="Administrator">Manage</a></li>
                            </c:if>
                    </ul>
                </div>
                <div id="stickySearch" class="grid_16">
                    <div class="stickyNews grid_12 alpha">
                        <p>Valentine?s BrownieCheese Special Package. <em>Free Delivery.</em> <a href="#" class="bookMan">More &raquo;</a></p>
                    </div>
                    <div class="search grid_4 omega">
                        <form action="#" method="get">
                            <input type="text" value="Type your keyword" id="s" name="s" onfocus="if (this.value == 'Type your keyword') {
                                        this.value = '';
                                    }" onblur="if (this.value == '') {
                                                this.value = 'Type your keyword';
                                            }" />
                        </form>
                    </div>
                </div>
                <div class="prodNav grid_16">
                    <div class="prodHeadline grid_16">
                        <h3>Your Shopping Cart</h3>
                    </div>
                </div>
                <div class="bodyContent grid_16">
                    <div class="shopCart grid_16 alpha">
                        <div class="headCart grid_16 alpha">
                            <div class="itemHead grid_7 alpha"> Item Description</div>
                            <div class="priceHead grid_2"> Price</div>
                            <div class="qtyHead grid_3"> Quantity</div>
                            <div class="subtotalHead grid_2"> Subtotal</div>
                            <div class="remHead grid_1 omega"> Remove</div>
                        </div>
                        <style>
                            *{
                                text-decoration: none;
                            }
                        </style>

                        <c:forEach items="${sessionScope.listCart}" var="c">
                            <div class="bodyCart grid_16 alpha">
                                <div class="warpCart">

                                    <div class="item grid_7 alpha">
                                        <p style="font-size: 120%;padding-bottom: 15px "><a href="#">
                                                <img src="images/cake/Totalcake/${c.productid.imgName}" style="  height: 70px; width: 70px;"alt="" /> 
                                            </a> Delicious Cheesecake in  Pan With Choco Slices<br />
                                            <span>${c.productid.name}</span></p>
                                    </div>
                                    <div class="price grid_2">
                                        <p style="padding-top: 20px; font-size: 140% ">${c.productid.price}</p>
                                    </div> 
                                    <div class="qty grid_3" style="margin-top: 2%">

                                 
                                            <form action="Reload">
                                                <input type="number"  name="quantity" value="${c.quantity}"   
                                                       style="width: 50%; height: 60%"    onchange="this.form.submit()"/>

                                                <input type="hidden" style="size: 1" name="id" value="${c.productid.id}"/>
                                            </form>
                 <!--                                            <input type="text" name="inputQuantity" id="inputQuantity" value="${c.quantity}"  size="1"/></a>-->



                                       
                                       

                                    </div>
                                    <div class="subtotal grid_2">
                                        <p style="padding-top: 20px;font-size: 140%">$ ${c.productid.price * c.quantity}</p>
                                    </div>
                                    <div class="remove grid_1 omega">
                                        <p style="padding-top: 19px; font-size: 140%">  <a href="RemoveCartController?id=${c.productid.id}">remove</a><p>
                                                </div>
                                                </div>



                                                </div>
                                            </c:forEach>
                                            <div class="footCart grid_16 alpha">
                                                <div class="grandTotal  prefix_11 alpha" style="display:inline;
                                                     float:left;
                                                     position:relative;
                                                     margin-left:10px;
                                                     margin-right:30px;
                                                     font:bold italic 20px/120% "Bookman Old Style", Georgia;
                                                     color:#FF9900;"> Grand Total</div>
                                                <div class="totalPrice grid_1 omega"> $${sessionScope.grandtotal}</div>
                                            </div>
                                            <div class="buttonCart grid_16 alpha">
                                                <a href="ProductOverviewController"> <input type="button" value="Continue Shopping" name="Continue Shopping" class="continueShop" /></a>
                                                <a href="CheckOutController">        <input type="submit" value="Checkout" style="float: right" name="Checkout" class="checkoutCart" /></a>
                                                <a href="RemoveCartController?id=0">     <input type="button" value="Remove All"   name="Remove all" class="remove All"  
                                                                                                style="display:block;
                                                                                                float:right;
                                                                                                cursor:pointer;
                                                                                                height:36px;
                                                                                                border:none;
                                                                                                padding: 10px;
                                                                                                margin-right: 10px;
                                                                                                width:110px;
                                                                                                background-color: #FF9900;
                                                                                                border-radius: 50px 50px;
                                                                                                font-weight: bolder;"
                                                                                                /></a>

                                                <div class="clear"></div>
                                            </div>

                                            </div>
                                            <div id="chooseCake" class="grid_16">
                                                <div class="youLike grid_16">
                                                    <h3>You might also like</h3>
                                                </div>
                                            </div>
                                            <div class="newCakes">
                                                <div class="newCake"><a href="product-details.html" class="grid_4"><img src="images/freshCake1.jpg" alt="" width="220" height="120" /></a></div>
                                                <div class="newCake"><a href="product-details.html" class="grid_4"><img src="images/freshCake2.jpg" alt="" width="220" height="120" /></a></div>
                                                <div class="newCake"><a href="product-details.html" class="grid_4"><img src="images/freshCake3.jpg" alt="" width="220" height="120" /></a></div>
                                                <div class="newCake"><a href="product-details.html" class="grid_4"><img src="images/freshCake4.jpg" alt="" width="220" height="120" /></a></div>
                                            </div>
                                            </div>
                                            </div>
                                            <div class="clear"></div>
                                            </div>
                                            <div id="richContent">
                                                <div class="container_16">
                                                    <div class="popularCakes grid_4">
                                                        <h4>Popular Cakes</h4>
                                                        <ul>
                                                            <li><a href="#">Ultimate Choco Brownie</a></li>
                                                            <li><a href="#">Mokakokoa Brownie</a></li>
                                                            <li><a href="#">CoffeeBrown</a></li>
                                                            <li><a href="#">Delicacheese</a></li>
                                                            <li><a href="#">Berries Cheesecake</a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="recommended grid_4">
                                                        <h4>Recommended</h4>
                                                        <ul>
                                                            <li><a href="#">Ultimate Choco Brownie</a></li>
                                                            <li><a href="#">Mokakokoa Brownie</a></li>
                                                            <li><a href="#">CoffeeBrown</a></li>
                                                            <li><a href="#">Delicacheese</a></li>
                                                            <li><a href="#">Berries Cheesecake</a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="specialOffer grid_4">
                                                        <h4>Special Offer</h4>
                                                        <ul>
                                                            <li><a href="#">Ultimate Choco Brownie</a></li>
                                                            <li><a href="#">Mokakokoa Brownie</a></li>
                                                            <li><a href="#">CoffeeBrown</a></li>
                                                            <li><a href="#">Delicacheese</a></li>
                                                            <li><a href="#">Berries Cheesecake</a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="orderPhone grid_4">
                                                        <h4><em>Order by Phone</em> <span>987-654-321</span></h4>
                                                    </div>
                                                    <div class="clear"></div>
                                                </div>
                                            </div>
                                            <div id="richContent2">
                                                <div class="container_16">
                                                    <div class="fromBlog grid_4">
                                                        <h4>From the blog</h4>
                                                        <h5>New Recipes in Our Basket</h5>
                                                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra, felis vel accumsan fermentum... <a href="#" class="bookMan">more &raquo;</a></p>
                                                    </div>
                                                    <div class="corporateInfo grid_4">
                                                        <h4>Corporate Info</h4>
                                                        <ul>
                                                            <li><a href="#">Privacy Policy</a></li>
                                                            <li><a href="#">Term &amp; Conditions</a></li>
                                                            <li><a href="#">Franchise</a></li>
                                                            <li><a href="#">About us</a></li>
                                                            <li><a href="#">FAQ</a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="storeDelivery grid_4">
                                                        <h4>Store &amp; Delivery</h4>
                                                        <ul>
                                                            <li><a href="#">Store Locator</a></li>
                                                            <li><a href="#">Delivery Terms &amp;amp Pricing</a></li>
                                                            <li><a href="#">Delivery Coverage</a></li>
                                                            <li><a href="#">Gift Services</a></li>
                                                            <li><a href="#">Track my order</a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="socialNet grid_4">
                                                        <h4>Keep in touch</h4>
                                                        <ul>
                                                            <li><a href="#" class="facebook">Facebook</a></li>
                                                            <li><a href="#" class="twitter">Twitter</a></li>
                                                            <li><a href="#" class="feed">Feed</a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="clear"></div>
                                                </div>
                                            </div>
                                            <div id="footer">
                                                <div class="container_16">
                                                    <div class="copyright grid_16">
                                                        <p class="left">Copyright &copy; 2010, Your Company Here, All Rights Reserved</p>
                                                        <p class="right">Design by <a href="http://tokokoo.com/">Tokokoo</a> &amp; <a href="http://www.instantshift.com/">instantShift</a></p>
                                                        <div class="clear"></div>
                                                    </div>
                                                    <div class="clear"></div>
                                                </div>
                                            </div>
                                            </body>
                                            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

                                            </html>
