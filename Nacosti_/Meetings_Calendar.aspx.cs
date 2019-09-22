using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Nacosti_
{
    public partial class Meetings_Calendar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Session["name"].ToString()) &&
                !string.IsNullOrEmpty(Session["directorNo"].ToString()))
            {
                _MeetingsCalendar();
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        public string _MeetingsCalendar()
        {
            string mySchemeet = "";
            try
            {
                var odataconn = WsConfig.ReturnNavObj();
                int count = 0;
                var mycommittees =
                    odataconn.CommitteeBoardMembers.Where(r => r.Director_No == Session["directorNo"] as string);
                foreach (var committee in mycommittees)
                {
                    var committeeCode = committee.Committee;
                    var committeeMeetings = odataconn.boardMeetings.Where(r => r.Meeting_group_Code == committeeCode && r.Published == true && r.Start_date > DateTime.Today).ToList().OrderByDescending(t => t.Start_date);
                   
                    foreach (var meeting in committeeMeetings)
                    {
                        count++;
                        mySchemeet +=
                            "<tr>" +
                            $"<td>{count}</td>" +
                            $"<td><a href = 'Meeting_Board.aspx?meeting={meeting.No}'>{meeting.No}</a></td>" +
                            $"<td>{meeting.Meeting_group}</td>" +
                            $"<td>{Convert.ToDateTime(meeting.Start_date):dd/MM/yyyy}</td>" +
                            $"<td>{meeting.Start_time}</td>" +
                            $"<td >{Convert.ToDateTime(meeting.End_Date):dd/MM/yyyy}</td>" +
                            $"<td>{meeting.End_time}</ td >" + $"<td>{meeting.Venue_Location}</ td >" + "</tr> ";
                    }
                }
            }
            catch (Exception)
            {
                // ignored

            }
            return mySchemeet;
        }

        public string _CommiteeMeetingsCalendar()
        {
            string mySchemeet = "";
            try
            {
                var odataconn = WsConfig.ReturnNavObj();
                int count = 0;
                var mycommittees =
                    odataconn.CommitteeBoardMembers.Where(r => r.Director_No == Session["directorNo"] as string);
                foreach (var committee in mycommittees)
                {
                    var committeeCode = committee.Committee;
                    var committeeMeetings = odataconn.committeeMeetings.Where(r => r.Meeting_group_Code == committeeCode && r.Published == true && r.Start_date > DateTime.Today).ToList().OrderByDescending(t => t.Start_date);
                  
                    foreach (var meeting in committeeMeetings)
                    {
                         count++;
                        mySchemeet +=
                            "<tr>" +
                            $"<td>{count}</td>" +
                            $"<td><a href = 'Meeting_Committee.aspx?meeting={meeting.No}'>{meeting.Title}</a></td>" +
                            $"<td>{meeting.Meeting_group}</td>" +
                            $"<td>{Convert.ToDateTime(meeting.Start_date):dd/MM/yyyy}</td>" +
                            $"<td>{meeting.Start_time}</td>" +
                            $"<td >{Convert.ToDateTime(meeting.End_Date):dd/MM/yyyy}</td>" +
                            $"<td>{meeting.End_time}</ td >" + $"<td>{meeting.Venue_Location}</ td >" + "</tr> ";
                       
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