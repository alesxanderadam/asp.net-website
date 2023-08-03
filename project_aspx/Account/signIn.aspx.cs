using Microsoft.Owin.BuilderProperties;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

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

        using (SqlConnection connection = new SqlConnection("Data Source=TIMNGUYEN\\SQLEXPRESS;Initial Catalog=Pixel_Admin;Integrated Security=True"))
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
                    Cookie cookie = new Cookie();
                    cookie.SetCookie(Response, "Email", reader.GetString(2), 1);
                    //cookie.SetCookie(Response, "Role_id", reader.GetString(5), 1);
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