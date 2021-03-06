<%@ Page Language="c#" MasterPageFile="../masterpages/umbracoDialog.Master" Codebehind="AssignDomain.aspx.cs" AutoEventWireup="True" Inherits="umbraco.dialogs.AssignDomain" %>
<%@ Register TagPrefix="cc1" Namespace="umbraco.uicontrols" Assembly="controls" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
function doSubmit() {document.Form1["ok"].click()}
	var functionsFrame = this;
	var tabFrame = this;
	var isDialog = true;
	var submitOnEnter = true;
	</script>
	<!--
  <script type="text/javascript" src="../js/umbracoCheckKeys.js"></script>
-->
</asp:Content>

<asp:Content ContentPlaceHolderID="body" runat="server">
    <input type="hidden" name="domainId" value="<%=umbraco.helper.Request("editDomain")%>" />
    
    <cc1:Feedback ID="FeedBackMessage" runat="server" />
    
    <cc1:Pane runat="server" ID="pane_addnew">
      <cc1:PropertyPanel runat="server" ID="prop_domain" Text="Domain">
         <asp:TextBox ID="DomainName" runat="server" Width="252px"></asp:TextBox>
              <asp:RequiredFieldValidator ControlToValidate="Languages" ErrorMessage="*" ID="DomainValidator" runat="server" Display="Dynamic" />
              <br /><small><%= umbraco.ui.Text("assignDomain", "domainHelp") %></small>
      </cc1:PropertyPanel>
      
      <cc1:PropertyPanel ID="prop_lang" runat="server" Text="language">
        <asp:RequiredFieldValidator ControlToValidate="Languages" ErrorMessage="*" ID="LanguageValidator"
              runat="server" Display="Dynamic" />
            <asp:DropDownList ID="Languages" runat="server" />
      </cc1:PropertyPanel>
      
      <cc1:PropertyPanel runat="server" Text=" ">
        <asp:Button ID="ok" runat="server" OnClick="SaveDomain"></asp:Button> 
      </cc1:PropertyPanel>
    </cc1:Pane>
    
    <cc1:Pane ID="pane_edit" runat="server">
      <cc1:PropertyPanel runat="server">
                <asp:Literal ID="allDomains" runat="server" />
      </cc1:PropertyPanel> 
    </cc1:Pane>
    
    <p>
      <a href="#" onClick="top.closeModal()"><%= umbraco.ui.Text("defaultdialogs", "closeThisWindow")%></a>
    </p>
</asp:Content>