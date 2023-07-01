<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="cart.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <!-- Page Header Start -->
    <div class="container-fluid bg-secondary mb-5">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
            <h1 class="font-weight-semi-bold text-uppercase mb-3">Shopping Cart</h1>
            <div class="d-inline-flex">
                <p class="m-0"><a href="">Home</a></p>
                <p class="m-0 px-2">-</p>
                <p class="m-0">Shopping Cart</p>
            </div>
        </div>
    </div>
    <!-- Page Header End -->
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
    <form runat="server">
    <!-- Cart Start -->
    <div class="container-fluid pt-5">
        <div class="row px-xl-5">
            <div class="col-lg-8 table-responsive mb-5">
                <table class="table table-bordered text-center mb-0">
                    <thead class="bg-secondary text-dark">
                        <tr>
                            <th>Products</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                            <th>Remove</th>
                        </tr>
                    </thead>
                    <tbody class="align-middle">
                        <asp:Repeater ID="Repeater1" runat="server" 
                            onitemcommand="Repeater1_ItemCommand" 
                            onitemdatabound="Repeater1_ItemDataBound">
                        <ItemTemplate>
                            <asp:Literal ID="ltrid" runat="server" Visible="false" Text='<%# Eval("product_id") %>'></asp:Literal>
                        <tr>
                            <td class="align-middle"><img src="admin/uploads/<%# Eval("product_photo") %>" alt="" style="width: 50px;"/><%# Eval("product_name") %> </td>
                            <td class="align-middle">Rs. <%# Eval("price") %></td>
                            <td class="align-middle">
                                <div class="input-group quantity mx-auto" style="width: 100px;">
                                    <div class="input-group-btn">
                                        <asp:Button ID="btnminus" runat="server" Text="-" class="btn btn-sm btn-primary btn-minus" style="height:30px;" Font-Bold="True" Font-Size="Large" />
                                        
                                    </div>
                                      <asp:TextBox ID="txtqty" runat="server" class="form-control bg-secondary text-center" Text='<%#Eval("qty") %>' style="height:30px;"></asp:TextBox>
                                    <div class="input-group-btn">
                                         <asp:Button ID="btnplus" runat="server" Text="+" class="btn btn-sm btn-primary btn-minus" style="height:30px;" Font-Bold="True" Font-Size="Large" />
                                       
                                    </div>
                                </div>
                            </td>
                            <td class="align-middle">Rs. <%# Eval("amount") %></td>
                            <td class="align-middle"> <asp:Button ID="btndel" runat="server" Text="X" class="btn btn-sm btn-primary btn-minus" style="height:30px;" Font-Bold="True" Font-Size="Large"/>
                                       </td>
                        </tr>
                      </ItemTemplate>
                        </asp:Repeater>
                        
                    </tbody>
                </table>
            </div>
            <div class="col-lg-4">
               
                    <div class="input-group">
                        <input type="text" class="form-control p-4" placeholder="Coupon Code"/>
                        <div class="input-group-append">
                            <button class="btn btn-primary">Apply Coupon</button>
                        </div>
                    </div>
                
                <div class="card border-secondary mb-5">
                    <div class="card-header bg-secondary border-0">
                        <h4 class="font-weight-semi-bold m-0">Cart Summary</h4>
                    </div>
                    <div class="card-body">
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
                        <asp:Button ID="btncheckout" runat="server" Text="Proceed To Checkout" 
                            class="btn btn-block btn-primary my-3 py-3" onclick="btncheckout_Click"/>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
    <!-- Cart End -->

</asp:Content>

