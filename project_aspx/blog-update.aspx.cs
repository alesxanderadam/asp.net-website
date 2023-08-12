using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class blog_update : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int blogId = getBlogIdParam();
            getBlogById(blogId);
        }

    }
    protected void getBlogById(int blogId)
    {
        using (SqlConnection connection = new SqlConnection("Data Source=TIMNGUYEN\\SQLEXPRESS;Initial Catalog=Pixel_Admin;Integrated Security=True"))
        {
            connection.Open();

            SqlCommand command = new SqlCommand("SELECT name, description, category_id, title, user_id FROM [Blog] WHERE id = @blogId", connection);
            command.Parameters.AddWithValue("@blogId", blogId);

            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                string name = reader.GetString(0);
                string description = reader.GetString(1);
                int category_id = reader.GetInt32(2);
                string title = reader.GetString(3);
                int user_id = reader.GetInt32(4);

                txtName.Text = name;
                txtDescription.Text = description;
                DDLCateId.Text = category_id.ToString();
                txtTitle.Text = title;
                DDLUserId.Text = user_id.ToString();
            }

            reader.Close();
        }
    }
    protected int getBlogIdParam()
    {
        string blogId = Request.Params["blogId"]; // hoặc Request.QueryString["roleId"] 
        int blogIdValue;

        if (!string.IsNullOrEmpty(blogId) && int.TryParse(blogId, out blogIdValue))
        {
            return blogIdValue;
        }

        // Xử lý khi ID không hợp lệ
        Response.Redirect("blog.aspx");
        return 0;
    }

    protected void btnFixBlog_Click(object sender, EventArgs e)
    {
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
        int blogId = getBlogIdParam();
        string userId = DDLUserId.Text;

        string queryUpdateHaveImage = " UPDATE [Blog] SET [name] = @name, [title] = @title, [description] = @description, [category_id] = @category_id, [image] = @image, [updated_at] = @updated_at, [user_id] = @user_id WHERE id = @id ";
        string queryUpdate = "UPDATE [Blog] SET [name] = @name, [title] = @title, [description] = @description, [category_id] = @category_id, [image] = @image, [updated_at] = @updated_at, [user_id] = @user_id WHERE id = @id ";
        string query = (FileUploadImage.HasFile) ? queryUpdateHaveImage : queryUpdate;

        using (SqlConnection connection = new SqlConnection("Data Source=TIMNGUYEN\\SQLEXPRESS;Initial Catalog=Pixel_Admin;Integrated Security=True"))
        {
            connection.Open();

            using (SqlCommand cmd = new SqlCommand(query, connection))
            {
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@title", title);
                cmd.Parameters.AddWithValue("@description", SqlDbType.NVarChar).Value = description;
                cmd.Parameters.AddWithValue("@category_id", cateId);
                cmd.Parameters.AddWithValue("@updated_at", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss.fff"));
                cmd.Parameters.AddWithValue("@user_id", userId);


                if (FileUploadImage.HasFile)
                {
                    string uploadedfilepath = Server.MapPath("upload/avartar/" + FileUploadImage.FileName);
                    FileUploadImage.PostedFile.SaveAs(uploadedfilepath);
                    cmd.Parameters.AddWithValue("@image", FileUploadImage.FileName);
                }
                cmd.Parameters.AddWithValue("@id", blogId);

                // Thực thi câu lệnh UPDATE
                int rowsAffected = cmd.ExecuteNonQuery();

                if (rowsAffected > 0)
                {
                    Response.Redirect("blog.aspx");
                }
                else
                {
                    // Xử lý khi không có dòng nào bị ảnh hưởng (cập nhật không thành công)
                }
            }
        }
    }
}