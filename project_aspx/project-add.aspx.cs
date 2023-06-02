using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class project_add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string prjName = txtPrjName.Text;
        string desc = txtDesc.Text;
        string connectionString = "Data Source=MSI\\SQLEXPRESS;Initial Catalog=Pixel_Admin;Integrated Security=True";

        SqlConnection connection = new SqlConnection(connectionString);
        connection.Open();
        string sql = "INSERT INTO Project (name, description) VALUES (@PrjName, @Description)";
        SqlCommand command = new SqlCommand(sql, connection);
        command.Parameters.AddWithValue("@PrjName", prjName);
        command.Parameters.AddWithValue("@Description", desc);

        command.ExecuteNonQuery();
        Response.Redirect("project.aspx");
    }

    
}