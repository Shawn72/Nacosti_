using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Nacosti_
{
    public partial class Board_Resolutions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Meetings_Resolution();

        }

        public string Meetings_Resolution()
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
                    var committeeMeetings =
                        odataconn.boardMeetings.ToList()
                            .OrderByDescending(t => t.Start_date)
                            .Where(r => r.Meeting_group_Code == committeeCode && r.Start_date < DateTime.Today && r.Status == "Completed");

                    foreach (var meeting in committeeMeetings)
                    {
                        count++;
                        myPastmeet += string.Format("<tr>" +
                                                    "<td>{0}</td>" +
                                                    "<td><a href = 'Resolutions_Pdf.aspx?meeting={1}&&meettype=board'>{2}</a></td>" +
                                                    "<td>{3}</td>" +
                                                    "<td>{4}</td>" +
                                                    "<td>{5}</td>" +
                                                    "</tr>", count, meeting.No, meeting.No, Convert.ToDateTime(meeting.End_Date).ToString("dd/MM/yyyy"), meeting.End_time, meeting.Venue_Location);
                    }
                }
            }
            catch (Exception)
            {
                // ignored

            }
            return myPastmeet;
        }

        public string CommiteeMeetings_Resolution()
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
                    var committeeMeetings =
                        odataconn.committeeMeetings.ToList()
                            .OrderByDescending(t => t.Start_date)
                            .Where(r => r.Meeting_group_Code == committeeCode && r.Start_date < DateTime.Today && r.Status == "Completed");

                    foreach (var meeting in committeeMeetings)
                    {
                        count++;
                        myPastmeet += string.Format("<tr>" +
                                                    "<td>{0}</td>" +
                                                    "<td><a href = 'Resolutions_Pdf.aspx?meeting={1}&&meettype=committee'>{2}</a></td>" +
                                                    "<td>{3}</td>" +
                                                    "<td>{4}</td>" +
                                                    "<td>{5}</td>" +
                                                    "</tr>", count, meeting.No, meeting.No, Convert.ToDateTime(meeting.End_Date).ToString("dd/MM/yyyy"), meeting.End_time, meeting.Venue_Location);
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