using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Account_signUp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["success"] == "1")
            {
                // Đăng ký thành công, hiển thị thông báo alert
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Đăng ký thành công. Vui lòng đăng nhập.');", true);
            }
        }
    }

    protected bool UserIsLoggedIn()
    {
        // Kiểm tra xem người dùng đã đăng nhập bằng cách kiểm tra cookie
        Cookie cookie = new Cookie();
        string email = cookie.GetCookieValue(Request, "Email");
        return !string.IsNullOrEmpty(email);
    }

    protected void submitRegister_Click(object sender, EventArgs e)
    {
        string email = Email.Text;
        string password = Password.Text;

        // Kiểm tra xem người dùng có tồn tại trong cơ sở dữ liệu hay không
        bool userExists = CheckUserExists(email);

        if (!userExists)
        {
            // Nếu người dùng chưa tồn tại, thêm thông tin người dùng vào cơ sở dữ liệu
            AddUserToDatabase(email, password);

            // Lưu thông tin đăng nhập vào cookie
            Cookie cookie = new Cookie();
            cookie.SetCookie(Response, "Email", email, 1);

            // Chuyển hướng đến trang dashboard sau khi đăng ký thành công
            Response.Redirect("~/Account/signIn.aspx?success=1");
        }
        else
        {
            // Người dùng đã tồn tại, hiển thị thông báo lỗi
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Người dùng đã tồn tại. Vui lòng chọn địa chỉ email khác.');", true);
        }
    }

    protected bool CheckUserExists(string email)
    {
        // Kiểm tra xem người dùng đã tồn tại trong cơ sở dữ liệu hay chưa
        bool userExists = false;
        using (SqlConnection connection = new SqlConnection("Data Source=TIMNGUYEN\\SQLEXPRESS;Initial Catalog=Pixel_Admin;Integrated Security=True"))
        {
            connection.Open();
            string query = "SELECT COUNT(*) FROM [User] WHERE [email] = @email";
            SqlCommand cmd = new SqlCommand(query, connection);
            {
                cmd.Parameters.AddWithValue("@email", email);

                int count = Convert.ToInt32(cmd.ExecuteScalar());
                if (count > 0)
                {
                    userExists = true;
                }
            }
        }
        return userExists;
    }

    protected void AddUserToDatabase(string email, string password)
    {
        // Thêm thông tin người dùng vào cơ sở dữ liệu
        using (SqlConnection connection = new SqlConnection("Data Source=TIMNGUYEN\\SQLEXPRESS;Initial Catalog=Pixel_Admin;Integrated Security=True"))
        {
            connection.Open();
            string query = "INSERT INTO [User] ([email], [password]) VALUES (@email, @password)";
            SqlCommand cmd = new SqlCommand(query, connection);
            {
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@password", password);
                cmd.ExecuteNonQuery();
            }
        }
    }
}
