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
            smtp.Credentials = new NetworkCredential("akq15721@omeie.com", "");

            //Tham số lần lượt là địa chỉ người gửi, người nhận, tiêu đề và nội dung thư
            smtp.Send("minhsutrolai2@gmail.com", txtName.Text, txtTieude.Text, txtNoiDung.Text);
            lblThongBao.Text = "Sent.";
        }
        catch (Exception ex)
        {
            lblThongBao.Text = ex.Message;
        }
    }
}