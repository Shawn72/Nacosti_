<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Board_Papers.aspx.cs" Inherits="Nacosti_.Board_Papers" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server" >
<div class="page-wrapper">
    
<div class="content container-fluid">
<h1></h1>
<div class="panel panel-default" style="margin-top:10px;" >
  
<div class="panel-group">
    <div class="form-group">
        
        <h4>Board Documents</h4>
        <hr />
        <asp:TreeView ID="treeView1" runat="server" ImageSet="XPFileExplorer" NodeIndent="15" >
            <HoverNodeStyle Font-Underline="True" ForeColor="#6666AA"  />
            <NodeStyle Font-Names="Corbel" Font-Size="12pt" ForeColor="Black" HorizontalPadding="2px"
                       NodeSpacing="0px" VerticalPadding="2px" ></NodeStyle>
            <ParentNodeStyle Font-Bold="False" />
            <SelectedNodeStyle BackColor="#B5B5B5" Font-Underline="False" HorizontalPadding="0px"
                               VerticalPadding="0px"  />
        </asp:TreeView>

    </div>
    
 <%--<div class="form-group">
        <asp:GridView ID="gridBoarPapersUploads" runat="server" CssClass="table table-striped table-hover" GridLines="None" AutoGenerateColumns="false" EmptyDataText = "No files available for this meeting">
            <Columns>
                <asp:BoundField DataField="Text" HeaderText="Meeting Documents" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkDownload" Text = "Download" CommandArgument = '<%# Eval("Value") %>' runat="server" OnClick = "DownloadFile"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkViewDoc" runat ="server" Text = "View" CommandArgument = '<%# Eval("Value") %>' OnClick = "lnkViewDoc_OnClick" AutoPostBack ="True" OnClientClick="SetTarget();"></asp:LinkButton>
                    </ItemTemplate> 

                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>--%>

<br />
<div class="panel panel-default" style="margin-top:10px; display: none;" id="viewmeID">
    <iframe runat="server" ID="viewMe" width="100%" height="500"></iframe>
</div>

</div>
</div>
        	
					
</div>
</div>
   

<script type = "text/javascript">
    let vieMeid = document.querySelector('#viewmeID');
    const SetTarget=()=> {
        document.forms[0].target = "_blank";
        vieMeid.style.display = "block";
    }
</script>

</asp:Content>
