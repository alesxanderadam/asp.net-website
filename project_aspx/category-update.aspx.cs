using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class blogview_category_update : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int categoryId = getCateIdFromParams();
            getCateById(categoryId);
        }
    }
    protected void getCateById(int categoryId)
    {
        using (SqlConnection connection = new SqlConnection("Data Source=TIMNGUYEN\\SQLEXPRESS;Initial Catalog=Pixel_Admin;Integrated Security=True"))
        {
            connection.Open();

            SqlCommand command = new SqlCommand("SELECT name, description FROM Category WHERE id = @cateId", connection);
            command.Parameters.AddWithValue("@cateId", categoryId);

            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                string name = reader.GetString(0); // Lấy giá trị tại vị trí cột name
                txtCateName.Text = name;

            }
            reader.Close();
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string name = txtCateName.Text;
        int cateId = getCateIdFromParams();

        // Kết nối đến cơ sở dữ liệu
        using (SqlConnection connection = new SqlConnection("Data Source=TIMNGUYEN\\SQLEXPRESS;Initial Catalog=Pixel_Admin;Integrated Security=True"))
        {
            connection.Open();

            // Tạo câu lệnh UPDATE
            string query = "UPDATE Role SET name = @name WHERE id = @cateId";

            // Tạo đối tượng SqlCommand và gán giá trị cho các tham số
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@name", name);
                command.Parameters.AddWithValue("@cateId", cateId);

                // Thực thi câu lệnh UPDATE
                int rowsAffected = command.ExecuteNonQuery();

                if (rowsAffected > 0)
                {
                    Response.Redirect("category.aspx");
                }
                else
                {
                    // Xử lý khi không có dòng nào bị ảnh hưởng (cập nhật không thành công)
                }
            }
        }
    }
    protected int getCateIdFromParams()
    {
        string cateId = Request.Params["categoryId"]; // hoặc Request.QueryString["roleId"] 
        int cateIdValue;

        if (!string.IsNullOrEmpty(cateId) && int.TryParse(cateId, out cateIdValue))
        {
            return cateIdValue;
        }

        // Xử lý khi ID không hợp lệ
        Response.Redirect("category.aspx");
        return 0;
    }
}