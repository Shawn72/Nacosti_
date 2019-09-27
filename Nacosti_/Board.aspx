<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Board.aspx.cs" Inherits="Nacosti_.MyCommittees"  MasterPageFile="~/Site.Master"%>
<%@ Import Namespace="Nacosti_" %>

<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-wrapper">
        <div class="content container-fluid">
            <div class="panel panel-default">
                <div class="panel-heading">Boards</div>
                <div class="panel-body">
                    <div class="table-responsive">
                    <table class="table table-striped custom-table m-b-0 datatable">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Board Name</th>
                            </tr>
                        </thead>
                         <%
                             var odataconn = WsConfig.ReturnNavObj();
                            int count1 = 1;
                            var committeeDetails = odataconn.allBoards.ToList();
                            foreach (var committeeDetail in committeeDetails)
                            {
                                
                             %>
                                <tr>
                                    <td><% =count1 %></td>
                                    <td><a href="Board_Meetings.aspx?comm=<%=committeeDetail.Code %>&&boardname=<%=committeeDetail.Description %>"><%=committeeDetail.Description %></a></td>
                                </tr>
                            <%
                                count1++;
                               }
                            %>
                    </table>
                </div>
               </div>
            </div>
        </div>
    </div>
</asp:Content>