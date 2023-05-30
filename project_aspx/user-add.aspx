<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="user-add.aspx.cs" Inherits="user_add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row bg-title">
                    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                        <h4 class="page-title">Thêm người dùng mới</h4>
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
                                    <label class="col-md-12">Tên người dùng</label>
                                    <div class="col-md-12">
                                        <asp:TextBox ID="txtUserName" runat="server" placeholder="Tên người dùng" CssClass="form-control form-control-line"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Email</label>
                                    <div class="col-md-12">
                                        <asp:TextBox type="text" ID="txtEmail" runat="server" placeholder="Email" CssClass="form-control form-control-line"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Mật khẩu</label>
                                    <div class="col-md-12">
                                        <asp:TextBox type="password" ID="txtPW" runat="server" placeholder="Mật khẩu" CssClass="form-control form-control-line"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Địa chỉ</label>
                                    <div class="col-md-12">
                                        <asp:TextBox type="text" ID="txtAddress" runat="server" placeholder="Địa chỉ" CssClass="form-control form-control-line"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Vai trò</label>
                                    <div class="col-md-12">
                                        <asp:DropDownList type="text" ID="cboRoleId" runat="server" placeholder="Vai trò" CssClass="form-control form-control-line" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="id"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Pixel_AdminConnectionString6 %>" SelectCommand="SELECT * FROM [Role]">
                                        </asp:SqlDataSource>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">hình ảnh</label>
                                    <div class="col-md-12">
                                        <asp:FileUpload ID="FileUpload1" runat="server" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <asp:Button ID="btnSubmit" runat="server" Text="Thêm" CssClass="btn btn-success" />
                                        <a href="user.aspx" class="btn btn-primary">Quay lại</a>
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

