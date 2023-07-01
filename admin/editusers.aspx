<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="editusers.aspx.cs" Inherits="admin_Default" %>

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
    <h2>Edit User</h2>

   <form runat="server">
        <hr />
        <asp:TextBox ID="txtuid" runat="server" class="form-control" Visible="false"></asp:TextBox>
        <div class="col-md-12 col-sm-12">
             <div class="form-group  col-md-6  col-sm-12">
                <label class="form-Label">Name :</label> <span class="red">*</span>
                <asp:TextBox ID="txtName" runat="server" class="form-control" ReadOnly></asp:TextBox>
                 
                
            </div>
             <div class="form-group  col-md-6  col-sm-12">
                <label class="form-Label">Gender:</label> <span class="red">*</span>
                 <asp:TextBox ID="txtGender" runat="server" class="form-control" ReadOnly></asp:TextBox>
            </div>
             <div class="form-group  col-md-6  col-sm-12">
                <label class="form-Label">Email Id:</label> <span class="red">*</span>
                 <asp:TextBox ID="txtEmail" runat="server" class="form-control" ReadOnly></asp:TextBox>
                 
                
               
            </div>
            <div class="form-group  col-md-6  col-sm-12">
                <label class="form-Label">Mobile No:</label> <span class="red">*</span>
                 <asp:TextBox ID="txtMno" runat="server" class="form-control" ReadOnly></asp:TextBox>
            </div>
             <div class="form-group  col-md-6  col-sm-12">
                <label class="form-Label">Address:</label> <span class="red">*</span>
                 <asp:TextBox ID="txtAddress" runat="server" class="form-control" ReadOnly></asp:TextBox>
            </div>

             <div class="form-group  col-md-6  col-sm-12">
                <label class="form-Label">Activate:</label> <span class="red">*</span>
                 <asp:DropDownList ID="ddlActivate" runat="server"  class="form-control">
                 <asp:ListItem Text="Active" Value="Active"></asp:ListItem>
                 <asp:ListItem Text="Deactive" Value="Deactive"></asp:ListItem>
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

