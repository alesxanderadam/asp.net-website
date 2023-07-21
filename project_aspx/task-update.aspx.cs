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

            SqlCommand command = new SqlCommand("SELECT [name], [project_id] FROM [Task] WHERE id = @taskId", connection);
            command.Parameters.AddWithValue("@taskId", taskId);

            SqlDataReader reader = command.ExecuteReader();
            if (reader.HasRows && reader.Read())
            {
                txtTaskName.Text = reader.GetString(0);
                cboPrjName.Text = reader.GetInt32(1).ToString();
            }
            reader.Close();
        }
    }

    protected int getTaskIdFromParams()
    {
        string taskId = Request.QueryString["taskId"]; // hoặc Request.QueryString["roleId"] 

        if (!string.IsNullOrEmpty(taskId) && int.TryParse(taskId, out int taskIdValue))
        {
            return taskIdValue;
        }

        // Xử lý khi ID không hợp lệ
        Response.Redirect("task.aspx");
        return 0;
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string name = txtTaskName.Text;
        string prj_id = cboPrjName.Text;
        string user_id = cboUserName.Text;
        int TaskId = getTaskIdFromParams();

        // Kết nối đến cơ sở dữ liệu
        using (SqlConnection connection = new SqlConnection("Data Source=MSI\\SQLEXPRESS;Initial Catalog=Pixel_Admin;Integrated Security=True"))
        {
            connection.Open();

            // Tạo câu lệnh UPDATE
            string query = "UPDATE Task SET name = @name, project_id = @prj_id WHERE id = @taskId";

            // Tạo đối tượng SqlCommand và gán giá trị cho các tham số
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@name", name);
                command.Parameters.AddWithValue("@prj_id", prj_id);
                command.Parameters.AddWithValue("@taskid", TaskId);

                // Thực thi câu lệnh UPDATE
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