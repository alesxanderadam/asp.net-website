using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Task : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        if (sender is Button btn)
        {
            if (int.TryParse(btn.CommandArgument, out int taskId))
            {
                DeleteTaskFromDatabase(taskId);
            }
        }
    }

    public void DeleteTaskFromDatabase(int task_id)
    {
        string connectionString = "Data Source=MSI\\SQLEXPRESS;Initial Catalog=Pixel_Admin;Integrated Security=True";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            string sql = "DELETE Task WHERE Task.id = @Id";

            using (SqlCommand command = new SqlCommand(sql, connection))
            {
                command.Parameters.AddWithValue("@Id", task_id);
                command.ExecuteNonQuery();
            }
            SqlDataSource1.DataBind();
            TaskRepeater.DataBind();
        }
    }


    protected void Unnamed_Click(object sender, EventArgs e)
    {
        Button btn = sender as Button;
        string taskId = btn.CommandArgument;

        Response.Redirect("task-update.aspx?taskId=" + taskId);
    }
}