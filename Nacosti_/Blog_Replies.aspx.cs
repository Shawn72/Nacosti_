using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Nacosti_
{
    public partial class Blog_Replies : System.Web.UI.Page
    {
        public int blogId = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
             blogId = Convert.ToInt32(Request.QueryString["blogId"]);
            LoadForums();
        }

        public void LoadForums()
        {
            var odataconn = WsConfig.ReturnNavObj();

            var forumBlogs = odataconn.boardBlog.Where(r => r.Blog_Id == blogId).ToList()
                .OrderByDescending(m => m.Date_Created);
            foreach (var oneblog in forumBlogs)
            {
                txtForumTitle.Text = oneblog.Blog_Title;
                txtareaForumComment.Text = oneblog.Blog_Body;
            }
        }

        protected void btnSaveReply_OnClick(object sender, EventArgs e)
        {
            var director = (string)Session["directorNo"];
            var dirName = Session["name"].ToString();
            var myForumreply = txtForumReply.Text.Trim();

            if (string.IsNullOrWhiteSpace(myForumreply))
            {
                forumfeedback.InnerHtml =
                    "<div class='alert alert-danger'>You can't save empty reply text, type something!</div>";
                txtareaForumComment.Focus();
                return;
            }
            var status = WsConfig.ObjNav.FnInsertBlogReply(myForumreply, director, dirName, blogId);
            var info = status.Split('*');
            forumfeedback.InnerHtml = "<div class='alert alert-" + info[0] + "'>" + info[1] + "</div>";
            txtForumReply.Text = "";
        }
    }
}