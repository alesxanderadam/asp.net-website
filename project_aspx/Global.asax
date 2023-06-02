<%@ Application Language="C#" %>
<%@ Import Namespace="project_aspx" %>
<%@ Import Namespace="System.Web.Optimization" %>
<%@ Import Namespace="System.Web.Routing" %>

<script runat="server">

        void Application_Start(object sender, EventArgs e)
        {
            RouteConfig.RegisterRoutes(RouteTable.Routes);

            // Kiểm tra xem người dùng đã đăng nhập hay chưa
            //if (!UserLoggedIn())
            //{
            //    // Nếu chưa đăng nhập, chuyển hướng đến trang đăng nhập
            //    Response.Redirect("~/signIn.aspx");
        }

    //private bool UserLoggedIn()
    //{
    //    HttpRequest request = new HttpRequest();
    //    Cookie cookie = new Cookie();
    //    string email = cookie.GetCookieValue(Request,"Email");
    //    return !string.IsNullOrEmpty(email);
    //}



</script>
