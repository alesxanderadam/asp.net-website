<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="task-add.aspx.cs" Inherits="task_add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row bg-title">
                    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                        <h4 class="page-title">Thêm mới công việc</h4>
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
                                        <asp:Textbox ID="txtTaskName" runat="server" placeholder="Tên quyền" CssClass="form-control form-control-line"></asp:Textbox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Tên nhân viên</label>
                                    <div class="col-md-12">
                                        <asp:DropDownList type="text" ID="cboUserName" runat="server" placeholder="Tên nhân viên" CssClass="form-control form-control-line" DataSourceID="SqlDataSource2" DataTextField="fullname" DataValueField="role_id" AutoPostBack="True"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Pixel_AdminConnectionString3 %>" SelectCommand="SELECT * FROM [User]"></asp:SqlDataSource>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Tên dự án</label>
                                    <div class="col-md-12">
                                        <asp:DropDownList type="text" ID="cboPrjName" runat="server" placeholder="Tên dự án" CssClass="form-control form-control-line" DataSourceID="SqlDataSource3" DataTextField="name" DataValueField="id"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Pixel_AdminConnectionString4 %>" SelectCommand="SELECT * FROM [Project]"></asp:SqlDataSource>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Trạng thái</label>
                                    <div class="col-md-12">
                                        <asp:DropDownList type="text" ID="cboStatus" runat="server" placeholder="Trạng thái" CssClass="form-control form-control-line" DataSourceID="SqlDataSource1" DataTextField="status" DataValueField="status"></asp:DropDownList>
                                    </div>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Pixel_AdminConnectionString4 %>" SelectCommand="SELECT * FROM [Task]">
                                        </asp:SqlDataSource>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <asp:Button ID="btnSubmit" runat="server" Text="Thêm" CssClass="btn btn-success" OnClick="btnSubmit_Click" />
                                        <a href="Task.aspx" class="btn btn-primary">Quay lại</a>
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

