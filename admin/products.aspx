<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPage.master" AutoEventWireup="true" CodeFile="products.aspx.cs" Inherits="admin_Default" %>

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
    <h2>Medicine</h2>
    <fieldset>
        <div class="col-md-12">
            <div>
                <button class="btn btn-default" onclick="location.href='editproducts.aspx'" type="button" title="Add New Area">
                    Add New Medicine  <i class="fa fa-plus"></i>
                </button>
                <br />
                

            </div>

            <table id="datatab" class="table-bordered table-striped table-condensed cf" style="width:100%">

                <thead>
                    <tr>
                        <th align="center" style="width:10%;">Medicine Id</th>
                        <th align="center" style="width:10%;">Image</th>
                        <th align="center" style="width:10%;">Medicine Name</th>
                         <th align="center" style="width:10%;">Company Name</th>
                         <th align="center" style="width:10%;">Generic Name</th>
                        <th align="center" style="width:10%;">Old Price</th>
                         <th align="center" style="width:10%;">New Price</th>
                          <th align="center" style="width:10%;">Type</th>
                           <th align="center" style="width:10%;">Unit</th>
                           
                        <th style="width:10%;">Actions</th>
                    </tr>
                </thead>

                <tbody>

                    <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                    
                                <tr>
                                    <td data-title="City:" align="left">
                                        <%# Eval("product_id") %>
                                    </td>
                                    <td data-title="City:" align="left">
                                        <img src="uploads/<%# Eval("photo") %>" width="50px" height="50px" />
                                    </td>
                                     <td data-title="State:" align="left">
                                        <%# Eval("product_name") %>
                                    </td>
                                    <td data-title="State:" align="left">
                                        <%# Eval("company_name") %>
                                    </td>
                                    <td data-title="State:" align="left">
                                        <%# Eval("generic_name") %>
                                    </td>
 									<td data-title="Country:" align="left">
                                        <%# Eval("old_price") %>
                                    </td>
                                    <td data-title="Country:" align="left">
                                        <%# Eval("new_price") %>
                                    </td>
                                    <td data-title="Country:" align="left">
                                        <%# Eval("medicine_type") %>
                                    </td>
                                    <td data-title="Country:" align="left">
                                        <%# Eval("medicine_unit") %>
                                    </td>
                                    <td align="left">
                                        <button class="btn" title="Go to Medicine Details" type="button" id="button" onclick="location.href='editproducts.aspx?id=<%# Eval("product_id") %>'"><i class="fa fa-edit"></i></button>

                                        <span class="fa-2x">|</span>

                                        <button class="btn" title="Delete" type="button" id="button" onclick="DeleteProd('<%# Eval("product_id") %>')"><i class="fa fa-trash"></i></button>
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
<script type="text/javascript">
    function DeleteProd(ID) {
        if (confirm("Are you sure to delete the record?")) {
            location.href = "products.aspx?id=" + ID;
        }
    }
</script>
</asp:Content>

