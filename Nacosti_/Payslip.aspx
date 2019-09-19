<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payslip.aspx.cs" Inherits="Nacosti_.Payslip"  MasterPageFile="~/Site.Master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="page-wrapper">
        <div class="content container-fluid">
            <div id="payslipfeedback" runat="server"></div>
            
            <div class="row">
		        <div class="col-xs-12">
			        <h4 class="page-title">Payslip</h4>
		        </div>
	        </div>
      <div class="row" style="margin-top:10px;" >
          <div class="lead col-md-5">
              Select Pay Period:
              <asp:DropdownList runat="server" ID="payperiod" CssClass="form-control" OnSelectedIndexChanged="payperiod_SelectedIndexChanged" AutoPostBack="True"/>
          </div>
          <div class="lead">
              <iframe runat="server" ID="display"  src="" width="100%" height="500"></iframe>
          </div>
     </div>
    </div>
</div>
</asp:Content>
