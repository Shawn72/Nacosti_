using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Nacosti_
{
    public partial class Meetings_Past : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            PastMeetings();
            PastCommiteeMeetings();
            Session["pastOrpresent"] = "pastmeeting";
        }

        public string PastMeetings()
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
                        myPastmeet += string.Format("<tr>"+
                            "<td>{0}</td>" +
                            "<td><a href = 'Meeting_Board.aspx?meeting={1}'>{2}</a></td>" + 
                            "<td>{3}</td>" +
                            "<td>{4}</td>" +
                            "<td >{5}</td>" + 
                            "<td>{6}</td>" + 
                            "<td>{7}</td>" +
                            "</tr>", count, meeting.No, meeting.Title, Convert.ToDateTime(meeting.Start_date).ToString("dd/MM/yyyy"), meeting.Start_time, Convert.ToDateTime(meeting.End_Date).ToString("dd/MM/yyyy"), meeting.End_time, meeting.Venue_Location);
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
                                                    "<td><a href = 'Meeting_Committee.aspx?meeting={1}'>{2}</a></td>" +
                                                    "<td>{3}</td>" +
                                                    "<td>{4}</td>" +
                                                    "<td >{5}</td>" +
                                                    "<td>{6}</td>" +
                                                    "<td>{7}</td>" +
                                                    "</tr>", count, meeting.No, meeting.Title, Convert.ToDateTime(meeting.Start_date).ToString("dd/MM/yyyy"), meeting.Start_time, Convert.ToDateTime(meeting.End_Date).ToString("dd/MM/yyyy"), meeting.End_time, meeting.Venue_Location);
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