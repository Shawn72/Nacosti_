<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Blog_Forum.aspx.cs" Inherits="Nacosti_.Blog_Forum" MasterPageFile="~/Site.Master" %>
<%@ Import Namespace="Nacosti_" %>

<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-wrapper">
        <% var odataconn = WsConfig.ReturnNavObj(); %>
        <div class="content container-fluid">
            <h1>Forum</h1>
            <div class="panel panel-outline card-info">
                <div class="panel-header">
                    <h4 class="panel-title">
                       Meetings Forum
                    </h4>
                </div>
            
                 <div class="panel-body">
               
                <div class="mb-3">
                    <div id="forumfeedback" runat="server"></div>
                <br/>
                    <label id="lblCharleftTextarea" title="" style="color: red;"></label>
                    <br/>
                        <strong>Forum Tittle (Max Characters: 100)</strong> 
                        <asp:TextBox  runat="server" ID="txtForumTitle" CssClass="form-control" placeholder="Please text forum title here"  onKeyUp="javascript:CheckTextArea(this, 100);" onChange="javascript:CheckTextArea(this, 100);"></asp:TextBox>
                    <br/>
                    <strong>Forum Details (Max Characters: 250)</strong> 
                    <asp:TextBox runat="server" placeholder="Please input your forum discussion text here" TextMode="MultiLine" ID="txtareaForumComment" 
                                    CssClass="form-control" style="width: 100%; height: 100px; font-size: 14px; line-height: 15px; border: 1px solid #dddddd; 
                                        padding: 10px;" MaxLength="10"
                                    onKeyUp="javascript:CheckTextArea(this, 250);" onChange="javascript:CheckTextArea(this, 250);"></asp:TextBox>
                    </div>
                <br/>
                <div class="mb-3">
                    <span class="btn btn-success pull-left btn-sm">
                        <i class="fa fa-save"></i>&nbsp; <asp:Button runat="server" ID="btnSaveForum"  style="background: none;border: 0" Text="Save Forum" OnClick="btnSaveForum_OnClick"></asp:Button>
                    </span> 
                </div>
                <br/>
               <br/>
                
                <div class="mb-3">
                    <table class="table table-striped table-bordered datatable">
                        <thead>
                        <tr>
                            <th>No.</th>
                            <th>Forum Title</th>
                            <th>Created by</th>
                            <th>Date Created</th>
                            <th>Time Created</th>
                        </tr>
                        </thead>
                        <%
                            int counter = 0;
                            var forumDetails = odataconn.boardBlog.ToList().OrderByDescending(m=>m.Date_Created);
                            foreach (var oneforum in forumDetails)
                            {
                                counter++;
                        %>
                            <tr>
                                <td><% =counter.ToString() %></td>
                                <td><a href ='Blog_Replies.aspx?blogId=<% =oneforum.Blog_Id %>'><% =oneforum.Blog_Title %></a></td>
                                <td><% =oneforum.Created_ByDirName %></td>
                                <td><% =Convert.ToDateTime(oneforum.Date_Created).ToString("dd/MM/yyyy") %></td>
                                <td><% =oneforum.Time_Created %></td>
                            </tr>
                        <%}%>

                    </table>
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
