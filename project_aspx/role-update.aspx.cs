using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class role_update :  System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int roleId = getRoleIdFromParams();
            getRoleById(roleId);
        }
    }

    protected void getRoleById(int roleId)
    {
        using (SqlConnection connection = new SqlConnection("Data Source=TIMNGUYEN\\SQLEXPRESS;Initial Catalog=Pixel_Admin;Integrated Security=True"))
        {
            connection.Open();

            SqlCommand command = new SqlCommand("SELECT name, description FROM Role WHERE id = @roleId", connection);
            command.Parameters.AddWithValue("@roleId", roleId);

            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                string name = reader.GetString(0); // Lấy giá trị tại vị trí cột name
                string description = reader.GetString(1); // Lấy giá trị tại vị trí cột description

                txtRoleName.Text = name;
                txtDesc.Text = description;
            }

            reader.Close();
        }
    }


    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string name = txtRoleName.Text;
        string description = txtDesc.Text;
        int roleId = getRoleIdFromParams();

        // Kết nối đến cơ sở dữ liệu
        using (SqlConnection connection = new SqlConnection("Data Source=TIMNGUYEN\\SQLEXPRESS;Initial Catalog=Pixel_Admin;Integrated Security=True"))
        {
            connection.Open();

            // Tạo câu lệnh UPDATE
            string query = "UPDATE Role SET name = @name, description = @description WHERE id = @roleId";

            // Tạo đối tượng SqlCommand và gán giá trị cho các tham số
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@name", name);
                command.Parameters.AddWithValue("@description", description);
                command.Parameters.AddWithValue("@roleId", roleId);

                // Thực thi câu lệnh UPDATE
                int rowsAffected = command.ExecuteNonQuery();

                if (rowsAffected > 0)
                {
                    Response.Redirect("role.aspx");
                }
                else
                {
                    // Xử lý khi không có dòng nào bị ảnh hưởng (cập nhật không thành công)
                }
            }
        }
    }

    protected int getRoleIdFromParams()
    {
        string roleId = Request.Params["roleId"]; // hoặc Request.QueryString["roleId"] 
        int roleIdValue;

        if (!string.IsNullOrEmpty(roleId) && int.TryParse(roleId, out roleIdValue))
        {
            return roleIdValue;
        }

        // Xử lý khi ID không hợp lệ
        Response.Redirect("role.aspx");
        return 0;
    }
}
