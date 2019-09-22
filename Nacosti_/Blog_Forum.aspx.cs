using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Nacosti_
{
    public partial class Blog_Forum : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSaveForum_OnClick(object sender, EventArgs e)
        {
           
            var director = (string)Session["directorNo"];
            var dirName = Session["name"].ToString();
            var forumTitle = txtForumTitle.Text.Trim();
            var myForum = txtareaForumComment.Text.Trim();

            if (string.IsNullOrWhiteSpace(forumTitle))
            {
                forumfeedback.InnerHtml =
                    "<div class='alert alert-danger'>You can't save empty forum title, give it a title!</div>";
                txtForumTitle.Focus();
                return;
            }

            if (string.IsNullOrWhiteSpace(myForum))
            {
                forumfeedback.InnerHtml =
                    "<div class='alert alert-danger'>You can't save empty forum text, type something!</div>";
                txtareaForumComment.Focus();
                return;
            }
            var status = WsConfig.ObjNav.FnInsertBlog(forumTitle, myForum, director, dirName);
            var info = status.Split('*');
            forumfeedback.InnerHtml = "<div class='alert alert-" + info[0] + "'>" + info[1] + "</div>";
            txtForumTitle.Text = "";
            txtareaForumComment.Text = "";
            
        }

      
    }
}