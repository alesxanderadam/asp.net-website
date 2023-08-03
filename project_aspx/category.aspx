<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="category.aspx.cs" Inherits="blogview_category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
     <!-- Page Content -->
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row bg-title">
                <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                    <h4 class="page-title">Danh sách danh mục</h4>
                </div>
                <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12 text-right">
                    <a href="category-add.aspx" class="btn btn-sm btn-success">Thêm mới</a>
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
                                    <asp:BoundField DataField="name" HeaderText="Tên danh mục" SortExpression="name" />
                                    <asp:TemplateField HeaderText="Thao tác">
                                        <ItemTemplate>
                                            <asp:Button CssClass="btn btn-sm btn-primary" runat="server" Text="Sửa" OnClick="Unnamed_Click" CommandArgument='<%# Eval("id") %>'  />
                                            <asp:Button ID="btnDelete" runat="server" Text="Xóa" CssClass="btnbtn btn-sm btn-danger" OnClick="btnDelete_Click" CommandArgument='<%# Eval("id") %>'  />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Pixel_AdminConnectionString %>" DeleteCommand="DELETE FROM [Category] WHERE [id] = @id" InsertCommand="INSERT INTO [Category] ([name], [created_at], [updated_at]) VALUES (@name, @created_at, @updated_at)" SelectCommand="SELECT * FROM [Category]" UpdateCommand="UPDATE [Category] SET [name] = @name, [created_at] = @created_at, [updated_at] = @updated_at WHERE [id] = @id">
                                <DeleteParameters>
                                    <asp:Parameter Name="id" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="name" Type="String" />
                                    <asp:Parameter Name="created_at" Type="DateTime" />
                                    <asp:Parameter Name="updated_at" Type="DateTime" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="name" Type="String" />
                                    <asp:Parameter Name="created_at" Type="DateTime" />
                                    <asp:Parameter Name="updated_at" Type="DateTime" />
                                    <asp:Parameter Name="id" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
</asp:Content>

