<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="myorders.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<!-- Page Header Start -->
    <div class="container-fluid bg-secondary mb-5">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
            <h1 class="font-weight-semi-bold text-uppercase mb-3">My Orders</h1>
            <div class="d-inline-flex">
                <p class="m-0"><a href="">Home</a></p>
                <p class="m-0 px-2">-</p>
                <p class="m-0">My Orders</p>
            </div>
        </div>
    </div>
    <!-- Page Header End -->
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
    <form id="Form1" runat="server">
    <!-- Cart Start -->
    <div class="container-fluid pt-5">
        <div class="row px-xl-5">
            <div class="col-lg-12 table-responsive mb-5">
                <table class="table table-bordered text-center mb-0">
                    <thead class="bg-secondary text-dark">
                        <tr>
                            <th>Order No</th>
                            <th>Order Date</th>
                            <th>Order Time</th>
                            <th>SubTotal</th>
                            <th>Shipping Charge</th>
                            <th>Total Amount</th>
                            <th>Payment Type</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody class="align-middle">
                        <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            
                        <tr>
                            <td class="align-middle"><%# Eval("order_no") %> </td>
                            <td class="align-middle"><%# Eval("order_date") %> </td>
                           <td class="align-middle"><%# Eval("order_time") %> </td>
                           <td class="align-middle"><%# Eval("subtotal") %> </td>
                           <td class="align-middle"><%# Eval("shipping") %> </td>
                           <td class="align-middle"><%# Eval("total_amount") %> </td>
                           <td class="align-middle"><%# Eval("payment_type") %> </td>
                           <td class="align-middle"><%# Eval("status") %> </td>

                        </tr>
                      </ItemTemplate>
                        </asp:Repeater>
                        
                    </tbody>
                </table>
            </div>
     
        </div>
    </div>
    </form>
    <!-- Cart End -->

</asp:Content>

