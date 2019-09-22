using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Nacosti_
{
    public partial class Meetings_Schedule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Session["name"].ToString()) &&
                !string.IsNullOrEmpty(Session["directorNo"].ToString()))
            {
                _MeetingsSchedule();
                _CommitteeMeetingsSchedule();
                Session["pastOrpresent"] = "notpastmeeting";
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
        public string _MeetingsSchedule()
        {
            string mySchemeet = "";
            int count = 0;
            try
            {
                var odataconn = WsConfig.ReturnNavObj();
                var mycommittees =
                    odataconn.CommitteeBoardMembers.Where(r => r.Director_No == Session["directorNo"] as string);
                foreach (var committee in mycommittees)
                {
                    var committeeCode = committee.Committee;
                    var committeeMeetings = odataconn.boardMeetings.Where(r => r.Meeting_group_Code == committeeCode && r.Published == true && r.Start_date > DateTime.Today).ToList().OrderByDescending(t => t.Start_date);
                    foreach (var meeting in committeeMeetings)
                    {
                        count++;                                         

                        mySchemeet += string.Format("<tr>"+
                            "<td>{0}</td>" +
                            "<td><a href = 'Meeting_Board.aspx?meeting={1}'>{2}</a></td>" +
                            "<td>{3:dd/MM/yyyy}</td>" + "<td>{4}</td>" + "<td >{5:dd/MM/yyyy}</td>" + "<td>{6}</td >" + "<td>{7}</td >" + "<td>{8}</td>"+
                            "</tr> ", count, meeting.No, meeting.No, Convert.ToDateTime(meeting.Start_date), meeting.Start_time, Convert.ToDateTime(meeting.End_Date), meeting.End_time, meeting.Venue_Location, meeting.Parking_Arrangement);
                    }
                }
            }
            catch (Exception)
            {
                // ignored

            }
            return mySchemeet;
        }

        public string _CommitteeMeetingsSchedule()
        {
            string mySchemeet = "";
            int count = 0;
            try
            {
                var odataconn = WsConfig.ReturnNavObj();
                var mycommittees =
                    odataconn.CommitteeBoardMembers.Where(r => r.Director_No == Session["directorNo"] as string);
                foreach (var committee in mycommittees)
                {
                    var committeeCode = committee.Committee;
                    var committeeMeetings = odataconn.committeeMeetings.Where(r => r.Meeting_group_Code == committeeCode && r.Published == true && r.Start_date > DateTime.Today).ToList().OrderByDescending(t => t.Start_date);
                    foreach (var meeting in committeeMeetings)
                    {
                        count++;

                        mySchemeet += string.Format("<tr>" +
                                                    "<td>{0}</td>" +
                                                    "<td><a href = 'Meeting_Board.aspx?meeting={1}'>{2}</a></td>" +
                                                    "<td>{3:dd/MM/yyyy}</td>" + "<td>{4}</td>" + "<td >{5:dd/MM/yyyy}</td>" + "<td>{6}</td >" + "<td>{7}</td >" + "<td>{8}</td>" +
                                                    "</tr> ", count, meeting.No, meeting.Title, Convert.ToDateTime(meeting.Start_date), meeting.Start_time, Convert.ToDateTime(meeting.End_Date), meeting.End_time, meeting.Venue_Location, meeting.Parking_Arrangement);
                    }
                }
            }
            catch (Exception)
            {
                // ignored

            }
            return mySchemeet;
        }
    }
}