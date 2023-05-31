<%@ Page Title="Task" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Task.aspx.cs" Inherits="Task" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" Runat="Server">
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
                            <asp:GridView ID="TaskGridView" runat="server" CssClass="table" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" OnRowDataBound="TaskGridView_RowDataBound">
                                <Columns>
                                    <asp:BoundField DataField="id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                    <asp:BoundField DataField="name" HeaderText="Tên công việc" SortExpression="name" />
                                    <asp:BoundField DataField="project_id" HeaderText="Dự án" SortExpression="project_id" />
                                    <asp:BoundField DataField="user_id" HeaderText="Người làm" SortExpression="user_id" />
                                    <asp:BoundField DataField="status" HeaderText="Trạng thái" SortExpression="status" />
                                    <asp:TemplateField HeaderText="Công cụ">
                                        <ItemTemplate>
                                            <asp:Button CssClass="btn btn-sm btn-primary" runat="server" Text="Sửa" OnClick="Unnamed_Click" CommandArgument='<%# Eval("id") %>'  />
                                            <asp:Button ID="btnDelete" runat="server" Text="Xóa" CssClass="btnbtn btn-sm btn-danger" OnClick="btnDelete_Click" CommandArgument='<%# Eval("id") %>'  />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Pixel_AdminConnectionString4 %>" DeleteCommand="DELETE FROM [Task] WHERE [id] = @id" InsertCommand="INSERT INTO [Task] ([name], [project_id], [user_id], [created_at], [updated_at], [status]) VALUES (@name, @project_id, @user_id, @created_at, @updated_at, @status)" SelectCommand="SELECT [Task].[id], [Task].[name], [User].fullname AS user_id, [Project].[name] AS project_id, [Task].[status] FROM Task INNER JOIN [User] ON Task.user_id = [User].[id] INNER JOIN Project ON Task.project_id = Project.id;" UpdateCommand="UPDATE [Task] SET [name] = @name, [project_id] = @project_id, [user_id] = @user_id, [created_at] = @created_at, [updated_at] = @updated_at, [status] = @status WHERE [id] = @id">
                                <DeleteParameters>
                                    <asp:Parameter Name="id" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>                                    
                                    <asp:Parameter Name="name" Type="String" />
                                    <asp:Parameter Name="project_id" Type="Int32" />
                                    <asp:Parameter Name="user_id" Type="Int32" />
                                    <asp:Parameter Name="created_at" Type="DateTime" />
                                    <asp:Parameter Name="updated_at" Type="DateTime" />
                                    <asp:Parameter Name="status" Type="Byte" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="name" Type="String" />
                                    <asp:Parameter Name="project_id" Type="Int32" />
                                    <asp:Parameter Name="user_id" Type="Int32" />
                                    <asp:Parameter Name="created_at" Type="DateTime" />
                                    <asp:Parameter Name="updated_at" Type="DateTime" />
                                    <asp:Parameter Name="status" Type="Byte" />
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

