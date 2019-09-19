<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Meetings_Schedule.aspx.cs" Inherits="Nacosti_.Meetings_Schedule" MasterPageFile="~/Site.Master"%>

<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
<div class="page-wrapper">
    <div class="content container-fluid">
    <h1>Meetings Schedule</h1>
    <div class="row">
		<div class="col-xs-12">
			<h4 class="page-title">Board Meetings Schedule</h4>
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
                                <th>Start Date</th>
                                <th>Start Time</th>
                                <th>End Date</th>
                                <th>End Time</th>
                                <th>Venue</th>
                                <th>Parking Arrangement</th>
                            </tr>
                        </thead>
                        <tbody>
                           <% = _MeetingsSchedule() %>
                        </tbody>
                        <tfoot>
                            <tr>
                                <th>#</th>
                                <th>Title</th>
                                <th>Start Date</th>
                                <th>Start Time</th>
                                <th>End Date</th>
                                <th>End Time</th>
                                <th>Venue</th>
                                <th>Parking Arrangement</th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
      
    <div class="row">
        <div class="col-xs-12">
            <h4 class="page-title">Committee Meetings Schedule</h4>
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
                            <th>Start Date</th>
                            <th>Start Time</th>
                            <th>End Date</th>
                            <th>End Time</th>
                            <th>Venue</th>
                            <th>Parking Arrangement</th>
                        </tr>
                        </thead>
                        <tbody>
                        <% = _CommitteeMeetingsSchedule() %>
                        </tbody>
                        <tfoot>
                        <tr>
                            <th>#</th>
                            <th>Title</th>
                            <th>Start Date</th>
                            <th>Start Time</th>
                            <th>End Date</th>
                            <th>End Time</th>
                            <th>Venue</th>
                            <th>Parking Arrangement</th>
                        </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>   
       

    </div>
</div>
</asp:Content>
