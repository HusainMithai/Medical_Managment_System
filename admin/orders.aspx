<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="orders.aspx.cs" Inherits="admin_Default" %>

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
    <script type="text/javascript">
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
    th {
        background-color: #ede4dc;
    }
</style>
<style>
    @media only screen and (max-width: 800px) {
        /* Force table to not be like tables anymore */
        #no-more-tables table,
        #no-more-tables thead,
        #no-more-tables tbody,
        #no-more-tables th,
        #no-more-tables td,
        #no-more-tables tr {
        display: block;
        }

        /* Hide table headers (but not display: none;, for accessibility) */
        #no-more-tables thead tr {
        position: absolute;
        top: -9999px;
        right: -9999px;
        }

        #no-more-tables tr { border: 1px solid #ccc; }

        #no-more-tables td {
        /* Behave like a "row" */
        border: none;
        border-bottom: 1px solid #eee;
        position: relative;
        padding-right: 50%;
        white-space: normal;
        text-align:right;
        }

        #no-more-tables td:before {
        /* Now like a table header */
        position: absolute;
        /* Top/left values mimic padding */
        top: 6px;
        right: 6px;
        width: 45%;
        padding-right: 10px;
        white-space: nowrap;
        text-align:right;
        font-weight: bold;
        }

        /*
        Label the data
        */
        #no-more-tables td:before { content: attr(data-title); }
        }
</style>

<script type="text/javascript">
    var dTable;
    $(document).ready(function () {
        dTable = $('#datatab').dataTable({
            "language": {
                "sProcessing": "جاري التحميل...",
                "sLengthMenu": " عدد النتائج في الصفحة _MENU_",
                "sZeroRecords": "No records to display",
                "sInfo": "Number of records displayed  : _TOTAL_ ",
                "sInfoEmpty": "Displays 0 to 0 of 0 records",
                "sInfoFiltered": "( Max Records: _MAX_ )",
                "sInfoPostFix": "",
                "sSearch": "Search: ",
                "sUrl": "",
                "oPaginate": {
                    "sFirst": "First",
                    "sPrevious": "Previous",
                    "sNext": "Next",
                    "sLast": "Last"
                }
            },

            "bLengthChange": false,
            "bFilter": true,
            "bSort": false,
            "bInfo": true,
            "sPaginationType": "full_numbers",
            "bAutoWidth": false,
            "pageLength": 15
        }).columnFilter({
            sPlaceHolder: "head:after", aoColumns: [{ type: "text" }, null, null]
        });

        // New record
        $('a.editor_create').on('click', function (e) {
            e.preventDefault();

            jTable.create({
                title: 'Create new record',
                buttons: 'Add'
            });
        });
    });
</script>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <h2>View Orders </h2>
    <fieldset>
        <div class="col-md-12">
            <div>
               

            </div>

            <table id="datatab" class="table-bordered table-striped table-condensed cf" style="width:100%">

                <thead>
                    <tr>
                        <th align="center" style="width:10%;">Id</th>
                        <th align="center" style="width:10%;">Customer Email</th>
                        <th align="center" style="width:10%;">Order No</th>
                        <th align="center" style="width:10%;">Order Date</th>
                        <th align="center" style="width:10%;">Subtotal</th>
                        <th align="center" style="width:10%;">Shipping</th>
                        <th align="center" style="width:10%;">Total</th>
                        <th align="center" style="width:10%;">Payment Type</th>
                        <th align="center" style="width:10%;">Status</th>
                        <th style="width:10%;">Actions</th>
                    </tr>
                </thead>

                <tbody>

                    
                                  <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                    
                                <tr>
                                    <td data-title="City:" align="left">
                                        <%# Eval("Id") %>
                                    </td>
                                    
 									<td data-title="Country:" align="left">
                                        <%# Eval("user_email_id") %>
                                    </td>
                                    <td data-title="Country:" align="left">
                                        <%# Eval("order_no") %>
                                    </td>
                                   
                                    <td data-title="Country:" align="left">
                                        <%# Eval("order_date") %>
                                    </td>
                                    <td data-title="Country:" align="left">
                                        <%# Eval("subtotal") %>
                                    </td>
                                    <td data-title="Country:" align="left">
                                        <%# Eval("shipping") %>
                                    </td>
                                    <td data-title="Country:" align="left">
                                        <%# Eval("total_amount") %>
                                    </td>
                                    <td data-title="Country:" align="left">
                                        <%# Eval("payment_type") %>
                                    </td>
                                    <td data-title="Country:" align="left">
                                        <%# Eval("status") %>
                                    </td>
                                    <td align="left">
                                        <button class="btn" title="View" type="button" id="button" onclick="location.href='orders.aspx?ono=<%# Eval("order_no") %>';"><i class="fa fa-eye"></i></button>
                                        <button class="btn" title="Edit" type="button" id="button1" onclick="location.href='editorders.aspx?ono=<%# Eval("order_no") %>';"><i class="fa fa-edit"></i></button>
                                    </td>

                                </tr>
                    
                    </ItemTemplate>
                    </asp:Repeater>
                </tbody>

            </table>
            <br />
            <button onclick="exportexcel()">
                Export to Excel
            </button>
        </div>
    </fieldset>
     <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
     <br />
     <h2>Order Details </h2>
     <fieldset>
        <div class="col-md-12">
            <div>
               

            </div>

            <table id="Table1" class="table-bordered table-striped table-condensed cf" style="width:100%">

                <thead>
                    <tr>
                        <th align="center" style="width:10%;">Sr. No</th>
                        <th align="center" style="width:10%;">Photo</th>
                        <th align="center" style="width:10%;">Product Name</th>
                        <th align="center" style="width:10%;">Price</th>
                        <th align="center" style="width:10%;">Qty</th>
                        <th align="center" style="width:10%;">Amount</th>
                      
                    </tr>
                </thead>

                <tbody>

                    
                                  <asp:Repeater ID="Repeater2" runat="server">
                    <ItemTemplate>
                    
                                <tr>
                                    <td data-title="City:" align="left">
                                        <%# Eval("srno") %>
                                    </td>
                                    
 									<td data-title="Country:" align="left">
                                       <img src='uploads/<%# Eval("product_photo") %>' width="50px" height="50px" />
                                    </td>
                                    <td data-title="Country:" align="left">
                                        <%# Eval("product_name") %>
                                    </td>
                                   
                                    <td data-title="Country:" align="left">
                                        <%# Eval("price") %>
                                    </td>
                                    <td data-title="Country:" align="left">
                                        <%# Eval("qty") %>
                                    </td>
                                    <td data-title="Country:" align="left">
                                        <%# Eval("amount") %>
                                    </td>
                                    

                                </tr>
                    
                    </ItemTemplate>
                    </asp:Repeater>
                </tbody>

            </table>
            <br />
            <button onclick="exportexcel()">
                Export to Excel
            </button>
        </div>
    </fieldset>

    <br />
     <h2>Shipping Details </h2>
     <fieldset>
        <div class="col-md-12">
            <div>
               

            </div>

            <table id="Table2" class="table-bordered table-striped table-condensed cf" style="width:100%">

                <thead>
                    <tr>
                        <th align="center" style="width:10%;">First Name</th>
                        <th align="center" style="width:10%;">Last Name</th>
                        <th align="center" style="width:10%;">Email id</th>
                        <th align="center" style="width:10%;">Mobile No</th>
                        <th align="center" style="width:10%;">Address</th>
                        <th align="center" style="width:10%;">Country</th>
                      <th align="center" style="width:10%;">City</th>
                      <th align="center" style="width:10%;">State</th>
                      <th align="center" style="width:10%;">ZipCode</th>
                    </tr>
                </thead>

                <tbody>

                    
                                  <asp:Repeater ID="Repeater3" runat="server">
                    <ItemTemplate>
                    
                                <tr>
                                    <td data-title="City:" align="left">
                                        <%# Eval("first_name") %>
                                    </td>
                                    
 									<td data-title="Country:" align="left">
                                       <%# Eval("last_name") %>
                                    </td>
                                    <td data-title="Country:" align="left">
                                        <%# Eval("email_id") %>
                                    </td>
                                   
                                    <td data-title="Country:" align="left">
                                        <%# Eval("mobile_no") %>
                                    </td>
                                    <td data-title="Country:" align="left">
                                        <%# Eval("address1") %>,<%# Eval("address2") %>
                                    </td>
                                    <td data-title="Country:" align="left">
                                        <%# Eval("country") %>
                                    </td>
                                    
                                    <td data-title="Country:" align="left">
                                        <%# Eval("city") %>
                                    </td>
                                    <td data-title="Country:" align="left">
                                        <%# Eval("state") %>
                                    </td>
                                    <td data-title="Country:" align="left">
                                        <%# Eval("zipcode") %>
                                    </td>
                                </tr>
                    
                    </ItemTemplate>
                    </asp:Repeater>
                </tbody>

            </table>
            <br />
            <button onclick="exportexcel()">
                Export to Excel
            </button>
        </div>
    </fieldset>

     <br />
     <h2>Bill Details </h2>
     <fieldset>
        <div class="col-md-12">
            <div>
               

            </div>

            <table id="Table3" class="table-bordered table-striped table-condensed cf" style="width:100%">

                <thead>
                    <tr>
                        <th align="center" style="width:10%;">First Name</th>
                        <th align="center" style="width:10%;">Last Name</th>
                        <th align="center" style="width:10%;">Email id</th>
                        <th align="center" style="width:10%;">Mobile No</th>
                        <th align="center" style="width:10%;">Address</th>
                        <th align="center" style="width:10%;">Country</th>
                      <th align="center" style="width:10%;">City</th>
                      <th align="center" style="width:10%;">State</th>
                      <th align="center" style="width:10%;">ZipCode</th>
                    </tr>
                </thead>

                <tbody>

                    
                                  <asp:Repeater ID="Repeater4" runat="server">
                    <ItemTemplate>
                    
                                <tr>
                                    <td data-title="City:" align="left">
                                        <%# Eval("first_name") %>
                                    </td>
                                    
 									<td data-title="Country:" align="left">
                                       <%# Eval("last_name") %>
                                    </td>
                                    <td data-title="Country:" align="left">
                                        <%# Eval("email_id") %>
                                    </td>
                                   
                                    <td data-title="Country:" align="left">
                                        <%# Eval("mobile_no") %>
                                    </td>
                                    <td data-title="Country:" align="left">
                                        <%# Eval("address1") %>,<%# Eval("address2") %>
                                    </td>
                                    <td data-title="Country:" align="left">
                                        <%# Eval("country") %>
                                    </td>
                                    
                                    <td data-title="Country:" align="left">
                                        <%# Eval("city") %>
                                    </td>
                                    <td data-title="Country:" align="left">
                                        <%# Eval("state") %>
                                    </td>
                                    <td data-title="Country:" align="left">
                                        <%# Eval("zipcode") %>
                                    </td>
                                </tr>
                    
                    </ItemTemplate>
                    </asp:Repeater>
                </tbody>

            </table>
            <br />
            <button onclick="exportexcel()">
                Export to Excel
            </button>
        </div>
    </fieldset>
</div>
<link href="css/dataTables.css" rel="stylesheet" />
<script src="js/jquery.table2excel.min.js"></script>
<script type="text/javascript">

    function exportexcel() {
        $("#datatab").table2excel({
            name: "Table2Excel",
            filename: "User Details",
            fileext: ".xls",
            exclude: ".noExlCol",
        });
    }
</script>

</asp:Content>

