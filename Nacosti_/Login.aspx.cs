using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Nacosti_.webPortal;

namespace Nacosti_
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void FnLogin(string dirNumber, string password)
        {
            if (string.IsNullOrEmpty(dirNumber) || string.IsNullOrEmpty(password))
                feedback.InnerHtml = "<div class='alert alert-danger'>Username and password are required fields</div>";
            else
            {
                //try
                //{
                var wsconnection = WsConfig.ObjNav;
                var odataconn = WsConfig.ReturnNavObj();
                var loginstatus = wsconnection.FnLogin(dirNumber, password);
                var info = loginstatus.Split('*');
                switch (info[0])
                {
                    case "success":
                        //check if member is a director
                        var vendors =
                            odataconn.Vendors.Where(r => r.No == dirNumber).ToList();
                        foreach (var onevendor in vendors)
                        {
                                Session["name"] = onevendor.Name;
                                Session["directorNo"] = onevendor.No;  
                        }
                        //for (int i = 0; i < vendors.Count(); i++)
                        //{
                        //    var onevendor = vendors[i];

                        //    Session["name"] = onevendor.Name;
                        //    Session["directorNo"] = onevendor.No;
                        //    //var usertype = Convert.ToInt32(onevendor.usertype);
                        //    //Session["usertype"] = usertype;
                        //}
                        Response.Redirect("Dashboard.aspx");
                        break;
                    default:
                        feedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + "</div>";
                        break;
                    }
                //}
                //catch (Exception ex)
                //{
                //    // ignored
                //    feedback.InnerHtml = "<div class='alert alert-danger'>" + ex.Message + "</div>";
                //}
            }
        }

        static string EncryptP(string mypass)
        {
            //encryptpassword:
            using (MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider())
            {
                UTF8Encoding utf8 = new UTF8Encoding();
                byte[] data = md5.ComputeHash(utf8.GetBytes(mypass));
                return Convert.ToBase64String(data);
            }
        }

        protected void btnLogin_OnClick(object sender, EventArgs e)
        {
            var myUsername = txtUsername.Value.Trim();
            var myPassword = txtPassword.Value.Trim();
            FnLogin(myUsername, myPassword);
        }
    }
}