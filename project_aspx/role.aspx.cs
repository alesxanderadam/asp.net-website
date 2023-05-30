using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Data.Entity.Infrastructure.Design.Executor;

public partial class About : Page
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
            string sql = "DELETE Role WHERE Role.id = @Id";

            // Tạo đối tượng SqlCommand
            using (SqlCommand command = new SqlCommand(sql, connection))
            {
                // Thêm các tham số vào câu lệnh SQL
                command.Parameters.AddWithValue("@Id", id);
                // Thực thi câu lệnh SQL
                command.ExecuteNonQuery();
            }
            GridView2.DataBind();
            SqlDataSource2.DataBind();
        }
    }

    protected void Unnamed_Click(object sender, EventArgs e)
    {
        Button btn = sender as Button;
        string roleId = btn.CommandArgument;

        // Chuyển đến trang role-update.aspx và truyền giá trị roleId qua QueryString
        Response.Redirect("role-update.aspx?roleId=" + roleId);
    }
}