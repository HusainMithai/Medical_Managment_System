<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <!-- Categories Start -->
    <div class="container-fluid pt-5">
     <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">Top Categories</span></h2>
        </div>
        <div class="row px-xl-5 pb-3">
            <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
            <div class="col-lg-4 col-md-6 pb-1">
                <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
                    <p class="text-right"><%#Eval("noimgs") %> Products</p>
                    <a href="" class="cat-img position-relative overflow-hidden mb-3">
                        <img class="img-fluid" src='admin/uploads/<%#Eval("photo") %>' alt="" style="width:250px;height:250px;"/>
                    </a>
                    <h5 class="font-weight-semi-bold m-0"><%#Eval("Category_Name") %></h5>
                </div>
            </div>
            </ItemTemplate>
            </asp:Repeater>
            
        </div>
    </div>
    <!-- Categories End -->


    


     <!-- Vendor Start -->
    <div class="container-fluid py-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">Top Pharma Company</span></h2>
        </div>
        <div class="row px-xl-5">
            <div class="col">
                <div class="owl-carousel vendor-carousel">
                    <div class="vendor-item border p-4">
                        <img src="img/vendor-1.jpg" alt=""/>
                    </div>
                    <div class="vendor-item border p-4">
                        <img src="img/vendor-2.jpg" alt=""/>
                    </div>
                    <div class="vendor-item border p-4">
                        <img src="img/vendor-3.jpg" alt=""/>
                    </div>
                    <div class="vendor-item border p-4">
                        <img src="img/vendor-4.jpg" alt=""/>
                    </div>
                    <div class="vendor-item border p-4">
                        <img src="img/vendor-5.jpg" alt=""/>
                    </div>
                    <div class="vendor-item border p-4">
                        <img src="img/vendor-6.jpg" alt=""/>
                    </div>
                    <div class="vendor-item border p-4">
                        <img src="img/vendor-7.jpg" alt=""/>
                    </div>
                    <div class="vendor-item border p-4">
                        <img src="img/vendor-8.jpg" alt=""/>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
    <!-- Vendor End -->
</asp:Content>

