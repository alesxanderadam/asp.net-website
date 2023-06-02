using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

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

            SqlCommand command = new SqlCommand("SELECT name, project_id, user_id, status FROM Task WHERE id = @taskId", connection);
            command.Parameters.AddWithValue("@taskId", taskId);

            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                string name = reader.GetString(0); // Lấy giá trị tại vị trí cột name
                int prj_id = reader.GetInt32(1); // Lấy giá trị tại vị trí cột description
                int user_id = reader.GetInt32(2);
                byte status = reader.GetByte(3);


                txtTaskName.Text = name;
                cboPrjName.Text = prj_id.ToString();
                cboUserName.Text = user_id.ToString();
                cboStatus.Text = status.ToString();
            }

            reader.Close();
        }
    }

    protected int getTaskIdFromParams()
    {
        string taskId = Request.Params["taskId"]; // hoặc Request.QueryString["roleId"] 
        int taskIdValue;

        if (!string.IsNullOrEmpty(taskId) && int.TryParse(taskId, out taskIdValue))
        {
            return taskIdValue;
        }

        // Xử lý khi ID không hợp lệ
        Response.Redirect("Task.aspx");
        return 0;
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string name = txtTaskName.Text; 
        string prj_id = cboPrjName.Text;
        string user_id = cboUserName.Text;
        string status = cboStatus.Text;
        int TaskId = getTaskIdFromParams();

        // Kết nối đến cơ sở dữ liệu
        using (SqlConnection connection = new SqlConnection("Data Source=MSI\\SQLEXPRESS;Initial Catalog=Pixel_Admin;Integrated Security=True"))
        {
            connection.Open();

            // Tạo câu lệnh UPDATE
            string query = "UPDATE Task SET name = @name, project_id = @prj_id, user_id = @user_id, status = @status WHERE id = @taskId";

            // Tạo đối tượng SqlCommand và gán giá trị cho các tham số
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@name", name);
                command.Parameters.AddWithValue("@prj_id", prj_id);
                command.Parameters.AddWithValue("@user_id", user_id);
                command.Parameters.AddWithValue("@status", status);
                command.Parameters.AddWithValue("@taskid", TaskId);

                // Thực thi câu lệnh UPDATE
                int rowsAffected = command.ExecuteNonQuery();

                if (rowsAffected > 0)
                {
                    Response.Redirect("Task.aspx");
                }
                else
                {
                    // Xử lý khi không có dòng nào bị ảnh hưởng (cập nhật không thành công)
                }
            }
        }
    }
}