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
        Button btnDelete = sender as Button;
        int id = Convert.ToInt32(btnDelete.CommandArgument);

        string connectionString = "Data Source=MSI\\SQLEXPRESS;Initial Catalog=Pixel_Admin;Integrated Security=True";

        // Tạo kết nối
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            // Mở kết nối
            connection.Open();

            // Tạo câu lệnh SQL để chèn dữ liệu
            string sql = "DELETE Task WHERE Task.id = @Id";

            // Tạo đối tượng SqlCommand
            using (SqlCommand command = new SqlCommand(sql, connection))
            {
                // Thêm các tham số vào câu lệnh SQL
                command.Parameters.AddWithValue("@Id", id);
                // Thực thi câu lệnh SQL
                command.ExecuteNonQuery();
            }
            TaskGridView.DataBind();
            SqlDataSource1.DataBind();
        }
    }

    protected void Unnamed_Click(object sender, EventArgs e)
    {
        Button btn = sender as Button;
        string taskId = btn.CommandArgument;

        // Chuyển đến trang role-update.aspx và truyền giá trị roleId qua QueryString
        Response.Redirect("task-update.aspx?taskid=" + taskId);
    }

    protected void TaskGridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string status = DataBinder.Eval(e.Row.DataItem, "status").ToString();

            if (status == "0")
            {
                e.Row.Cells[4].Text = "Chưa hoàn thành";
            }
            else if (status == "1")
            {
                e.Row.Cells[4].Text = "Đã hoàn thành";
            }
        }
    }
}