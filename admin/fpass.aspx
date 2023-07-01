<%@ Page Language="C#" AutoEventWireup="true" CodeFile="fpass.aspx.cs" Inherits="admin_index" %>

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
         <div class="col-sm-12  col-md-12 col-md-offset-0">
        <h2>Forgot Password</h2>
        <br />
    	</div>
    	<hr />
    	<label for="inputUsername" class="sr-only">Email Id</label>
    <span class="red">Enter Your registered email address below and we will send you an email containing your password.</span>
    	     <asp:TextBox ID="txtEmail" runat="server"  class="form-control" placeholder="Your Email" required="required" data-validation-required-message="Please enter Email" ></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" CssClass="help-block text-danger" 
                                 ErrorMessage="Invalid Email Id" ControlToValidate="txtEmail" Display="Dynamic" 
                                 ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                  
       
    	<br />
    <div class="input-group">
        <div class="pull-left">
        <asp:Button ID="btnSubmit" class="btn btn-lg btn-primary btn-block" runat="server" 
                                Text="Get Password" onclick="btnSubmit_Click" />
                            
        </div>
        &nbsp;&nbsp;&nbsp;
        <div class="pull-right">
              <asp:Button ID="Button1" class="btn btn-lg btn-primary btn-block" runat="server" 
                                Text="Cancel" />
      
        </div>
    </div>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
             onselecting="SqlDataSource1_Selecting"></asp:SqlDataSource>
</form>
    <br />
    <br />
</body>
</html>
