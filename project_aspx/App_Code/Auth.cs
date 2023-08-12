using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Auth
/// </summary>
public class Auth
{
    public Auth()
    {
     
    }

    public bool IsInforUserCookieExists()
    {
        return HttpContext.Current.Request.Cookies["InforUser"].Value != null;
    }


}