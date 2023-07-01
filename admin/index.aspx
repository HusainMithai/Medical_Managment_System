<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="admin_index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <title>Log In</title>
    <link href="css/signin.css" rel="stylesheet" />
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/site.css" rel="stylesheet" />
    <link href="css/font-awesome.min.css" rel="stylesheet" />
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
      
</head>
<body>
   <div class="container">
        <script type="text/javascript">
            $(function () {
                $("#ErrorMessage").fadeTo(2000, 500).slideUp(500, function () {
                    $("#ErrorMessage").slideUp(500);
                });

            });
        </script>
         <div class="row" style="text-align:center;" id="ErrorMessage">
           
                <br />
                <div class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2">
                    <% if (Page.IsPostBack == true && Session["error"].ToString().Equals("Yes"))
                       { %>
                    <div class="alert alert-danger alert-dismissible" role="alert">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <strong><%=Session["msg"] %></strong>
                    </div>
                    <%}
                       else if (Page.IsPostBack == true && Session["error"].ToString().Equals("No"))
                       { %>
                       <div class="alert alert-success alert-dismissible" role="alert">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <strong><%=Session["msg"] %></strong>
                    </div>
                        <%} %>
                </div>

           
        </div>
         </div> <!-- /container -->
         <form id="form1" runat="server" class="form-signin">
         <div class="text-center">
        <br />
        <br />
		 <a href="">
        <img src="img/eshop.png" width="150px" height="150px" style="border-radius:20px" />
		</a>
    	</div>
    	<hr />
    	<label for="inputEmail" class="sr-only">Username</label>
         <asp:TextBox ID="txtUsername" runat="server" class="form-control" placeholder = "Username"></asp:TextBox>
    	<br />
    	<label for="inputPassword" class="sr-only">Password</label>
         <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" class="form-control" placeholder = "Password"></asp:TextBox>
    	<div class="checkbox">

        <label>
            <input type="checkbox" name="remme"></input>Remember me
        </label>
        <br />
        <label>
            <a href="fpass.aspx">Forgot Password? </a>
        </label>
    </div>
         <asp:Button ID="btnLogin" runat="server" Text="Login" 
             class="btn btn-lg btn-primary btn-block" onclick="btnLogin_Click" />
         <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
</form>
    <br />
    <br />
</body>
</html>
