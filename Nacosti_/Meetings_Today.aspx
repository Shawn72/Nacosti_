<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Meetings_Today.aspx.cs" Inherits="Nacosti_.Meetings_Today" MasterPageFile="~/Site.Master" %>

<%@ Import Namespace="Nacosti_" %>
<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
<div class="page-wrapper">
  <% var odataconn = WsConfig.ReturnNavObj();var wsconnection = WsConfig.ObjNav;%>
    <div class="content container-fluid">
    <h1></h1>
    <div class="row">
		<div class="col-xs-12">
			<h4 class="page-title">Today's Board Meetings</h4>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="table-responsive">
					<table class="table table-striped custom-table m-b-0 datatable">
							<thead>
								<tr>
                                    <th>#</th>
                                    <th>Title</th>
									<th>Description</th>
                                    <th>Start Date</th>
                                    <th>Start Time</th>
                                    <th>End Date</th>
                                    <th>End Time</th>
									<th>Location</th>
                                    <th>Venue</th>
									<th>Logistics Arrangement</th>
                                </tr>
							</thead>
							<tbody>
		                <%
                        var counter = 0;
                        var myboard = odataconn.CommitteeBoardMembers.Where(r => r.Director_No ==(String) Session["directorNo"]);
                        foreach (var committee in myboard)
                        {
                            var committeeCode = committee.Committee;
                            DateTime today = new DateTime(DateTime.Now.Year,DateTime.Now.Month,DateTime.Now.Day );
                            var committeeMeetings = odataconn.boardMeetings.Where(r=> r.Start_date == today && r.Meeting_group_Code ==committeeCode).ToList();
                            foreach (var meeting in committeeMeetings)
                            {
                                counter++;
                            %>
                                <tr>
                                <td><%=counter %></td>
					            <td><a href="Meeting_Board.aspx?meeting=<% =meeting.No %>"><% =meeting.No %></a></td>
					            <td><% =meeting.Meeting_group %></td>
					            <td><% =Convert.ToDateTime(meeting.Start_date).ToString("dd/MM/yyyy") %></td>
					            <td><% =meeting.Start_time %></td>
					            <td><% =Convert.ToDateTime(meeting.End_Date).ToString("dd/MM/yyyy") %></td>
					            <td><% =meeting.End_time %></td>
					            <td><% =meeting.Venue_Location %></td>
					            <td><% =meeting.Conference_Venue %></td>
					            <td><% =meeting.Parking_Arrangement %></td>
					        </tr>
                                <%}
                                }
                            %>
							</tbody>
                            <tfoot>
								<tr>
                                    <th>#</th>
                                    <th>Title</th>
									<th>Description</th>
                                    <th>Start Date</th>
                                    <th>Start Time</th>
                                    <th>End Date</th>
                                    <th>End Time</th>
									<th>Location</th>
                                    <th>Venue</th>
									<th>Logistics Arrangement</th>
                                </tr>
							</tfoot>
						</table>
				</div>
			</div>
		</div>
        
        <div class="row">
            <div class="col-xs-12">
                <h4 class="page-title">Today's Commitee Meetings</h4>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="table-responsive">
                    <table class="table table-striped custom-table m-b-0 datatable">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Title</th>
                            <th>Description</th>
                            <th>Start Date</th>
                            <th>Start Time</th>
                            <th>End Date</th>
                            <th>End Time</th>
                            <th>Location</th>
                            <th>Venue</th>
                            <th>Logistics Arrangement</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            var counter2 = 0;
                            var mycommittees = odataconn.CommitteeBoardMembers.Where(r => r.Director_No ==(String) Session["directorNo"]);
                            foreach (var committee in mycommittees)
                            {
                                var committeeCode = committee.Committee;
                                DateTime today = new DateTime(DateTime.Now.Year,DateTime.Now.Month,DateTime.Now.Day );
                                var committeeMeetings = odataconn.committeeMeetings.Where(r=> r.Start_date == today && r.Meeting_group_Code ==committeeCode).ToList();
                                foreach (var meeting in committeeMeetings)
                                {
                                    counter2++;
                                %>
                                <tr>
                                    <td><%=counter2 %></td>
                                    <td><a href="Meeting_Board.aspx?meeting=<% =meeting.No %>"><% =meeting.Title %></a></td>
                                    <td><% =meeting.Meeting_group %></td>
                                    <td><% =Convert.ToDateTime(meeting.Start_date).ToString("dd/MM/yyyy") %></td>
                                    <td><% =meeting.Start_time %></td>
                                    <td><% =Convert.ToDateTime(meeting.End_Date).ToString("dd/MM/yyyy") %></td>
                                    <td><% =meeting.End_time %></td>
                                    <td><% =meeting.Venue_Location %></td>
                                    <td><% =meeting.Conference_Venue %></td>
                                    <td><% =meeting.Parking_Arrangement %></td>
                                </tr>
                        <%}
                        }
                        %>
                        </tbody>
                        <tfoot>
                        <tr>
                            <th>#</th>
                            <th>Title</th>
                            <th>Description</th>
                            <th>Start Date</th>
                            <th>Start Time</th>
                            <th>End Date</th>
                            <th>End Time</th>
                            <th>Location</th>
                            <th>Venue</th>
                            <th>Logistics Arrangement</th>
                        </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>    

      </div>
</div>
</asp:Content>
