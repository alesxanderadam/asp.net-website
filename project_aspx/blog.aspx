<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="blog.aspx.cs" Inherits="blog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <style>
    
    .content-cell {
        max-height: 40px; 
        max-width:400px;
        overflow: hidden;
        white-space: nowrap;
        text-overflow: ellipsis;
    }

   
    .avatar-img {
        max-width: 50px; 
        max-height: 50px;
    }
</style>

    <!-- Page Content -->
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row bg-title">
                <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                    <h4 class="page-title">Danh sách bài viết</h4>
                </div>
                <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12 text-right">
                    <a href="blog-add.aspx" class="btn btn-sm btn-success">Thêm mới</a>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /row -->
            <div class="row">
                <div class="col-sm-12">
                    <div class="white-box">
                        <div class="table-responsive">
                            <asp:GridView ID="GridView2" runat="server" CssClass="table" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource2">
                                <Columns>
                                    <asp:BoundField DataField="id" HeaderText="Mã số" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                    <asp:BoundField DataField="name" HeaderText="Tên bài viết" SortExpression="name" />
                                    <asp:BoundField DataField="name" HeaderText="Tiêu đề tóm tắt" SortExpression="name" />
                                    <asp:BoundField DataField="description" HeaderText="Nội dung bài viết" SortExpression="name" ItemStyle-CssClass="content-cell"/>
                                    <asp:BoundField DataField="category_id" HeaderText="Danh mục bài viết" SortExpression="name" />
                                    <asp:TemplateField HeaderText="Ảnh bài viết">
                                        <ItemTemplate>
                                            <asp:Image CssClass="avatar-img" ID="imgAvatar" runat="server" ImageUrl='<%# ResolveUrl("~/Upload/Image/" + Eval("image"))%>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Thao tác">
                                        <ItemTemplate>
                                            <asp:Button CssClass="btn btn-sm btn-primary" runat="server" Text="Sửa" OnClick="Unnamed_Click" CommandArgument='<%# Eval("id") %>'  />
                                            <asp:Button ID="btnDelete" runat="server" Text="Xóa" CssClass="btnbtn btn-sm btn-danger" OnClick="btnDelete_Click" CommandArgument='<%# Eval("id") %>'  />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Pixel_AdminConnectionString %>" SelectCommand="select [Blog].id, [Blog].name, [Blog].description, [Category].name as category_id, [Blog].updated_at, [Blog].image FROM [Blog] INNER JOIN [Category] ON [Blog].category_id = [Category].id">
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
</asp:Content>

