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
                // LoadMeetingsDocs();
                if (!IsPostBack)
                {
                    LoadDocumentTree();
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }

        }

        protected void LoadDocumentTree()
        {
            DirectoryInfo rootInfo = new DirectoryInfo(Server.MapPath("~/Documents/"));
            PopulateTreeView(rootInfo, null);
        }

        private void PopulateTreeView(DirectoryInfo dirInfo, TreeNode treeNode)
        {
            foreach (DirectoryInfo directory in dirInfo.GetDirectories())
            {
                TreeNode directoryNode = new TreeNode
                {
                    Text = directory.Name,
                    Value = directory.FullName
                };

                if (treeNode == null)
                {
                    //If Root Node, add to TreeView.
                    treeView1.Nodes.Add(directoryNode);
                    treeView1.CollapseAll(); //start Parent Tree folder collapsed
                }
                else
                {
                    //If Child Node, add to Parent Node.
                    treeNode.ChildNodes.Add(directoryNode);
                }

                //Get all files in the Directory.
                foreach (FileInfo file in directory.GetFiles())
                {
                    //Add each file as Child Node.
                    TreeNode fileNode = new TreeNode
                    {
                        Text = file.Name,
                        Value = file.FullName,
                        Target = "_blank",
                        NavigateUrl = (new Uri(Server.MapPath("~/"))).MakeRelativeUri(new Uri(file.FullName)).ToString()
                    };
                    directoryNode.ChildNodes.Add(fileNode);
                    directoryNode.CollapseAll();
                }

                PopulateTreeView(directory, directoryNode);
                directoryNode.SelectAction = TreeNodeSelectAction.None; //Make Parent node Directory unclickable
            }
        }

        //protected void LoadMeetingsDocs()
        //{
        //    try
        //    {
        //        string[] filePaths = Directory.GetFiles(Server.MapPath("~/Documents/"));

        //        List<ListItem> files = filePaths.Select(filePath => new ListItem(Path.GetFileName(filePath), filePath)).ToList();
        //        gridViewImportantUploads.DataSource = files;
        //        gridViewImportantUploads.DataBind();
        //    }
        //    catch (Exception)
        //    {
        //        // KCDFAlert.ShowAlert("No Uploads!");
        //    }

        //}

        //protected void DownloadFile(object sender, EventArgs e)
        //{
        //    var linkButton = sender as LinkButton;
        //    if (linkButton != null)
        //    {
        //        string filePath = linkButton.CommandArgument;
        //        Response.ContentType = ContentType;
        //        Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
        //        Response.WriteFile(filePath);
        //    }
        //    Response.End();
        //}

        //protected void lnkViewDoc_OnClick(object sender, EventArgs e)
        //{
        //    var linkButton = sender as LinkButton;
        //    if (linkButton != null)
        //    {
        //        string filePath = linkButton.CommandArgument;
        //        Session["viewfilepath"] = filePath;
        //    }
        //    Response.Redirect("ViewMeetingsDocs_General.aspx");
        //}
    }
}