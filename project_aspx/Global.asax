<%@ Application Language="C#" %>
<%@ Import Namespace="project_aspx" %>
<%@ Import Namespace="System.Web.Optimization" %>
<%@ Import Namespace="System.Web.Routing" %>

<script RunAt="server">

    void Application_Start(object sender, EventArgs e)
    {
        RouteConfig.RegisterRoutes(RouteTable.Routes);
        //UserLoggedIn();
    }

    //private bool UserLoggedIn()
    //{
    //    Cookie cookie = new Cookie();
    //    string email = cookie.GetCookieValue(Request, "Email");
    //    if (!string.IsNullOrEmpty(email))
    //    {
    //        Response.Redirect("~/dashboard");
    //        return true;
    //    }
    //    return false;
    //}



</script>
