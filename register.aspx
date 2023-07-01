<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage3.master" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <!-- Page Header Start -->
    <div class="container-fluid bg-secondary mb-5">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
            <h1 class="font-weight-semi-bold text-uppercase mb-3">Register Me</h1>
            <div class="d-inline-flex">
                <p class="m-0"><a href="">Home</a></p>
                <p class="m-0 px-2">-</p>
                <p class="m-0">Register</p>
            </div>
        </div>
    </div>
    <!-- Page Header End -->


    <!-- Contact Start -->
    <div class="container-fluid pt-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">Registration</span></h2>
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
                    <form id="Form1" runat="server">
                        <div class="control-group">
                            <asp:TextBox ID="txtName" runat="server" class="form-control" placeholder="Your Name" required="required" data-validation-required-message="Please enter Name" ></asp:TextBox>
                            
                            <p class="help-block text-danger"></p>
                        </div>
                         <div class="control-group">
                         Gender:
                         </div>
                        <div class="control-group">
                            <asp:RadioButtonList ID="rdbtngender" runat="server">
                            <asp:ListItem Text="Male" Value="Male" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="Female" Value="Female" Selected="False"></asp:ListItem>

                            </asp:RadioButtonList>
                            
                        </div>
                        <div class="control-group">
                         <asp:TextBox ID="txtMobile" runat="server"  class="form-control" placeholder="Your Mobile No" required="required" data-validation-required-message="Please enter Mobile No" ></asp:TextBox>
                            <p class="help-block text-danger"></p>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidator2" 
                                runat="server" CssClass="help-block text-danger" 
                                 ErrorMessage="Invalid Mobile No" ControlToValidate="txtMobile" Display="Dynamic" 
                                 ValidationExpression="\d{10}"></asp:RegularExpressionValidator>
                        </div>

                        <div class="control-group">
                        <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" class="form-control" placeholder="Your Address" required="required" data-validation-required-message="Please enter Address" ></asp:TextBox>
                            <p class="help-block text-danger"></p>
                        </div>

                        <div class="control-group">
                        <asp:TextBox ID="txtCity" runat="server"  class="form-control" placeholder="Your City" required="required" data-validation-required-message="Please enter City" ></asp:TextBox>
                            <p class="help-block text-danger"></p>
                        </div>

                        <div class="control-group">
                              <asp:TextBox ID="txtState" runat="server"  class="form-control" placeholder="Your State" required="required" data-validation-required-message="Please enter State" ></asp:TextBox>
                            <p class="help-block text-danger"></p>
                        </div>
                         <div class="control-group">
                              <asp:TextBox ID="txtCountry" runat="server"  class="form-control" placeholder="Your Country" required="required" data-validation-required-message="Please enter Country" ></asp:TextBox>
                            <p class="help-block text-danger"></p>
                        </div>
                         
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

                        <div class="control-group">
                          <asp:TextBox ID="txtcpass" runat="server" TextMode="Password"  class="form-control" placeholder="Your Confirm Password" required="required" data-validation-required-message="Please enter Confirm Password" ></asp:TextBox>
                            <p class="help-block text-danger"></p>
                            <asp:CompareValidator ID="CompareValidator1" CssClass="help-block text-danger" 
                                runat="server" ErrorMessage="Confirm Password is Not Matched" 
                                ControlToValidate="txtcpass" ControlToCompare="txtPass" Display="Dynamic"></asp:CompareValidator>
                        </div>

                        <div>
                            <asp:Button ID="btnSubmit" class="btn btn-primary py-2 px-4" runat="server" 
                                Text="Submit" onclick="btnSubmit_Click" />
                            
                        </div>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                    </form>
                </div>
            </div>
            <div class="col-lg-3 mb-5">
                
            </div>
        </div>
    </div>
    <!-- Contact End -->
</asp:Content>

