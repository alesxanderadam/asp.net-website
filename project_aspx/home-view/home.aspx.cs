using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class home_view_home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Repeater4_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            DataRowView dataRow = (DataRowView)e.Item.DataItem;
            int categoryID = Convert.ToInt32(dataRow["id"]);
            Repeater repeater8 = (Repeater)e.Item.FindControl("Repeater8");
            SqlDataSource SqlDataSource7 = new SqlDataSource(ConfigurationManager.ConnectionStrings["Pixel_AdminConnectionString5"].ConnectionString,
                "SELECT TOP 6 [Blog].id, [Blog].name, [Blog].title, [Blog].description, [Category].name AS category_id, [Blog].updated_at, [Blog].image " +
                "FROM [Blog] INNER JOIN [Category] ON [Blog].category_id = [Category].id WHERE [Blog].category_id = @CategoryID ORDER BY NEWID()");
            SqlDataSource7.SelectParameters.Add("CategoryID", DbType.Int32, categoryID.ToString());
            repeater8.DataSource = SqlDataSource7;
            repeater8.DataBind();
        }
    }
}