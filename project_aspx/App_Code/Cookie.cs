using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Cookie
/// </summary>
public class Cookie
{
    public Cookie(){}

    public void SetCookie(HttpResponse Response , string cookieName, string cookieValue, int expirationDays)
    {
        HttpCookie cookie = new HttpCookie(cookieName, cookieValue);
        cookie.Expires = DateTime.Now.AddDays(expirationDays);
        Response.Cookies.Add(cookie);
    }

    public string GetCookieValue(HttpRequest Request ,string cookieName)
    {
        HttpCookie cookie = Request.Cookies[cookieName];
        if (cookie != null)
        {
            return cookie.Value;
        }
        else
        {
            return string.Empty;
        }
    }

    public void DeleteCookie(HttpResponse Response, string cookieName)
    {
        HttpCookie cookie = new HttpCookie(cookieName);
        cookie.Expires = DateTime.Now.AddDays(-1);
        Response.Cookies.Add(cookie);
    }
}