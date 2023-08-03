using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnAddUser_Click(object sender, EventArgs e)
    {
        string FullName = txtFullName.Text;
        string Email = txtEmail.Text;
        string Password = txtPassword.Text;
        string Address = txtAddress.Text;
        string RoleId = DDLRole.Text;
        string Avartar = FileUploadAvartar.FileName;
        if (FileUploadAvartar.HasFile)
        {
            string uploadedFilePath = Server.MapPath("Upload/Avartar/" + FileUploadAvartar.FileName);
            FileUploadAvartar.PostedFile.SaveAs(uploadedFilePath);
        }
        else
        {
            
        }
        using (SqlConnection connection = new SqlConnection("Data Source=TIMNGUYEN\\SQLEXPRESS;Initial Catalog=Pixel_Admin;Integrated Security=True"))
        {
            connection.Open();
            string insertQueryUser = "INSERT INTO [User]([fullname], [email], [password], [address], [role_id], [avartar], [created_at]) VALUES(@Fullname, @Email, @Password, @Address, @RoleId, @Avartar, @created_at)";
            SqlCommand cmd = new SqlCommand(insertQueryUser, connection);
            {
                cmd.Parameters.AddWithValue("@Fullname", FullName);
                cmd.Parameters.AddWithValue("@Email", Email);
                cmd.Parameters.AddWithValue("@Password", Password);
                cmd.Parameters.AddWithValue("@Address", Address);
                cmd.Parameters.AddWithValue("@RoleId", RoleId);
                cmd.Parameters.AddWithValue("@Avartar", Avartar);
                cmd.Parameters.AddWithValue("@created_at", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss.fff"));

                cmd.ExecuteNonQuery();
                Response.Redirect("user.aspx");                
            }

        }
    }
}