<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Meeting_Board.aspx.cs" Inherits="Nacosti_.Meetings" MasterPageFile="~/Site.Master" %>
<%@ Import Namespace="Nacosti_" %>
<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
<div class="page-wrapper">
   <% var odataconn = WsConfig.ReturnNavObj(); %>
    <div class="content container-fluid">
    <h1></h1>
        <div class="panel panel-default" style="margin-top:10px;" >
             <%
                 var meetingCode = Request.QueryString["meeting"];
                 var meetingDetails = odataconn.boardMeetings.Where(r => r.No == meetingCode).ToList().OrderByDescending(m=>m.Start_date);
                 foreach (var meeting in meetingDetails)
                 {%>
         <h3 style="width: 100%; text-align: center;"><strong> MEETING: <% =meeting.No.ToUpper() %></strong></h3> <hr/>
         <div runat="server" id="feedback"></div>
           <div style="max-height: 200px; overflow-y: scroll;">
              <div class="row form-group">
                  <div class="col-md-6 col-lg-6">
                      Start Date:
                           <div class="input-group"><span class="input-group-addon"><i class="fa fa-calendar fa-fw"></i></span>
                              <input type="text"  class="form-control"  disabled value="<%=Convert.ToDateTime(meeting.Start_date).ToString("dd/MM/yyyy")+" "+meeting.Start_time %>">
                          </div>
                      </div>
                    <div class="col-md-6 col-lg-6">
                        End Date:
                            <div class="input-group"><span class="input-group-addon"><i class="fa fa-calendar fa-fw"></i></span>
                                <input type="text"  class="form-control"   disabled value="<%=Convert.ToDateTime(meeting.End_Date).ToString("dd/MM/yyyy")+" "+meeting.End_time %>">
                            </div>
                      </div>
                  </div>
               <div class="row form-group">
                <div class="col-md-6 col-lg-6">
                    Venue:
           <div class="input-group"><span class="input-group-addon"><i class="fa fa-calendar fa-fw"></i></span>
              <input type="text"  class="form-control"  disabled value="<%=meeting.Conference_Venue %>">
          </div>
                  </div>
                <div class="col-md-6 col-lg-6">
                    Convened By:
           <div class="input-group"><span class="input-group-addon"><i class="fa fa-calendar fa-fw"></i></span>
              <input type="text"  class="form-control"    disabled value="<%=meeting.Convened_by %>">
          </div>
                  </div>
                      </div>
               <div class="row form-group">
                <div class="col-md-6 col-lg-6">
                    Contact Telephone:
           <div class="input-group"><span class="input-group-addon"><i class="fa fa-calendar fa-fw"></i></span>
              <input type="text"  class="form-control"   disabled value="<%=meeting.Contact_Tel_No %>">
          </div>
                  </div>
                <div class="col-md-6 col-lg-6">
                    Contact E-mail
                    <div class="input-group"><span class="input-group-addon"><i class="fa fa-calendar fa-fw"></i></span>
                        <input type="text"  class="form-control"   disabled value="<%=meeting.Contact_Email %>">
                    </div>
                  </div>

                </div>
               <div class="row form-group">
                <div class="col-md-6 col-lg-6">
                    Description:
           <div class="input-group"><span class="input-group-addon"><i class="fa fa-calendar fa-fw"></i></span>
              <input type="text"  class="form-control"   disabled value="<%=meeting.Title %>">
          </div>
                  </div>
                <div class="col-md-6 col-lg-6">
                    Committee
           <div class="input-group"><span class="input-group-addon"><i class="fa fa-calendar fa-fw"></i></span>
              <input type="text"  class="form-control"   disabled value="<%=meeting.Meeting_group %>">
          </div>
            </div>
          </div>
         </div>

          <br/>
           <div class="col-md-12">
          <div class="panel panel-outline card-info">
            <div class="panel-header">
              <h4 class="panel-title">
               <strong>Meeting Actions</strong> 
              </h4>
            </div>
            <!-- /.card-header -->
            <div class="panel-body">
              <div class="mb-3">
                  <div id="commentfeedback" runat="server"></div>
                  <br/>
                  <div class="form-group" style="background-color: aquamarine">
                      <div  id="meetConf"  runat="server"></div>
                    </div>
                   <br/>
                  <div class="form-group">
                      <strong>Are you Attending this meeting?</strong>
                       <asp:DropDownList runat="server" ID="ddlAttendMeetorNot" CssClass="form-control" OnSelectedIndexChanged="ddlAttendMeetorNot_OnSelectedIndexChanged" AutoPostBack="True">
                          <asp:ListItem Value="0">--Select your Response--</asp:ListItem>
                          <asp:ListItem Value="1">Confirm Attendance</asp:ListItem>
                          <asp:ListItem Value="2">Apologetic Decline</asp:ListItem>
                      </asp:DropDownList>
                  </div>
              </div>
               <br/>
                 
              <div class="mb-3">
                  <strong>Comments (Max Characters: 250)</strong> 
                <br />
                  <label id="lblCharleftTextarea" title=""></label>
                <br/>
                  <asp:TextBox runat="server" placeholder="please input your comment here" TextMode="MultiLine" ID="txtareaComment" 
                      CssClass="form-control" style="width: 100%; height: 100px; font-size: 14px; line-height: 15px; border: 1px solid #dddddd; 
                      padding: 10px;" MaxLength="10"
                      onKeyUp="javascript:CheckTextArea(this, 250);" onChange="javascript:CheckTextArea(this, 100);"></asp:TextBox>
             </div>
              <br/>
            <div class="row">
                <span class="btn btn-success pull-left btn-sm">
                    <i class="fa fa-save"></i>&nbsp; <asp:Button runat="server" ID="btnSaveComment"  style="background: none;border: 0" Text="Save Comment" OnClick="btnSaveComment_OnClick"></asp:Button>
                </span> 
            </div>
            <br/>
            <div>
            <table class="table table-striped table-bordered datatable">
             <thead>
             <tr>
                 <th>No.</th>
                 <th>Comment</th>
                 <th>Date Created</th>
                 <th>Comment Reply</th>
             </tr>
             </thead>
               <%
                 var meetCode = Request.QueryString["meeting"];
                 int counter = 0;
                 var commentDetails = odataconn.BoardComments.Where(r => r.Meeting_Code == meetCode && r.Member_No==Session["directorNo"] as string).ToList().OrderByDescending(m=>m.Date_Created);
                 foreach (var onecomment in commentDetails)
                 {
                     counter++;
                  %>
                  <tr>
                     <td><% =counter.ToString() %></td>
                     <td><% =onecomment.Comment %></td>
                     <td><% =Convert.ToDateTime(onecomment.Date_Created).ToString("dd/MM/yyyy") %></td>
                      <% if (string.IsNullOrEmpty(onecomment.Comment_Reply))
                         { %>
                          <td class="alert alert-danger">No Reply for this comment yet!</td>
                      <% }
                         else
                         {%>
                        <td class="alert alert-success"><% =onecomment.Comment_Reply %></td>
                     <% } %>
                 </tr>
                  <%}%>

                </table>
                </div>
                
                <div class="row">
                    <div class="col-md-12">
                        <h4> Meeting Attendance</h4>
                        <div class="table-responsive">
                            <table class="table table-striped custom-table m-b-0 datatable">
                                <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>Member Name</th>
                                    <th>Attendance Status</th>
                                </tr>
                                </thead>
                                <tbody>
                               
                            <% if (Pastornot=="pastmeeting")
                             {%>

                            <%
                                int attcounter = 0;
                                var meetingAttendance = odataconn.boardMeetingAttendance.Where(r => r.Meeting_Code == meetCode).ToList().OrderByDescending(m=>m.Meeting_Date);
                                foreach (var attendee in meetingAttendance)
                                {
                                    attcounter++; %>
                                <tr>
                                    <td><% =attcounter.ToString() %></td>
                                    <td><% =attendee.Member_Name %></td>
                                    <td><% =attendee.Attendance %></td>
                                </tr>

                    
                              <% } %>
                       
                           <%}
                           else
                           {%>
                            <tr>
                                <td class="alert alert-danger" colspan="3">Meeting is not past yet!</td>
                            </tr>
                           <%} %>
                             </tbody>
                        </table>
                      </div>
                 </div>
            </div>   
                
                <div class="row">
                    <div class="col-md-12">
                        <h4> Meeting Inattendance</h4>
                        <div class="table-responsive">
                            <table class="table table-striped custom-table m-b-0 datatable">
                                <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>Member Name</th>
                                    <th>Attendance Status</th>
                                </tr>
                                </thead>
                                <tbody>
                               
                                <% if (Pastornot=="pastmeeting")
                                   {%>

                                    <%
                                        int attcounter = 0;
                                        var meetingAttendance = odataconn.inAttendances.Where(r => r.Meeting_Code == meetCode).ToList().OrderByDescending(m=>m.Meeting_Date);
                                        foreach (var attendee in meetingAttendance)
                                        {
                                            attcounter++; %>
                                        <tr>
                                            <td><% =attcounter.ToString() %></td>
                                            <td><% =attendee.Member_Name %></td>
                                            <td><% =attendee.Attendance %></td>
                                        </tr>

                    
                                    <% } %>
                       
                                <%}
                                   else
                                   {%>
                                    <tr>
                                        <td class="alert alert-danger" colspan="3">Meeting is not past yet!</td>
                                    </tr>
                                <%} %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>             

            </div>
          </div>
        </div>
          <br/>
        <!-- /.col-->
            <%}%>
           <h3 style="width: 100%; text-align: center;"><strong>Documents</strong></h3><hr/>
           <div class="panel-group">
               
                 <div class="form-group">
                    <asp:GridView ID="gridViewMeetingsUploads" runat="server" CssClass="table table-striped table-advance table-hover" GridLines="None" AutoGenerateColumns="false" EmptyDataText = "No files available for this meeting">
                        <Columns>
                            <asp:BoundField DataField="Text" HeaderText="Meeting Documents" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkDownload" Text = "Download" CommandArgument = '<%# Eval("Value") %>' runat="server" OnClick = "DownloadFile"></asp:LinkButton>
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
          </div>
					
    </div>
</div>
    
<script>
function CheckTextArea(textArea, maxLength) {
    document.getElementById("lblCharleftTextarea").innerHTML = maxLength - textArea.value.length + " characters left";
    if (textArea.value.length > maxLength) {
        document.getElementById("lblCharleftTextarea").style.color = "red";
        textArea.value = textArea.value.substr(0, maxLength);
        document.getElementById("lblCharleftTextarea").innerHTML = maxLength - textArea.value.length + " characters left";
    }
    else if (textArea.value.length < maxLength) {
        document.getElementById("lblCharleftTextarea").style.color = "Black";
    }
    else {
        document.getElementById("lblCharleftTextarea").style.color = "red";
    }
}
</script>
</asp:Content>
