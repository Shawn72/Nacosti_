﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Providers.Entities;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Nacosti_
{
    public partial class Meetings : System.Web.UI.Page
    {
        public string Meetingcode = "";
        public string Pastornot = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Session["name"].ToString()) &&
                !string.IsNullOrEmpty(Session["directorNo"].ToString()))
            {

                try
                {
                    Meetingcode = Request.QueryString["meeting"];
                    if (string.IsNullOrEmpty(Meetingcode))
                        throw new Exception();
                    LoadMeetingsDocs(Meetingcode);
                   // Session["pastOrpresent"] = "notpastmeeting";
                    Pastornot = (string)Session["pastOrpresent"];
                }
                catch (Exception)
                {
                    Response.Redirect("Dashboard.aspx");
                }
                if (!string.IsNullOrEmpty((string) Session["feedback"]))
                {
                    feedback.InnerHtml = (string) Session["feedback"];
                    Session["feedback"] = null;

                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void yes_click(object sender, EventArgs e)
        {
            //try
            //{
            //    String voteItem = Request.QueryString["voteitem"];
            //    String status = Config.ObjNav.Vote(voteItem, (String)Session["directorNo"], 0);
            //    String[] info = status.Split('*');
            //    Session["feedback"] = "<div class='alert alert-" + info[0] + "'>" + info[1] + "</div>";
            //    Response.Redirect("Meeting.aspx?meeting=" + Request.QueryString["meeting"]);
            //}
            //catch (Exception ex)
            //{
            //    Session["feedback"] = "<div class='alert alert-danger'>" + ex.Message + "</div>";
            //}
        }

        protected void abstain_click(object sender, EventArgs e)
        {
            //try
            //{
            //    String voteItem = Request.QueryString["voteitem"];
            //    String status = Config.ObjNav.Vote(voteItem, (String)Session["directorNo"], 2);
            //    String[] info = status.Split('*');
            //    Session["feedback"] = "<div class='alert alert-" + info[0] + "'>" + info[1] + "</div>";
            //    Response.Redirect("Meeting.aspx?meeting=" + Request.QueryString["meeting"]);
            //}
            //catch (Exception ex)
            //{
            //    Session["feedback"] = "<div class='alert alert-danger'>" + ex.Message + "</div>";
            //}
        }

        protected void no_click(object sender, EventArgs e)
        {
            //try
            //{
            //    String voteItem = Request.QueryString["voteitem"];
            //    String status = Config.ObjNav.Vote(voteItem, (String)Session["directorNo"], 1);
            //    String[] info = status.Split('*');
            //    Session["feedback"] = "<div class='alert alert-" + info[0] + "'>" + info[1] + "</div>";
            //    Response.Redirect("Meeting.aspx?meeting=" + Request.QueryString["meeting"]);
            //}
            //catch (Exception ex)
            //{
            //    Session["feedback"] = "<div class='alert alert-danger'>" + ex.Message + "</div>";
            //}
        }

        protected void LoadMeetingsDocs(string meetingNo)
        {
            try
            {
                var filePaths = Directory.GetFiles(Server.MapPath("~/MeetingsDocs/NACOSTI/Board Meeting Card/" + meetingNo + "/"));
               
                List<ListItem> files = new List<ListItem>();
                foreach (string filePath in filePaths)
                {
                    files.Add(new ListItem(Path.GetFileName(filePath), filePath));
                }
                gridViewMeetingsUploads.DataSource = files;
                gridViewMeetingsUploads.DataBind();
            }
            catch (Exception)
            {
                //IGNORE: to do here
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
            Session["meetingNo"] = Meetingcode;
            Session["meetType"] = "board";
            Response.Redirect("ViewMeetingDocs.aspx");
        }

        protected void btnSaveComment_OnClick(object sender, EventArgs e)
        {
          //  meetingcode = Request.QueryString["meeting"];
            var director = (String)Session["directorNo"];
            string myComment = txtareaComment.Text.Trim();

            if (String.IsNullOrWhiteSpace(myComment))
            {
                commentfeedback.InnerHtml =
                    "<div class='alert alert-danger'>You can't save empty comment, write something!</div>";
                return;
            }
            string status = WsConfig.ObjNav.FnInsertComment(Meetingcode, director, myComment);
            var info = status.Split('*');
            commentfeedback.InnerHtml = "<div class='alert alert-" + info[0] + "'>" + info[1] + "</div>";
            txtareaComment.Text = "";
            LoadMeetingsDocs(Meetingcode);
        }
    }
}