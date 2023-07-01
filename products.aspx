<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="products.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<!-- Page Header Start -->
    <div class="container-fluid bg-secondary mb-5">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
            <h1 class="font-weight-semi-bold text-uppercase mb-3">Our Medicines</h1>
            <div class="d-inline-flex">
                <p class="m-0"><a href="">Home</a></p>
                <p class="m-0 px-2">-</p>
                <p class="m-0">Medicines</p>
            </div>
        </div>
    </div>
    <!-- Page Header End -->
    <form runat="server">

    <!-- Shop Start -->
    <div class="container-fluid pt-5">
        <div class="row px-xl-5">
            <!-- Shop Sidebar Start -->
            <div class="col-lg-3 col-md-12">
                <!-- Price Start -->
                <div class="border-bottom mb-4 pb-4">
                    <h5 class="font-weight-semi-bold mb-4">Filter by Price</h5>
                       <asp:CheckBoxList ID="pricelist" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="pricelist_SelectedIndexChanged" >
                    <asp:ListItem Value="All Price" Text="&nbsp;&nbsp;All Price" >&nbsp;&nbsp;</asp:ListItem>
                    <asp:ListItem Value="Rs. 0- Rs. 100" Text="&nbsp;&nbsp;Rs. 0- Rs. 100" >&nbsp;&nbsp;</asp:ListItem>
                    <asp:ListItem Value="Rs. 100- Rs. 300" Text="&nbsp;&nbsp;Rs. 100- Rs. 300" >&nbsp;&nbsp;</asp:ListItem>
                    <asp:ListItem Value="Rs. 300- Rs. 500" Text="&nbsp;&nbsp;Rs. 300- Rs. 500" >&nbsp;&nbsp;</asp:ListItem>
                    <asp:ListItem Value="Rs. 500- Above" Text="&nbsp;&nbsp;Rs. 500- Above" >&nbsp;&nbsp;</asp:ListItem>

                    </asp:CheckBoxList>
                       
                </div>
                <!-- Price End -->
                
                <!-- Color Start -->
                <div class="border-bottom mb-4 pb-4">
                    <h5 class="font-weight-semi-bold mb-4">Filter by Generic Name</h5>
                    <asp:CheckBoxList ID="colorlist" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="colorlist_SelectedIndexChanged" >
                    <asp:ListItem Value="All Generic" Text="&nbsp;&nbsp;All Generic" >&nbsp;&nbsp;</asp:ListItem>
                    </asp:CheckBoxList>
                        
                   
                </div>
                <!-- Color End -->

                <!-- Size Start -->
                <div class="border-bottom mb-4 pb-4">
                    <h5 class="font-weight-semi-bold mb-4">Filter by Type</h5>
                    <asp:CheckBoxList ID="sizelist" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="sizelist_SelectedIndexChanged" >
                    <asp:ListItem Value="All Type" Text="&nbsp;&nbsp;All Type" >&nbsp;&nbsp;</asp:ListItem>
                    </asp:CheckBoxList>
                        
                   
                </div>
                <!-- Size End -->
               
            </div>
            <!-- Shop Sidebar End -->


            <!-- Shop Product Start -->
            <div class="col-lg-9 col-md-12">
                <div class="row pb-3">
                    <div class="col-12 pb-1">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Search by name"/>
                                    <div class="input-group-append">
                                        <span class="input-group-text bg-transparent text-primary">
                                            <i class="fa fa-search"></i>
                                        </span>
                                    </div>
                                </div>
                           
                            <div class="dropdown ml-4">
                                <button class="btn border dropdown-toggle" type="button" id="triggerId" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">
                                            Sort by
                                        </button>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="triggerId">
                                    <a class="dropdown-item" href="#">Latest</a>
                                    <a class="dropdown-item" href="#">Popularity</a>
                                    <a class="dropdown-item" href="#">Best Rating</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                    <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                     <div class="col-lg-4 col-md-6 col-sm-12 pb-1">
                        <div class="card product-item border-0 mb-4">
                            <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                <img class="img-fluid w-100" src='admin/uploads/<%# Eval("photo") %>' alt="" style="width:250px;height:250px;"/>
                            </div>
                            <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                                <h6 class="text-truncate mb-3"><%# Eval("product_name") %></h6>
                                <div class="d-flex justify-content-center">
                                    <h6>Rs. <%# Eval("new_price") %></h6><h6 class="text-muted ml-2"><del>Rs. <%# Eval("old_price") %></del></h6>
                                </div>
                            </div>
                            <div class="card-footer d-flex justify-content-between bg-light border">
                                <a href='detail.aspx?pid=<%#Eval("product_id") %>' class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                                <a href='cart.aspx?pid=<%#Eval("product_id") %>' class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                            </div>
                        </div>
                    </div>
                    </ItemTemplate>
                    </asp:Repeater>
                    <div class="col-12 pb-1">
                        <nav aria-label="Page navigation">
                          <ul class="pagination justify-content-center mb-3">
                            <%
                                if (int.Parse(Session["curpage"].ToString()) == 1)
                                { %>
                            <li class="page-item disabled">
                                <%}
                                else
                                { %>
                                <li class="page-item">
                                <%} %>
                              <a class="page-link" style="cursor:pointer;"  onclick="changepage(<%=int.Parse(Session["curpage"].ToString())-1 %>);" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                                <span class="sr-only">Previous</span>
                              </a>
                            </li>

                            <% for (int i = 1; i <= int.Parse(Session["nopages"].ToString()); i++)
                               { 
                                   if(i==int.Parse(Session["curpage"].ToString()))
                                   {
                                       %>
                            <li class="page-item active"><a class="page-link" style="cursor:pointer;"  onclick="changepage(<%=i %>);"><%=i %></a></li>
                            <% } else { %>
                            <li class="page-item"><a class="page-link" style="cursor:pointer;" onclick="changepage(<%=i %>);"><%=i %></a></li>
                            
                            <%}} %>

                            <%
                             if (int.Parse(Session["curpage"].ToString()) ==int.Parse(Session["nopages"].ToString()))
                                { %>
                            <li class="page-item disabled">
                                <%}
                                else
                                { %>
                                <li class="page-item">
                                <%} %>

                           
                              <a class="page-link" style="cursor:pointer;" onclick="changepage(<%=int.Parse(Session["curpage"].ToString())+1 %>);" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                                <span class="sr-only">Next</span>
                              </a>
                            </li>
                          </ul>
                        </nav>
                    </div>
                </div>
            </div>
            <!-- Shop Product End -->
        </div>
    </div>
    </form>
    <!-- Shop End -->
    <script type="text/javascript">
        function changepage(pno) {
            var urlparams = new URLSearchParams(window.location.search);
            var myparam = urlparams.get("catid");
            if (myparam == null) {
                window.location.href = "products.aspx?pno=" + pno;
            }
            else {
                window.location.href = "products.aspx?catid="+myparam+"&pno=" + pno;
            }
        }
        
    </script>
</asp:Content>

