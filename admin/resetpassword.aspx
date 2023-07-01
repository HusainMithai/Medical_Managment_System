<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="resetpassword.aspx.cs" Inherits="admin_Default" %>

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
    <h2>Reset Password</h2>
<form id="form1" runat="server">
        <hr />
        <input type="hidden" name="areaid"></input>
        <div class="col-md-12 col-sm-12">
            <div class="form-group  col-md-6  col-sm-12">
                <label class="form-Label">Old Password :</label> <span class="red">*</span>
                <asp:TextBox ID="txtOpass" TextMode="Password" runat="server" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ErrorMessage="Plz Enter Old Password" ControlToValidate="txtOpass" 
                    Display="Dynamic" Font-Bold="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </div>
             <div class="clearfix"></div>
            <div class="form-group  col-md-6  col-sm-12">
                <label class="form-Label">New Password :</label> <span class="red">*</span>
                <asp:TextBox ID="txtNpass" TextMode="Password" runat="server" class="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ErrorMessage="Plz Enter New Password" ControlToValidate="txtNpass" 
                    Font-Bold="True" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </div>
            <div class="clearfix"></div>
            <div class="form-group  col-md-6  col-sm-12">
                <label class="form-Label">Retype New Password :</label> <span class="red">*</span>
                <asp:TextBox ID="txtRNpass" TextMode="Password" runat="server" class="form-control"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ErrorMessage="Retype New Password is not Matched" ControlToCompare="txtNpass" 
                    ControlToValidate="txtRNpass" Display="Dynamic" Font-Bold="True" 
                    ForeColor="#CC0000"></asp:CompareValidator>
            </div>
            
            

        </div>

        <div class="col-md-12">
            <hr />
            <asp:Button ID="btnreset" runat="server" Text="Reset Password" 
                class="btn btn-default" onclick="btnreset_Click" />
            
        </div>
<asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
        </form>
    
</div>
</asp:Content>

