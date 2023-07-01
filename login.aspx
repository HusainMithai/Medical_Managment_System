<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage3.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <!-- Page Header Start -->
    <div class="container-fluid bg-secondary mb-5">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
            <h1 class="font-weight-semi-bold text-uppercase mb-3">Login Page</h1>
            <div class="d-inline-flex">
                <p class="m-0"><a href="">Home</a></p>
                <p class="m-0 px-2">-</p>
                <p class="m-0">Login</p>
            </div>
        </div>
    </div>
    <!-- Page Header End -->


    <!-- Contact Start -->
    <div class="container-fluid pt-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">Login</span></h2>
        </div>
        <div class="row px-xl-5">
             <div class="col-lg-3 mb-5">
                
            </div>
            <div class="col-lg-6 mb-5">
                <div class="contact-form">
                    <div id="success">
                     <% if (Page.IsPostBack == true && Session["error"].ToString().Equals("Yes"))
                       { %>
                    <div class='alert alert-success'>
                    <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;
                    </button>
                    <strong><%=Session["msg"]%> </strong>
                    </div>
                    <%}
                       else if (Page.IsPostBack == true && Session["error"].ToString().Equals("No"))
                       { %>
                        <div class='alert alert-danger'>
                    <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;
                    </button>
                    <strong><%=Session["msg"]%> </strong>
                    </div>
                    <%} %>
                    </div>
                    <form name="sentMessage" runat="server">
                       
                        <div class="control-group">
                             <asp:TextBox ID="txtEmail" runat="server"  class="form-control" placeholder="Your Email" required="required" data-validation-required-message="Please enter Email" ></asp:TextBox>
                            <p class="help-block text-danger"></p>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" CssClass="help-block text-danger" 
                                 ErrorMessage="Invalid Email Id" ControlToValidate="txtEmail" Display="Dynamic" 
                                 ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </div>
                        
                       <div class="control-group">
                         <asp:TextBox ID="txtPass" runat="server" TextMode="Password"  class="form-control" placeholder="Your Password" required="required" data-validation-required-message="Please enter Password" ></asp:TextBox>
                            <p class="help-block text-danger"></p>
                        </div>

                       
                        <div>
                            <asp:Button ID="btnLogin" class="btn btn-primary py-2 px-4" runat="server" 
                                Text="Login" onclick="btnLogin_Click" />
                        </div>
                        <div>
                        <br />
                        <a href="forgot.aspx">Forgot Password</a>
                        </div>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            onselecting="SqlDataSource1_Selecting"></asp:SqlDataSource>
                    </form>
                </div>
            </div>
            <div class="col-lg-3 mb-5">
                
            </div>
        </div>
    </div>
    <!-- Contact End -->
</asp:Content>

