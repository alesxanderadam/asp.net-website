using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Configuration;

public partial class home_view_home_single : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    

    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            DataRowView dataRow = (DataRowView)e.Item.DataItem;
            string categoryID = dataRow["category_id"].ToString();

            DataList dataList3 = (DataList)e.Item.FindControl("DataList3");
            SqlDataSource SqlDataSource7 = new SqlDataSource(ConfigurationManager.ConnectionStrings["Pixel_AdminConnectionString5"].ConnectionString,
                "SELECT * FROM [Category] WHERE [Category].name = @CategoryID ORDER BY NEWID()");
            SqlDataSource7.SelectParameters.Add("CategoryID", DbType.String, categoryID.ToString());
            dataList3.DataSource = SqlDataSource7;
            dataList3.DataBind();
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