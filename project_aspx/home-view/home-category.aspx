<%@ Page Title="" Language="C#" MasterPageFile="~/home-view/Home.master" AutoEventWireup="true" CodeFile="home-category.aspx.cs" Inherits="home_view_home_category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:DataList ID="DataList1" runat="server" DataKeyField="id" DataSourceID="SqlDataSource2" Width="1500px">
        <ItemTemplate>
            <!-- Breadcrumb Start -->
            <div class="container-fluid">
                <div class="container">
                    <nav class="breadcrumb bg-transparent m-0 p-0">
                        <a class="breadcrumb-item" href="home.aspx">Home</a>
                        <a class="breadcrumb-item" href="#">Danh mục</a>
                        <asp:Label ID="Label5" runat="server" CssClass="breadcrumb-item active" Text='<%# Eval("category_id") %>'></asp:Label>
                    </nav>
                </div>
            </div>
            <!-- Breadcrumb End -->
        </ItemTemplate>
    </asp:DataList>
            <!-- News With Sidebar Start -->
            <div class="container-fluid py-3">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8">
                            <div class="row">
                                <div class="col-12">
                                    <div class="d-flex align-items-center justify-content-between bg-light py-2 px-4 mb-3">
                                        <asp:DataList ID="DataList3" runat="server" DataKeyField="id" DataSourceID="SqlDataSource2" Width="1500px">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" CssClass="m-0" Text='<%# Eval("category_id") %>' Font-Bold="true" Font-Size="X-Large"></asp:Label>
                                            </ItemTemplate>
                                        </asp:DataList>                             
                                    </div>
                                </div>
                                <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource4">
                                    <ItemTemplate>
                                        <div class="col-lg-6">
                                            <div class="position-relative mb-3">
                                                <asp:Image ID="Image2" CssClass="img-fluid w-100" Style="object-fit: cover;" runat="server" ImageUrl='<%# ResolveUrl("~/Upload/Image/" + Eval("image"))%>' />
                                                <div class="overlay position-relative bg-light">
                                                    <div class="mb-2" style="font-size: 14px;">
                                                        <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource1">
                                                            <ItemTemplate>
                                                                <asp:HyperLink ID="HyperLink2" runat="server" Text='<%# Eval("name") %>' ForeColor="Red" NavigateUrl='<%# Eval("id", "~/home-view/home-category.aspx?id={0}") %>'></asp:HyperLink>
                                                            </ItemTemplate>
                                                        </asp:ListView>
                                                        <span class="px-1">/</span>
                                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("updated_at", "{0:hh:mm:ss - dd/MM/yyyy}") %>'></asp:Label>
                                                    </div>    
                                                    <asp:HyperLink ID="HyperLink3" runat="server" CssClass="h4" Text='<%# Eval("name") %>' NavigateUrl='<%# Eval("id", "~/home-view/home-single.aspx?id={0}") %>'></asp:HyperLink>
                                                    <asp:Label ID="Label4" runat="server" CssClass="m-0" Text='<%# Eval("title") %>'></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                            <div class="mb-3">
                                <a href=""><img class="img-fluid w-100" src="../Upload/Image/ŠMX-Sansale-desk-1200x120.png" alt=""></a>
                            </div>
                             <div class="row">
                                 <div class="col-md-12">
                                    <asp:ListView ID="ListView1" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource3">
                                        <LayoutTemplate>
                                            <div class="row">
                                                <asp:PlaceHolder runat="server" ID="itemPlaceholder" />
                                            </div>
                                            <div class="col-12">
                                                <nav aria-label="Page navigation">
                                                    <ul class="pagination justify-content-center">
                                                        <asp:DataPager ID="DataPager1" runat="server" PageSize="6" PagedControlID="ListView1" Class="pagination justify-content-center">
                                                            <Fields>
                                                                <asp:NextPreviousPagerField ShowFirstPageButton="false" ShowPreviousPageButton="true" ShowNextPageButton="false" ShowLastPageButton="false" ButtonType="Link" NextPageText="" PreviousPageText="" ButtonCssClass="fa fa-angle-double-left page-item page-link" />
                                                                <asp:NumericPagerField ButtonType="Link" CurrentPageLabelCssClass="page-item acti page-link font-weight-bold " NumericButtonCssClass="page-item page-link font-weight-bold" NextPreviousButtonCssClass="page-item" />
                                                                <asp:NextPreviousPagerField ShowFirstPageButton="false" ShowPreviousPageButton="false" ShowNextPageButton="true" ShowLastPageButton="false" ButtonType="Link" NextPageText="" PreviousPageText="" ButtonCssClass="fa fa-angle-double-right page-item page-link" />
                                                            </Fields>
                                                        </asp:DataPager>
                                                    </ul>
                                                </nav>
                                                
                                            </div>
                                        </LayoutTemplate>
                                        <ItemTemplate>
                                            <div class="col-lg-6">
                                                <div class="d-flex mb-3">
                                                    <asp:Image ID="Image2" Style="width: 100px; height: 100px; object-fit: cover;" runat="server" ImageUrl='<%# ResolveUrl("~/Upload/Image/" + Eval("image"))%>' />
                                                    <div class="w-100 d-flex flex-column justify-content-center bg-light px-3" style="height: 100px;">
                                                        <div class="mb-1" style="font-size: 13px;">
                                                            <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource1">
                                                                <ItemTemplate>
                                                                    <asp:HyperLink ID="HyperLink2" runat="server" Text='<%# Eval("name") %>' ForeColor="Red" NavigateUrl='<%# Eval("id", "~/home-view/home-category.aspx?id={0}") %>'></asp:HyperLink>
                                                                </ItemTemplate>
                                                            </asp:ListView>
                                                            <span class="px-1">/</span>
                                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("updated_at", "{0:hh:mm:ss - dd/MM/yyyy}") %>'></asp:Label>
                                                        </div>
                                                        <asp:HyperLink ID="HyperLink3" runat="server" CssClass="h6 m-0 content-cell" Text='<%# Eval("name") %>' NavigateUrl='<%# Eval("id", "~/home-view/home-single.aspx?id={0}") %>'></asp:HyperLink>
                                                    </div>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:ListView>
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
                                    <small>Sit eirmod nonumy kasd eirmod</small>
                                </div>
                            </div>
                            <!-- Newsletter End -->

                            <!-- Ads Start -->
                            <div class="mb-3 pb-3">
                                <a href="">
                                    <img class="img-fluid" src="../img/news-500x280-4.jpg" alt=""></a>
                            </div>
                            <!-- Ads End -->

                            <!-- Popular News Start -->
                            <div class="pb-3">
                                <div class="bg-light py-2 px-4 mb-3">
                                    <h3 class="m-0">Nổi bật</h3>
                                </div>
                                <asp:Repeater ID="Repeater6" runat="server" DataSourceID="SqlDataSource5">
                                    <ItemTemplate>
                                        <div class="d-flex mb-3">
                                            <asp:Image ID="Image1" Style="width: 100px; height: 100px; object-fit: cover;" runat="server" ImageUrl='<%# ResolveUrl("~/Upload/Image/" + Eval("image"))%>' />
                                            <div class="w-100 d-flex flex-column justify-content-center bg-light px-3" style="height: 100px;">
                                                <div class="mb-1" style="font-size: 13px;">
                                                    <asp:HyperLink ID="HyperLink6" runat="server" Text='<%# Eval("category_id") %>' ForeColor="Red"></asp:HyperLink>
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
                                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource6">
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
            <!-- News With Sidebar End -->

            <!-- Back to Top -->
            <a href="#" class="btn btn-dark back-to-top"><i class="fa fa-angle-up"></i></a>
        
   
    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:Pixel_AdminConnectionString2 %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Pixel_AdminConnectionString3 %>" SelectCommand="select top 1 [Blog].id, [Blog].name, [Blog].title, [Blog].description, [Category].name as category_id, [Blog].updated_at,[Blog].image FROM [Blog] INNER JOIN [Category] ON [Blog].category_id = [Category].id WHERE ([Blog].category_id = @id)">
        <SelectParameters>
            <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Pixel_AdminConnectionString3 %>" SelectCommand="select [Blog].id, [Blog].name, [Blog].title, [Blog].description, [Category].name as category_id, [Blog].updated_at,[Blog].image FROM [Blog] INNER JOIN [Category] ON [Blog].category_id = [Category].id WHERE ([Blog].category_id = @id) ORDER BY NEWID()">
        <SelectParameters>
            <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Pixel_AdminConnectionString3 %>" SelectCommand="select top 4 [Blog].id, [Blog].name, [Blog].title, [Blog].description, [Category].name as category_id, [Blog].updated_at,[Blog].image FROM [Blog] INNER JOIN [Category] ON [Blog].category_id = [Category].id WHERE ([Blog].category_id = @id) ORDER BY [updated_at] DESC">
        <SelectParameters>
            <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:Pixel_AdminConnectionString5 %>" SelectCommand="select top 6 [Blog].id, [Blog].name, [Blog].image, [Category].name as category_id, [Blog].updated_at FROM [Blog] INNER JOIN [Category] ON [Blog].category_id = [Category].id ORDER BY NEWID()"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Pixel_AdminConnectionString3 %>" SelectCommand="select * from [Category] WHERE ([Category].id = @id)">
        <SelectParameters>
            <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

