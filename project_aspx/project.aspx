<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="project.aspx.cs" Inherits="project" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" Runat="Server">
    <!-- Page Content -->
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row bg-title">
                <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                    <h4 class="page-title">Danh sách dự án</h4>
                </div>
                <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12 text-right">
                    <a href="project-add" class="btn btn-sm btn-success">Thêm mới</a>
                </div>

                <!-- /.col-lg-12 -->
            </div>
            <!-- /row -->
            <div class="row">
                <div class="col-sm-12">
                    <div class="white-box">
                        <div class="table-responsive">
                            <asp:GridView ID="PrjGridView" runat="server" CssClass="table" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1">
                                <Columns>
                                    <asp:BoundField DataField="id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                    <asp:BoundField DataField="name" HeaderText="Tên" SortExpression="name" />
                                    <asp:BoundField DataField="description" HeaderText="Mô tả" SortExpression="description" />  
                                    <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                            <asp:Button CssClass="btn btn-sm btn-primary" runat="server" Text="Sửa" OnClick="Unnamed_Click" CommandArgument='<%# Eval("id") %>'  />
                                            <asp:Button ID="btnDelete" runat="server" Text="Xóa" CssClass="btnbtn btn-sm btn-danger" OnClick="btnDelete_Click" CommandArgument='<%# Eval("id") %>'  />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Pixel_AdminConnectionString5 %>" DeleteCommand="DELETE FROM [Project] WHERE [id] = @id" InsertCommand="INSERT INTO [Project] ([name], [description], [created_at], [updated_at]) VALUES (@name, @description, @created_at, @updated_at)" SelectCommand="SELECT * FROM [Project]" UpdateCommand="UPDATE [Project] SET [name] = @name, [description] = @description, [created_at] = @created_at, [updated_at] = @updated_at WHERE [id] = @id">
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
                </div>
            </div>
            <!-- /.row -->
        </div>
    </div>
        <!-- /.container-fluid -->
</asp:Content>

