<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="user-add.aspx.cs" Inherits="user_add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <!-- Page Content -->
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row bg-title">
                <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                    <h4 class="page-title">Thêm mới thành viên</h4>
                </div>
            </div>
            <!-- /.row -->
            <!-- .row -->
            <div class="row">
                <div class="col-md-2 col-12"></div>
                <div class="col-md-8 col-xs-12">
                    <div class="white-box">
                        <div class="form-horizontal form-material">
                            <div class="form-group">
                                <label class="col-md-12">Họ tên</label>
                                <div class="col-md-12">
                                    <asp:TextBox ID="txtFullName" runat="server" placeholder="Jonhat" CssClass="form-control form-control-line"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="example-email" class="col-md-12">Email</label>
                                <div class="col-md-12">
                                    <asp:TextBox type="email" placeholder="johnathan@admin.com" ID="txtEmail" runat="server" CssClass="form-control form-control-line"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-12">Mật khẩu</label>
                                <div class="col-md-12">
                                    <asp:TextBox type="password" ID="txtPassword" runat="server" CssClass="form-control form-control-line"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-12">Địa chỉ</label>
                                <div class="col-md-12">
                                    <asp:TextBox type="text" placeholder="41/2 Los Angeles" ID="txtAddress" runat="server" CssClass="form-control form-control-line"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-12">Quyền</label>
                                <div class="col-sm-12">
                                    <asp:DropDownList
                                        CssClass="form-control form-control-line"
                                        ID="DDLRole"
                                        runat="server"
                                        DataSourceID="DataSourceRole"
                                        DataTextField="name"
                                        DataValueField="id">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="DataSourceRole" runat="server" ConnectionString="<%$ ConnectionStrings:Pixel_Admin %>" SelectCommand="SELECT [id], [name] FROM [Role]"></asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-12">Hình ảnh</label>
                                <div class="col-md-12">
                                    <asp:FileUpload ID="FileUploadAvartar" runat="server" CssClass="form-control form-control-line" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <asp:Button Id="btnAddUser" runat="server" CssClass="btn btn-success" Text="Thêm mới" OnClick="btnAddUser_Click" />
                                    <a href="user-table.html" class="btn btn-primary">Quay lại</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-2 col-12"></div>
        </div>
        <!-- /.row -->
    </div>
    <!-- /.container-fluid -->
</asp:Content>

