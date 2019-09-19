<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Commitee_Meetings.aspx.cs" Inherits="Nacosti_.Commitee_Meetings" MasterPageFile="~/Site.Master" %>
<%@ Import Namespace="Nacosti_" %>

<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="page-wrapper">
        <div class="content container-fluid">
    
            <div class="panel panel-default" style="margin-top:10px;" >
                <% var odataconn = WsConfig.ReturnNavObj();
                   string commiteeCode = Request.QueryString["comm"];
                   string commiteeName = Request.QueryString["commname"];
                   var committeeDetails = odataconn.committeeMeetings.Where(r => r.Meeting_group_Code == commiteeCode.Trim()).ToList().OrderByDescending(d=>d.Start_date);
                   foreach (var detail in committeeDetails)
                   {
                %>
                    <h3 style="width: 100%; text-align: center"> <strong>Committee Name:&nbsp;<% =commiteeName.ToUpper() %></strong></h3>
                    <hr/>
                    <div style="max-height: 200px; overflow: auto;">
                        <div class="lead row">
                            <div class="col-md-6 col-lg-6">
                                Start Date:
                                <div class="input-group"><span class="input-group-addon"><i class="fa fa-calendar fa-fw"></i></span>
                                    <input type="text"  class="form-control"  disabled value="<% =detail.Start_date %>">
                                </div>
                            </div>

                            <div class="col-md-6 col-lg-6">
                                End Date:
                                <div class="input-group"><span class="input-group-addon"><i class="fa fa-calendar fa-fw"></i></span>
                                    <input type="text"  class="form-control"  disabled value="<% =detail.End_Date %>" >
                                </div>
                            </div>
                        </div>

                        <div class="lead row">
                            <div class="col-md-6 col-lg-6">
                                Chairman:
                                <div class="input-group"><span class="input-group-addon"><i class="fa fa-calendar fa-fw"></i></span>
                                    <input type="text"  class="form-control"   disabled value="Chairman">
                                </div>
                            </div>
                            <div class="col-md-6 col-lg-6">
                                Secretary:
                                <div class="input-group"><span class="input-group-addon"><i class="fa fa-calendar fa-fw"></i></span>
                                    <input type="text"  class="form-control"  disabled value="Secretary">
                                </div>
                            </div>
                        </div>
                    </div>
                <%
                    break;
           } %>
                <h3 style="width: 100%; text-align: center;">COMMITEE MEMBERS </h3><hr/>
        
                <div class="table-responsive">
                    <table class="table table-striped custom-table m-b-0 datatable">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Name</th>
                            <th>Role</th>
                        </tr>
                        </thead>
           
                        <% var members = odataconn.CommitteeBoardMembers.Where(r => r.Committee == commiteeCode).ToList().OrderBy(r=>r.Role);
                            int membercount = 0;
                            foreach (var onemember in members)
                            {
                                membercount++;
                            %>
                                <tr>
                                    <td><% =membercount %></td>
                                    <td><%=onemember.Names %></td>
                                    <td><%=onemember.Role %></td>
                                </tr>
                            <%
                          
                        }
                        %>
                    </table>
                </div>
                <br/>
                <h3 style="width: 100%; text-align: center;">MEETINGS TYPES</h3><hr/>
                
                <div class="table-responsive">
                    <table class="table table-striped custom-table m-b-0 datatable">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Committee Meetings Category</th>
                        </tr>
                        </thead>
                        <tbody>
                         <tr>
                                <td>1</td>
                                <td><a href="CommiteeMeetingsCategory.aspx?commtype=Scheduled Committee Meeting&&meetcode=<%=commiteeCode %>">Scheduled Committee Meeting</a></td>
                            </tr>
                             <tr>
                                 <td>2</td>
                                <td><a href="CommiteeMeetingsCategory.aspx?commtype=Special Committee Meeting&&meetcode=<%=commiteeCode %>">Special Committee Meeting</a></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
