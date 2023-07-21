using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class task_detail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Gọi phương thức để lấy giá trị tham số StatusId từ cơ sở dữ liệu
            int statusIdForColumn1 = GetStatusIdForColumn1FromDatabase();

            // Truyền giá trị tham số vào SqlDataSource1
            SqlDataSource1.SelectParameters["StatusId"].DefaultValue = statusIdForColumn1.ToString();

            // Tải lại dữ liệu cho Repeater rpTask_detail1 sau khi thay đổi tham số
            rpTask_detail1.DataBind();
        }
    }
    private int GetStatusIdForColumn1FromDatabase()
    {
        int statusIdForColumn1 = 0; // Khởi tạo giá trị mặc định

        // Chuỗi kết nối tới cơ sở dữ liệu (thay đổi theo cấu hình của bạn)
        string connectionString = "Data Source=MSI\\SQLEXPRESS;Initial Catalog=Pixel_Admin;Integrated Security=True;";

        // Câu truy vấn SQL để lấy giá trị StatusId từ cơ sở dữ liệu (thay đổi theo cấu trúc cơ sở dữ liệu của bạn)
        string query = "SELECT [status_id] FROM [Task_Detail];";

        try
        {
            // Mở kết nối đến cơ sở dữ liệu
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Tạo đối tượng SqlCommand và thực thi câu truy vấn
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Đọc giá trị từ SqlDataReader (nếu câu truy vấn trả về nhiều dòng dữ liệu, bạn cần sử dụng vòng lặp)
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // Đọc giá trị StatusId từ cột thứ 0 (vị trí cột đầu tiên)
                            statusIdForColumn1 = reader.GetInt32(0);
                        }
                    }
                }
            }
        }
        catch (Exception ex)
        {
            // Xử lý nếu có lỗi xảy ra trong quá trình truy vấn hoặc kết nối cơ sở dữ liệu
            // Bạn có thể log lỗi, hiển thị thông báo cho người dùng, hoặc thực hiện các xử lý khác tùy ý.
            // Ví dụ:
            Console.WriteLine(ex.Message);
        }

        return statusIdForColumn1;
    }
}