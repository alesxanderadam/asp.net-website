using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_update : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int userId = getUserIdParam();
            getUserById(userId);
        }
    }
    protected void getUserById(int userId)
    {
        using (SqlConnection connection = new SqlConnection("Data Source=TIMNGUYEN\\SQLEXPRESS;Initial Catalog=Pixel_Admin;Integrated Security=True"))
        {
            connection.Open();

            SqlCommand command = new SqlCommand("SELECT fullname, email, password, address, role_id FROM [User] WHERE id = @userId", connection);
            command.Parameters.AddWithValue("@userId", userId);

            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                string Fullname = reader.GetString(0); 
                string Email = reader.GetString(1);
                string Password = reader.GetString(2);
                string Address = reader.GetString(3);
                int RoleId = reader.GetInt32(4);

                txtFullName.Text = Fullname;
                txtEmail.Text = Email;
                txtPassword.Text = Password;
                txtAddress.Text = Address;
                DDLRole.Text = RoleId.ToString();
            }

            reader.Close();
        }
    }

    protected int getUserIdParam()
    {
        string userId = Request.Params["userId"]; // hoặc Request.QueryString["roleId"] 
        int roleIdValue;

        if (!string.IsNullOrEmpty(userId) && int.TryParse(userId, out roleIdValue))
        {
            return roleIdValue;
        }

        // Xử lý khi ID không hợp lệ
        Response.Redirect("user.aspx");
        return 0;
    }

    protected void btnUpdateUser_Click(object sender, EventArgs e)
    {
        string fullname = txtFullName.Text;
        string email = txtEmail.Text;
        string password = txtPassword.Text;
        string address = txtAddress.Text;
        string role_id = DDLRole.Text;
        int userId = getUserIdParam();

        string queryUpdateHaveImage = " UPDATE [User] SET [fullname] = @fullname, [email] = @email, [password] = @password, [address] = @address, [role_id] = @role_id, [avartar] = @avartar, [updated_at] = @updated_at WHERE id = @userId ";
        string queryUpdate = "UPDATE [User] SET [fullname] = @fullname, [email] = @email, [password] = @password, [address] = @address, [role_id] = @role_id, [updated_at] = @updated_at WHERE id = @userId ";
        string query = (FileUploadAvartar.HasFile) ? queryUpdateHaveImage : queryUpdate;

        using (SqlConnection connection = new SqlConnection("Data Source=MSI\\SQLEXPRESS;Initial Catalog=Pixel_Admin;Integrated Security=True"))
        {
            connection.Open();

            using (SqlCommand command = new SqlCommand(query , connection))
            {
                command.Parameters.AddWithValue("@fullname", fullname);
                command.Parameters.AddWithValue("@email", email);
                command.Parameters.AddWithValue("@password", password);
                command.Parameters.AddWithValue("@address", address);
                command.Parameters.AddWithValue("@updated_at", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss.fff"));
                command.Parameters.AddWithValue("@role_id", role_id);
                if (FileUploadAvartar.HasFile)
                {
                    string uploadedfilepath = Server.MapPath("upload/avartar/" + FileUploadAvartar.FileName);
                    FileUploadAvartar.PostedFile.SaveAs(uploadedfilepath);
                    command.Parameters.AddWithValue("@avartar", FileUploadAvartar.FileName);
                }
                command.Parameters.AddWithValue("@userId", userId);

                // Thực thi câu lệnh UPDATE
                int rowsAffected = command.ExecuteNonQuery();
              
                if (rowsAffected > 0)
                {
                    Response.Redirect("user.aspx");
                }
                else
                {
                    // Xử lý khi không có dòng nào bị ảnh hưởng (cập nhật không thành công)
                }
            }
        }
    }
}