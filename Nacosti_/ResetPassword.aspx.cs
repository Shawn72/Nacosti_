using System;
using System.Linq;
using System.Security.Cryptography;
using System.Text;

namespace Nacosti_
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void ChangeDirectorPassword()
        {
            var dirNumber = txtDirNo.Value.Trim();
            var newpassword = NewPassword();
            var odataconn = WsConfig.ReturnNavObj();
            var name = "";
            var email = "";
            if (string.IsNullOrWhiteSpace(txtDirNo.Value.Trim()))
            {
                passchangefeedback.InnerHtml = "<div id='alert alert-danger'>Please enter your Director Number!</div>";
                return;
            }

            try
            {
                var dirinfo =
                    odataconn.Vendors.Where(c => c.No == dirNumber).ToArray();
                for (int i = 0; i < dirinfo.Count(); i++)
                {
                    var onedirinfo = dirinfo[i];
                    email = onedirinfo.E_Mail;
                    name = onedirinfo.Name;
                }
                if (string.IsNullOrWhiteSpace(email))
                {
                    passchangefeedback.InnerHtml = "<div id='alert alert-danger'>Your Email Account is not on our database!, kindly contact system admninistrator</div>";
                }
                else
                {
                    var status = WsConfig.ObjNav.FnResetPassword(dirNumber, newpassword);
                    var info = status.Split('*');
                    SendNewPassword(email, name, newpassword);
                    passchangefeedback.InnerHtml = "<div class='alert alert-" + info[0] + "'>" + info[1] + "</div>";
                }
            }
            catch (Exception exception)
            {
                passchangefeedback.InnerHtml = "<div id='alert alert-danger'>" + exception.Message + "</div>";
            }
        }
        protected string NewPassword()
        {
            var nPwd = "";
            var rdmNumber = new Random();
            nPwd = rdmNumber.Next(1000, 1999).ToString();
            return nPwd;
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

        protected void SendNewPassword(string myEmail, string myName, string myPassword)
        {
            //begin send email to VC now, down here
            const string mSubject = @"Request password Reset";
            string emailbody = "Dear " + myName + "<br/>";
            emailbody += "<br />You have reset you password successfully. Your new Password is " + myPassword + ". Kindly go to Login";
            emailbody += "<br /><br />Thank you";
            //send email to user
             WsConfig.MailFunction(emailbody, myEmail, mSubject);
        }

        protected void btnResetPassword_OnClick(object sender, EventArgs e)
        {
            ChangeDirectorPassword();
        }
    }
}