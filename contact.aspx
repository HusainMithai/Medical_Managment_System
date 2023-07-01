<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage3.master" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <!-- Page Header Start -->
    <div class="container-fluid bg-secondary mb-5">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
            <h1 class="font-weight-semi-bold text-uppercase mb-3">Contact Us</h1>
            <div class="d-inline-flex">
                <p class="m-0"><a href="">Home</a></p>
                <p class="m-0 px-2">-</p>
                <p class="m-0">Contact</p>
            </div>
        </div>
    </div>
    <!-- Page Header End -->
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
    <!-- Contact Start -->
    <div class="container-fluid pt-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">Contact For Any Queries</span></h2>
        </div>
        <div class="row px-xl-5">
            <div class="col-lg-7 mb-5">
                <div class="contact-form">
                    <div id="success"></div>
                    <form runat="server">
                    <div id="Div1">
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
                    <%}
                       
                        %>
                        </div>
                        <div class="control-group">
                            <asp:TextBox ID="txtname" runat="server" class="form-control" placeholder="Your Name"
                                required="required" data-validation-required-message="Please enter your name" ></asp:TextBox>
                            <p class="help-block text-danger"></p>
                        </div>
                        <div class="control-group">
                         <asp:TextBox ID="txtemail" runat="server" class="form-control" placeholder="Your Email"
                                required="required" data-validation-required-message="Please enter your email" ></asp:TextBox>
                           
                            <p class="help-block text-danger"></p>
                        </div>
                        <div class="control-group">
                        <asp:TextBox ID="txtsub" runat="server" class="form-control" placeholder="Subject"
                                required="required" data-validation-required-message="Please enter a subject" ></asp:TextBox>
                         
                             <p class="help-block text-danger"></p>
                        </div>
                        <div class="control-group">
                         <asp:TextBox ID="txtmsg" runat="server" TextMode="MultiLine" Rows="6" class="form-control" placeholder="Message"
                                required="required"
                                data-validation-required-message="Please enter your message"></asp:TextBox>
                        
                            <p class="help-block text-danger"></p>
                        </div>
                        <div>
                            <asp:Button ID="btnsend" runat="server" class="btn btn-primary py-2 px-4" 
                                Text="Send Message" onclick="btnsend_Click" />
                            
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-lg-5 mb-5">
                <h5 class="font-weight-semi-bold mb-3">Get In Touch</h5>
                <p>Laxmi Complex, Station Road.</p>
                <div class="d-flex flex-column mb-3">
                    <h5 class="font-weight-semi-bold mb-3">Store</h5>
                    <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>Beside Bus Station, Dahod, Gujarat, India</p>
                    <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>info@eshopper.com</p>
                    <p class="mb-2"><i class="fa fa-phone-alt text-primary mr-3"></i>+02673 248158</p>
                </div>
                
            </div>
        </div>
    </div>
    <!-- Contact End -->
</asp:Content>

