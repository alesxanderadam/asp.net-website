using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class task_add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {}


    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string taskName = txtTaskName.Text;
        string user_id = cboUserName.Text;
        string prj_id = cboPrjName.Text;
        string status_id = cboStatus.Text;
        DateTime created_at = DateTime.Now;

        string connectionString = "Data Source=MSI\\SQLEXPRESS;Initial Catalog=Pixel_Admin;Integrated Security=True";

        SqlConnection connection = new SqlConnection(connectionString);
        connection.Open();
        string sql = "INSERT INTO [Task] ([name], [project_id], [user_id], [status_id], [created_at]) VALUES (@Name, @Prj_id, @User_id, @Status_id, @Created_at)";
        SqlCommand command = new SqlCommand(sql, connection);
        command.Parameters.AddWithValue("@Name", taskName);
        command.Parameters.AddWithValue("@Prj_id", prj_id);
        command.Parameters.AddWithValue("@User_id", user_id);
        command.Parameters.AddWithValue("@Status_id", status_id);
        command.Parameters.AddWithValue("@Created_at", created_at);

        command.ExecuteNonQuery();
        Response.Redirect("task.aspx");
    }
}