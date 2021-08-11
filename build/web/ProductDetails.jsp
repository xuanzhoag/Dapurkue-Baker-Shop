<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>DapurKue | Product Details</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" media="all" href="css/960.css" />
        <link rel="stylesheet" type="text/css" media="all" href="css/reset.css" />
        <link rel="stylesheet" type="text/css" media="all" href="css/text.css" />
        <link rel="stylesheet" type="text/css" media="all" href="css/style.css" />
        <link rel="stylesheet" type="text/css" media="all" href="themes/brown/style.css" />
    </head>
    <script>

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
                        <h3 class="login"><span class="hiUser"><c:if test="${not empty sessionScope.user1}"></c:if>Hi, ${sessionScope.user1.role} ${sessionScope.user1.account} HE151343|</span> <span class="myAccount"><a href="UpdateAccountController?id=${sessionScope.user1.id}">My Account</a></span> <a href="LogoutController">Logout</a></h3>
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
                    <div class="breadcrumb grid_12 alpha"> <a href="#">Cakes</a> &raquo; <a href="#">Brownies</a> &raquo; Brownimissu</div>
                    <div class="browseCategory grid_4 omega">
                        <form action="#" method="get">
                            <select>
                                <option>All Category</option>
                                <option>Brownimissu</option>
                                <option>Kue Tete</option>
                                <option>Bagelan</option>
                            </select>
                        </form>
                    </div>
                </div>
                <div class="bodyContent grid_16">
                    <div class="blogPage grid_11 alpha">

                        <div class="post">
                            <p><img src="images/cake/Totalcake/${requestScope.pro.imgName}" style="height: 350px ; width: 100%"  alt="" /></p><br>
                            
                                <h2>${requestScope.pro.name}</h2> 
                                <p>${requestScope.pro.description}</p>
                        </div>
                    </div>
                    <div class="sideBarProd grid_5 omega">
                        <div class="sideBarWarp">
                            <h3 >${requestScope.pro.category.name}</h3>     
                            <h4 style="font-size: 130%">${requestScope.pro.price} $ </h4>
                            <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sitouiet amet metus cursus consequat. Nullaiverra, felis vel accumsan fermentum, nisl enimuh.</p>
                       
                              
                                
                            
                                <p> 
                                    <a href="add3cart?id=${requestScope.pro.id}">  <input type="submit" value="Add to Cart" tabindex="2" name="submit" class="addCart button" />
                                    <input type="hidden" value="30" name="comment_post_ID" /></a>
                                </p>
                           
                            <ul>
                                <li><a href="#"><img src="images/flickr1.jpg" alt="" /></a></li>
                                <li><a href="#"><img src="images/flickr2.jpg" alt="" /></a></li>
                                <li><a href="#"><img src="images/flickr3.jpg" alt="" /></a></li>
                                <li><a href="#"><img src="images/flickr4.jpg" alt="" /></a></li>
                            </ul>
                            <div class="clear"></div>
                        </div>
                        <div class="fiveStar">
                            <h4>Our Quality Guarantee</h4>
                            <p><img src="images/star.png" alt="" /> <img src="images/star.png" alt="" /> <img src="images/star.png" alt="" /> <img src="images/star.png" alt="" /> <img src="images/star.png" alt="" /></p>
                            <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. vivamus tempor justo sit amet metus cursus consequat. Nulla viverra.</p>
                        </div>
                        <p><a href="#" class="viewOrder">View Order &amp; delivery details &raquo;</a></p>
                    </div>
                    <div id="chooseCake" class="grid_16">
                        <div class="youLike grid_16">
                            <h3>You might also like</h3>
                        </div>
                    </div>
                    <div class="newCakes">
                        <div class="newCake"><a href="#" class="grid_4"><img src="images/freshCake1.jpg" alt="" width="220" height="120" /></a></div>
                        <div class="newCake"><a href="#" class="grid_4"><img src="images/freshCake2.jpg" alt="" width="220" height="120" /></a></div>
                        <div class="newCake"><a href="#" class="grid_4"><img src="images/freshCake3.jpg" alt="" width="220" height="120" /></a></div>
                        <div class="newCake"><a href="#" class="grid_4"><img src="images/freshCake4.jpg" alt="" width="220" height="120" /></a></div>
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
</html>