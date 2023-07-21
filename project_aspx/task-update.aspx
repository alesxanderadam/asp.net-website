<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="task-update.aspx.cs" Inherits="task_update" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row bg-title">
                    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                        <h4 class="page-title">Chỉnh sửa công việc</h4>
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
                                    <label class="col-md-12">Tên công việc</label>
                                    <div class="col-md-12">
                                        <asp:TextBox ID="txtTaskName" runat="server" placeholder="Tên công việc" CssClass="form-control form-control-line"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Tên người dùng</label>
                                    <div class="col-md-12">
                                        <asp:DropDownList type="text" ID="cboUserName" runat="server" placeholder="Nhập tên người dùng" CssClass="form-control form-control-line" DataSourceID="SqlDataSource1" DataTextField="fullname" DataValueField="id"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Pixel_Admin %>"  SelectCommand="SELECT * FROM [User]">
                                        </asp:SqlDataSource>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Tên dự án</label>
                                    <div class="col-md-12">
                                        <asp:DropDownList type="text" ID="cboPrjName" runat="server" placeholder="Nhập tên dự án" CssClass="form-control form-control-line" DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="id"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Pixel_Admin %>" SelectCommand="SELECT * FROM [Project]"></asp:SqlDataSource>
                                    </div>
                                </div>
                                <%--<div class="form-group">
                                    <label class="col-md-12">Trạng thái</label>
                                    <div class="col-md-12" style="left: 0px; top: 0px">
                                        <asp:DropDownList type="text" ID="cboStatus" runat="server" placeholder="Trạng thái" CssClass="form-control form-control-line">
                                            <asp:ListItem Selected="True" Value="0">Chưa hoàn thành</asp:ListItem>
                                            <asp:ListItem Value="1">Đã hoàn thành</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>--%>
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <asp:Button ID="btnUpdate" runat="server" Text="Sửa" CssClass="btn btn-success" OnClick="btnUpdate_Click" />
                                        <a href="task.aspx" class="btn btn-primary">Quay lại</a>
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

