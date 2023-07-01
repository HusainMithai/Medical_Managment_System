<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="editorders.aspx.cs" Inherits="admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <script type="text/javascript">
     $(document).ready(function () {
         // get current URL path and assign 'active' class
         var pathname = window.location.pathname;
         $('.nav > li > a[href="' + pathname + '"]').parent().addClass('active');
     })
    </script>
    <script>
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
<script type="text/javascript" src="js/ViewFile.js"></script>
   <style>
    .mce-branding-powered-by {
        display: none;
    }
</style>
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <h2>Edit Orders</h2>

   <form id="Form1" runat="server">
        <hr />
        <div class="col-md-12 col-sm-12">
            <div class="form-group  col-md-6  col-sm-12">
                <label class="form-Label">Order No :</label> <span class="red">*</span>
                <asp:TextBox ID="txtono" runat="server" class="form-control" ReadOnly></asp:TextBox>
                 
                
            </div>
             <div class="form-group  col-md-6  col-sm-12">
                <label class="form-Label">Subtotal:</label> <span class="red">*</span>
                 <asp:TextBox ID="txtsubtotal" runat="server" class="form-control" ReadOnly></asp:TextBox>
            </div>
             <div class="form-group  col-md-6  col-sm-12">
                <label class="form-Label">Shipping:</label> <span class="red">*</span>
                 <asp:TextBox ID="txtshipping" runat="server" class="form-control" ReadOnly></asp:TextBox>
                 
                
               
            </div>
            <div class="form-group  col-md-6  col-sm-12">
                <label class="form-Label">Total Amount:</label> <span class="red">*</span>
                 <asp:TextBox ID="txttotal" runat="server" class="form-control" ReadOnly></asp:TextBox>
            </div>
             <div class="form-group  col-md-6  col-sm-12">
                <label class="form-Label">Payment Type:</label> <span class="red">*</span>
                 <asp:TextBox ID="txttype" runat="server" class="form-control" ReadOnly></asp:TextBox>
            </div>

             <div class="form-group  col-md-6  col-sm-12">
                <label class="form-Label">Status:</label> <span class="red">*</span>
                 <asp:DropDownList ID="ddlstatus" runat="server"  class="form-control">
                 <asp:ListItem Text="Placed" Value="Placed"></asp:ListItem>
                 <asp:ListItem Text="Packed" Value="Packed"></asp:ListItem>
                 <asp:ListItem Text="Shipped" Value="Shipped"></asp:ListItem>
                 <asp:ListItem Text="Delivered" Value="Delivered"></asp:ListItem>
                 <asp:ListItem Text="Returned" Value="Returned"></asp:ListItem>
                 <asp:ListItem Text="Cancelled" Value="Cancelled"></asp:ListItem>
                 </asp:DropDownList>
               
            </div>
        </div>

        <div class="col-md-12">
            <hr />
               <asp:Button ID="btnsave" runat="server" Text="Save" class="btn btn-default" 
                onclick="btnsave_Click"  />&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnback" runat="server" Text="Back to List" 
                class="btn btn-default" onclick="btnback_Click"  />
          
        </div>

    </form>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
</div>

</asp:Content>

