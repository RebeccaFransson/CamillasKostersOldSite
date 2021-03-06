<%@ Page Language="c#" MasterPageFile="../masterpages/umbracoDialog.Master"Codebehind="sort.aspx.cs" AutoEventWireup="True" Inherits="umbraco.cms.presentation.sort" %>
<%@ Register TagPrefix="cc1" Namespace="umbraco.uicontrols" Assembly="controls" %>

<asp:Content ContentPlaceHolderID="head" runat="server">

  <style type="text/css">
    #sortableFrame{height: 270px; overflow: auto; border: 1px solid #ccc;}
    #sortableNodes{padding: 4px; display: block}
    #sortableNodes thead tr th{border-bottom:1px solid #ccc; padding: 4px; padding-right: 25px;
                                background-image: url(/umbraco_client/tableSorting/img/bg.gif);     
                                cursor: pointer; 
                                font-weight: bold; 
                                background-repeat: no-repeat; 
                                background-position: center right; 
                               }
    
    #sortableNodes thead tr th.headerSortDown { 
      background-image: url(/umbraco_client/tableSorting/img/desc.gif); 
    }
     
    #sortableNodes thead tr th.headerSortUp { 
      background-image: url(/umbraco_client/tableSorting/img/asc.gif); 
    } 
    
    #sortableNodes tbody tr td{border-bottom:1px solid #efefef}
    #sortableNodes td{padding: 4px; cursor: move;}  
    tr.tDnD_whileDrag , tr.tDnD_whileDrag td{background:#dcecf3; border-color:  #a8d8eb !Important; margin-top: 20px;}
    #sortableNodes .nowrap{white-space: nowrap; } 
    </style>
  
  
  <script type="text/javascript" src="/umbraco_client/tablesorting/tableFilter.js"></script>
  <script type="text/javascript" src="/umbraco_client/tablesorting/tableDragAndDrop.js"></script>
  
</asp:Content>

<asp:Content ContentPlaceHolderID="body" runat="server">

<div id="loading" style="display: none;">
<div class="notice">
      <p><%= umbraco.ui.Text("sort", "sortPleaseWait") %></p>
</div>
<br />
<img src="/umbraco_client/images/progressbar.gif" />
</div>

<div id="sortingDone" style="display: none;" class="success">
  <p><asp:Literal runat="server" ID="sortDone"></asp:Literal></p>
  <p>
  <a href="#" onClick="top.closeModal()"><%= umbraco.ui.Text("defaultdialogs", "closeThisWindow")%></a>
  </p>
</div>

<div id="sortArea">
<cc1:Pane runat="server" ID="sortPane">
  <p class="help">
    <%= umbraco.ui.Text("sort", "sortHelp") %>
  </p>
  
  <div id="sortableFrame">
    <table id="sortableNodes" cellspacing="0">
      <colgroup>
	      <col/>
	      <col/>
	      <col/>
	    </colgroup>
	    <thead>
	    <tr>
        <th style="width: 100%">Name</th>
        <th class="nowrap">Creation date</th>
        <th class="nowrap">Sort order</th>
      </tr>
      </thead>
      <tbody>
        <asp:Literal ID="lt_nodes" runat="server" />
      </tbody>
    </table>
  </div>
</cc1:Pane>

  <br />
  <p>
    <input type="button" onclick="sort(); return false;" value='<%=umbraco.ui.Text("save") %>' />
    <em> or </em><a href="#" style="color: blue"  onClick="parent.closeModal()"><%=umbraco.ui.Text("general", "cancel", this.getUser())%></a>  
  </p>
</div>
  
   <script type="text/javascript">

     jQuery(document).ready(function() {
       jQuery("#sortableNodes").tablesorter();
       jQuery("#sortableNodes").tableDnD({containment: jQuery("#sortableFrame") } );
     });


     function sort() {
       var rows = jQuery('#sortableNodes tbody tr');
       var sortOrder = "";

       jQuery.each(rows, function() {
         sortOrder += jQuery(this).attr("id").replace("node_","") + ",";
       });
               
        document.getElementById("sortingDone").style.display = 'none';
        document.getElementById("sortArea").style.display = 'none';
        	    
		    document.getElementById("loading").style.display = 'block';	    
		    umbraco.presentation.webservices.nodeSorter.UpdateSortOrder(<%=umbraco.helper.Request("ID")%>, sortOrder, showConfirm);
      }       
       
      function showConfirm() {
		    document.getElementById("loading").style.display = 'none';	    
		    document.getElementById("sortingDone").style.display = 'block';	
		    top.reloadCurrentNode();
		  }
		  
  </script>
  
</asp:Content>
  