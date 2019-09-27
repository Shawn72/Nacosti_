using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Nacosti_
{
    public partial class Meetings_Summary : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            PastBoardMeetings();
            PastCommiteeMeetings();
        }

        public string PastBoardMeetings()
        {
            string myPastmeet = "";
            var count = 0;
            try
            {
                var odataconn = WsConfig.ReturnNavObj();
                var mycommittees =
                    odataconn.CommitteeBoardMembers.Where(r => r.Director_No == Session["directorNo"] as string);
                foreach (var committee in mycommittees)
                {
                    var committeeCode = committee.Committee;
                    var committeeDetails = odataconn.allBoards.ToList().Where(m=>m.Code== committeeCode);
                    foreach (var committeeDetail in committeeDetails)
                    {
                        count++;
                        var meetingCount = WsConfig.ObjNav.FnCountBoardMeetings(committeeCode);
                        myPastmeet += string.Format(
                        "<tr>" +
                        "<td>{0}</td>" +
                        "<td><a href = 'Meetings_FilterbyCode.aspx?commcode={1}&&mtype=aBoard&&boardDescr={2}'>{2}</a></td>" +
                        "<td>{3}</td>" +
                        "</tr>", count, committeeDetail.Code, committeeDetail.Description, meetingCount);
                    }
                  }
                }
            catch (Exception)
            {
                // ignored
            }
            return myPastmeet;
        }

        public string PastCommiteeMeetings()
        {
            string myPastmeet = "";
            var count = 0;
            try
            {
                var odataconn = WsConfig.ReturnNavObj();
                var mycommittees = odataconn.CommitteeBoardMembers.Where(r => r.Director_No == Session["directorNo"] as string);
                foreach (var committee in mycommittees)
                {
                    var committeeCode = committee.Committee;
                    var committeeDetails = odataconn.Committees.ToList().Where(m => m.Code == committeeCode);
                    foreach (var committeeDetail in committeeDetails)
                    {
                        count++;
                        var meetingCount = WsConfig.ObjNav.FnCountCommitteeMeetings(committeeCode);
                        myPastmeet += string.Format(
                        "<tr>" +
                        "<td>{0}</td>" +
                        "<td><a href = 'Meetings_FilterbyCode.aspx?commcode={1}&&mtype=aCommt&&boardDescr={2}'>{2}</a></td>" +
                        "<td>{3}</td>" +
                        "</tr>", count, committeeDetail.Code, committeeDetail.Description, meetingCount);
                    }
                }
            }
            catch (Exception)
            {
                // ignored
            }
            return myPastmeet;
        }
    }
}