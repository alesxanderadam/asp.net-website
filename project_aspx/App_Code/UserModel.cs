using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for UserModel
/// </summary>
public class UserModel
{
    public UserModel()
    {
       
    }
    public int Id { get; set; }
    public string Fullname { get; set; }
    public string Email { get; set; }
    public string Password { get; set; }
    public string Avartar { get; set; }
    public int Role_id { get; set; }

}