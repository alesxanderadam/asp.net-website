using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class home_view_home_search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Lấy giá trị của tham số 'q' từ query string và giải mã (nếu có)
        
        if (Request.QueryString["q"] != null)
        {
            string searchValue = Server.UrlDecode(Request.QueryString["q"]);
            txtSearch.Text = searchValue;
        }
    }



    protected void Button1_Click(object sender, EventArgs e)
    {

    }
}