using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Nacosti_
{
    public partial class Meetings_Upcoming : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadMeetingsDocs();
            Session["pastOrpresent"] = "notpastmeeting";
        }

        protected void LoadMeetingsDocs()
        {
            try
            {
                var filePaths = Directory.GetFiles(Server.MapPath("~/BoardPapers/"));

                List<ListItem> files = filePaths.Select(filePath => new ListItem(Path.GetFileName(filePath), filePath)).ToList();
                //gridViewMeetingUploads.DataSource = files;
                //gridViewMeetingUploads.DataBind();
            }
            catch (Exception)
            {
                // KCDFAlert.ShowAlert("No Uploads!");
            }

        }
    }
}