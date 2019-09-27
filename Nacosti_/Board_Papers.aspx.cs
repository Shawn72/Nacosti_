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
    public partial class Board_Papers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Session["name"].ToString()) &&
                !string.IsNullOrEmpty(Session["directorNo"].ToString()))
            {
                // LoadBoardDocs();
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
            DirectoryInfo rootInfo = new DirectoryInfo(Server.MapPath("~/BoardPapers/"));
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

        //protected void LoadBoardDocs()
        //{
        //    try
        //    {
        //        string[] filePaths = Directory.GetFiles(Server.MapPath("~/BoardPapers/"));

        //        List<ListItem> files = new List<ListItem>();
        //        foreach (string filePath in filePaths)
        //        {
        //            files.Add(new ListItem(Path.GetFileName(filePath), filePath));
        //        }
        //        gridBoarPapersUploads.DataSource = files;
        //        gridBoarPapersUploads.DataBind();
        //    }
        //    catch (Exception)
        //    {
        //        //TODO: ignore exception
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
        //    var filePath = "";
        //    var linkButton = sender as LinkButton;
        //    if (linkButton != null)
        //        filePath = linkButton.CommandArgument;
        //    var filename = Path.GetFileName(filePath);
            
        //    Response.ContentType = "pdf";
        //    WebClient client = new WebClient();
        //    var fileBuffer = client.DownloadData(filePath);
        //    Response.Clear();
        //    Response.ClearContent();
        //    Response.ClearHeaders();
        //    Response.Cache.SetCacheability(HttpCacheability.Private);
        //    Response.CacheControl = "private";
        //    Response.AddHeader("Content-Type", "application/pdf");
        //    viewMe.Attributes.Add("src", ResolveUrl("~/BoardPapers/" + filename));

        //    Response.AddHeader("content-length", fileBuffer.Length.ToString());
        //    Response.BufferOutput = false;
        //    Response.Flush();
        //    Response.BinaryWrite(fileBuffer);
        //    Response.Flush();
        //    Response.SuppressContent = true;
        //    HttpContext.Current.ApplicationInstance.CompleteRequest();
        //    Response.End();
        //}
    }
}