<%@ Page Language="C#" MasterPageFile="../masterpages/umbracoDialog.Master" AutoEventWireup="true" CodeBehind="emptyTrashcan.aspx.cs" Inherits="umbraco.presentation.dialogs.emptyTrashcan" %>
<%@ Register TagPrefix="cc1" Namespace="umbraco.uicontrols" Assembly="controls" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
		<script type="text/javascript">
		
		    var emptyTotal = '<%= umbraco.cms.businesslogic.RecycleBin.Count().ToString()%>';
		    
		    function emptyRecycleBin() {
    			jQuery('#formDiv').hide();
    			jQuery('#buttons').hide(); 
	    		jQuery('#animation').show(); 
		    	jQuery('#anim').attr("src","/umbraco_client/images/progressBar.gif");
		    	
		    	// call the empty trashcan webservice
		    	umbraco.presentation.webservices.trashcan.EmptyTrashcan();

         // wait one second to start the status update
         setTimeout('updateStatus();', 1000);
		    }
		    
		    function updateStatus() {
		        umbraco.presentation.webservices.trashcan.GetTrashStatus(updateStatusLabel, failure);
		    }
		    
		    function failure(retVal) {
		        alert('error: ' + retVal);
		    }
		    
		    function updateStatusLabel(retVal) {
                jQuery('#statusLabel').html("<strong>" + retVal + " <%=umbraco.ui.Text("remaining")%></strong>");            

                if (retVal != '' && retVal != '0') {
                    setTimeout('updateStatus();', 500);
                } else {
                    jQuery('#div_form').hide();
                    jQuery('#notification').show();
                    jQuery('#notification').html("<p><%=umbraco.ui.Text("defaultdialogs", "recycleBinIsEmpty")%> </p> <p><a href='#' onClick='top.closeModal()'><%= umbraco.ui.Text("defaultdialogs", "closeThisWindow")%></a></p>");
                    top.reloadCurrentNode();
                }
                
		    }
		</script>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="body">
    
 		
  	<div class="success" id="notification" style="display: none;"></div>
		
		<div id="div_form">
		<cc1:Pane id="pane_form" runat="server">
		<cc1:PropertyPanel runat="server">
		
		
		
		<div id="animation" align="center" style="display: none;">
		<p><%= umbraco.ui.Text("defaultdialogs", "recycleBinDeleting")%></p>
		
		<img src="/umbraco_client/images/progressBar.gif" id="anim" alt="<%=umbraco.ui.Text("actions", "emptyTrashcan", this.getUser())%>"/><br />
		<span class="guiDialogTiny" id="statusLabel"><%=umbraco.ui.Text("deleting", this.getUser())%></span>
		</div>
	  	  	  
	  <div id="formDiv">
	    <p><%= umbraco.ui.Text("defaultdialogs", "recycleBinWarning")%></p>
		   <input type="checkbox" id="confirmDelete" onclick="$get('ok').disabled = !this.checked;" /> <label for="confirmDelete"><%=umbraco.ui.Text("defaultdialogs", "confirmEmptyTrashcan", umbraco.cms.businesslogic.RecycleBin.Count().ToString(), this.getUser())%></label>
		</div>
	  </cc1:PropertyPanel>
	  </cc1:Pane>
	  
		<br />
		<div id="buttons">
		<input type="button" ID="ok" value="<%=umbraco.ui.Text("actions", "emptyTrashcan", this.getUser()) %>" class="guiInputButton" onclick="if ($get('confirmDelete').checked) {emptyRecycleBin();}" disabled="true" />  
		<em><%= umbraco.ui.Text("or") %></em> 
    <a href="#" onclick="top.closeModal();">
      <%=umbraco.ui.Text("cancel")%>
    </a>
		</div>
		</div>
</asp:Content>