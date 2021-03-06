<%@ Page Title="Edit content" Language="c#" MasterPageFile="masterpages/umbracoPage.Master"Codebehind="editContent.aspx.cs" ValidateRequest="false" AutoEventWireup="True"
  Inherits="umbraco.cms.presentation.editContent" Trace="false" %>
  
<%@ Register TagPrefix="cc1" Namespace="umbraco.uicontrols" Assembly="controls" %>



<asp:Content ContentPlaceHolderID="head" runat="server">
  <script type="text/javascript">
		// Save handlers for IDataFields		
		var saveHandlers = new Array();
		
		// A hack to make sure that any javascript can access page id and version
		<asp:Literal id="jsIds" runat="server"></asp:Literal>
		
		// For short-cut keys
		var isDialog = true;
		var functionsFrame = this;
		var disableEnterSubmit = true;
	
		
		function addSaveHandler(handler) {
			saveHandlers[saveHandlers.length] = handler;
		}		
		
		function invokeSaveHandlers() {
			for (var i=0;i<saveHandlers.length;i++) {
				eval(saveHandlers[i]);
			}
		}
		
		function doSubmit() {
			invokeSaveHandlers();
			document.getElementById("TabView1_tab01layer_save").click();
		}
  </script>
  
  <script src="js/umbracoCheckKeys.js" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="body" runat="server">
<table height="38" cellspacing="0" cellpadding="0" width="371" border="0">
      <tr valign="top">
        <td height="20">
        </td>
        <td>
          <asp:PlaceHolder ID="plc" runat="server"></asp:PlaceHolder>
        </td>
      </tr>
    </table>
    
    <input id="doSave" type="hidden" name="doSave" runat="server">
    <input id="doPublish" type="hidden" name="doPublish" runat="server">
    
      <asp:Panel ID="syncScript" runat="server" Visible="false">
        <script type="text/javascript">
            parent.top.syncTree('<asp:Literal id="SyncPath" runat="server"></asp:Literal>', '<%=umbraco.helper.Request("isNew") %>', '<asp:Literal id="newName" runat="server"></asp:Literal>', '<asp:Literal id="newPublishStatus" runat="server"></asp:Literal>');
      </script>
    </asp:Panel>
</asp:Content>    