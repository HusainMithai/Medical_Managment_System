<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dashboard.aspx.cs" Inherits="Dashboard" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="" />
    <meta name="author" content=""/>
    <title>E-Shopper</title>

    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/site.css" rel="stylesheet" />
    <link href="css/font-awesome.min.css" rel="stylesheet" />
 <link href="css/dashboard.css" rel="stylesheet" />
 <link href="css/fullcalendar.css" rel="stylesheet" />

    <script type="text/javascript" src='js/jquery-3.3.1.min.js'></script>
     <script type="text/javascript" src='js/ckeditor/ckeditor.js'></script>
   
    <script type="text/javascript" src='js/jquery.validate.js'></script>
    <script type="text/javascript" src='js/jquery.validate.unobtrusive.js'></script>
    <script type="text/javascript" src='js/jquery.validate.min.js'></script>
    <script type="text/javascript" src='js/moment.min.js'></script>
    <script type="text/javascript" src='js/moment-with-locales.min.js'></script>
    <script type="text/javascript" src='js/bootstrap-datetimepicker.min.js'></script>
    <script type="text/javascript" src='js/jquery.validate.unobtrusive.bootstrap.min.js'></script>
    <script type="text/javascript" src='js/bootstrap.js'></script>
     <script type="text/javascript" src='js/respond.js'></script>
      <script type="text/javascript" src='js/modernizr-2.6.2.js'></script>
      
      <script type="text/javascript" src="js/jquery-ui-1.10.4.min.js"></script>
<script type="text/javascript" src="js/fullcalendar.min.js"></script>
 <script type="text/javascript">
     $(function () {
         $("#ErrorMessage").fadeTo(2000, 500).slideUp(500, function () {
             $("#ErrorMessage").slideUp(500);
         });

     });
    </script>
</head>
<body>
     <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">

                <a class="navbar-brand dask " href="#">E-Shopper</a>
                <a class="navbar-brand mbl" href="#">E-Shopper</a>
            </div>
            <div id="" class="top-drop">
                <ul class="nav navbar-nav navbar-right">
                    <li class="liDashBoard"><a href="dashboard.aspx">Dashboard</a></li>

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-language fa-2x"></i><b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="">English</a></li>
                            <li><a href="">Arabic</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i><b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a class="col-xs-6 col-sm-3 placeholder" href="resetpassword.aspx">
                                    <i class="fa fa-lock fa-2x"></i>
                                    <span class="text-justify">Reset Password</span>
                                </a>
                            </li>
                            <li>
                                <a class="col-xs-6 col-sm-3 placeholder" href="logout.aspx">
                                    <i class="fa fa-power-off fa-2x"></i>
                                    <span class="text-justify">Logout</span>
                                </a>
                            </li>
                        </ul>

                    </li>
                </ul>

            </div>
        </div>
    </nav>
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-3 col-md-2 sidebar">


                <div class="navbar-header">

                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>

                <div id="navbar" class="navbar-collapse collapse ">
                    <ul class="nav nav-sidebar">
                         <li><a href="dashboard.aspx">Dashboard <span class="sr-only">(current)</span></a></li>
                        <li><a href="category.aspx"><i class="fa fa-sitemap"></i> Category</a></li>
                        <li><a href="products.aspx"><i class="fa fa-sliders"></i> Products</a></li>
                         <li><a href="users.aspx"><i class="fa fa-group"></i> Users</a></li>
                        <li><a href="contactus.aspx"><i class="fa fa-phone "></i> ContactUs</a></li>
                       <li><a href="orders.aspx"><i class="fa fa-tags"></i> Orders</a></li>

                       
                        
                       
                    </ul>
                </div>
            </div>
            <div class="row" style="text-align:center;margin-top:10px !important;" id="ErrorMessage">
            	
                    <div class="col-lg-4 col-lg-offset-4 col-md-6 col-md-offset-3">
                        <script  type="text/javascript">
                            $(document).ready(function () {
                                var type = '@ViewBag.MsgType';
                                if (type == "Success") {
                                    $('#divAlert').addClass("alert alert-dismissible alert-success");
                                }
                                else if (type == 'Danger') {
                                    $('#divAlert').addClass("alert alert-dismissible alert-danger");
                                }
                                else if (type == 'Info') {
                                    $('#divAlert').addClass("alert alert-dismissible alert-info");
                                }
                                else if (type == 'Warning') {
                                    $('#divAlert').addClass("alert alert-dismissible alert-warning");
                                }
                                else {
                                    $('#divAlert').addClass("alert alert-dismissible alert-info");
                                }



                            });
                        </script>
                        <div id="divAlert"  role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <strong>Welcome</strong>

                        </div>
                    </div>
               
            </div>
           
        </div>
    </div>
    <script  type="text/javascript">
        $(document).ready(function () {
            // get current URL path and assign 'active' class
            var pathname = window.location.pathname;
            $('.nav > li > a[href="' + pathname + '"]').parent().addClass('active');
        })
    </script>
    <script  type="text/javascript">
        function SetSessionValue(value, SessionName, RedirectAction, RedirectController) {
            $.LoadingOverlay("show", {
                image: "",
                fontawesome: "fa  fa-spinner fa-spin"
            });
            var rUrl = '@Url.Action("-1", "**")';
            rUrl=rUrl.replace('-1', RedirectAction);
            rUrl = rUrl.replace('**', RedirectController);

            $.ajax({
                url: "@Url.Action("SetSessionValue", "SessionManage")",
                data: { value: value, SessionName: SessionName },
            type: 'POST',
            cache: false,
            success: function (result) {
                if (result.toLowerCase() == "true") {
                    window.location = rUrl;
                }
                $.LoadingOverlay("hide");
            },
            error: function (e) {
                $.LoadingOverlay("hide");
            }
        });
        }
    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            $(".sidebar").hide();
            $(".liDashBoard").hide();
        });
</script>


<div class="col-sm-12  col-md-12  main  dash-brd">
    <h1 class="page-header">Dashboard</h1>
    <div class="row placeholders">
        <div class="DBMenus">
            <a class="col-xs-6 col-sm-3 placeholder" href="">
                <div class="d-bx-h">
                    <i class="fa fa-home fa-4x"></i>
                    <h4>Home</h4>
                    <span class="text-muted">Add Contents</span>
                </div>
            </a>
        </div>
        <div class="DBMenus">
            <a class="col-xs-6 col-sm-3 placeholder" href="category.aspx">
                <div class="d-bx-h">
                    <i class="fa fa-newspaper-o fa-4x"></i>
                    <h4>Product Category</h4>
                    <span class="text-muted">Create Category</span>
                </div>
            </a>
        </div>
        <div class="DBMenus">
            <a class="col-xs-6 col-sm-3 placeholder" href="products.aspx">
                <div class="d-bx-h">
                    <i class="fa fa-registered fa-4x"></i>
                    <h4>Products</h4>
                    <span class="text-muted">Product Details</span>
                </div>
            </a>
        </div>
        <div class="DBMenus">
            <a class="col-xs-6 col-sm-3 placeholder" href="users.aspx">
                <div class="d-bx-h">
                    <i class="fa fa-sitemap fa-4x"></i>
                    <h4>Users</h4>
                    <span class="text-muted">Manage Users</span>
                </div>
            </a>
        </div>

    </div>

    <div class="row placeholders">
        <div class="DBMenus">
            <a class="col-xs-6 col-sm-3 placeholder" href="contactus.aspx">
                <div class="d-bx-h">
                    <i class="fa fa-phone fa-4x"></i>
                    <h4>Contact Us</h4>
                    <span class="text-muted">Contact Us</span>
                </div>
            </a>
        </div>
        <div class="DBMenus">
            <a class="col-xs-6 col-sm-3 placeholder" href="orders.aspx">
                <div class="d-bx-h">
                    <i class="fa fa-calendar fa-4x"></i>
                    <h4>Orders</h4>
                    <span class="text-muted">View Orders</span>
                </div>
            </a>
        </div>
        
    </div>
   
    
</div>


</body>
</html>
