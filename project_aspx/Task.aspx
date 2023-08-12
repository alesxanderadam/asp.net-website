<%@ Page Title="Task" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="task.aspx.cs" Inherits="Task" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="Server">
    <!-- Page Content -->
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row bg-title">
                <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                    <h4 class="page-title">Danh sách công việc</h4>
                </div>
                <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12 text-right">
                    <a href="task-add.aspx" class="btn btn-sm btn-success">Thêm mới</a>
                </div>

                <!-- /.col-lg-12 -->
            </div>
            <!-- /row -->
            <div class="row">
                <div class="col-sm-12">
                    <div class="white-box">
                        <div class="table-responsive">
                            <asp:Repeater ID="TaskRepeater" runat="server" DataSourceID="SqlDataSource1">
                                <HeaderTemplate>
                                    <table class="table" id="example" style="font-size: 11px; font-weight: 200">
                                        <thead>
                                            <tr>
                                                <th>STT</th>
                                                <th>Tên Công Việc</th>
                                                <th>Dự Án</th>
                                                <th>Người Thực Hiện</th>
                                                <th>Ngày Bắt Đầu</th>
                                                <th>Ngày Kết Thúc</th>
                                                <th>Trạng Thái</th>
                                                <th>Hành Động</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Container.ItemIndex + 1 %></td>
                                        <td><%# Eval("Name") %></td>
                                        <td><%# Eval("Dự án") %></td>
                                        <td><%# Eval("Người thực hiện") %></td>
                                        <td><%# Eval("created_at") %></td>
                                        <td><%# Eval("updated_at") %></td>
                                        <td><%# Eval("Trạng thái") %></td>
                                        <td>
                                            <a href='<%# "/task-update?task_id=" + Eval("Id") %>' class="btn btn-sm btn-primary">Sửa</a>
                                        <asp:Button ID="btnDelete" runat="server" Text="Xóa" CssClass="btn btn-sm btn-danger" OnClick="btnDelete_Click" CommandArgument='<%# Eval("Id") %>' OnClientClick="return confirm('Bạn có chắc muốn xóa công việc này?');" />
                                            <a href="#" class="btn btn-sm btn-info">Xem</a>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </tbody>
        </table>
                                </FooterTemplate>
                            </asp:Repeater>

                        </div>
                    </div>
                </div>
            </div>
            <!-- /.row -->
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Pixel_Admin1 %>" SelectCommand="SELECT
  [Task].[id],
  [Task].[name],
  [Project].[name] AS [Dự án],
  [User].[fullname] AS [Người thực hiện], -- Thêm cột tên người dùng
  [Status].[name] as [Trạng thái],
  [Task].[created_at],
  [Task].[updated_at]
FROM [Task]
INNER JOIN [Project] ON [Task].[project_id] = [Project].[id]
INNER JOIN [User] ON [Task].[user_id] = [User].[id]
INNER JOIN [Status] ON [Task].[status_id] = [Status].[id];
"></asp:SqlDataSource>
    <!-- /.container-fluid -->
</asp:Content>

