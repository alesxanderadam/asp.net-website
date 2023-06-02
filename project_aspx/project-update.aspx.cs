using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class project_update : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int prjId = getPrjIdFromParams();
            getPrjById(prjId);
        }
    }

    protected void getPrjById(int prjId)
    {
        using (SqlConnection connection = new SqlConnection("Data Source=MSI\\SQLEXPRESS;Initial Catalog=Pixel_Admin;Integrated Security=True"))
        {
            connection.Open();

            SqlCommand command = new SqlCommand("SELECT name, description FROM Project WHERE id = @prjId", connection);
            command.Parameters.AddWithValue("@prjId", prjId);

            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                string name = reader.GetString(0); // Lấy giá trị tại vị trí cột name
                string description = reader.GetString(1); // Lấy giá trị tại vị trí cột description

                txtPrjName.Text = name;
                txtDesc.Text = description;
            }

            reader.Close();
        }
    }

    protected int getPrjIdFromParams()
    {
        string prjId = Request.Params["prjId"]; // hoặc Request.QueryString["roleId"] 
        int prjIdValue;

        if (!string.IsNullOrEmpty(prjId) && int.TryParse(prjId, out prjIdValue))
        {
            return prjIdValue;
        }

        // Xử lý khi ID không hợp lệ
        Response.Redirect("project.aspx");
        return 0;
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string name = txtPrjName.Text;
        string description = txtDesc.Text;
        int prjId = getPrjIdFromParams();

        // Kết nối đến cơ sở dữ liệu
        using (SqlConnection connection = new SqlConnection("Data Source=MSI\\SQLEXPRESS;Initial Catalog=Pixel_Admin;Integrated Security=True"))
        {
            connection.Open();

            // Tạo câu lệnh UPDATE
            string query = "UPDATE Project SET name = @name, description = @description WHERE id = @prjId";

            // Tạo đối tượng SqlCommand và gán giá trị cho các tham số
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@name", name);
                command.Parameters.AddWithValue("@description", description);
                command.Parameters.AddWithValue("@prjId", prjId);

                // Thực thi câu lệnh UPDATE
                int rowsAffected = command.ExecuteNonQuery();

                if (rowsAffected > 0)
                {
                    Response.Redirect("project.aspx");
                }
                else
                {
                    // Xử lý khi không có dòng nào bị ảnh hưởng (cập nhật không thành công)
                }
            }
        }
    }
}