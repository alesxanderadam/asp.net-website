using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Contact : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            exampleGridView.DataBind();
        }
    }

    protected string GetRoleName(object role_id)
    {
        string roleName = string.Empty;
        int roleId;

        if (role_id != null && int.TryParse(role_id.ToString(), out roleId))
        {
            using (SqlConnection connection = new SqlConnection("Data Source=MSI\\SQLEXPRESS;Initial Catalog=Pixel_Admin;Integrated Security=True"))
            {
                connection.Open();

                SqlCommand command = new SqlCommand("SELECT name FROM role WHERE id = @roleId", connection);
                command.Parameters.AddWithValue("@roleId", roleId);

                object result = command.ExecuteScalar();

                if (result != null)
                {
                    roleName = result.ToString();
                }
            }
        }

        return roleName;
    }
}