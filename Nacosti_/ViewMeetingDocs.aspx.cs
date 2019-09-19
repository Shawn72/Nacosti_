using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Nacosti_
{
    public partial class ViewMeetingDocs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var meetingtype = Session["meetType"] as string;

                var fPath = Session["viewfilepath"].ToString();
                var meetingNo = Session["meetingNo"].ToString();
                var filename = Path.GetFileName(fPath);
                var fExt = Path.GetExtension(filename);
                
                if (fExt.Equals(".pdf"))
                {
                    Response.ContentType = "pdf";
                    WebClient client = new WebClient();
                    var fileBuffer = client.DownloadData(fPath);
                    Response.Clear();
                    Response.ClearContent();
                    Response.ClearHeaders();
                    Response.Cache.SetCacheability(HttpCacheability.Private);
                    Response.CacheControl = "private";
                    Response.AddHeader("Content-Type", "application/pdf");

                    switch (meetingtype)
                    {
                        case "board":
                            viewMe.Attributes.Add("src", ResolveUrl("~/MeetingsDocs/NACOSTI/Board Meeting Card/" + meetingNo + "/" + filename));
                            break;
                        case "committee":
                            viewMe.Attributes.Add("src", ResolveUrl("~/MeetingsDocs/NACOSTI/Committee Meeting Card/" + meetingNo + "/" + filename));
                            break;
                    }
                    
                   
                    Response.AddHeader("content-length", fileBuffer.Length.ToString());
                    Response.BufferOutput = false;
                    Response.Flush();
                    Response.BinaryWrite(fileBuffer);
                    Response.Flush();
                    Response.SuppressContent = true;
                    HttpContext.Current.ApplicationInstance.CompleteRequest();
                    Response.End();
                }

                if (fExt.Equals(".docx"))
                {
                    WebClient client = new WebClient();
                    var fileBuffer = client.DownloadData(fPath);
                    new FileInfo(fPath);

                    Response.Clear();
                    Response.ClearContent();
                    Response.ClearHeaders();
                    Response.Cache.SetCacheability(HttpCacheability.Private);
                    Response.CacheControl = "private";
                    Response.AddHeader("Content-Type", "application/vnd.openxmlformats-officedocument.wordprocessingml.document");
                    Response.ContentType = "application/vnd.openxmlformats-officedocument.wordprocessingml.document";
                    Response.TransmitFile(fPath);

                    Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(fPath));
                    Response.AddHeader("content-length", fileBuffer.Length.ToString());
                    Response.BufferOutput = false;
                    Response.Flush();
                    Response.BinaryWrite(fileBuffer);
                    Response.Flush();
                    Response.SuppressContent = true;
                    HttpContext.Current.ApplicationInstance.CompleteRequest();
                    Response.End();
                   
                }

                if (fExt.Equals(".csv"))
                {
                    byte[] content = File.ReadAllBytes(fPath); 
                    Response.ContentType = "text/csv";
                    Response.AddHeader("content-disposition", "attachment; filename=" + filename + ".csv");
                    Response.TransmitFile(fPath);
                    Response.BufferOutput = true;
                    Response.OutputStream.Write(content, 0, content.Length);
                    Response.End();
                }
                if (fExt.Equals(".xls"))
                {

                    var myDocs = new FileInfo(fPath);
                    Response.Clear();
                    Response.ContentType = "application/vnd.ms-excel";
                    Response.AddHeader("content-disposition", "attachment;filename=" + myDocs.Name);
                    Response.TransmitFile(fPath);
                    Response.ContentType = "application/octet-stream";
                }
                else
                {
                    var myDocs = new FileInfo(fPath);
                    Response.Clear();
                    Response.ContentType = "application/octet-stream";
                    Response.AddHeader("content-disposition", "attachment;filename=" + myDocs.Name);
                    Response.TransmitFile(fPath);

                }
               
            }
        }
    }
}