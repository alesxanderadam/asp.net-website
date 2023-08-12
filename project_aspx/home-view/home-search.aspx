<%@ Page Title="" Language="C#" MasterPageFile="~/home-view/Home.master" AutoEventWireup="true" CodeFile="home-search.aspx.cs" Inherits="home_view_home_search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- Breadcrumb Start -->
    <div class="container-fluid">
        <div class="container">
            <nav class="breadcrumb bg-transparent m-0 p-0">
                <a class="breadcrumb-item" href="home.aspx">Home</a>
                <span class="breadcrumb-item active">Search</span>
            </nav>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <div class="container-fluid py-3">
        <div class="container">
            <div class="row ml-1 mb-3">
                <div class="contact-form bg-light col-lg-8 mb-3" style="padding: 30px;">
                    <form name="sentMessage" id="contactForm" novalidate="novalidate">
                        <div class="form-row">
                            <div class="col-md-5">
                                <div class="control-group">
                                    <label class="h5 px-1">Tìm kiếm :</label>
                                    <asp:TextBox ID="txtSearch" runat="server" placeholder="Tên nội dung bạn cần tìm" CssClass="form-control p4" ClientIDMode="Static">
                                    </asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-1">
                                <div class="control-group mt-4 py-2" style="position:relative; right:10px;">
                                    <asp:Button ID="Button1" runat="server" type="button" CssClass="button-with-icon input-group-text text-secondary w-100" Height="38px" ViewStateMode="Disabled" OnClick="Button1_Click"> </asp:Button>
                                </div>
                            </div>
                            <div class="col-md-4 ml-5">
                                <div class="control-group">
                                    <label class="h5 px-1">Lĩnh vực :</label>
                                    <asp:DropDownList
                                        CssClass="form-control form-control-line"
                                        ID="DDLCateId"
                                        runat="server"
                                        DataSourceID="DataSourceRole"
                                        DataTextField="name"
                                        DataValueField="id">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="DataSourceRole" runat="server" ConnectionString="<%$ ConnectionStrings:Pixel_AdminConnectionString %>" SelectCommand="SELECT [id], [name] FROM [Category]"></asp:SqlDataSource>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <div class="mb-3 row">
                <div class="col-lg-8">
                    <div class="d-flex align-items-center justify-content-between bg-light py-2 px-4 mb-3">
                        <h3 class="m-0">Kết quả tìm kiếm</h3>
                    </div>
                </div>
                <div class="col-lg-8">

                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource2">
                        <LayoutTemplate>
                            <div class="row">
                                <asp:PlaceHolder runat="server" ID="itemPlaceholder" />
                            </div>
                            <div class="col-lg-12">
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
                            <div class="position-relative col-lg-12 d-flex mb-3">
                                <asp:Image ID="Image10" Style="width: 250px; height: auto; object-fit: cover;" runat="server" ImageUrl='<%# ResolveUrl("~/Upload/Image/" + Eval("image"))%>' />
                                <div class="overlay position-relative bg-light">
                                    <div class="mb-2" style="font-size: 14px;">
                                        <asp:HyperLink ID="HyperLink3" runat="server" Text='<%# Eval("category_id") %>' ForeColor="Red"></asp:HyperLink>
                                        <span class="px-1">/</span>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("updated_at", "{0:hh:mm:ss - dd/MM/yyyy}") %>'></asp:Label>
                                    </div>
                                    <asp:HyperLink ID="HyperLink4" runat="server" CssClass="h4" Text='<%# Eval("name") %>' NavigateUrl='<%# Eval("id", "~/home-view/home-single.aspx?id={0}") %>'></asp:HyperLink>
                                    <asp:Label ID="Label4" runat="server" CssClass="m-0" Text='<%# Eval("title") %>'></asp:Label>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                </div>
            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Pixel_AdminConnectionString5 %>" SelectCommand="select top 4 [Blog].id, [Blog].name, [Blog].title, [Blog].description, [Category].name as category_id, [Blog].updated_at,[Blog].image FROM [Blog] INNER JOIN [Category] ON [Blog].category_id = [Category].id WHERE [Blog].name LIKE '%' +@Search+ '%' ORDER BY [updated_at] DESC">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtSearch" Name="Search" PropertyName="Text" DefaultValue="" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

