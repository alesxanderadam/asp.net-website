using project_aspx;
using System;
using System.Data.SqlClient;
using Microsoft.AspNet.Identity;
using System.Web;
using Newtonsoft.Json;

public partial class Account_signIn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Cookie cookie = new Cookie();
        string email = cookie.GetCookieValue(Request, "Email");
        if (!string.IsNullOrEmpty(email))
        {
            Response.Redirect("~/dashboard.aspx");
        }
    }

    protected void submitLogin_Click(object sender, EventArgs e)
    {
        string email = Email.Text;
        string password = Password.Text;

        using (SqlConnection connection = new SqlConnection("Data Source=MSI\\SQLEXPRESS;Initial Catalog=Pixel_Admin;Integrated Security=True"))
        {
            connection.Open();
            string query = "SELECT * FROM [User] WHERE [email] = @email and [password] = @password";
            SqlCommand cmd = new SqlCommand(query, connection);
            {
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@password", password);

                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    UserModel user  = new UserModel();
                    Cookie cookie = new Cookie();

                    user.Id = reader.GetInt32(reader.GetOrdinal("id"));
                    user.Fullname = reader.GetString(reader.GetOrdinal("fullname"));
                    user.Email = reader.GetString(reader.GetOrdinal("email"));
                    user.Role_id = reader.GetInt32(reader.GetOrdinal("role_id"));
                    user.Avartar = reader.GetString(reader.GetOrdinal("avartar"));


                    cookie.SetCookie(Response, "Email", reader.GetString(2), 1);
                    cookie.SetCookie(Response, "InforUser", JsonConvert.SerializeObject(user), 1);
                    
                    Response.Redirect("~/dashboard");
                }
                else
                {
                    Response.Redirect("~/account/signIn");
                }

                reader.Close();
            }

        }
    }
}