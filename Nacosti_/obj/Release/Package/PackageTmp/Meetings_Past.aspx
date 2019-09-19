<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Meetings_Past.aspx.cs" Inherits="Nacosti_.Meetings_Past" MasterPageFile="~/Site.Master" %>
<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
<div class="page-wrapper">
    <div class="content container-fluid">
    <h1> Past Meetings</h1>
    <div class="row">
		<div class="col-xs-12">
			<h4 class="page-title">Past Board Meetings</h4>
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
                            </tr>
                            </thead>
		                <tbody>
			            <% = PastMeetings() %>
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
                            </tr>
                        </tfoot>
					</table>
			</div>
		</div>
	</div>
        
        <div class="row">
            <div class="col-xs-12">
                <h4 class="page-title">Past Committee Meetings</h4>
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
                        </tr>
                        </thead>
                        <tbody>
                        <% = PastCommiteeMeetings() %>
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
                        </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>

    </div>
</div>
</asp:Content>