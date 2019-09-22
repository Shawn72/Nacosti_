<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Resolutions_Pdf.aspx.cs" Inherits="Nacosti_.Resolutions_Pdf" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-wrapper">
        <div class="content container-fluid">
            <div id="resolutionfeedback" runat="server"></div>
            <div class="row">
                <div class="col-xs-12">
                    <h4 class="page-title">Resolutions for Meeting No: <%=MeetingCode %></h4>
                </div>
            </div>
            <div class="row" style="margin-top:10px;" >
                <div class="lead col-md-5">
                    View Resolutions for this meeting
                   <asp:Button runat="server" ID="btnViewResolution" Text="View Resolutions" OnClick="btnViewResolution_OnClick" CssClass="btn btn-primary"/>
                </div>
                <div class="lead">
                    <iframe runat="server" ID="displayRes"  src="" width="100%" height="500"></iframe>
                </div>
            </div>
        </div>
    </div>
</asp:Content>