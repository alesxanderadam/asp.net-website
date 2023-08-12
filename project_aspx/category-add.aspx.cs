using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class blogview_category_add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(txtCateName.Text))
        {
            lblThongBao.Text = "Vui lòng nhập tên danh mục!";
            lblThongBao.CssClass = "help-block text-danger";
            return;
        }

        string cateName = txtCateName.Text;
        string connectionString = "Data Source=TIMNGUYEN\\SQLEXPRESS;Initial Catalog=Pixel_Admin;Integrated Security=True";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();
            string sql = "INSERT INTO Category (name) VALUES (@Name)";
            SqlCommand command = new SqlCommand(sql, connection);

            // Sử dụng tham số truy vấn để giữ nguyên ký tự đặc biệt trong tên danh mục
            SqlParameter parameter = new SqlParameter("@Name", System.Data.SqlDbType.NVarChar);
            parameter.Value = cateName;
            command.Parameters.Add(parameter);

            command.ExecuteNonQuery();
        }

        Response.Redirect("category.aspx");
    }
}