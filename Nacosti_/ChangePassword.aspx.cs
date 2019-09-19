using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Nacosti_
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //String customerNo = (String)Session["directorNo"];
            //if (string.IsNullOrEmpty(customerNo))
            //{
            //    Response.Redirect("Dashboard.aspx");
            //}
            //try
            //{
            //    Boolean logout = Convert.ToBoolean(Session["logout"]);
            //    if (logout)
            //    {
            //        Response.Redirect("Login");
            //    }
            //}
            //catch (Exception) { }
        }

        protected void btnResetPasss_OnClick(object sender, EventArgs e)
        {
            var customerNo = (string)Session["username"];
            var tCurrentPassword = password.Text.Trim();
            var tNewPassword = newPassord.Text.Trim();
            var tConfirmPassword = confirmPassword.Text.Trim();

            //var hasNumber = new Regex(@"[0-9]+");
            //var hasUpperChar = new Regex(@"[A-Z]+");
            var hasMiniMaxChars = new Regex(@".{4,8}");
            //var hasLowerChar = new Regex(@"[a-z]+");
            //var hasSymbols = new Regex(@"[!@#$%^&*()_+=\[{\]};:<>|./?,-]");


            if (string.IsNullOrEmpty(customerNo))
            {
                feedback.InnerHtml = "<div class='alert alert-danger'>Seems you are not logged in. Kindly log in again.</div>";
                return;
            }
            if (string.IsNullOrWhiteSpace(tCurrentPassword) || string.IsNullOrWhiteSpace(tNewPassword))
            {
                feedback.InnerHtml = "<div class='alert alert-danger'>Password  fields should not be empty!!</div>";
                return;
            }
            //if (!hasLowerChar.IsMatch(tConfirmPassword))
            //{
            //    feedback.InnerHtml = "<div class='alert alert-danger'>Password should contain Atleast one lower case letter</div>";
            //    return;
            //}
            //if (!hasUpperChar.IsMatch(tConfirmPassword))
            //{
            //    feedback.InnerHtml = "<div class='alert alert-danger'>Password should contain Atleast one upper case letter</div>";
            //    return;
            //}
            if (!hasMiniMaxChars.IsMatch(tConfirmPassword))
            {
                feedback.InnerHtml = "<div class='alert alert-danger'>Password should be between 4 and 8 characters</div>";
                return;
            }
            // if (!hasNumber.IsMatch(tConfirmPassword))
            //{
            //    feedback.InnerHtml = "<div class='alert alert-danger'>Password should contain Atleast one numeric value</div>";
            //    return;
            //}

            // if (!hasSymbols.IsMatch(tConfirmPassword))
            //{
            //    feedback.InnerHtml = "<div class='alert alert-danger'>Password should contain Atleast one special case characters</div>";
            //    return;
            //}
            else
            {
                if (tNewPassword == tConfirmPassword)
                {
                    if (tNewPassword.Length < 4)
                    {
                        feedback.InnerHtml = "<div class='alert alert-danger'>New password is too short.</div>";
                    }
                    else
                    {
                        var status = WsConfig.ObjNav.ChangePassword(customerNo, tCurrentPassword, tNewPassword, tConfirmPassword);
                        var info = status.Split('*');
                        if (info[0] == "success")
                        {
                            Session["changedPassword"] = true;
                            //Session["logout"] = true;
                            // Response.Redirect("Login.aspx");
                            // feedback.InnerHtml = "<div class='alert alert-" + info[0] + "'>" + info[1] + "</div>";

                        }
                        feedback.InnerHtml = "<div class='alert alert-" + info[0] + "'>" + info[1] + "</div>";
                    }
                }
                else
                {
                    feedback.InnerHtml = "<div class='alert alert-danger'>New password does not match confirm password.</div>";
                }
            }
        }
    }
}