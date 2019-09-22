<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommiteeMeetingsCategory.aspx.cs" Inherits="Nacosti_.CommiteeMeetingsCategory" MasterPageFile="~/Site.Master"%>
<%@ Import Namespace="Nacosti_" %>

<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="page-wrapper">
        <div class="content container-fluid">
    
            <div class="panel panel-default" style="margin-top:10px;" >
        
                <h3 style="width: 100%; text-align: center;">MEETINGS</h3><hr/>
        
                <div class="table-responsive">
                    <table class="table table-striped custom-table m-b-0 datatable">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Meeting</th>
                            <th>Start Date</th>
                            <th>End Date</th>
                            <th>Location</th>
                            <th>Venue</th>
                        </tr>
                        </thead>
           
                        <% 
                            var odataconn = WsConfig.ReturnNavObj();
                            var commiteetype = Request.QueryString["commtype"];
                            var meetcode = Request.QueryString["meetcode"];
                            var meetings = odataconn.committeeMeetings.Where(r => r.Meeting_Type == commiteetype && r.Meeting_group_Code ==meetcode).ToList().OrderByDescending(t=>t.Start_date);
                            int meetingcount = 1;
                            foreach (var meeting in meetings)
                            {

                        %>
                            <tr>
                                <td><% =meetingcount %></td>
                                <td><a href="Meeting_Committee.aspx?meeting=<%=meeting.No %>"><%=meeting.No %></a></td>
                                <td><%=Convert.ToDateTime(meeting.Start_date).ToString("dd/MM/yyyy") %></td>
                                <td><%=Convert.ToDateTime(meeting.End_Date).ToString("dd/MM/yyyy") %></td>
                                <td><%=meeting.Venue_Location %></td>
                                <td><%=meeting.Conference_Venue %></td>
                            </tr>
                        <%
                            meetingcount++;
                           }
                        %>
                    </table>
                </div>
            </div>
        </div>
    </div>

</asp:Content>