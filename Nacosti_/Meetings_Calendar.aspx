<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Meetings_Calendar.aspx.cs" Inherits="Nacosti_.Meetings_Calendar" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-wrapper">
        <div class="content container-fluid">
            <%--<h1>Meetings Calendar</h1>--%>
            <div class="row">
                <div class="col-xs-12">
                    <h4 class="page-title">Board Meetings Calendar</h4>
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
                                <th>Meeting Category</th>
                                <th>Start Date</th>
                                <th>Start Time</th>
                                <th>End Date</th>
                                <th>End Time</th>
                                <th>Venue</th>
                            </tr>
                            </thead>
                            <tbody>
                            <% = _MeetingsCalendar() %>
                            </tbody>
                            <tfoot>
                            <tr>
                                <th>#</th>
                                <th>Title</th>
                                <th>Meeting Category</th>
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
                    <h4 class="page-title">Commitee Meetings Calendar</h4>
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
                                <th>Meeting Category</th>
                                <th>Start Date</th>
                                <th>Start Time</th>
                                <th>End Date</th>
                                <th>End Time</th>
                                <th>Venue</th>
                            </tr>
                            </thead>
                            <tbody>
                            <% = _CommiteeMeetingsCalendar() %>
                            </tbody>
                            <tfoot>
                            <tr>
                                <th>#</th>
                                <th>Title</th>
                                <th>Meeting Category</th>
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
