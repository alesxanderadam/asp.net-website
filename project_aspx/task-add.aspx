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
                                        <asp:DropDownList type="text" ID="cboUserName" runat="server" placeholder="Tên nhân viên" CssClass="form-control form-control-line" DataSourceID="SqlDataSource2" DataTextField="fullname" DataValueField="id" AutoPostBack="True"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Pixel_Admin %>" SelectCommand="SELECT * FROM [User]" DeleteCommand="DELETE FROM [User] WHERE [id] = @id" InsertCommand="INSERT INTO [User] ([fullname], [email], [password], [address], [role_id], [avartar], [deleted], [created_at], [updated_at]) VALUES (@fullname, @email, @password, @address, @role_id, @avartar, @deleted, @created_at, @updated_at)" UpdateCommand="UPDATE [User] SET [fullname] = @fullname, [email] = @email, [password] = @password, [address] = @address, [role_id] = @role_id, [avartar] = @avartar, [deleted] = @deleted, [created_at] = @created_at, [updated_at] = @updated_at WHERE [id] = @id">
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
                                                <asp:Parameter Name="deleted" Type="Int32" />
                                                <asp:Parameter Name="created_at" Type="DateTime" />
                                                <asp:Parameter Name="updated_at" Type="DateTime" />
                                            </InsertParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="fullname" Type="String" />
                                                <asp:Parameter Name="email" Type="String" />
                                                <asp:Parameter Name="password" Type="String" />
                                                <asp:Parameter Name="address" Type="String" />
                                                <asp:Parameter Name="role_id" Type="Int32" />
                                                <asp:Parameter Name="avartar" Type="String" />
                                                <asp:Parameter Name="deleted" Type="Int32" />
                                                <asp:Parameter Name="created_at" Type="DateTime" />
                                                <asp:Parameter Name="updated_at" Type="DateTime" />
                                                <asp:Parameter Name="id" Type="Int32" />
                                            </UpdateParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Tên dự án</label>
                                    <div class="col-md-12">
                                        <asp:DropDownList type="text" ID="cboPrjName" runat="server" placeholder="Tên công việc" CssClass="form-control form-control-line" DataSourceID="SqlDataSource3" DataTextField="name" DataValueField="id"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Pixel_Admin %>" SelectCommand="SELECT * FROM [Project]" DeleteCommand="DELETE FROM [Project] WHERE [id] = @id" InsertCommand="INSERT INTO [Project] ([name], [description], [created_at], [updated_at]) VALUES (@name, @description, @created_at, @updated_at)" UpdateCommand="UPDATE [Project] SET [name] = @name, [description] = @description, [created_at] = @created_at, [updated_at] = @updated_at WHERE [id] = @id">
                                            <DeleteParameters>
                                                <asp:Parameter Name="id" Type="Int32" />
                                            </DeleteParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="name" Type="String" />
                                                <asp:Parameter Name="description" Type="String" />
                                                <asp:Parameter Name="created_at" Type="DateTime" />
                                                <asp:Parameter Name="updated_at" Type="DateTime" />
                                            </InsertParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="name" Type="String" />
                                                <asp:Parameter Name="description" Type="String" />
                                                <asp:Parameter Name="created_at" Type="DateTime" />
                                                <asp:Parameter Name="updated_at" Type="DateTime" />
                                                <asp:Parameter Name="id" Type="Int32" />
                                            </UpdateParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Trạng thái</label>
                                    <div class="col-md-12">
                                        <asp:DropDownList type="text" ID="cboStatus" runat="server" placeholder="Trạng thái" CssClass="form-control form-control-line" DataTextField="status" DataValueField="status">
                                            <asp:ListItem Selected="True" Value="0">Chưa hoàn thành</asp:ListItem>
                                            <asp:ListItem Value="1">Đã hoàn thành</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
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

