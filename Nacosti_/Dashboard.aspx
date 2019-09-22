<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Nacosti_.Dashboard" MasterPageFile="~/Site.Master" %>
<%@ Import Namespace="Nacosti_" %>
<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
<div class="page-wrapper">
    <div class="content container-fluid">
    <h1>Dashboard</h1>
      <% var odataconn = WsConfig.ReturnNavObj();%>  
		
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-table">
					<div class="panel-heading">
						<h3 class="panel-title">Meetings Happening Today</h3>
					</div>
					<div class="panel-body">
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
                                    var counter1 = 0;
                                    var myboards = odataconn.CommitteeBoardMembers.Where(r => r.Director_No ==(string) Session["directorNo"]);
                                    foreach (var oneboard in myboards)
                                    {
                                        var committeeCode = oneboard.Committee;
                                        DateTime today = new DateTime(DateTime.Now.Year,DateTime.Now.Month,DateTime.Now.Day );
                                        var boardMeetings = odataconn.boardMeetings.Where(r=> r.Start_date == today && r.Meeting_group_Code ==committeeCode).ToList();
                                        foreach (var meeting in boardMeetings)
                                        {
                                            counter1++;
					                %>
					                    <tr>
                                            <td><%=counter1 %></td>
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
					<div class="panel-footer">
						<a href="#" class="text-primary">View all meetings</a>
					</div>
				</div>
			</div>
		</div>
        
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-table">
                    <div class="panel-heading">
                        <h3 class="panel-title">Committee meetings Today</h3>
                    </div>
                    <div class="panel-body">
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
                                    var mycommittees = odataconn.CommitteeBoardMembers.Where(r => r.Director_No ==(String) Session["directorNo"]);
                                    foreach (var committee in mycommittees)
                                    {
                                        var committeeCode = committee.Committee;
                                        DateTime today = new DateTime(DateTime.Now.Year,DateTime.Now.Month,DateTime.Now.Day );
                                        var committeeMeetings = odataconn.committeeMeetings.Where(r=> r.Start_date == today && r.Meeting_group_Code ==committeeCode).ToList();
                                        foreach (var meeting in committeeMeetings)
                                        {
                                            counter++;
                                    %>
                                        <tr>
                                            <td><%=counter %></td>
                                            <td><a href="Meeting_Committee.aspx?meeting=<% =meeting.No %>"><% =meeting.No %></a></td>
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
                    <div class="panel-footer">
                        <a href="#" class="text-primary">View all meetings</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-table">
					<div class="panel-heading">
						<h3 class="panel-title">Meetings Document</h3>
					</div>
					<div class="panel-body">
						<div class="table-responsive">	
                             <asp:GridView ID="gridViewImportantUploads" runat="server" CssClass="table table-striped custom-table m-b-0" GridLines="None" AutoGenerateColumns="false" EmptyDataText = "No files available!">
                        <Columns>
                            <asp:BoundField DataField="Text" HeaderText="Important Documents" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkDownload" Text = "Download" CommandArgument = '<%# Eval("Value") %>' runat="server" OnClick = "DownloadFile" ></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkViewDoc" runat ="server" Text = "View" CommandArgument = '<%# Eval("Value") %>' OnClick = "lnkViewDoc_OnClick" AutoPostBack ="True"></asp:LinkButton>
                                </ItemTemplate> 

                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
					</div>
					</div>
					<div class="panel-footer">
						<a href="#" class="text-primary">View all Documents</a>
					</div>
				</div>
            </div>
        </div>
	</div>
				
</div>
</asp:Content>
