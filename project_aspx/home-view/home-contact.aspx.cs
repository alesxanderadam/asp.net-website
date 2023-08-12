using System;

using System.Collections;

using System.Configuration;

using System.Data;

using System.Linq;

using System.Web;

using System.Web.Security;

using System.Web.UI;

using System.Web.UI.HtmlControls;

using System.Web.UI.WebControls;

using System.Web.UI.WebControls.WebParts;

using System.Xml.Linq;
using System.Net;
using System.Net.Mail;
using System.Text.RegularExpressions;


public partial class home_view_home_contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [Obsolete]
    private void SendMail(string pNoiDung, string pNguoiNhan)
    {
        
    }

    protected void btnSend_Click(object sender, EventArgs e)
    {
        
        string emailPattern = @"^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$";
        if (!Regex.IsMatch(txtEmail.Text, emailPattern))
        {
            lblThongBao.Text = "Vui lòng nhập địa chỉ email hợp lệ.";
            lblThongBao.CssClass = "alert alert-danger";
            return;
        }
        SmtpClient smtp = new SmtpClient();
        try
        {
            //ĐỊA CHỈ SMTP Server
            smtp.Host = "smtp.gmail.com";
            //Cổng SMTP
            smtp.Port = 587;
            //SMTP yêu cầu mã hóa dữ liệu theo SSL
            smtp.EnableSsl = true;
            //UserName và Password của mail
            smtp.Credentials = new NetworkCredential("19001878@lttc.edu.vn", "bolaminh140583");

            //Tham số lần lượt là địa chỉ người gửi, người nhận, tiêu đề và nội dung thư
            smtp.Send("19001878@lttc.edu.vn", txtEmail.Text, txtTieude.Text, txtNoiDung.Text);
            lblThongBao.Text = "Bạn đã gửi thông báo thành công";
            lblThongBao.CssClass = "alert alert-success";
        }
        catch (Exception ex)
        {
            lblThongBao.Text = ex.Message;
            lblThongBao.CssClass = "alert alert-danger";
        }
    }
}