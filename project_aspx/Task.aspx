<%@ Page Title="Task" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="task.aspx.cs" Inherits="Task" %>

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
                            <%--OnRowDataBound="TaskGridView_RowDataBound"--%>
                            <asp:GridView ID="TaskGridView" runat="server" CssClass="table" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1">
                                <Columns>
                                    <asp:BoundField DataField="id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                    <asp:TemplateField HeaderText="Công việc">
                                        <ItemTemplate>
                                            <a href="task-detail.aspx"><%# Eval("name") %></a>                                        
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="project_id" HeaderText="Dự án" SortExpression="project_id" />
                                    <asp:TemplateField HeaderText="Công cụ">
                                        <ItemTemplate>
                                            <asp:Button CssClass="btn btn-sm btn-primary" runat="server" Text="Sửa" OnClick="Unnamed_Click" CommandArgument='<%# Eval("id") %>'  />
                                            <asp:Button ID="btnDelete" runat="server" Text="Xóa" CssClass="btnbtn btn-sm btn-danger" OnClick="btnDelete_Click" CommandArgument='<%# Eval("id") %>'  />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Pixel_Admin %>" SelectCommand="SELECT [Task].id, [Task].name, Project.name as project_id, [Task].created_at, [Task].updated_at  FROM [Task] INNER JOIN Project ON [Task].project_id = Project.id">
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

