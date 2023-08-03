<%@ Page Title="" Language="C#" MasterPageFile="~/home-view/Home.master" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="home_view_home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- Top News Slider Start -->
    
    <!-- Top News Slider End -->


    <!-- Main News Slider Start -->
    <div class="container-fluid py-3">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="owl-carousel owl-carousel-2 carousel-item-1 position-relative mb-3 mb-lg-0">
                        <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource2" >
                            <ItemTemplate>
                                <div class="position-relative overflow-hidden" style=" height: 435px;">
                                    <asp:Image ID="Image" CssClass="img-fluid h-100" style="object-fit: cover;" runat="server" ImageUrl='<%# ResolveUrl("~/Upload/Image/" + Eval("image"))%>' />
                                    <div class="overlay">
                                        <div class="mb-1">
                                            <asp:HyperLink ID="HyperLink5" runat="server" CssClass="text-white" Text='<%# Eval("category_id") %>'  ForeColor="Red" Font-Size="Large"></asp:HyperLink>
                                            <span class="px-2 text-white">/</span>
                                            <asp:Label ID="Label2" runat="server" CssClass="text-white" Text='<%# Eval("updated_at", "{0:hh:mm:ss - dd/MM/yyyy}") %>'></asp:Label>
                                        </div>
                                        <asp:HyperLink ID="HyperLink1" runat="server" CssClass="h2 m-0 text-white font-weight-bold" Text='<%# Eval("name") %>' NavigateUrl='<%# Eval("id", "~/home-view/home-single.aspx?id={0}") %>'></asp:HyperLink> 
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="d-flex align-items-center justify-content-between bg-light py-2 px-4 mb-3">
                        <h3 class="m-0">Danh mục</h3>
                        <a class="text-secondary font-weight-medium text-decoration-none" href="">View All</a>
                    </div>
                    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource4">
                        <ItemTemplate>
                            <div class="position-relative overflow-hidden mb-3" style="height: 80px;">
                                <img class="img-fluid w-100 h-100" src="../img/cat-500x80-1.jpg" style="object-fit: cover;">
                                <asp:HyperLink ID="HyperLink2" runat="server" CssClass="overlay align-items-center justify-content-center h4 m-0 text-white text-decoration-none" Text='<%# Eval("name") %>'></asp:HyperLink>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </div>
    <!-- Main News Slider End -->


    <!-- Featured News Slider Start -->
    <div class="container-fluid py-3">
        <div class="container">
            <div class="d-flex align-items-center justify-content-between bg-light py-2 px-4 mb-3">
                <h3 class="m-0">Hot trong ngày</h3>
                <a class="text-secondary font-weight-medium text-decoration-none" href="">View All</a>
            </div>
            <div class="owl-carousel owl-carousel-2 carousel-item-4 position-relative">
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource3">
                    <ItemTemplate>
                        <div class="position-relative overflow-hidden" style="height: 300px;">
                            <asp:Image ID="Image" CssClass="img-fluid w-100 h-100" Style="object-fit: cover;" runat="server" ImageUrl='<%# ResolveUrl("~/Upload/Image/" + Eval("image"))%>' />
                            <div class="overlay">
                                <div class="mb-1" style="font-size: 13px;">
                                    <asp:HyperLink ID="HyperLink5" runat="server" CssClass="text-white" Text='<%# Eval("category_id") %>'  ForeColor="Red"></asp:HyperLink>
                                    <span class="px-1 text-white">/</span>
                                    <asp:Label ID="Label2" runat="server" CssClass="text-white" Text='<%# Eval("updated_at", "{0:hh:mm:ss - dd/MM/yyyy}") %>'></asp:Label>
                                </div>
                                <asp:HyperLink ID="HyperLink1" runat="server" CssClass="h2 m-0 text-white font-weight-bold" Text='<%# Eval("name") %>' NavigateUrl='<%# Eval("id", "~/home-view/home-single.aspx?id={0}") %>'  Font-Size="Large"></asp:HyperLink>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
    <!-- Featured News Slider End -->


    <!-- Category News Slider Start -->
    <div class="container-fluid">
        <div class="container">
            <div class="row">
                <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSource4" OnItemDataBound="Repeater4_ItemDataBound">
                    <ItemTemplate>
                        <div class="col-lg-6 py-3">
                            <div class="bg-light py-2 px-4 mb-3">
                                <h3 class="m-0">
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("name") %>' Font-Size="X-Large"></asp:Label></h3>
                            </div>
                            <div class="owl-carousel owl-carousel-3 carousel-item-2 position-relative">
                                <asp:Repeater ID="Repeater8" runat="server">
                                    <ItemTemplate>
                                        <div class="position-relative">
                                            <asp:Image ID="Image4" CssClass="img-fluid w-100" Style="object-fit: cover;" runat="server" ImageUrl='<%# ResolveUrl("~/Upload/Image/" + Eval("image"))%>' />
                                            <div class="overlay position-relative bg-light">
                                                <div class="mb-2" style="font-size: 13px;">
                                                    <asp:HyperLink ID="HyperLink10" runat="server" Text='<%# Eval("category_id") %>' ForeColor="Red"></asp:HyperLink>
                                                    <span class="px-1">/</span>
                                                    <asp:Label ID="Label9" runat="server" Text='<%# Eval("updated_at", "{0:hh:mm:ss - dd/MM/yyyy}") %>'></asp:Label>
                                                </div>
                                                <asp:HyperLink ID="HyperLink13" runat="server" CssClass="h4 m-0" Text='<%# Eval("name") %>' Font-Size="Large" NavigateUrl='<%# Eval("id", "~/home-view/home-single.aspx?id={0}") %>'></asp:HyperLink>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
    <!-- Category News Slider End -->


    <!-- News With Sidebar Start -->
    <div class="container-fluid py-3">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="row mb-3">
                        <div class="col-12">
                            <div class="d-flex align-items-center justify-content-between bg-light py-2 px-4 mb-3">
                                <h3 class="m-0">Nổi bật</h3>
                                <a class="text-secondary font-weight-medium text-decoration-none" href="">View All</a>
                            </div>
                        </div>
                        <div class="col-lg-12 row">
                            <asp:Repeater ID="Repeater7" runat="server" DataSourceID="SqlDataSource6">
                                <ItemTemplate>
                                    <div class="position-relative col-6">
                                        <asp:Image ID="Image2" CssClass="img-fluid w-100" Style="object-fit: cover;" runat="server" ImageUrl='<%# ResolveUrl("~/Upload/Image/" + Eval("image"))%>' />
                                        <div class="clm-6 position-relative bg-light">
                                            <div class="mb-2" style="font-size: 14px;">
                                                <asp:HyperLink ID="HyperLink8" runat="server" Text='<%# Eval("category_id") %>' ForeColor="Red" Font-Size="Large"></asp:HyperLink>
                                                <span class="px-1">/</span>
                                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("updated_at", "{0:hh:mm:ss - dd/MM/yyyy}") %>'></asp:Label>
                                            </div>
                                            <asp:HyperLink ID="HyperLink9" runat="server" CssClass="h4" Text='<%# Eval("name") %>' Font-Size="Large" NavigateUrl='<%# Eval("id", "~/home-view/home-single.aspx?id={0}") %>'></asp:HyperLink>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("title") %>'></asp:Label>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>                    
                        </div>
                        <div class="col-12 row mt-3">

                            <asp:Repeater ID="Repeater8" runat="server" DataSourceID="SqlDataSource5">
                                <ItemTemplate>
                                    <div class="d-flex col-6 mb-3">
                                        <asp:Image ID="Image3" Style="width: 100px; height: 100px;object-fit: cover;" runat="server" ImageUrl='<%# ResolveUrl("~/Upload/Image/" + Eval("image"))%>' />
                                        <div class="w-100 d-flex flex-column justify-content-center bg-light px-3" style="height: 100px;">
                                            <div class="mb-1" style="font-size: 13px;">
                                                <asp:HyperLink ID="HyperLink12" runat="server" Text='<%# Eval("category_id") %>' ForeColor="Red"></asp:HyperLink>
                                                <span class="px-1">/</span>
                                                <asp:Label ID="Label8" runat="server" Text='<%# Eval("updated_at", "{0:hh:mm:ss - dd/MM/yyyy}") %>'></asp:Label>
                                            </div>
                                            <asp:HyperLink ID="HyperLink11" runat="server" CssClass="h6 m-0 content-cell" Text='<%# Eval("name") %>' NavigateUrl='<%# Eval("id", "~/home-view/home-single.aspx?id={0}") %>' Font-Size="Medium"></asp:HyperLink>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater> 
                        </div>
                    </div>

                    <div class="mb-3 pb-3">
                        <a href=""><img class="img-fluid w-100" src="../img/ads-700x70.jpg" alt=""></a>
                    </div>

                    <div class="mb-3 row">
                        <div class="col-12">
                            <div class="d-flex align-items-center justify-content-between bg-light py-2 px-4 mb-3">
                                <h3 class="m-0">Tin mới trong ngày</h3>
                                <a class="text-secondary font-weight-medium text-decoration-none" href="">View All</a>
                            </div>
                        </div>
                        <div class="col-lg-12">                 
                            <asp:Repeater ID="Repeater5" runat="server" DataSourceID="SqlDataSource2">
                                <ItemTemplate>
                                    <div class="position-relative d-flex mb-3">
                                        <asp:Image ID="Image10" Style="width: 250px; height: auto; object-fit: cover;" runat="server" ImageUrl='<%# ResolveUrl("~/Upload/Image/" + Eval("image"))%>' />
                                        <div class="overlay position-relative bg-light">
                                            <div class="mb-2" style="font-size: 14px;">
                                                <asp:HyperLink ID="HyperLink3" runat="server" Text='<%# Eval("category_id") %>'  ForeColor="Red"></asp:HyperLink>
                                                <span class="px-1">/</span>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("updated_at", "{0:hh:mm:ss - dd/MM/yyyy}") %>'></asp:Label>
                                            </div>
                                            <asp:HyperLink ID="HyperLink4" runat="server" CssClass="h4" Text='<%# Eval("name") %>' NavigateUrl='<%# Eval("id", "~/home-view/home-single.aspx?id={0}") %>'></asp:HyperLink>
                                            <asp:Label ID="Label4" runat="server" CssClass="m-0" Text='<%# Eval("title") %>'></asp:Label>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 pt-3 pt-lg-0">
                    <!-- Social Follow Start -->
                    <div class="pb-3">
                        <div class="bg-light py-2 px-4 mb-3">
                            <h3 class="m-0">Theo dõi chúng tôi</h3>
                        </div>
                        <div class="d-flex mb-3">
                            <a href="" class="d-block w-50 py-2 px-3 text-white text-decoration-none mr-2" style="background: #39569E;">
                                <small class="fab fa-facebook-f mr-2"></small><small>12,345 Fans</small>
                            </a>
                            <a href="" class="d-block w-50 py-2 px-3 text-white text-decoration-none ml-2" style="background: #52AAF4;">
                                <small class="fab fa-twitter mr-2"></small><small>12,345 Followers</small>
                            </a>
                        </div>
                        <div class="d-flex mb-3">
                            <a href="" class="d-block w-50 py-2 px-3 text-white text-decoration-none mr-2" style="background: #0185AE;">
                                <small class="fab fa-linkedin-in mr-2"></small><small>12,345 Connects</small>
                            </a>
                            <a href="" class="d-block w-50 py-2 px-3 text-white text-decoration-none ml-2" style="background: #C8359D;">
                                <small class="fab fa-instagram mr-2"></small><small>12,345 Followers</small>
                            </a>
                        </div>
                        <div class="d-flex mb-3">
                            <a href="" class="d-block w-50 py-2 px-3 text-white text-decoration-none mr-2" style="background: #DC472E;">
                                <small class="fab fa-youtube mr-2"></small><small>12,345 Subscribers</small>
                            </a>
                            <a href="" class="d-block w-50 py-2 px-3 text-white text-decoration-none ml-2" style="background: #1AB7EA;">
                                <small class="fab fa-vimeo-v mr-2"></small><small>12,345 Followers</small>
                            </a>
                        </div>
                    </div>
                    <!-- Social Follow End -->

                    <!-- Newsletter Start -->
                    <div class="pb-3">
                        <div class="bg-light py-2 px-4 mb-3">
                            <h3 class="m-0">Đăng ký</h3>
                        </div>
                        <div class="bg-light text-center p-4 mb-3">
                            <p>Đăng ký để nhận được thông báo về bảng tin mới nhất mà bạn hay theo dõi</p>
                            <div class="input-group" style="width: 100%;">
                                <input type="text" class="form-control form-control-lg" placeholder="Email của bạn">
                                <div class="input-group-append">
                                    <button class="btn btn-primary">Đăng ký</button>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                    <!-- Newsletter End -->

                    <!-- Ads Start -->
                    <div class="mb-3 pb-3">
                        <a href=""><img class="img-fluid" src="../img/news-500x280-4.jpg" alt=""></a>
                    </div>
                    <!-- Ads End -->

                    <!-- Popular News Start -->
                    <div class="pb-3">
                        <div class="bg-light py-2 px-4 mb-3">
                            <h3 class="m-0">Xem nhiều</h3>
                        </div>
                        <asp:Repeater ID="Repeater6" runat="server" DataSourceID="SqlDataSource5">
                            <ItemTemplate>
                                    <div class="d-flex mb-3">
                                        <asp:Image ID="Image1" Style="width: 100px; height: 100px; object-fit: cover;" runat="server" ImageUrl='<%# ResolveUrl("~/Upload/Image/" + Eval("image"))%>' />
                                        <div class="w-100 d-flex flex-column justify-content-center bg-light px-3" style="height: 100px;">
                                            <div class="mb-1" style="font-size: 13px;">
                                                <asp:HyperLink ID="HyperLink6" runat="server" Text='<%# Eval("category_id") %>'  ForeColor="Red"></asp:HyperLink>
                                                <span class="px-1">/</span>
                                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("updated_at", "{0:hh:mm:ss - dd/MM/yyyy}") %>'></asp:Label>
                                            </div>
                                            <asp:HyperLink ID="HyperLink7" runat="server" CssClass="h6 m-0" Text='<%# Eval("name") %>' NavigateUrl='<%# Eval("id", "~/home-view/home-single.aspx?id={0}") %>'></asp:HyperLink>
                                        </div>
                                    </div>
                            </ItemTemplate>
                        </asp:Repeater>

                    </div>
                    <!-- Popular News End -->

                    <!-- Tags Start -->
                    <div class="pb-3">
                        <div class="bg-light py-2 px-4 mb-3">
                            <h3 class="m-0">Lĩnh vực</h3>
                        </div>
                        <div class="d-flex flex-wrap m-n1">
                            <asp:Repeater ID="Repeater9" runat="server" DataSourceID="SqlDataSource1">
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink1" CssClass="btn btn-sm btn-outline-secondary m-1" runat="server" Name="Name" Text='<%# Eval("Name") %>' NavigateUrl='<%# Eval("id", "~/home-view/home-category.aspx?id={0}") %>'></asp:HyperLink>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                    <!-- Tags End -->
                </div>
            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Pixel_AdminConnectionString5 %>" SelectCommand="select * from [Category]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Pixel_AdminConnectionString5 %>" SelectCommand="select [Blog].id, [Blog].name, [Blog].title, [Blog].description, [Category].name as category_id, [Blog].updated_at,[Blog].image FROM [Blog] INNER JOIN [Category] ON [Blog].category_id = [Category].id ORDER BY [updated_at] DESC"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Pixel_AdminConnectionString5 %>" SelectCommand="select top 4 [Blog].id, [Blog].name, [Blog].title, [Blog].description, [Category].name as category_id, [Blog].updated_at,[Blog].image FROM [Blog] INNER JOIN [Category] ON [Blog].category_id = [Category].id ORDER BY [updated_at] DESC"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Pixel_AdminConnectionString5 %>" SelectCommand="SELECT TOP 4 * FROM Category ORDER BY NEWID()"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:Pixel_AdminConnectionString5 %>" SelectCommand="select top 6 [Blog].id, [Blog].name, [Blog].title, [Blog].description, [Category].name as category_id, [Blog].updated_at,[Blog].image FROM [Blog] INNER JOIN [Category] ON [Blog].category_id = [Category].id ORDER BY NEWID()"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:Pixel_AdminConnectionString5 %>" SelectCommand="select top 2 [Blog].id, [Blog].name, [Blog].title, [Blog].description, [Category].name as category_id, [Blog].updated_at,[Blog].image FROM [Blog] INNER JOIN [Category] ON [Blog].category_id = [Category].id ORDER BY NEWID()"></asp:SqlDataSource>
    <%--<asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:Pixel_AdminConnectionString5 %>"
    SelectCommand="SELECT TOP 6 [Blog].id, [Blog].name, [Blog].title, [Blog].description, [Category].name AS category_id, [Blog].updated_at, [Blog].image
                   FROM [Blog] INNER JOIN [Category] ON [Blog].category_id = [Category].id
                   ORDER BY NEWID()">
    </asp:SqlDataSource>--%>
    <!-- News With Sidebar End -->
</asp:Content>

