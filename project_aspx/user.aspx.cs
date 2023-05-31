using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Contact : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            exampleGridView.DataBind();
        }
    }

    protected void btnUpdateUse_Click(object sender, EventArgs e)
    {
        Button btn = sender as Button;
        string userId = btn.CommandArgument;

        Response.Redirect("user-update.aspx?userId=" + userId);

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
            string sql = "DELETE [User] WHERE id = @userId";

            // Tạo đối tượng SqlCommand
            using (SqlCommand command = new SqlCommand(sql, connection))
            {
                // Thêm các tham số vào câu lệnh SQL
                command.Parameters.AddWithValue("@userId", id);
                // Thực thi câu lệnh SQL
                command.ExecuteNonQuery();
            }
            exampleGridView.DataBind();
            SqlDataSource1.DataBind();
        }
    }
}