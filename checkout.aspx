<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="checkout.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <!-- Page Header Start -->
    <div class="container-fluid bg-secondary mb-5">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
            <h1 class="font-weight-semi-bold text-uppercase mb-3">Checkout</h1>
            <div class="d-inline-flex">
                <p class="m-0"><a href="">Home</a></p>
                <p class="m-0 px-2">-</p>
                <p class="m-0">Checkout</p>
            </div>
        </div>
    </div>
    <!-- Page Header End -->
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
    <form runat="server">
    <!-- Checkout Start -->
    <div class="container-fluid pt-5">
        <div class="row px-xl-5">
            <div class="col-lg-8">
                <div class="mb-4">
                    <h4 class="font-weight-semi-bold mb-4">Billing Address</h4>
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label>First Name</label>
                            <asp:TextBox ID="txtfname" runat="server" class="form-control"></asp:TextBox>
                           
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Last Name</label>
                            <asp:TextBox ID="txtlname" runat="server" class="form-control"></asp:TextBox>
                           
                            
                        </div>
                        <div class="col-md-6 form-group">
                            <label>E-mail</label>
                            <asp:TextBox ID="txtemail" runat="server" class="form-control"></asp:TextBox>
                           
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Mobile No</label>
                            <asp:TextBox ID="txtmno" runat="server" class="form-control"></asp:TextBox>
                          
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Address Line 1</label>
                            <asp:TextBox ID="txtaddr1" runat="server" class="form-control"></asp:TextBox>
                           
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Address Line 2</label>
                            <asp:TextBox ID="txtaddr2" runat="server" class="form-control"></asp:TextBox>
                           
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Country</label>
                            <asp:DropDownList ID="ddlcountry" runat="server"  class="custom-select">
                            <asp:ListItem Text="India" Value="India" Selected="True"></asp:ListItem>
                             <asp:ListItem Text="United States" Value="United States"></asp:ListItem>
                            </asp:DropDownList>
                           
                        </div>
                        <div class="col-md-6 form-group">
                            <label>City</label>
                            <asp:TextBox ID="txtcity" runat="server" class="form-control"></asp:TextBox>
                           
                        </div>
                        <div class="col-md-6 form-group">
                            <label>State</label>
                            <asp:TextBox ID="txtstate" runat="server" class="form-control"></asp:TextBox>
                           
                        </div>
                        <div class="col-md-6 form-group">
                            <label>ZIP Code</label>
                            <asp:TextBox ID="txtzip" runat="server" class="form-control"></asp:TextBox>
                        
                        </div>
                       
                        <div class="col-md-12 form-group">
                            <asp:CheckBox ID="shipto" runat="server" data-toggle="collapse" data-target="#shipping-address"/>
                            <label  for="shipto"  >Ship to different address</label>
                           
                        </div>
                    </div>
                </div>
                <div class="collapse mb-4" id="shipping-address">
                    <h4 class="font-weight-semi-bold mb-4">Shipping Address</h4>
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label>First Name</label>
                            <asp:TextBox ID="TextBox1" runat="server" class="form-control"></asp:TextBox>
                           
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Last Name</label>
                            <asp:TextBox ID="TextBox2" runat="server" class="form-control"></asp:TextBox>
                           
                            
                        </div>
                        <div class="col-md-6 form-group">
                            <label>E-mail</label>
                            <asp:TextBox ID="TextBox3" runat="server" class="form-control"></asp:TextBox>
                           
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Mobile No</label>
                            <asp:TextBox ID="TextBox4" runat="server" class="form-control"></asp:TextBox>
                          
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Address Line 1</label>
                            <asp:TextBox ID="TextBox5" runat="server" class="form-control"></asp:TextBox>
                           
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Address Line 2</label>
                            <asp:TextBox ID="TextBox6" runat="server" class="form-control"></asp:TextBox>
                           
                        </div>
                        <div class="col-md-6 form-group">
                            <label>Country</label>
                            <asp:DropDownList ID="DropDownList1" runat="server"  class="custom-select">
                            <asp:ListItem Text="India" Value="India" Selected="True"></asp:ListItem>
                             <asp:ListItem Text="United States" Value="United States"></asp:ListItem>
                            </asp:DropDownList>
                           
                        </div>
                        <div class="col-md-6 form-group">
                            <label>City</label>
                            <asp:TextBox ID="TextBox7" runat="server" class="form-control"></asp:TextBox>
                           
                        </div>
                        <div class="col-md-6 form-group">
                            <label>State</label>
                            <asp:TextBox ID="TextBox8" runat="server" class="form-control"></asp:TextBox>
                           
                        </div>
                        <div class="col-md-6 form-group">
                            <label>ZIP Code</label>
                            <asp:TextBox ID="TextBox9" runat="server" class="form-control"></asp:TextBox>
                        
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="card border-secondary mb-5">
                    <div class="card-header bg-secondary border-0">
                        <h4 class="font-weight-semi-bold m-0">Order Total</h4>
                    </div>
                    <div class="card-body">
                        <h5 class="font-weight-medium mb-3">Products</h5>
                        <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                        <div class="d-flex justify-content-between">
                            <p><%#Eval("product_name") %></p>
                            <p>Rs. <%#Eval("amount") %></p>
                        </div>
                        
                        </ItemTemplate>
                        </asp:Repeater>
                        
                        <hr class="mt-0">
                        <div class="d-flex justify-content-between mb-3 pt-1">
                            <h6 class="font-weight-medium">Subtotal</h6>
                            <h6 class="font-weight-medium">Rs. 
                                <asp:Literal ID="Literal1" runat="server"></asp:Literal></h6>
                        </div>
                        <div class="d-flex justify-content-between">
                            <h6 class="font-weight-medium">Shipping</h6>
                            <h6 class="font-weight-medium">Rs. 40</h6>
                        </div>
                    </div>
                    <div class="card-footer border-secondary bg-transparent">
                        <div class="d-flex justify-content-between mt-2">
                            <h5 class="font-weight-bold">Total</h5>
                            <h5 class="font-weight-bold">Rs. 
                                <asp:Literal ID="Literal2" runat="server"></asp:Literal></h5>
                        </div>
                    </div>
                </div>
                <div class="card border-secondary mb-5">
                    <div class="card-header bg-secondary border-0">
                        <h4 class="font-weight-semi-bold m-0">Payment</h4>
                    </div>
                    <div class="card-body">
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                        <asp:ListItem Text="&nbsp;Cash On Delivery" Value="Cash On Delivery"></asp:ListItem>
                        <asp:ListItem Text="&nbsp;Direct Check" Value="Direct Check"></asp:ListItem>
                        <asp:ListItem Text="&nbsp;Bank Transfer" Value="Bank Transfer"></asp:ListItem>
                        </asp:RadioButtonList>
                       
                    </div>
                    <div class="card-footer border-secondary bg-transparent">
                        <asp:Button ID="btnplace" runat="server" 
                            class="btn btn-lg btn-block btn-primary font-weight-bold my-3 py-3" 
                            Text="Place Order" onclick="btnplace_Click" />
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
    <!-- Checkout End -->
</asp:Content>

