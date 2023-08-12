﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class blog_add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnAddUser_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(txtName.Text))
        {
            lblThongBaoTen.Text = "Vui lòng nhập tên bài viết!";
            lblThongBaoTen.CssClass = "help-block text-danger";
            return;
        }

        if (string.IsNullOrEmpty(txtTitle.Text))
        {
            lblThongBaoTieuDeTT.Text = "Vui lòng nhập tiêu đề!";
            lblThongBaoTieuDeTT.CssClass = "help-block text-danger";
            return;
        }
        if (!FileUploadImage.HasFile)
        {
            lblThongBaoAnh.Text = "Vui lòng chọn ảnh bài viết!";
            lblThongBaoAnh.CssClass = "help-block text-danger";
            return;
        }


        string name = txtName.Text;
        string title = txtTitle.Text;
        string description = txtDescription.Text;
        string cateId = DDLCateId.Text;
        string userId = DDLUserId.Text;
        string image = "";
        if (FileUploadImage.HasFile)
        {
            image = FileUploadImage.FileName;
            string uploadedFilePath = Server.MapPath("Upload/Image/" + FileUploadImage.FileName);
            FileUploadImage.PostedFile.SaveAs(uploadedFilePath);
        }

        using (SqlConnection connection = new SqlConnection("Data Source=TIMNGUYEN\\SQLEXPRESS;Initial Catalog=Pixel_Admin;Integrated Security=True"))
        {
            connection.Open();
            string insertQueryUser = "INSERT INTO [Blog]([name], [description], [category_id], [image], [title], [created_at], [updated_at], [user_id]) VALUES(@name, @description, @category_id, @image, @title, @created_at, @updated_at, @user_id)";
            SqlCommand cmd = new SqlCommand(insertQueryUser, connection);
            {
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@title", title);
                cmd.Parameters.AddWithValue("@description", SqlDbType.NVarChar).Value = description;
                cmd.Parameters.AddWithValue("@category_id", cateId);
                cmd.Parameters.AddWithValue("@image", image);
                cmd.Parameters.AddWithValue("@updated_at", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss.fff"));
                cmd.Parameters.AddWithValue("@created_at", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss.fff"));
                cmd.Parameters.AddWithValue("@user_id", userId);

                cmd.ExecuteNonQuery();
                Response.Redirect("blog.aspx");
            }

        }
    }
}