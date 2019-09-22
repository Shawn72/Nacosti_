using System;

namespace Nacosti_
{
    public partial class Resolutions_Pdf : System.Web.UI.Page
    {
        public string MeetingCode = "";
        public string MeetingType = "";
        protected void Page_Load(object sender, EventArgs e)
        {
             MeetingCode = Request.QueryString["meeting"];
             MeetingType = Request.QueryString["meettype"];
            
        }

        protected void btnViewResolution_OnClick(object sender, EventArgs e)
        {
            GenerateResolvedPdf();
        }
        protected void GenerateResolvedPdf(){
            
            try
            {
                switch (MeetingType)
                {
                    case "board":
                        var statusB = WsConfig.ObjNav.GenerateMeetingResolutions(MeetingCode);
                        var splitstatusB = statusB.Split('*');
                        switch (splitstatusB[0])
                        {
                            case "success":
                                displayRes.Attributes.Add("src", ResolveUrl("~/Downloads/Resolutions/" + string.Format("{0}.pdf", MeetingCode)));
                                resolutionfeedback.InnerHtml = "<div class ='alert alert-success'>Meeting Resolutions generated successfully!</div>";
                                break;
                            default:
                                resolutionfeedback.InnerHtml = "<div class ='alert alert-danger'>" + splitstatusB[1] + "</div>";
                                break;

                        }

                        break;

                    case "committee":
                        var status = WsConfig.ObjNav.GenerateCommitteeResolutions(MeetingCode);
                        var splitstatus = status.Split('*');
                        switch (splitstatus[0])
                        {
                            case "success":
                                displayRes.Attributes.Add("src", ResolveUrl("~/Downloads/Resolutions/" + string.Format("{0}.pdf", MeetingCode)));
                                resolutionfeedback.InnerHtml = "<div class ='alert alert-success'>Meeting Resolutions generated successfully!</div>";
                                break;
                            default:
                                resolutionfeedback.InnerHtml = "<div class ='alert alert-danger'>" + splitstatus[1] + "</div>";
                                break;

                        }

                      break;
                }
                
            }
            catch (Exception exp)
            {
                //Handle exception
                resolutionfeedback.InnerHtml = exp.Message;
            }
        }
    }
}