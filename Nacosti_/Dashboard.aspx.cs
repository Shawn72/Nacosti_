using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Nacosti_
{
    public partial class Dashboard : System.Web.UI.Page
    {
        public string MeetingCode = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Session["name"].ToString()) &&
                !string.IsNullOrEmpty(Session["directorNo"].ToString()))
            {
                LoadMeetingsDocs();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }

        }
        protected void LoadMeetingsDocs()
        {
            try
            {
                string[] filePaths = Directory.GetFiles(Server.MapPath("~/Documents/"));

                List<ListItem> files = filePaths.Select(filePath => new ListItem(Path.GetFileName(filePath), filePath)).ToList();
                gridViewImportantUploads.DataSource = files;
                gridViewImportantUploads.DataBind();
            }
            catch (Exception)
            {
                // KCDFAlert.ShowAlert("No Uploads!");
            }

        }
        protected void DownloadFile(object sender, EventArgs e)
        {
            var linkButton = sender as LinkButton;
            if (linkButton != null)
            {
                string filePath = linkButton.CommandArgument;
                Response.ContentType = ContentType;
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
                Response.WriteFile(filePath);
            }
            Response.End();
        }

        protected void lnkViewDoc_OnClick(object sender, EventArgs e)
        {
            var linkButton = sender as LinkButton;
            if (linkButton != null)
            {
                string filePath = linkButton.CommandArgument;
                Session["viewfilepath"] = filePath;
            }
            Response.Redirect("ViewMeetingsDocs_General.aspx");
        }
    }
}