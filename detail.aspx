<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="detail.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- Page Header Start -->
    <div class="container-fluid bg-secondary mb-5">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
            <h1 class="font-weight-semi-bold text-uppercase mb-3">Medicine Detail</h1>
            <div class="d-inline-flex">
                <p class="m-0"><a href="">Home</a></p>
                <p class="m-0 px-2">-</p>
                <p class="m-0">Medicine Detail</p>
            </div>
        </div>
    </div>
    <!-- Page Header End -->
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
    <!-- Shop Detail Start -->
    <form id="Form1" runat="server">
      <div id="success">
                    <% if (Page.IsPostBack == true && Session["error"].ToString().Equals("Yes"))
                       { %>
                    <div class='alert alert-success'>
                    <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;
                    </button>
                    <strong><%=Session["msg"]%> </strong>
                    </div>
                    <%}
                       else if (Page.IsPostBack == true && Session["error"].ToString().Equals("No"))
                       { %>
                        <div class='alert alert-danger'>
                    <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;
                    </button>
                    <strong><%=Session["msg"]%> </strong>
                    </div>
                    <%}
                       
                        %>
    <div class="container-fluid py-5">
        <div class="row px-xl-5">
            <div class="col-lg-5 pb-5">
                <div id="product-carousel" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner border">
                        <div class="carousel-item active">
                            <asp:Image ID="Image1" runat="server" ImageUrl="" class="w-100 h-100" />
                        </div>
                        <div class="carousel-item">
                           <asp:Image ID="Image2" runat="server" ImageUrl="" class="w-100 h-100" />
                        </div>
                        <div class="carousel-item">
                            <asp:Image ID="Image3" runat="server" ImageUrl="" class="w-100 h-100" />
                        </div>
                        <div class="carousel-item">
                            <asp:Image ID="Image4" runat="server" ImageUrl="" class="w-100 h-100" />
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#product-carousel" data-slide="prev">
                        <i class="fa fa-2x fa-angle-left text-dark"></i>
                    </a>
                    <a class="carousel-control-next" href="#product-carousel" data-slide="next">
                        <i class="fa fa-2x fa-angle-right text-dark"></i>
                    </a>
                </div>
            </div>

            <div class="col-lg-7 pb-5">
                <asp:TextBox ID="txtpid" runat="server" Visible="false"></asp:TextBox>
                <h3 class="font-weight-semi-bold">
                    <asp:Literal ID="Literal1" runat="server"></asp:Literal></h3>
                <div class="d-flex mb-3">
                    <div class="text-primary mr-2">
                    <% for (int k = 1; k <= int.Parse(Session["rating"].ToString()); k++)
                       { %>
                        <small class="fas fa-star"></small>
                        <% } %>
                        <%
                            if (float.Parse(Session["rating"].ToString()) - int.Parse(Session["rating"].ToString()) > 0)
                            {
                             %>
                        <small class="fas fa-star-half-alt"></small>
                        <%} %>
                        <%
                            for (int k = int.Parse(Session["rating"].ToString())+1; k <= 5; k++)
                            {
                             %>
                        <small class="far fa-star"></small>
                        <%
                            } %>
                    </div>
                    <small class="pt-1">(<asp:Literal ID="Literal8" runat="server"></asp:Literal> Reviews)</small>
                </div>
                <h3 class="font-weight-semi-bold mb-4">
                    <asp:Literal ID="Literal2" runat="server"></asp:Literal></h3>
                <p class="mb-4">
                    <asp:Literal ID="Literal3" runat="server"></asp:Literal></p>
                <div class="d-flex mb-3">
                    <p class="text-dark font-weight-medium mb-0 mr-3">Type:</p>
                    <asp:Literal ID="Literal4" runat="server"></asp:Literal>
                </div>
                <div class="d-flex mb-4">
                    <p class="text-dark font-weight-medium mb-0 mr-3">Unit:</p>
                    <asp:Literal ID="Literal5" runat="server"></asp:Literal>
                </div>
                <div class="d-flex align-items-center mb-4 pt-2">
                
                    <div class="input-group quantity mr-3" style="width: 130px;">
                        <div class="input-group-btn">
                            <button class="btn btn-primary btn-minus" style="height:30px;" >
                            <i class="fa fa-minus"></i>
                            </button>
                        </div>
                        <asp:TextBox ID="txtqty" runat="server" class="form-control bg-secondary text-center" Text="1" style="height:30px;"></asp:TextBox>
                        <div class="input-group-btn">
                            <button class="btn btn-primary btn-plus" style="height:30px;" >
                                <i class="fa fa-plus"></i>
                            </button>
                        </div>
                    </div>
                    <br />
                    <asp:Button ID="btncart" runat="server" Text="Add To Cart" 
                        class="btn btn-primary px-3" onclick="btncart_Click"></asp:Button>
                    
                    
                </div>
                <div class="d-flex pt-2">
                    <p class="text-dark font-weight-medium mb-0 mr-2">Share on:</p>
                    <div class="d-inline-flex">
                        <a class="text-dark px-2" href="">
                            <i class="fab fa-facebook-f"></i>
                        </a>
                        <a class="text-dark px-2" href="">
                            <i class="fab fa-twitter"></i>
                        </a>
                        <a class="text-dark px-2" href="">
                            <i class="fab fa-linkedin-in"></i>
                        </a>
                        <a class="text-dark px-2" href="">
                            <i class="fab fa-pinterest"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row px-xl-5">
            <div class="col">
                <div class="nav nav-tabs justify-content-center border-secondary mb-4">
                    <a class="nav-item nav-link active" data-toggle="tab" href="#tab-pane-1">Description</a>
                    <a class="nav-item nav-link" data-toggle="tab" href="#tab-pane-3">Reviews (<asp:Literal
                        ID="Literal9" runat="server"></asp:Literal>)</a>
                </div>
                <div class="tab-content">
                    <div class="tab-pane fade show active" id="tab-pane-1">
                        <h4 class="mb-3">Product Description</h4>
                        <p>
                            <asp:Literal ID="Literal6" runat="server"></asp:Literal></p>
                        
                    </div>
                   
                    <div class="tab-pane fade" id="tab-pane-3">
                        <div class="row">
                            <div class="col-md-6">
                                <h4 class="mb-4">
                                    <asp:Literal ID="Literal10" runat="server"></asp:Literal> review for "<asp:Literal ID="Literal7" runat="server"></asp:Literal>"</h4>
                                <asp:Repeater ID="Repeater1" runat="server">
                                <ItemTemplate>
                                <div class="media mb-4">
                                    <img src="img/noimg.jpg" alt="Image" class="img-fluid mr-3 mt-1" style="width: 45px;"/>
                                    <div class="media-body">
                                        <h6><%# Eval("Name") %><small> - <i><%# Eval("Review_Datetime") %></i></small></h6>
                                        <div class="text-primary mb-2">
                                            <%# Eval("Rating") %> Stars
                                        </div>
                                        <p><%# Eval("Review") %></p>
                                    </div>
                                </div>
                                </ItemTemplate>
                                </asp:Repeater>
                                
                            </div>
                            <div class="col-md-6">
                                <h4 class="mb-4">Leave a review</h4>
                                <small>Your email address will not be published. Required fields are marked *</small>
                                    <div class="form-group">
                                        <label for="name">Your Rating(Between 1 to 5) *</label>
                                        <asp:TextBox ID="txtratings" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                
                                    <div class="form-group">
                                        <label for="message">Your Review *</label>
                                        <asp:TextBox ID="txtmessage" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
                                        
                                    </div>
                                    <div class="form-group">
                                        <label for="name">Your Name *</label>
                                        <asp:TextBox ID="txtName" runat="server" class="form-control"></asp:TextBox>
                                        
                                    </div>
                                    <div class="form-group">
                                        <label for="email">Your Email *</label>
                                        <asp:TextBox ID="txtEmail" runat="server" class="form-control"></asp:TextBox>
                                        
                                    </div>
                                    <div class="form-group mb-0">
                                        <asp:Button ID="btnleave" runat="server" Text="Leave Your Review"  
                                            class="btn btn-primary px-3" onclick="btnleave_Click"/>
                                        
                                    </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
    <!-- Shop Detail End -->
</asp:Content>

