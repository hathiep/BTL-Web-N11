<%@page import="java.util.List"%>
<%@page import="model.User"%>
<%@page import="model.Order"%>
<%@page import="model.OrderItem"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" media="screen" href="admin_styles/font-awesome.css">
    <link rel="stylesheet" href="admin_styles/style4.css">
    <link rel="stylesheet" href="admin_styles/order_detail.css">
    <title>Phụ Kiện Công Nghệ</title>
</head>
<body>
<header id="header">
    <div id="logo-group">
        <span id="logo"><a href="/admin#/home"> <img src="" alt="RUNTIME"> </a></span>
        <span id="view-site"> <a href="/" target="_blank"><i class="fa fa-external-link"></i></a> </span>
    </div>
    <div class="pull-left">
        
        <div id="fullscreen" class="btn-header transparent pull-right">
            <span> <a href="javascript:void(0);" data-action="launchFullscreen" title="Full Screen"><i class="fa fa-arrows-alt"></i></a> </span>
        </div>
        
        <div id="hide-menu" class="btn-header pull-right no-margin">
            <span> <a href="javascript:void(0);" data-action="toggleMenu" title="Collapse Menu"><i class="fa fa-reorder"></i></a> </span>
        </div>

    </div>

    <div class="pull-right">

        <ul id="profile-img" class="header-dropdown-list hidden-xs padding-5">
            <li class="">
                <a href="#" target="_self" class="dropdown-toggle  no-margin avatar" data-toggle="dropdown">
                    <img src="/Areas/Admin/Images/avatars/user.png" alt="Phụ Kiện Công Nghệ" class="img-circle" />
                    <span>phukien</span>
                    <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu pull-right">
                    <li>
                        <a href="/admin#/userlogin/changepassword" class="padding-10 padding-top-0 padding-bottom-0"><i class="fa fa-cog"></i> Đổi mật khẩu</a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="/admin#/userlogin" class="padding-10 padding-top-0 padding-bottom-0"> <i class="fa fa-user"></i> Tài khoản quản trị</a>
                    </li>
                    <li class="divider"></li>
                    
                    <li>
                        <a href="javascript:void(0);" class="padding-10 padding-top-0 padding-bottom-0" data-action="launchFullscreen"><i class="fa fa-arrows-alt"></i> Full Screen</a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="/admin/account/login" class="padding-10 padding-top-5 padding-bottom-5" data-action="userLogout" data-logout-msg="Bạn có muốn đăng xuất khỏi hệ thống không?"><i class="fa fa-sign-out fa-lg"></i> <strong>Đăng xuất</strong></a>
                    </li>
                </ul>
            </li>
        </ul>

        <div id="logout" class="btn-header transparent pull-right hidden">
            <span> <a href="/admin/account/login" title="Sign Out" data-action="userLogout" data-logout-msg="Bạn có muốn đăng xuất khỏi hệ thống không?"><i class="fa fa-sign-out"></i></a> </span>
        </div>

    </div>

</header>
    
<aside id="left-panel">
    <nav>
        <ul>
            <li>
                <a id="tongquan" href="home" title="Tổng quan"><span class="menu-item-parent">Tổng quan</span></a>
            </li>
            <li class="sub-menu"><span class="menu-item-parent">Sản phẩm</span>
                <ul>
                    <li>
                        <a href="product-list">Tất cả sản phẩm</a>
                    </li>
                    <li>
                        <a href="/admin#/productgroup">Nhóm sản phẩm</a>
                    </li>
                    <li>
                        <a href="/admin#/product/inventory">Tồn kho</a>
                    </li>
                </ul>
            </li>
            <li class="sub-menu"><span class="menu-item-parent">Tin tức</span>
                <ul>
                    <li>
                        <a href="/admin#/news/create">Thêm mới tin tức</a>
                    </li>
                    <li>
                        <a href="/admin#/news">Danh sách tin tức</a>
                    </li>
                    <li>
                        <a href="/admin#/newsgroup">Nhóm tin tức</a>
                    </li>
                </ul>
            </li>
            <li class="sub-menu"><span class="menu-item-parent">Đơn hàng</span>
                <ul>
                    <li>
                        <a href="orderlist">Đơn hàng</a>
                    </li>
                    <li>
                        <a href="/admin#/order/shipping">Vận chuyển</a>
                    </li>
                    <li>
                        <a href="/admin#/order/draft">Đơn hàng nháp</a>
                    </li>
                </ul>
            </li>
            <li class="sub-menu"><span class="menu-item-parent">Khách hàng</span>
                <ul>
                    <li>
                        <a href="user-list">Danh sách khách hàng</a>
                    </li>
                    <li>
                        <a href="/admin#/contact">Liên hệ từ khách hàng</a>
                    </li>
                    <li>
                        <a href="/admin#/newsletter">Danh sách Email đăng ký</a>
                    </li>
                </ul>
            </li>
        </ul>
    </nav>

</aside>
<div id="right-panel">
    <% 
        Order order = (Order) request.getAttribute("Order");
        User user = (User) request.getAttribute("User");
    %>
    <form method="post" id="top">
        <h1 id="head">Đơn hàng #<%=1000000+order.getId()%></h1>
        <button class="form-button" id="button-save" type="submit" formaction="update-order-detail">Lưu</button>
        <input type="text" id="orderid" name="orderid" value="<%=order.getId()%>" hidden="true"/>
        <input type="text" id="payment-input" name="payment-input" value="<%=order.getPayment()%>" hidden="true"/>
        <input type="text" id="delivery-input" name="delivery-input" value="<%=order.getDelivery()%>" hidden="true"/>
    </form>
    <div id="content">
        <div id="client-info" class="main-block">
            <div id="user-info" class="block-info">
                <h2 class="block-heading">Thông tin khách hàng</h2>
                <div id="block-left">
                    <div class="info-item">
                        <label class="item-label" for="fullname">Họ và tên:</label>
                        <div class="item-content" id="fullname" name="fullname"><%=user.getFullname()%></div>
                    </div>
                    <div class="info-item">
                        <label class="item-label" for="dob">Ngày sinh:</label>
                        <div class="item-content" id="dob" name="dob"><%=user.getDob()%></div>
                    </div>
                    <div class="info-item">
                        <label class="item-label" for="email">Email:</label>
                        <div class="item-content" id="email" name="email"><%=user.getEmail()%></div>
                    </div>
                </div>
                <div id="block-right">
                    <div class="info-item">
                        <label class="item-label" for="phone">SÐT:</label>
                        <div class="item-content" id="phone" name="phone"><%=user.getPhone()%></div>
                    </div>
                    <div class="info-item">
                        <label class="item-label" for="address">Địa chỉ:</label>
                        <div class="item-content" id="address" name="address"><%=user.getAddress()%></div>
                    </div>
                    <div class="info-item">
                        <label class="item-label" for="note">Ghi chú:</label>
                        <div class="item-content" id="note" name="note" ><%=(order.getNote()==null) ? "--Trống--" : order.getNote()%></div>
                    </div>
                </div>
            </div>
        </div>
                
        <div id="product-info" class="main-block">
                <h2 class="block-heading">Danh sách sản phẩm</h2>
                <div id="block-table" class="main-block">
                    
                    <div id="box-product">
                        <table id="table-product" cellpadding="3" cellspacing="0" border="0">
                            <thead>
                                <tr>
                                    <th class="table-header col1">ID</th>
                                    <th class="table-header col5">Sản phẩm</th>
                                    <th class="table-header col4">Hình ảnh</th>
                                    <th class="table-header col3">Nhà cung cấp</th>
                                    <th class="table-header col1">Số lượng</th>
                                    <th class="table-header col3">Đơn Giá</th>
                                    <th class="table-header col2">Thành tiền</th>
                                </tr>
                            </thead>
                            <tbody>
                                
                            <%
                                List<OrderItem> list_OrderItem = (List<OrderItem>)request.getAttribute("list_OrderItem");
                                List<Product> list_Product = (List<Product>)request.getAttribute("list_Product");
                                for(OrderItem i:list_OrderItem){
                                    for(Product p:list_Product){
                                        if(p.getId()==i.getProduct_id()){
                                            int id = 10000+p.getId();
                            %>
                                            <tr id="product-row">
                                                <th class="col1"><a href="product-detail?id=<%=id%>">#<%=id%></a></th>
                                                <td class="left col5"><%=p.getName()%></td>
                                                <td class="col4"><img src="<%=p.getImage()%>" style="height: 20px; width: auto;"/></td>
                                                <td class="left col3"><%=p.getSupplier()%></td>
                                                <td class="col1"><%=i.getQuantity()%></td>
                                                <td class="center col3"><%=i.getPrice()%> ₫</td>
                                                <td class="right col2"><%=i.getQuantity()*i.getPrice()%> ₫</td>
                                            </tr>
                            <%
                                        }
                                    }
                                }
                            %>
                                
                                <tr>
                                    <td class="col1"></td>
                                    <td class="col5"></td>
                                    <td class="col4"></td>
                                    <td class="col4"></td>
                                    <td class="col1"></td>
                                    <td class="left col2">Tổng tiền hàng:</td>
                                    <td class="right col2"><%=order.getCost()%> ₫</td>
                                </tr>
                                <tr>
                                    <td class="col1"></td>
                                    <td class="col5"></td>
                                    <td class="col4"></td>
                                    <td class="col4"></td>
                                    <td class="col1"></td>
                                    <td class="left col2">Khuyến mãi:</td>
                                    <td class="right col2"><%=order.getDiscount()%> ₫</td>
                                </tr>
                                <tr>
                                    <td class="col1"></td>
                                    <td class="col5"></td>
                                    <td class="col4"></td>
                                    <td class="col4"></td>
                                    <td class="col1"></td>
                                    <td class="left col2">Phí vận chuyển:</td>
                                    <td class="right col2"><%=order.getFee()%> ₫</td>
                                </tr>
                                <tr id="order-total">
                                    <td class="col1"></td>
                                    <td class="col5"></td>
                                    <td class="col4"></td>
                                    <td class="col4"></td>
                                    <td class="col1"></td>
                                    <td class="left col2">Tổng thanh toán:</td>
                                    <td class="right col2"><%=order.getTotal()%> ₫</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
        </div>
        
        <div id="order-info" class="main-block">
            <h2 class="heading2 block-heading">Giao hàng</h2>
                <div class="info-item2">
                    <label class="item-label" >Đơn vị vận chuyển:</label>
                    <div class="item-content2 item-content" id="deliver" name="deliver" >Ninja Van</div>
                </div>
                <div class="info-item2">
                    <label class="item-label" for="delivery-status">Trạng thái giao hàng:</label>
                    <div class="item-content2 item-content" id="delivery-status" name="delivery-status" ><%=order.getDelivery()%></div>
                    
                </div>
                <button class="form-button" id="button-update1">Cập nhật</button>
                <div id="delivery-menu" class="delivery-menu hidden">
                    <div class="delivery-item">
                        <input type="checkbox" id="checkbox1" name="checkbox1" class="delivery-checkbox" value="1" checked disabled>
                        <label class="delivery-label" for="checkbox1">Chờ xác nhận</label>
                    </div>
                    <div class="delivery-item">
                        <input type="checkbox" id="checkbox2" name="checkbox2" class="delivery-checkbox" value="2">
                        <label class="delivery-label" for="checkbox2">Đã đóng gói</label>
                    </div>
                    <div class="delivery-item">
                        <input type="checkbox" id="checkbox3" name="checkbox3" class="delivery-checkbox" value="3">
                        <label class="delivery-label" for="checkbox3">Đang giao hàng</label> 
                    </div>
                    <div class="delivery-item">
                        <input type="checkbox" id="checkbox4" name="checkbox4" class="delivery-checkbox" value="4">
                        <label class="delivery-label" for="checkbox4">Đã giao hàng</label>
                    </div>
                </div>
                <script>
                    const updateButton = document.getElementById('button-update1');
                    const deliveryMenu = document.querySelector('.delivery-menu');

                    updateButton.addEventListener('click', () => {
                      deliveryMenu.classList.toggle('hidden');
                      if (deliveryMenu.classList.contains('hidden')) {
                        updateButton.textContent = 'Cập nhật';
                      } else {
                        updateButton.textContent = 'Hoàn tất';
                      }
                    });
                    const checkboxes = document.querySelectorAll('.delivery-checkbox');
                    const deliverylabels = document.querySelectorAll('.delivery-label');
                    const delivery_status = document.getElementById('delivery-status').textContent;
                    
                    let isDeliveryFound = false;

                    checkboxes.forEach((checkbox, index) => {
                      if (!isDeliveryFound) {
                        if (deliverylabels[index].textContent === delivery_status) {
                          isDeliveryFound = true;
                        }
                        checkbox.checked = true;
                        if(!isDeliveryFound) checkbox.disabled = true;
                      } else {
                        checkbox.checked = false;
                        checkbox.disabled = false;
                      }
                    });

                    checkboxes.forEach((checkbox, index) => {
                      checkbox.addEventListener('change', () => {
                        if (checkbox.checked) {
                            document.getElementById('delivery-status').innerHTML = deliverylabels[index].textContent;
                            document.getElementById('delivery-input').value = deliverylabels[index].textContent;
                          for (let i = 0; i < index; i++) {
                            checkboxes[i].checked = true;
                            checkboxes[i].disabled = true;
                            deliverylabels[i].checked = true;
                          }
                        }
                        else {
                            document.getElementById('delivery-status').innerHTML = deliverylabels[index-1].textContent;
                            document.getElementById('delivery-input').value = deliverylabels[index-1].textContent;
                            if(index>1) checkboxes[index-1].disabled = false;
                          for (let i = index + 1; i < checkboxes.length; i++) {
                            checkboxes[i].checked = false;
                          }
                        }
                      });
                    });
                </script>
        </div>
             
        <div id="payment-info" class="main-block">
                <h2 class="heading2 block-heading">Thanh toán</h2>
                <div class="info-item2">
                    <label class="item-label" for="payment-type">Hình thức thanh toán:</label>
                    <div class="item-content2 item-content" id="payment-type" name="payment-type" >Thanh toán khi nhận hàng</div>
                </div>
                <button class="form-button" id="button-update2">Cập nhật</button>
                <div class="info-item2">
                    <label class="item-label" for="payment-status">Trạng thái thanh toán:</label>
                    <div class="item-content2 item-content" id="payment-status" name="payment-status" ><%=order.getPayment()%></div>
                </div>
                <div id="payment-menu" class="payment-menu hidden">
                    <div class="payment-item">
                        <input type="checkbox" id="checkbox5" name="checkbox5" class="payment-checkbox" value="1" checked disabled>
                        <label class="payment-label" for="checkbox5">Chưa thanh toán</label>
                    </div>
                    <div class="payment-item">
                        <input type="checkbox" id="checkbox6" name="checkbox6" class="payment-checkbox" value="2">
                        <label class="payment-label" for="checkbox6">Đã thanh toán</label>
                    </div>
                </div>
                <script>
                    const updateButton2 = document.getElementById('button-update2');
                    const paymentMenu = document.querySelector('.payment-menu');

                    updateButton2.addEventListener('click', () => {
                    paymentMenu.classList.toggle('hidden');
                      if (paymentMenu.classList.contains('hidden')) {
                        updateButton2.textContent = 'Cập nhật';
                      } else {
                        updateButton2.textContent = 'Hoàn tất';
                      }
                    });
                    const checkboxes2 = document.querySelectorAll('.payment-checkbox');
                    const paymentlabels = document.querySelectorAll('.payment-label');
                    const payment_status = document.getElementById('payment-status').textContent;
                    
                    let isPaymentFound = false;

                    checkboxes2.forEach((checkbox, index) => {
                      if (!isPaymentFound) {
                        if (paymentlabels[index].textContent === payment_status) {
                          isPaymentFound = true;
                        }
                        checkbox.checked = true;
                        if(!isPaymentFound) checkbox.disabled = true;
                      } else {
                        checkbox.checked = false;
                        checkbox.disabled = false;
                      }
                    });

                    checkboxes2.forEach((checkbox, index) => {
                      checkbox.addEventListener('change', () => {
                        if (checkbox.checked) {
                            document.getElementById('payment-status').innerHTML = paymentlabels[index].textContent;
                            document.getElementById('payment-input').value = paymentlabels[index].textContent;
                          for (let i = 0; i < index; i++) {
                            checkboxes2[i].checked = true;
                            checkboxes2[i].disabled = true;
                            paymentlabels[i].checked = true;
                          }
                        }
                        else {
                            document.getElementById('payment-status').innerHTML = paymentlabels[index-1].textContent;
                            document.getElementById('payment-input').value = paymentlabels[index-1].textContent;
                            if(index>1) checkboxes2[index-1].disabled = false;
                          for (let i = index + 1; i < checkboxes2.length; i++) {
                            checkboxes2[i].checked = false;
                          }
                        }
                      });
                    });
                </script>
        </div>
    </div>
</div>
</body>
<script src="admin_scripts/admin.js"></script>
</html>