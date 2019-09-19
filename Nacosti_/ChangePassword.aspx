<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="Nacosti_.ChangePassword" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
          <div class="col-md-4 col-lg-4 col-sm-2 col-xs-2"></div>
          <div class="col-md-4 col-lg-4 col-sm-8 col-xs-8">
              <div runat="server" id="feedback"></div>
              <%
               try
            {
                bool changedPassword = Convert.ToBoolean(Session["changedPassword"]);
                if(!changedPassword)
                {
                   %>
                  <div class="alert alert-danger">Please update your password to access the other sections of the portal</div>
                  <%
                }
            }
            catch (Exception)
            {
               // Response.Redirect("ResetPass");
               // throw;
            } %>
             <p></p>
           
              <div class="lead">
                  <label>Current Password:</label>
                    <div class="input-group mb-10" > <span class="input-group-addon" style="background-color: #FFFFFF;"><i class="fa fa-lock fa-fw"></i></span>
                              <asp:Textbox runat="server" ID="password" placeholder="Current Password" CssClass="form-control" type="password" required="required"/>
                         </div>
                  
              </div>
              <div class="lead">
                  <label>New Password:</label>
                    <div class="input-group mb-10" > <span class="input-group-addon" style="background-color: #FFFFFF;"><i class="fa fa-lock fa-fw"></i></span>
                              <asp:Textbox runat="server" ID="newPassord" placeholder="New Password" CssClass="form-control" type="password" required="required"/>
                         </div>
                  
              </div>
              <div class="lead">
                  <label>Confirm Password:</label>
                    <div class="input-group mb-10" > <span class="input-group-addon" style="background-color: #FFFFFF;"><i class="fa fa-lock fa-fw"></i></span>
                              <asp:Textbox runat="server" ID="confirmPassword" placeholder="Confirm Password" CssClass="form-control" type="password" required="required"/>
                         </div>
                  
              </div>
              <div class="lead">
                  <p></p>
                  <asp:Button runat="server" ID="btnResetPasss" CssClass="btn btn-block btn-success" Text="Reset Password" OnClick="btnResetPasss_OnClick" />
              </div>
              <p></p>
          </div>
          <div class="col-md-4 col-lg-4 col-sm-2 col-xs-2"></div>
    </div>
</asp:Content>
