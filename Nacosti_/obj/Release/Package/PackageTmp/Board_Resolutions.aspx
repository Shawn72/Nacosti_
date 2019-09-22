<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Board_Resolutions.aspx.cs" Inherits="Nacosti_.Board_Resolutions" MasterPageFile="~/Site.Master" %>
<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-wrapper">
        <div class="content container-fluid">
            <div class="row">
                <div class="col-xs-12">
                    <h4 class="page-title"> Board Meetings Resolutions</h4>
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
                                <th>End Date</th>
                                <th>End Time</th>
                                <th>Venue</th>
                            </tr>
                            </thead>
                            <tbody>
                            <% = Meetings_Resolution() %>
                            </tbody>
                            <tfoot>
                            <tr>
                                <th>#</th>
                                <th>Title</th>
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
                    <h4 class="page-title">Committee Meetings Resolutions</h4>
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
                                <th>End Date</th>
                                <th>End Time</th>
                                <th>Venue</th>
                            </tr>
                            </thead>
                            <tbody>
                            <% = CommiteeMeetings_Resolution() %>
                            </tbody>
                            <tfoot>
                            <tr>
                                <th>#</th>
                                <th>Title</th>
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