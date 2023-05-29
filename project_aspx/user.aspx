<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="user.aspx.cs" Inherits="Contact" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">\
    
    <style>
    .avartar{
        width: 50px;
        height: 50px;
        border-radius: 100rem;
    }
</style>
    <!-- Page Content -->
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row bg-title">
                <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                    <h4 class="page-title">Danh sách thành viên</h4>
                </div>
                <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12 text-right">
                    <a href="" class="btn btn-sm btn-success">Thêm mới</a>
                </div>

                <!-- /.col-lg-12 -->
            </div>
            <!-- /row -->
            <div class="row">
                <div class="col-sm-12">
                    <div class="white-box">
                        <div class="table-responsive">
                            <asp:GridView ID="exampleGridView" runat="server" CssClass="table" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1">
                                <Columns>
                                    <asp:BoundField DataField="id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                    <asp:BoundField DataField="fullname" HeaderText="Fullname" SortExpression="fullname" />
                                    <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                                    <asp:BoundField DataField="password" HeaderText="Password" SortExpression="password" />
                                    <asp:BoundField DataField="address" HeaderText="Address" SortExpression="address" />
                                    <asp:BoundField DataField="role_id" HeaderText="Role" SortExpression="role_id" />
                                    <asp:TemplateField HeaderText="Avartar">
                                        <ItemTemplate>
                                            <asp:Image CssClass="avartar" ID="imgAvatar" runat="server" ImageUrl='<%# Eval("avartar") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Pixel_AdminConnectionString %>" DeleteCommand="DELETE FROM [User] WHERE [id] = @id" InsertCommand="INSERT INTO [User] ([fullname], [email], [password], [address], [role_id], [avartar], [created_at], [updated_at], [deleted]) VALUES (@fullname, @email, @password, @address, @role_id, @avartar, @created_at, @updated_at, @deleted)" SelectCommand="SELECT [User].id, [User].fullname, [User].email, [User].password, [User].address, Role.name as role_id, [User].avartar FROM [User] INNER JOIN Role ON [User].role_id = Role.id" UpdateCommand="UPDATE [User] SET [fullname] = @fullname, [email] = @email, [password] = @password, [address] = @address, [role_id] = @role_id, [avartar] = @avartar, [created_at] = @created_at, [updated_at] = @updated_at, [deleted] = @deleted WHERE [id] = @id">
                                <DeleteParameters>
                                    <asp:Parameter Name="id" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="fullname" Type="String" />
                                    <asp:Parameter Name="email" Type="String" />
                                    <asp:Parameter Name="password" Type="String" />
                                    <asp:Parameter Name="address" Type="String" />
                                    <asp:Parameter Name="role_id" Type="Int32" />
                                    <asp:Parameter Name="avartar" Type="String" />
                                    <asp:Parameter Name="created_at" Type="DateTime" />
                                    <asp:Parameter Name="updated_at" Type="DateTime" />
                                    <asp:Parameter Name="deleted" Type="Int32" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="fullname" Type="String" />
                                    <asp:Parameter Name="email" Type="String" />
                                    <asp:Parameter Name="password" Type="String" />
                                    <asp:Parameter Name="address" Type="String" />
                                    <asp:Parameter Name="role_id" Type="Int32" />
                                    <asp:Parameter Name="avartar" Type="String" />
                                    <asp:Parameter Name="created_at" Type="DateTime" />
                                    <asp:Parameter Name="updated_at" Type="DateTime" />
                                    <asp:Parameter Name="deleted" Type="Int32" />
                                    <asp:Parameter Name="id" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.row -->
        </div>
    </div>
        <!-- /.container-fluid -->
</asp:Content>
