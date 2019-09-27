<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Meetings_FilterbyCode.aspx.cs" Inherits="Nacosti_.Meetings_FilterbyCode" MasterPageFile="~/Site.Master"%>
<%@ Import Namespace="Nacosti_" %>

<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-wrapper">
        <% var odataconn = WsConfig.ReturnNavObj();
            var meeType = Request.QueryString["mtype"];
            var boardtype = Request.QueryString["boardDescr"];
            var meetingCode = Request.QueryString["commcode"];%>
        <div class="content container-fluid">
            <h1></h1>
           
            <% switch (meeType)
                {
                    case "aBoard":
             %>
                    <div class="row">
                        <div class="row">
                            <div class="col-xs-12">
                                <h4 class="page-title"> Board Meetings for: <%=boardtype %></h4>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="table-responsive">
                                <table class="table table-striped custom-table m-b-0 datatable">
                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Title</th>
                                        <th>Start Date</th>
                                        <th>Start Time</th>
                                        <th>End Date</th>
                                        <th>End Time</th>
                                        <th>Location</th>
                                        <th>Venue</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                <%
                                    int counter1 = 0;
                                    DateTime today = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day);
                                    var boardMeetings = odataconn.boardMeetings.Where(r => r.Meeting_group_Code == meetingCode && r.Status == "Completed" && r.Start_date < today && r.Published == true).ToList().OrderByDescending(t => t.Start_date);
                                    
                                    foreach (var meeting in boardMeetings)
                                    {
                                        counter1++; %>
                                            <tr>
                                                <td><%=counter1 %></td>
                                                <td><a href="Meeting_Board.aspx?meeting=<% = meeting.No %>"><% = meeting.No %></a></td>
                                                <td><% = Convert.ToDateTime(meeting.Start_date).ToString("dd/MM/yyyy") %></td>
                                                <td><% = meeting.Start_time %></td>
                                                <td><% = Convert.ToDateTime(meeting.End_Date).ToString("dd/MM/yyyy") %></td>
                                                <td><% = meeting.End_time %></td>
                                                <td><% = meeting.Venue_Location %></td>
                                                <td><% = meeting.Conference_Venue %></td>
                                                <%-- <td><a href="#"  data-toggle="modal" data-target="#meeting<%= count %>">Agenda</a></td>--%>
                                            </tr>
                                    <% }
                                      %>
                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <th>#</th>
                                        <th>Title</th>
                                        <th>Start Date</th>
                                        <th>Start Time</th>
                                        <th>End Date</th>
                                        <th>End Time</th>
                                        <th>Location</th>
                                        <th>Venue</th>
                                    </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>

            <% break;
                    case "aCommt":
              %>
                    <div class="row">
                        <div class="row">
                            <div class="col-xs-12">
                                <h4 class="page-title"> Committee Meetings for: <%=boardtype %></h4>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="table-responsive">
                                <table class="table table-striped custom-table m-b-0 datatable">
                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Title</th>
                                        <th>Start Date</th>
                                        <th>Start Time</th>
                                        <th>End Date</th>
                                        <th>End Time</th>
                                        <th>Location</th>
                                        <th>Venue</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <% int count = 0;
                                     DateTime leo = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day);
                                       var committeeMeetings = odataconn.committeeMeetings.Where(r => r.Meeting_group_Code == meetingCode && r.Status == "Completed" && r.Start_date < leo && r.Published == true).ToList().OrderByDescending(t => t.Start_date);

                                        foreach (var meeting in committeeMeetings)
                                        {
                                            count++; %>
                                            <tr>
                                                <td><%=count %></td>
                                                <td><a href="Meeting_Committee.aspx?meeting=<% = meeting.No %>"><% = meeting.No %></a></td>
                                                <td><% = Convert.ToDateTime(meeting.Start_date).ToString("dd/MM/yyyy") %></td>
                                                <td><% = meeting.Start_time %></td>
                                                <td><% = Convert.ToDateTime(meeting.End_Date).ToString("dd/MM/yyyy") %></td>
                                                <td><% = meeting.End_time %></td>
                                                <td><% = meeting.Venue_Location %></td>
                                                <td><% = meeting.Conference_Venue %></td>
                                                <%-- <td><a href="#"  data-toggle="modal" data-target="#meeting<%= count %>">Agenda</a></td>--%>
                                            </tr>
                                    <% }
                                       %>
                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <th>#</th>
                                        <th>Title</th>
                                        <th>Start Date</th>
                                        <th>Start Time</th>
                                        <th>End Date</th>
                                        <th>End Time</th>
                                        <th>Location</th>
                                        <th>Venue</th>
                                    </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>

              <%break;
              } %>
            
        </div>
    </div>
</asp:Content>
