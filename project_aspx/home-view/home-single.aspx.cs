using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class home_view_home_single : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Lấy ID của bài viết từ query string
            if (Request.QueryString["id"] != null)
            {
                int blogId = Convert.ToInt32(Request.QueryString["id"]);

                // Cập nhật số lượt xem của bài viết
                UpdateViewCount(blogId);

                // Hiển thị số lượt xem lên trang
                DataList1.DataBind();
            }
        }
    }
    private void UpdateViewCount(int blogId)
    {
        string connectionString = "Data Source=TIMNGUYEN\\SQLEXPRESS;Initial Catalog=Pixel_Admin;Integrated Security=True"; // Thay YourConnectionString bằng chuỗi kết nối tới cơ sở dữ liệu
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = "UPDATE [Blog] SET [Blog].views = [Blog].views + 1 WHERE [Blog].id = @blogId";
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@blogId", blogId);
            connection.Open();
            command.ExecuteNonQuery();
        }
    }

    private int GetViewCount(int blogId)
    {
        string connectionString = "Data Source=TIMNGUYEN\\SQLEXPRESS;Initial Catalog=Pixel_Admin;Integrated Security=True"; // Thay YourConnectionString bằng chuỗi kết nối tới cơ sở dữ liệu
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = "SELECT [Blog].views FROM [Blog] WHERE [Blog].id = @blogId";
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@blogId", blogId);
            connection.Open();
            object result = command.ExecuteScalar();
            if (result != null && result != DBNull.Value)
            {
                return Convert.ToInt32(result);
            }
            return 0;
        }
    }

    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            DataRowView dataRow = (DataRowView)e.Item.DataItem;
            string categoryID = dataRow["category_id"].ToString();
            int blogId = Convert.ToInt32(dataRow["id"]);

            DataList dataList3 = (DataList)e.Item.FindControl("DataList3");
            SqlDataSource SqlDataSource7 = new SqlDataSource(ConfigurationManager.ConnectionStrings["Pixel_AdminConnectionString5"].ConnectionString,
                "SELECT * FROM [Category] WHERE [Category].name = @CategoryID ORDER BY NEWID()");
            SqlDataSource7.SelectParameters.Add("CategoryID", DbType.String, categoryID.ToString());
            dataList3.DataSource = SqlDataSource7;
            dataList3.DataBind();
            //
            Label lblViewCount = (Label)e.Item.FindControl("lblViewCount");
            lblViewCount.Text = "Lượt xem: " + GetViewCount(blogId).ToString();
        }    
        
    }

    protected void DataList3_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        DataRowView dataRow = (DataRowView)e.Item.DataItem;
        int categoryID = Convert.ToInt32(dataRow["id"]);

        Repeater repeater3 = (Repeater)e.Item.FindControl("Repeater3");
        SqlDataSource SqlDataSource8 = new SqlDataSource(ConfigurationManager.ConnectionStrings["Pixel_AdminConnectionString5"].ConnectionString,
            "SELECT TOP 6 [Blog].id, [Blog].name, [Blog].title, [Blog].description, [Category].name AS category_id, [Blog].updated_at, [Blog].image " +
            "FROM [Blog] INNER JOIN [Category] ON [Blog].category_id = [Category].id WHERE [Blog].category_id = @CategoryID ORDER BY NEWID()");
        SqlDataSource8.SelectParameters.Add("CategoryID", DbType.Int32, categoryID.ToString());
        repeater3.DataSource = SqlDataSource8;
        repeater3.DataBind();
    }
}