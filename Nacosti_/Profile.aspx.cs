using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Nacosti_
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnResetPasss_OnClick(object sender, EventArgs e)
        {
            var customerNo = Session["directorNo"] as string;
            var tCurrentPassword = oldpassword.Value.Trim();
            var tNewPassword = newpassword.Value.Trim();
            var tConfirmPassword = confirmnewpassword.Value.Trim();
            var confirmValue = Request.Form["confirm_value"];
            var responseText = "";

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
          
            if (!hasMiniMaxChars.IsMatch(tConfirmPassword))
            {
                feedback.InnerHtml = "<div class='alert alert-danger'>Password should be between 4 and 8 characters</div>";
                return;
            }
        
            if (tNewPassword == tConfirmPassword)
            {
                if (tNewPassword.Length < 4)
                {
                    feedback.InnerHtml = "<div class='alert alert-danger'>New password is too short.</div>";
                    return;
                }
                var status =
                    WsConfig.ObjNav.ChangePassword(customerNo, tCurrentPassword, tNewPassword,
                        tConfirmPassword);
                var info = status.Split('*');
                switch (info[0])
                {
                    case "success":
                        Session["changedPassword"] = true;
                        responseText = "success*Password Change was successful*" + info[1];
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "alert", "popSweetAlert(" + responseText + ");", true);
                        break;
                    default:
                        responseText = "danger*Password Change Failed!*" + info[1];
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "alert", "popSweetAlert(" + responseText + ");", true);
                        break;
                }
            }
            else
            {
                feedback.InnerHtml = "<div class='alert alert-danger'>New password does not match confirm password.</div>";
                //ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "showAlert('" + status + "');", true);
            }

        }
    }
}