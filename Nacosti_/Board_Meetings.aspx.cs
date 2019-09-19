using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Nacosti_
{
    public partial class Board_Commitees : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var committeCode = "";
            var odataconn = WsConfig.ReturnNavObj();
            try
            {
                committeCode = Request.QueryString["comm"];
                if (string.IsNullOrEmpty(committeCode))
                {
                    throw new Exception();
                }
                //check user is  in the committee
                var committe =
                    odataconn.CommitteeBoardMembers.Where(
                        r =>
                            r.Committee.Equals(committeCode) &&
                            r.Director_No == (string)Session["directorNo"]);
                Boolean allowed = false;
                foreach (var comm in committe)
                {
                    allowed = true;
                }
                if (!allowed)
                {
                    Response.Redirect("Dashboard.aspx");
                }
            }
            catch (Exception)
            {
                Response.Redirect("Dashboard.aspx");
            }

        }

    }
}
