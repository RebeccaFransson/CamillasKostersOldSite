<%@ Page Language="c#" MasterPageFile="../masterpages/umbracoDialog.Master" Codebehind="publish.aspx.cs" AutoEventWireup="True" Inherits="umbraco.dialogs.publish" %>
<%@ Register TagPrefix="cc1" Namespace="umbraco.uicontrols" Assembly="controls" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

  <script type="text/javascript" language="javascript">
		var pubTotal = <asp:Literal ID="total" Runat="server"></asp:Literal>;
		xmlHttpDebug = true;
		var masterPagePrefix = '<asp:Literal ID="masterPagePrefix" Runat="server"></asp:Literal>';
				
		var reqNode;
		function startPublication() {
		    if (document.getElementById(masterPagePrefix+"PublishUnpublishedItems").checked) {		
    		    umbraco.webservices.publication.GetPublicationStatusMaxAll('<%=umbraco.helper.Request("id")%>', updateTotal);
    		  } else {
    		    updateTotal(pubTotal);
    		  }
		}
		
		function showPublication() {
	    var statusStr = '<%=umbraco.ui.Text("inProgressCounter")%>'; 
		  document.getElementById("counter").innerHTML = statusStr.replace('%0%', '0').replace('%1%', pubTotal);
			document.getElementById('formDiv').style.display = 'none'; 
			document.getElementById('animDiv').style.display = 'block'; 
		}
		
		function updateTotal(totalNodes) {
		  pubTotal = totalNodes;
			setTimeout("showPublication()", 100);
			setTimeout("updatePublication()", 200);
		}
		
		function updatePublication() {
		  umbraco.webservices.publication.GetPublicationStatus('<%=umbraco.helper.Request("id")%>', updatePublicationDo);
		}
		
		function updatePublicationDo(retVal) {
		  var statusStr = '<%=umbraco.ui.Text("inProgressCounter")%>'; 
		  document.getElementById("counter").innerHTML = statusStr.replace('%0%', retVal).replace('%1%', pubTotal);
			setTimeout("updatePublication()", 200);
		}
		
		function togglePublishingModes(cb){
		    var pubCb = document.getElementById('<%= PublishUnpublishedItems.ClientID %>');  
		    if (cb.checked){
		        pubCb.disabled = false; 
		        //document.getElementById('publishUnpublishedItemsLabel').disabled = false;
		      } else {
		        pubCb.disabled = true;
		        pubCb.checked = false;
		        //document.getElementById('publishUnpublishedItemsLabel').disabled = true;
		     }
		}
		
		// pubCounter
  function doSubmit() {document.Form1["ok"].click()}

	var functionsFrame = this;
	var tabFrame = this;
	var isDialog = true;
	var submitOnEnter = true;
	
  </script>

  <script type="text/javascript" src="../js/umbracoCheckKeys.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
 
    
    <asp:Panel ID="TheForm" Visible="True" runat="server">
      <div id="formDiv" style="visibility: visible;">
        <div class="propertyDiv">
        <p>
          <%= umbraco.ui.Text("publish", "publishHelp", pageName, base.getUser()) %>
        </p>
        
        <p>
        <asp:CheckBox runat="server" ID="PublishAll"></asp:CheckBox>
            <div style="margin-left: 16px; margin-top: 2px;">
                <asp:CheckBox runat="server" ID="PublishUnpublishedItems" Checked="false" /> <%= umbraco.ui.Text("publish", "includeUnpublished")%> 
            </div>
        </p>
        </div>
               
        <asp:Button ID="ok" runat="server" CssClass="guiInputButton"></asp:Button> <em><%= umbraco.ui.Text("general","or") %></em> <a href="#" style="color: blue" onClick="top.closeModal()"><%=umbraco.ui.Text("general", "cancel", this.getUser())%></a>
      </div>
      
      <div id="animDiv" style="display: none;" align="center">
        <script type="text/javascript">
		    umbPgStep = 1;
		    umbPgIgnoreSteps = true;
        </script>
        
        <div class="propertyDiv">
        <p>
          <%=umbraco.ui.Text("publish", "inProgress", this.getUser())%>      
        </p>
        <img src="/umbraco_client/images/progressBar.gif" id="anim" alt="<%=umbraco.ui.Text("publish", "inProgress", this.getUser())%>" /><br />
        <small class="guiDialogTiny"><div id="counter"></div></small>
        
        </div>
      </div>
      
    </asp:Panel>
    
    
    <asp:Panel ID="theEnd" Visible="False" runat="server">
    
      <cc1:Feedback ID="feedbackMsg" runat="server" />
      
      <script type="text/javascript">top.reloadCurrentNode();</script>
      
    </asp:Panel>
</asp:Content>