<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="editproducts.aspx.cs" Inherits="admin_Default" %>

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
    <h2>Edit Medicine</h2>
   
    
   <form id="form1" runat="server">
   
        <hr />
   <asp:TextBox ID="txtpid" runat="server" Visible="false"></asp:TextBox>
        <div class="col-md-12 col-sm-12">
            <div class="form-group  col-md-6  col-sm-12">
                <label class="form-Label">Medicine Name :</label> <span class="red">*</span>
                <asp:TextBox ID="txtpname" runat="server" class="form-control"></asp:TextBox>
                
            </div>
            <div class="form-group  col-md-6  col-sm-12">
                <label class="form-Label">Category Name:</label> <span class="red">*</span>
                <asp:DropDownList ID="ddlcname" runat="server" class="form-control" 
                    onselectedindexchanged="ddlcname_SelectedIndexChanged" AutoPostBack="True">
                <asp:ListItem Value="Select" Text="Select"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group  col-md-6  col-sm-12">
                <label class="form-Label">SubCategory Name:</label> <span class="red">*</span>
                <asp:DropDownList ID="ddlscname" runat="server" class="form-control">
                <asp:ListItem Value="Select" Text="Select"></asp:ListItem>
                </asp:DropDownList>
            </div>
              <div class="form-group  col-md-6  col-sm-12">
                <label class="form-Label">Company Name:</label> <span class="red">*</span>
                 <asp:TextBox ID="txtbname" runat="server" class="form-control"></asp:TextBox>
                
            </div>

              <div class="form-group  col-md-6  col-sm-12">
                <label class="form-Label">Generic Name:</label> <span class="red">*</span>
                <asp:TextBox ID="txtsdscr" TextMode="MultiLine" Rows="2" runat="server" class="form-control"></asp:TextBox>
                
               
            </div>
              <div class="form-group  col-md-6  col-sm-12">
                <label class="form-Label">Medicine Type:</label> <span class="red">*</span>
                 <asp:TextBox ID="txtsizewght" runat="server" class="form-control"></asp:TextBox>
                
               
            </div>
              <div class="form-group  col-md-6  col-sm-12">
                <label class="form-Label">Medicine Unit:</label> <span class="red">*</span>
                <asp:TextBox ID="txtcolor" runat="server" class="form-control"></asp:TextBox>
                
               
            </div>
              <div class="form-group  col-md-6  col-sm-12">
                <label class="form-Label">Old Price:</label> <span class="red">*</span>
                 <asp:TextBox ID="txtoprice" runat="server" class="form-control"></asp:TextBox>
                
               
            </div>
              <div class="form-group  col-md-6  col-sm-12">
                <label class="form-Label">New Price:</label> <span class="red">*</span>
                <asp:TextBox ID="txtnprice" runat="server" class="form-control"></asp:TextBox>
                
               
            </div>
              <div class="form-group  col-md-6  col-sm-12">
                <label class="form-Label">Description:</label> <span class="red">*</span>
                 <asp:TextBox ID="txtdscr" runat="server" TextMode="MultiLine" Rows="3" class="form-control"></asp:TextBox>
                
               
            </div>

             <div class="clearfix"></div>
            <div class="form-group  col-md-6  col-sm-12" id="DivAttachment">

                <label class="form-Label">Cover Photo: </label><span class="red">*</span>
                
                <asp:TextBox ID="hdAttachmentName" runat="server" Visible="false"></asp:TextBox>
                <asp:TextBox ID="hdViewImage" runat="server" Visible="false"></asp:TextBox>

                
                <div class="input-group image-preview">
                    
                 <asp:TextBox ID="txtRealFileName" runat="server" class="form-control input-group-textbox image-preview-filename" ReadOnly></asp:TextBox>

                   
                    <span class="input-group-btn">
                        <!-- loader -->
                        <span id="spanLoad" class="loader btn file-span-icons">
                            <img width="30px" src="img/XtaS.gif" />
                        </span>
                        
                       <asp:FileUpload ID="fupAttachment" runat="server" class="btn btn-default image-preview-input file-span-icons"/>

                       
                       
                    </span>
                </div>
            </div>
            <div class="form-group  col-md-6  col-sm-12">
                  <asp:Image ID="Image1" runat="server" Visible="false" Width="100px" Height="100px"/>
             </div>
               <div class="clearfix"></div>
           
             <div class="form-group  col-md-6  col-sm-12" id="Div1">

                <label class="form-Label">1st Photo: </label><span class="red">*</span>
                
                <asp:TextBox ID="hdAttachmentName1" runat="server" Visible="false"></asp:TextBox>
                <asp:TextBox ID="hdViewImage1" runat="server" Visible="false"></asp:TextBox>

                
                <div class="input-group image-preview">
                    
                 <asp:TextBox ID="txtRealFileName1" runat="server" class="form-control input-group-textbox image-preview-filename" ReadOnly></asp:TextBox>

                   
                    <span class="input-group-btn">
                        <!-- loader -->
                        <span id="span1" class="loader btn file-span-icons">
                            <img width="30px" src="img/XtaS.gif" />
                        </span>
                        
                       <asp:FileUpload ID="fupAttachment1" runat="server" class="btn btn-default image-preview-input file-span-icons"/>

                       
                       
                    </span>
                </div>
            </div>
             <div class="form-group  col-md-6  col-sm-12">
                  <asp:Image ID="Image2" runat="server" Visible="false" Width="100px" Height="100px"/>
             </div>
               <div class="clearfix"></div>
           
            <div class="form-group  col-md-6  col-sm-12" id="Div2">

                <label class="form-Label">2nd Photo: </label><span class="red">*</span>
                
                <asp:TextBox ID="hdAttachmentName2" runat="server" Visible="false"></asp:TextBox>
                <asp:TextBox ID="hdViewImage2" runat="server" Visible="false"></asp:TextBox>

                
                <div class="input-group image-preview">
                    
                 <asp:TextBox ID="txtRealFileName2" runat="server" class="form-control input-group-textbox image-preview-filename" ReadOnly></asp:TextBox>

                   
                    <span class="input-group-btn">
                        <!-- loader -->
                        <span id="span2" class="loader btn file-span-icons">
                            <img width="30px" src="img/XtaS.gif" />
                        </span>
                        
                       <asp:FileUpload ID="fupAttachment2" runat="server" class="btn btn-default image-preview-input file-span-icons"/>

                       
                       
                    </span>
                </div>
            </div>
             <div class="form-group  col-md-6  col-sm-12">
                  <asp:Image ID="Image3" runat="server" Visible="false" Width="100px" Height="100px"/>
             </div>
               <div class="clearfix"></div>
           
            <div class="form-group  col-md-6  col-sm-12" id="Div3">

                <label class="form-Label">3rd Photo: </label><span class="red">*</span>
                
                <asp:TextBox ID="hdAttachmentName3" runat="server" Visible="false"></asp:TextBox>
                <asp:TextBox ID="hdViewImage3" runat="server" Visible="false"></asp:TextBox>

                
                <div class="input-group image-preview">
                    
                 <asp:TextBox ID="txtRealFileName3" runat="server" class="form-control input-group-textbox image-preview-filename" ReadOnly></asp:TextBox>

                   
                    <span class="input-group-btn">
                        <!-- loader -->
                        <span id="span3" class="loader btn file-span-icons">
                            <img width="30px" src="img/XtaS.gif" />
                        </span>
                        
                       <asp:FileUpload ID="fupAttachment3" runat="server" class="btn btn-default image-preview-input file-span-icons"/>

                       
                       
                    </span>
                </div>
            </div>
              <div class="form-group  col-md-6  col-sm-12">
                  <asp:Image ID="Image4" runat="server" Visible="false" Width="100px" Height="100px"/>
                </div>
        </div>

        <div class="col-md-12">
            <hr />
            <asp:Button ID="btnsave" runat="server" Text="Save" class="btn btn-default" 
                onclick="btnsave_Click"  />&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnback" runat="server" Text="Back to List" 
                class="btn btn-default" onclick="btnback_Click"  />
           
        </div>
        

    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
   
    </form>
</div>


</asp:Content>

