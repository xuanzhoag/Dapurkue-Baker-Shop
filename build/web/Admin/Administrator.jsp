


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" media="all" href="css/960.css" />
        <link rel="stylesheet" type="text/css" media="all" href="css/reset.css" />
        <link rel="stylesheet" type="text/css" media="all" href="css/text.css" />
        <link rel="stylesheet" type="text/css" media="all" href="css/style.css" />
        <link rel="stylesheet" type="text/css" media="all" href="themes/brown/style.css" />
    </head>
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
                                <p>Subtotal: ${sessionScope.grandtotal}</p>
                                <p><span class="vChart"><a href="showCartController">View Cart</a></span> <span class="cOut"><a href="checkout.html">Checkout</a></span></p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div id="headright" class="grid_7 prefix_5 omega">
                                <h3 class="login"><span class="hiUser"><c:if test="${not empty sessionScope.user1}"></c:if>Hi,${sessionScope.user1.role} ${sessionScope.user1.account} HE151343|</span> <span class="myAccount"><a href="#">My Account</a></span> <a href="LogoutController">Logout</a></h3>
                                    <p>Subtotal: $ 00.00</p>
                                    <p><span class="vChart"><a href="showCartController">View Cart</a></span> <span class="cOut"><a href="checkout.html">Checkout</a></span></p>
                                </div>
                        </c:otherwise>


                    </c:choose>
                </div>
                <div id="mainMenu" class="grid_16">
                    <ul>
                        <li><a href="index.html">Home</a></li>
                        <li><a href="#">Cakes</a></li>
                        <li><a href="#">Order &amp; Delivery</a></li>
                        <li><a href="#">Blog</a></li>
                        <li><a href="#">About</a></li>
                        <li><a href="#">Contact</a></li>
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
                <div class="pageInfo grid_16">
                    <div class="dapurBlog grid_11 alpha">

                    </div>
                </div>
                <div class="checkout grid_16">
                    <div class="billInfo grid_12 alpha">

                        <div><h3 style="font:bold italic 20px  Georgia;margin-left:3%">
                                Product Management
                            </h3></div>
                        <div class="bodyContent grid_12" style="margin-top: 0%;">
                            <div class="shopCart grid_12 alpha">
                                <div class="headCart grid_12 alpha" >
                                    <div class="qtyHead grid_1"style="text-align: left;" >ID</div>
                                    <div class="qtyHead grid_1" style="padding-right: 5%;" >Name</div>
                                    <div class="qtyHead grid_1" style="padding-right: 5%;">Phone</div>
                                    <div class="qtyHead grid_1" style="padding-right: 5%;" >Address</div>
                                    <div class="qtyHead grid_2" >username</div>


                                    <div class="qtyHead grid_1">status</div>
                                    <div class="subtotalHead grid_1" style="padding-left: 10px"> Update</div>
                                    <div class="remHead grid_1 omega"> Remove</div>
                                </div>
                                <c:forEach items="${requestScope.cusList}" var="c">

                                    <div class="bodyCart grid_12 alpha" style="font-size: 120%">
                                        <!--           item grid_9 alpha-->
                                        <div class="warpCart">
                                            <div class="qtyHead grid_1" style="text-align: left; margin-top: 10px" >${c.id}</div>
                                            <div class="qtyHead grid_1" style="padding-right: 5%;  margin-top: 10px" >${c.cname}</div>
                                            <div class="qtyHead grid_1" style="padding-right: 5%;  margin-top: 10px" >${c.cphone}</div>

                                            <div class="qtyHead grid_1"  style="padding-right: 5%; margin-top: 10px">${c.cAddress}</div>
                                            <div class="priceHead grid_2" style=" margin-top: 10px">${c.username}</div>



                                            <div class="qtyHead grid_1" style=" margin-top: 10px">  <c:choose>
                                                    <c:when test="${c.status==1}">
                                                        <p>enable</p>
                                                    </c:when>
                                                    <c:when test="${c.status == 0}">
                                                        <p>disable</p>
                                                    </c:when> 

                                                </c:choose></div>

                                            <div class="subtotalHead grid_1" class="subtotalHead grid_1" style="padding-left: 10px; margin-top: 10px"><a href="UpdateCustomerController?id=${c.id}">Update</a> </div>
                                            <div class="remHead grid_1 omega" style=" margin-top: 10px"><a href="RemoveCustomerController?id=${c.id}">Remove</a> </div>

                                        </div>



                                    </div>
                                </c:forEach>

                                <a href="InsertCustomerController"> <input type="button" value="Adding a new Customer "  name="update" class="Update AccountButton" 
                                                                           style="display:block;
                                                                           float:left;
                                                                           cursor:pointer;
                                                                           height:39px;
                                                                           border:none;
                                                                           margin: 20px;
                                                                           width:254px;
                                                                           background-color: #FF9900;
                                                                           border-radius: 50px 50px;
                                                                           font-weight: bold;
                                                                           "/>


                                    <!--                            <div class="buttonCart grid_16 alpha">
                                                                    <input type="button" value="Add More Accounts" name="addMoreAccounts" class="addMoreAccounts" />
                                                                   
                                                                    <div class="clear"></div>
                                                                </div>-->
                                    </form>
                            </div>
                            <div id="chooseCake" class="grid_16">
                                <div class="youLike grid_16">
                                    <h3>You might also like</h3>
                                </div>
                            </div>

                        </div>


                    </div>
                    <div class="summary grid_4 omega">
                        <h4 style="padding-bottom:  2%">Summary</h4>
                        <div class="sumWarp">
                            <ul>
                                <li><a href="Administrator" class="down">Customer Manager <span><img src="images/done.png" alt="" /></span></a>
                                    <ul>
                                        <li class="info">${requestScope.cuactive.count} Valid Customers </li>
                                        <li class="info">${requestScope.cudeactive.count} customers are banned</li>
                                        <li class="edit"><a href="#">EDIT &raquo;</a></li>
                                        <li class="clear"></li>
                                    </ul>
                                </li>
                                <li><a href="ProductManager" class="down">Product Manager <span><img src="images/done.png" alt="" /></span></a>
                                    <ul>
                                        <li class="info">${requestScope.pactive.count} Products has been offered for sale</li>
                                        <li class="info">${requestScope.pdeactive.count} not enough quality Products </li>
                                        <li class="edit"><a href="#">EDIT &raquo;</a></li>
                                        <li class="clear"></li>
                                    </ul>
                                </li>
                                <li><a href="OrderManager" class="down">Order Manager <span><img src="images/done.png" alt="" /></span></a>
                                    <ul>
                                        <li class="info">${requestScope.ocancel.sum} Orders were Cancelled </li>
                                        <li class="info">${requestScope.oshipping.sum} Orders are waiting for conveying</li>
                                        <li class="info">${requestScope.ocomplete.sum} Orders were already shipped</li>
                                        <li class="edit"><a href="#">EDIT &raquo;</a></li>
                                        <li class="clear"></li>
                                    </ul>
                                </li>

                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="clear"></div>
        </div>
        <div id="richContent2">
            <div class="container_16">
                <div class="lastTweet grid_4">
                    <h4>Latest Tweets</h4>
                    <p><a href="#">@someone</a> yes indeed this is one hell of a free css template! <a href="#">Read More</a> <span><em>15 minutes ago</em></span></p>
                    <p><a href="#">@someone</a> yes indeed this is one hell of a free css template! <a href="#">Read More</a> <span><em>15 minutes ago</em></span></p>
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