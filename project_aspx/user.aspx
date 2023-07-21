<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="user.aspx.cs" Inherits="Contact" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
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
                    <a href="user-add.aspx" class="btn btn-sm btn-success">Thêm mới</a>
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
                                    <asp:BoundField DataField="id" HeaderText="Mã số" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                    <asp:BoundField DataField="fullname" HeaderText="Họ tên" SortExpression="fullname" />
                                    <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                                    <asp:BoundField DataField="password" HeaderText="Mật khẩu" SortExpression="password" />
                                    <asp:BoundField DataField="address" HeaderText="Địa chỉ" SortExpression="address" />
                                    <asp:BoundField DataField="role_id" HeaderText="Quyền" SortExpression="role_id" />
                                    <asp:TemplateField HeaderText="Ảnh đại diện">
                                        <ItemTemplate>
                                            <asp:Image CssClass="avartar" ID="imgAvatar" runat="server" ImageUrl='<%# ResolveUrl("~/Upload/Avartar/" + Eval("avartar"))%>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Thao tác">
                                        <ItemTemplate>
                                             <asp:Button ID="btnUpdateUser" CssClass="btn btn-sm btn-primary mb-2" runat="server" Text="Sửa" OnClick="btnUpdateUse_Click" CommandArgument='<%# Eval("id") %>'  />
                                            <asp:Button ID="btnDelete" runat="server" Text="Xóa" CssClass="btnbtn btn-sm btn-danger" OnClick="btnDelete_Click" CommandArgument='<%# Eval("id") %>'  />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Pixel_Admin %>" DeleteCommand="DELETE FROM [User] WHERE [id] = @id" InsertCommand="INSERT INTO [User] ([fullname], [email], [password], [address], [role_id], [avartar], [deleted], [created_at], [updated_at]) VALUES (@fullname, @email, @password, @address, @role_id, @avartar, @deleted, @created_at, @updated_at)" SelectCommand="SELECT [User].id, [User].fullname, [User].email, [User].password, [User].address, Role.name as role_id, [User].avartar FROM [User] INNER JOIN Role ON [User].role_id = Role.id" UpdateCommand="UPDATE [User] SET [fullname] = @fullname, [email] = @email, [password] = @password, [address] = @address, [role_id] = @role_id, [avartar] = @avartar, [deleted] = @deleted, [created_at] = @created_at, [updated_at] = @updated_at WHERE [id] = @id">
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
