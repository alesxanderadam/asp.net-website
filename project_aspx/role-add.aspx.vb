Imports System.Data.SqlClient

Partial Class role_add
    Inherits System.Web.UI.Page

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        Dim roleName As String = txtRoleName.Text
        Dim description As String = txtDesc.Text

        Dim connectionString As String = "Data Source=TIMNGUYEN\SQLEXPRESS;Initial Catalog=Pixel_Admin;Integrated Security=True"

        ' Tạo kết nối
        Using connection As New SqlConnection(connectionString)
            ' Mở kết nối
            connection.Open()

            ' Tạo câu lệnh SQL để chèn dữ liệu
            Dim sql As String = "INSERT INTO Role (name, description) VALUES (@RoleName, @Description)"

            ' Tạo đối tượng SqlCommand
            Using command As New SqlCommand(sql, connection)
                ' Thêm các tham số vào câu lệnh SQL
                command.Parameters.AddWithValue("@RoleName", roleName)
                command.Parameters.AddWithValue("@Description", description)

                ' Thực thi câu lệnh SQL
                command.ExecuteNonQuery()
            End Using
        End Using
        Response.Redirect("role.aspx")
    End Sub
End Class
