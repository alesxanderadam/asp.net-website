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
    {

    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string taskName = txtTaskName.Text;
        string user_id = cboUserName.Text;
        string prj_id = cboPrjName.Text;
        string status = cboStatus.Text;
        string connectionString = "Data Source=TIMNGUYEN\\SQLEXPRESS;Initial Catalog=Pixel_Admin;Integrated Security=True";

        SqlConnection connection = new SqlConnection(connectionString);
        connection.Open();
        string sql = "INSERT INTO task (name, project_id, user_id, status) VALUES (@Name, @Prj_id, @User_id, @Status)";
        SqlCommand command = new SqlCommand(sql, connection);
        command.Parameters.AddWithValue("@Name", taskName);
        command.Parameters.AddWithValue("@Prj_id", prj_id);
        command.Parameters.AddWithValue("@User_id", user_id);
        command.Parameters.AddWithValue("@Status", status);

        command.ExecuteNonQuery();
        Response.Redirect("Task.aspx");
    }
}