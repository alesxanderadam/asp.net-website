using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class home_view_home_category : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int CateId = getCateIdParam();
        }
    }
    protected int getCateIdParam()
    {
        string cateId = Request.Params["id"]; 
        int cateIdValue;

        if (!string.IsNullOrEmpty(cateId) && int.TryParse(cateId, out cateIdValue))
        {
            return cateIdValue;
        }
        // Xử lý khi ID không hợp lệ
        Response.Redirect("home.aspx");
        return 0;
    }

   
    
}