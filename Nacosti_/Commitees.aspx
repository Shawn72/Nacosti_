<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Commitees.aspx.cs" Inherits="Nacosti_.Commitees" MasterPageFile="~/Site.Master" %>
<%@ Import Namespace="Nacosti_" %>

<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-wrapper">
        <div class="content container-fluid">
            <div class="panel panel-default">
                <div class="panel-heading">Committees</div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-striped custom-table m-b-0 datatable">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>Committee Name</th>
                            </tr>
                            </thead>
                            <%
                                var odataconn = WsConfig.ReturnNavObj();
                                int count1 = 0;
                                var committeeDetails = odataconn.Committees.ToList();
                                foreach (var committeeDetail in committeeDetails)
                                {
                                    count1++;
                            %>
                                        <tr>
                                            <td><% =count1 %></td>
                                            <td><a href="Commitee_Meetings.aspx?comm=<%=committeeDetail.Code %>&&commname=<%=committeeDetail.Description %>"><%=committeeDetail.Description %></a></td>
                                        </tr>
                                <% }
                                %>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>