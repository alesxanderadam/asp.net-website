<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="project-update.aspx.cs" Inherits="project_update" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
     <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row bg-title">
                    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                        <h4 class="page-title">Chỉnh sửa dự án</h4>
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
                                    <label class="col-md-12">Tên dự án</label>
                                    <div class="col-md-12">
                                        <asp:TextBox ID="txtPrjName" runat="server" placeholder="Tên dự án" CssClass="form-control form-control-line"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Mô tả</label>
                                    <div class="col-md-12">
                                        <asp:TextBox type="text" ID="txtDesc" runat="server" placeholder="Mô tả" CssClass="form-control form-control-line"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <asp:Button ID="btnUpdate" runat="server" Text="Sửa" CssClass="btn btn-success" OnClick="btnUpdate_Click" />
                                        <a href="role.aspx" class="btn btn-primary">Quay lại</a>
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

