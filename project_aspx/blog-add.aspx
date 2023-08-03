<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="blog-add.aspx.cs" ValidateRequest="false" Inherits="blog_add" %>
<%@ Register Src="~/lib/ckfinder/config.ascx" TagName="Config" TagPrefix="CKFinder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <!-- Page Content -->
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row bg-title">
                <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                    <h4 class="page-title">Thêm mới bài viết</h4>
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
                                <label class="col-md-12">tên bài viết</label>
                                <div class="col-md-12">
                                    <asp:TextBox ID="txtName" runat="server" placeholder="tựa bài" CssClass="form-control form-control-line"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="example-email" class="col-md-12">Tiêu đề tóm tắt</label>
                                <div class="col-md-12">
                                    <asp:TextBox  placeholder="tiêu đề tóm tắt" ID="txtTitle" runat="server" CssClass="form-control form-control-line"></asp:TextBox>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label class="col-md-12">Nội dung bài viết</label>
                                <div class="col-md-12">
                                    <asp:TextBox type="text" placeholder="Nội dung bài viết" TextMode="MultiLine" ID="txtDescription" runat="server" CssClass="form-control form-control-line"></asp:TextBox>
                                    <script type="text/javascript">
                                        $(function () {
                                            CKEDITOR.replace('MainContent_txtDescription');
                                        });
                                    </script>
                                    <script>
                                        /*CKEDITOR.replace("txtDescription")*/
                                    </script>                           
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-12">Danh mục</label>
                                <div class="col-sm-12">
                                    <asp:DropDownList
                                        CssClass="form-control form-control-line"
                                        ID="DDLCateId"
                                        runat="server"
                                        DataSourceID="DataSourceRole"
                                        DataTextField="name"
                                        DataValueField="id">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="DataSourceRole" runat="server" ConnectionString="<%$ ConnectionStrings:Pixel_AdminConnectionString %>" SelectCommand="SELECT [id], [name] FROM [Category]"></asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-12">Hình ảnh</label>
                                <div class="col-md-12">
                                    <asp:FileUpload ID="FileUploadImage" runat="server" CssClass="form-control form-control-line" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <asp:Button Id="btnAddUser" runat="server" CssClass="btn btn-success" Text="Thêm mới" OnClick="btnAddUser_Click" />
                                    <a href="blog.aspx" class="btn btn-primary">Quay lại</a>
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

