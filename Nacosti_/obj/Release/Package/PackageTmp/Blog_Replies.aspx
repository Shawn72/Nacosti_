<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Blog_Replies.aspx.cs" Inherits="Nacosti_.Blog_Replies" MasterPageFile="~/Site.Master" %>
<%@ Import Namespace="Nacosti_" %>
<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-wrapper">
        <% var odataconn = WsConfig.ReturnNavObj(); %>
        <div class="content container-fluid">
            <div class="panel panel-outline card-info">
                
                <div class="panel-header">
                    <h4 class="panel-title">
                        Meetings Forum
                    </h4>
                </div>
            
                <div class="panel-body">
               
                    <div class="mb-3">                      
                        <br/>
                        <strong>Forum Title</strong> 
                        <asp:TextBox  runat="server" ID="txtForumTitle" CssClass="form-control" placeholder="forum title" Enabled="False"></asp:TextBox>
                        <br/>
                        <strong>Forum Details (Max Characters: 250)</strong> 
                        <asp:TextBox runat="server" placeholder="forum discussion" TextMode="MultiLine" ID="txtareaForumComment" Enabled="False"
                                     CssClass="form-control" style="width: 100%; height: 100px; font-size: 14px; line-height: 15px; border: 1px solid #dddddd;  padding: 10px;" MaxLength="10"></asp:TextBox>
                    </div>
                    <br/>
                    <div class="mb-3">
                        <div id="forumfeedback" runat="server"></div>
                        <br/>
                        <label id="lblCharleftTextarea" title="" style="color: red;"></label>
                        <strong>Reply to this forum (Max Characters: 250)</strong> 
                        <asp:TextBox runat="server" placeholder="please type your reply here" TextMode="MultiLine" ID="txtForumReply" 
                                     CssClass="form-control" style="width: 100%; height: 100px; font-size: 14px; line-height: 15px; border: 1px solid #dddddd;  padding: 10px;" MaxLength="10"
                                     onKeyUp="javascript:CheckTextArea(this, 250);" onChange="javascript:CheckTextArea(this, 250);"></asp:TextBox>
                    
                        <span class="btn btn-success pull-left btn-sm">
                            <i class="fa fa-send"></i>&nbsp; <asp:Button runat="server" ID="btnSaveReply"  style="background: none;border: 0" Text="Reply" OnClick="btnSaveReply_OnClick"></asp:Button>
                        </span> 
                        <br/>
                        <br/>
                    </div>
                    <br/>

                    <% 
                        var forumReplies = odataconn.blogReplies.Where(r=>r.Blog_Id==blogId).ToList().OrderByDescending(m=>m.Entry_Id);
                       
                        if (!forumReplies.Any())
                        { %>
                            <div class="mb-3">
                                <div class="form-group-lg alert alert-danger">No Replies received yet, be first to comment</div>
                            </div>
                        <% }
                        else
                        {
                        %>
                    <br/>
                    <div class="mb-3">
                        <div class="panel panel-outline card-info">
                            <div class="panel-header">
                                <h4 class="panel-title">All Replies</h4>
                            </div>
                        <div class="panel-body">
                            <div class="form-group-lg">
                                <%foreach (var onereply in forumReplies)
                                  { %>
                                    <div class="row mb-3">
                                        
                                       <% if (onereply.Replier_DirNo.Equals(Session["directorNo"]))
                                          { %>
                                       <div  style="padding-left: 0;">
                                            <div class="pull-left">
                                            <span class="user-img"><img class="img-circle" src="assets/img/avatar.png" width="30" alt="username"></span><%= onereply.Replier_Name %>
                                        </div>
                                        <div class="pull-right" style="font-style: italic"><%= onereply.Blog_Reply %></div> 

                                       </div>
                                        <% }
                                          else
                                          { %>
                                        <div style="padding-left: 5em;">
                                           
                                            <div class="pull-left">
                                                <span class="user-img"><img class="img-circle" src="assets/img/avatar.png" width="30" alt="username"></span><%= onereply.Replier_Name %>
                                            </div>
                                            <div class="pull-right"><%= onereply.Blog_Reply %></div> 
                                       </div>
                                        <% } %>

                                      
                                    </div>
                                <hr/>
                                   <br/>
                                <% } %>
                            </div>
                            
                        </div>
                       </div>
                    </div>
                    <br/>
                    <% } %>                    
                  
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
