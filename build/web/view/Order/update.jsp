<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>DapurKue | Login</title>
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
                                <p>Subtotal: $ ${grandtotal}</p>
                                <p><span class="vChart"><a href="showCartController">View Cart</a></span> <span class="cOut"><a href="CheckOutController">Checkout</a></span></p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div id="headright" class="grid_7 prefix_5 omega">
                                <h3 class="login"><span class="hiUser"><c:if test="${not empty sessionScope.user1}"></c:if>Hi, ${sessionScope.user1.role} ${sessionScope.user1.account} HE151343 |</span> <span class="myAccount"><a href="UpdateAccountController?id=${sessionScope.user1.id}">My Account</a></span> <a href="LogoutController">Logout</a></h3>
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
                <div class="checkout grid_16">
                    <div class="newAccount grid_8 alpha">
                        <h4>Update Order</h4>

                        <form method="post" action="UpdateOrderController"  >

                            <fieldset>
                                <input type="hidden" tabindex="2" size="22" value="${requestScope.order.id}" id="id"  name="id" class="text" />
                                <br />
                                <label for="name">Receiver: </label>
                                <input type="text" tabindex="1" size="22"  value="${requestScope.order.name}" name="name" id="name" class="text" />
                                <br />  <label for="mobile">Phone number</label>
                                <input type="text" tabindex="1" size="22" value="${requestScope.order.mobile}" name="mobile" id="mobile" class="text" />

                                <br />

                                <label for="address">Address: </label>
                                <input type="text" tabindex="1" size="22" value="${requestScope.order.address}" name="address" id="address" class="text" />
                                <br />
                                <label for="money">Price </label>
                                <input type="text" tabindex="1" size="22" value="${requestScope.order.money}" name="money" id="money" class="text" />
                                <br />


                                <label for="CustomerName">Customer Name: </label>
                                <select name="cusname">
                                    <c:forEach items="${requestScope.cusList}" var="c">
                                        <option <c:if test="${c.id == requestScope.order.cusID.id}"> selected="selected"</c:if> value="${requestScope.order.cusID.id}">
                                            ${c.cname}
                                        </option>
                                    </c:forEach>
                                </select>
                                <br>
                                    <c:if test="${sessionScope.user1.role == 'admin'}">
                                        <label for="status" >status: </label>
                                        <input style="padding-top: 20px"  <c:if test="${requestScope.order.status == 1}"> checked 
                                               </c:if> type="radio" name="status" value="1"/> enable
                                        <input <c:if test="${requestScope.order.status == 0}">
                                                checked  </c:if>  type="radio" name="status" value="0"/> disable

                                            <br />
                                    </c:if>


                            </fieldset>

                            <p>
                                <input type="submit" value="Adding a new Customer" name="update" class="UpdateProductButton" 
                                       style="display:block;
                                       float:left;
                                       cursor:pointer;
                                       height:39px;
                                       border:none;
                                       width:254px;
                                       background-color: #FF9900;
                                       border-radius: 50px 50px;
                                       font-weight: bold;
                                       "/>
                            </p>
                        </form>

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
                        <li><a href="#">Delivery Terms &amp; Pricing</a></li>
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