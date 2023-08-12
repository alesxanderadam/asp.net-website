using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Threading.Tasks;

public partial class task_update : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int taskId = getTaskIdFromParams();
            getTaskById(taskId);
        }
    }

    protected void getTaskById(int taskId)
    {
        using (SqlConnection connection = new SqlConnection("Data Source=MSI\\SQLEXPRESS;Initial Catalog=Pixel_Admin;Integrated Security=True"))
        {
            connection.Open();

            SqlCommand command = new SqlCommand(@"SELECT
  [Task].[id],
  [Task].[name],
  [Project].[id] AS [Dự án],
  [User].[id] AS [Người thực hiện],
  [Status].[id] as [Trạng thái],
  [Task].[created_at],
  [Task].[updated_at]
FROM [Task]
INNER JOIN [Project] ON [Task].[project_id] = [Project].[id]
INNER JOIN [User] ON [Task].[user_id] = [User].[id]
INNER JOIN [Status] ON [Task].[status_id] = [Status].[id]
WHERE [Task].[id] = @taskId", connection);

            command.Parameters.AddWithValue("@taskId", taskId);

            SqlDataReader reader = command.ExecuteReader();
            if (reader.HasRows && reader.Read())
            {
                txtTaskName.Text = reader.GetString(reader.GetOrdinal("name"));
                cboPrjName.SelectedValue = reader.GetInt32(reader.GetOrdinal("Dự án")).ToString();
                cboUserName.SelectedValue = reader.GetInt32(reader.GetOrdinal("Người thực hiện")).ToString();
                cboStatus.SelectedValue = reader.GetInt32(reader.GetOrdinal("Trạng thái")).ToString();
            }
            reader.Close();
        }
    }


    protected int getTaskIdFromParams()
    {
        string taskId = Request.QueryString["task_id"];

        if (!string.IsNullOrEmpty(taskId) && int.TryParse(taskId, out int taskIdValue))
        {
            return taskIdValue;
        }

        Response.Redirect("task.aspx");
        return 0;
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        int TaskId = getTaskIdFromParams();
        string taskName = txtTaskName.Text;
        string user_id = cboUserName.Text;
        string prj_id = cboPrjName.Text;
        string status_id = cboStatus.Text;
        DateTime updated_at = DateTime.Now;

        using (SqlConnection connection = new SqlConnection("Data Source=MSI\\SQLEXPRESS;Initial Catalog=Pixel_Admin;Integrated Security=True"))
        {
            connection.Open();

            string updateSql = "UPDATE [Task] SET [name] = @Name, [project_id] = @Prj_id, [user_id] = @User_id, [status_id] = @Status_id, [updated_at] = @Updated_at WHERE [id] = @taskId";

            using (SqlCommand command = new SqlCommand(updateSql, connection))
            {
                command.Parameters.AddWithValue("@Name", taskName);
                command.Parameters.AddWithValue("@Prj_id", prj_id);
                command.Parameters.AddWithValue("@User_id", user_id);
                command.Parameters.AddWithValue("@Status_id", status_id);
                command.Parameters.AddWithValue("@Updated_at", updated_at);
                command.Parameters.AddWithValue("@taskid", TaskId);

                int rowsAffected = command.ExecuteNonQuery();

                if (rowsAffected > 0)
                {
                    Response.Redirect("task.aspx");
                }
                else
                {
                    // Xử lý khi không có dòng nào bị ảnh hưởng (cập nhật không thành công)
                }
            }
        }
    }
}