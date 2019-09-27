<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Meetings_Summary.aspx.cs" Inherits="Nacosti_.Meetings_Summary" MasterPageFile="~/Site.Master" %>
<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-wrapper">
        <div class="content container-fluid">
            <%--<h1>Meetings Calendar</h1>--%>
            <div class="row">
                <div class="col-xs-12">
                    <h4 class="page-title">Summary of Board Meetings  </h4>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="table-responsive">
                        <table class="table table-striped custom-table m-b-0 datatable">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>Meeting Category</th>
                                <th>Number of Meetings</th>
                            </tr>
                            </thead>
                            <tbody>
                            <% = PastBoardMeetings() %>
                            </tbody>
                            <tfoot>
                            <tr>
                                <th>#</th>
                                <th>Meeting Category</th>
                                <th>Number of Meetings</th>
                            </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="col-xs-12">
                    <h4 class="page-title">Summary Commitee Meetings</h4>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="table-responsive">
                        <table class="table table-striped custom-table m-b-0 datatable">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>Commitee Category</th>
                                <th>Number of Meetings</th>
                            </tr>
                            </thead>
                            <tbody>
                            <% =PastCommiteeMeetings() %>
                            </tbody>
                            <tfoot>
                            <tr>
                                <th>#</th>
                                <th>Committee Category</th>
                                <th>Number of Meetings</th>
                            </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
