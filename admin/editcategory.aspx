<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="editcategory.aspx.cs" Inherits="admin_Default" %>

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
    <script  type="text/javascript">
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

   <style>
    .mce-branding-powered-by {
        display: none;
    }
</style>
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <h2>Edit Category</h2>

   <form id="form1" runat="server" >
        <hr />
        <asp:TextBox ID="txtId" runat="server" Visible="false"></asp:TextBox>
        <div class="col-md-12 col-sm-12">
            <div class="form-group  col-md-6  col-sm-12">
                <label class="form-Label">Category Name :</label> <span class="red">*</span>
                <asp:TextBox ID="txtcname" runat="server" class="form-control"></asp:TextBox>
               
                
            </div>
            <div class="form-group  col-md-6  col-sm-12">
                <label class="form-Label">Under:</label> <span class="red">*</span>
                <asp:TextBox ID="txtunder" runat="server" class="form-control"></asp:TextBox>
               
            </div>
            
            

        </div>

        <div class="col-md-12">
            <hr />
            <asp:Button ID="btnSave" runat="server" Text="Save" class="btn btn-default" 
                onclick="btnSave_Click"/>
            &nbsp;&nbsp;
            <asp:Button ID="btnList" runat="server" Text="Back to List" 
                class="btn btn-default" CausesValidation="false" onclick="btnList_Click"/>
        </div>
   <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
        </form>
    
</div>




</asp:Content>

