<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  
  <link href="resources/app/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css">
  <link href="resources/app/bower_components/fancytree/dist/skin-bootstrap/ui.fancytree.min.css" rel="stylesheet" type="text/css">
  <link href="resources/app/bower_components/bootstrap3-dialog/dist/css/bootstrap-dialog.min.css" rel="stylesheet" type="text/css">
  
  <style type="text/css">
		
		/* Reduce bootstrap's default 'panel' padding: */
		div#tree {
			padding: 3px 5px;
		}
		#draggableSample, #droppableSample {
    		height:100px;
    		padding:0.5em;
    		width:150px;
    		border:1px solid #AAAAAA;
  		}
  		#draggableSample {
    		background-color: silver;
    		color:#222222;
  		}
  		#droppableSample {
    		background-color: maroon;
    		color: white;
  		}
  		#droppableSample.drophover {
    		border: 1px solid green;
  		}
  		.menu-padding {padding-top:40px;}
  		.dropdown-menu-right{
  			float: left;
  		}
  		.btn-separator:after {
    		content: ' ';
    		display: block;
    		float: left;
    		background: #2fb34a;
    		margin: 0 5px;
    		height: 37px;
    		width: 1px;
		}
		#mainHeader {
			padding-top: 5px;
			background-color: #d6d5d5;
		}
		.menu {
			margin-top: 10px;
		}
		.logo {
			margin: 5px;
		}
		
		.margin_nav {
  			margin-top: 5px;
  			line-height:20px;
  			margin-bottom: 5px;
  			
		}
		.nav-pills > li > a {
    		line-height: 1px;
    		margin-right: 2px;
    		padding-left: 12px;
    		padding-right: 12px;
		}

</style>
  
</head>
<body >
<div class="container-fluid">
	<div class="row">
		 <table width="100%" cellspacing="0" cellpadding="0" border="0" id="mainHeader">
		 	<tr>
		   	<td><img id="logo" class="logo" src="assets/logo.png" alt="Logo"/></td>
		   	<c:if test="${!simple}">
		     		<td align="center" width="99%" id="eventsRow">
		       		<a href="events.shtm">
		         			<span id="__header__alarmLevelDiv" style="display:none;">
		           			<img id="__header__alarmLevelImg" src="images/spacer.gif" alt="" border="0" title=""/>
		           			<span id="__header__alarmLevelText"></span>
		         			</span>
		       		</a>
		       	</td>
		   	</c:if>
		   	<c:if test="${!empty instanceDescription}">
		     		<td align="right" valign="bottom" class="projectTitle" style="padding:5px; white-space: nowrap;">${instanceDescription}</td>
		   	</c:if>
		 	</tr>
		</table>
	</div>
	
	<div class="row">
		<div class="col-md-12">
		    <nav>
		    	<ul class="nav nav-pills margin_nav">
		    		<c:if test="${!empty sessionUser}">
		    		
		    			<li role="presentation"><a href="watch_list.shtm" class='btn btn-xs' data-toggle="tooltip" data-placement="top" title='<fmt:message key="menu.watchlists.tooltip"/>'><img src="resources/app/menu_icons/eye.png" ></a></li>
  						<li role="presentation"><a href="views.shtm" class='btn btn-xs' data-toggle="tooltip" data-placement="top" title='<fmt:message key="menu.graphicalviews.tooltip"/>'><img src="resources/app/menu_icons/icon_view.png" ></a></li>
  						<li role="presentation"><a href="events.shtm" class='btn btn-xs' data-toggle="tooltip" data-placement="top" title='<fmt:message key="menu.alarms.tooltip"/>'><img src="resources/app/menu_icons/flag_white.png" ></a></li>	
  						<li role="presentation"><a href="reports.shtm" class='btn btn-xs' data-toggle="tooltip" data-placement="top" title='<fmt:message key="menu.reports.tooltip"/>'><img src="resources/app/menu_icons/report.png" ></a></li>
  						
  						<c:if test="${sessionUser.dataSourcePermission}">
          			    	<span class="btn-separator"></span>
            				<li role="presentation"><a href="event_handlers.shtm" class='btn btn-xs' data-toggle="tooltip" data-placement="top" title='<fmt:message key="menu.event_handlers.tooltip"/>'><img src="resources/app/menu_icons/cog.png"/></a></li>
            				<li role="presentation"><a href="data_sources.shtm" class='btn btn-xs' data-toggle="tooltip" data-placement="top" title='<fmt:message key="menu.data_source.tooltip"/>'><img src="resources/app/menu_icons/icon_ds.png"/></a></li>
            				<li role="presentation"><a href="scheduled_events.shtm" class='btn btn-xs' data-toggle="tooltip" data-placement="top" title='<fmt:message key="menu.scheduled_events.tooltip"/>'><img src="resources/app/menu_icons/clock.png"/></a></li>
            				<li role="presentation"><a href="compound_events.shtm" class='btn btn-xs' data-toggle="tooltip" data-placement="top" title='<fmt:message key="menu.compound_event_detectors.tooltip"/>'><img src="resources/app/menu_icons/multi_bell.png"/></a></li>
            				<li role="presentation"><a href="point_links.shtm" class='btn btn-xs' data-toggle="tooltip" data-placement="top" title='<fmt:message key="menu.point_links.tooltip"/>'><img src="resources/app/menu_icons/link.png"/></a></li>
            				<li role="presentation"><a href="scripting.shtm" class='btn btn-xs' data-toggle="tooltip" data-placement="top" title='<fmt:message key="menu.scripting.tooltip"/>'><img src="resources/app/menu_icons/script_gear.png"/></a></li>
            				<span class="btn-separator"></span>
          				</c:if>
          				
          				<li role="presentation"><a href="users.shtm" data-toggle="tooltip" data-placement="top" title='<fmt:message key="menu.users.tooltip"/>'><img src="resources/app/menu_icons/user.png"/></a></li>
          				<c:if test="${sessionUser.admin}">
	        				<li role="presentation"><a href="usersProfiles.shtm" class='btn btn-xs' data-toggle="tooltip" data-placement="top" title='<fmt:message key="menu.users_profiles.tooltip"/>'><img src="resources/app/menu_icons/user_ds.png"/></a></li>
            				<li role="presentation" class="active"><a href="pointHierarchySLTS" class='btn btn-xs' data-toggle="tooltip" data-placement="top" title='<fmt:message key="menu.point_hierarchy.tooltip"/>'><img src="resources/app/menu_icons/folder_brick.png"/></a></li>
            				<li role="presentation"><a href="mailing_lists.shtm" class='btn btn-xs' data-toggle="tooltip" data-placement="top" title='<fmt:message key="menu.mailing_lists.tooltip"/>'><img src="resources/app/menu_icons/book.png"/></a></li>
            				<li role="presentation"><a href="publishers.shtm" class='btn btn-xs' data-toggle="tooltip" data-placement="top" title='<fmt:message key="menu.publishers.tooltip"/>'><img src="resources/app/menu_icons/transmit.png"/></a></li>
            				<li role="presentation"><a href="maintenance_events.shtm" class='btn btn-xs' data-toggle="tooltip" data-placement="top" title='<fmt:message key="menu.maintenance_events.tooltip"/>'><img src="resources/app/menu_icons/hammer.png"/></a></li>
            				<li role="presentation"><a href="system_settings.shtm" class='btn btn-xs' data-toggle="tooltip" data-placement="top" title='<fmt:message key="menu.system_setings.tooltip"/>'><img src="resources/app/menu_icons/application_form.png"/></a></li>
            				<li role="presentation"><a href="emport.shtm" class='btn btn-xs' data-toggle="tooltip" data-placement="top" title='<fmt:message key="menu.import_export.tooltip"/>'><img src="resources/app/menu_icons/script_code.png"/></a></li>
            				<li role="presentation"><a href="sql.shtm" class='btn btn-xs' data-toggle="tooltip" data-placement="top" title='<fmt:message key="menu.sql.tooltip"/>'><img src="resources/app/menu_icons/script.png"/></a></li>
            				<span class="btn-separator"></span>
          				</c:if>
          			
          				<li role="presentation"><a href="logout.htm" class='btn btn-xs' data-toggle="tooltip" data-placement="top" title='<fmt:message key="menu.logout.tooltip"/>'><img src="resources/app/menu_icons/control_stop_blue.png"></a></li>
          				<li role="presentation"><a href="help.shtm" class='btn btn-xs' data-toggle="tooltip" data-placement="top" title='<fmt:message key="menu.help.tooltip"/>'><img src="resources/app/menu_icons/help.png"></a></li>
		    		</c:if>
        			<c:if test="${empty sessionUser}">
          				<li role="presentation"><a href="login.htm" class='btn btn-xs' data-toggle="tooltip" data-placement="top" title='<fmt:message key="menu.login.tooltip"/>'><img src="resources/app/menu_icons/control_play_blue.png"></a></li>
        			</c:if>
        			<div class="btn-group pull-right menu">
						<button class="btn dropdown-toggle btn-xs" data-toggle="dropdown" data-toggle="tooltip" data-placement="top" title='<fmt:message key="menu.change_language.tooltip"/>'>
							<img src="resources/app/menu_icons/world.png" alt="" >
							<span class="caret"/>
						</button>
						<ul class="dropdown-menu dropdown-menu-right">
 			    			<li><a onclick="setLocale('de')">Deutsch</a></li>
               				<li><a onclick="setLocale('ru')">Руссиан</a></li>
             				<li><a onclick="setLocale('fi')">Suomi</a></li>
           					<li><a onclick="setLocale('pt')">Português</a></li>
           					<li><a onclick="setLocale('en')">English</a></li>
             				<li><a onclick="setLocale('lu')">Luxembourgeois</a></li>
							<li><a onclick="setLocale('fr')">Francais</a></li>
							<li><a onclick="setLocale('zh')">中文</a></li>
							<li><a onclick="setLocale('nl')">Nederlands</a></li>
							<li><a onclick="setLocale('es')">Español</a></li>
 						</ul>
  					</div>
  					<div class="btn-group pull-right menu">
            			<c:if test="${!empty sessionUser}">
            				<a href="" class="btn btn-xs"><span><fmt:message key="header.user"/>: <b>${sessionUser.username}</b></mark></span></a>
            	  
            			<!-- TODO REST MiscDwr.toggleUserMuted(setUserMuted)
            				<img id="userMutedImg" class="ptr" onclick="MiscDwr.toggleUserMuted(setUserMuted)" onmouseover="hideLayer('localeEdit')" border="0" src="images/sound_none.png" title="Mute" alt="Mute" style="display: inline;">
            			-->
            			<!-- TODO goHomeUrl()
            				<img src="images/house.png" alt="" title="Go to my default page" class="ptr" onclick="goHomeUrl()" onmouseover="hideLayer('localeEdit')" border="0">
            			-->
            			<!-- TODO setHomeUrl()
            				<img src="images/house_link.png" alt="" title="Make this my default page" class="ptr" onclick="setHomeUrl()" onmouseover="hideLayer('localeEdit')" border="0">
            			-->
          				</c:if>
          			</div>
				</ul>
		    </nav>          	
		  </div>
	</div>

  	<div class="row">
		<div class="col-md-12">
  			<c:if test="${!empty sessionUser}">
  				<div class="panel panel-default" >
					<div class="panel-heading help">
						<b><fmt:message key="pointHierarchySLTS.pointHierarchy"/></b> <span class="glyphicon glyphicon-question-sign"></span> <span class="label label-warning">rc version of the view</span>
	     			</div>
	     			<div class="menu panel-heading help">
						<div class="btn-group">
			  				<button id="addNode" class="btn btn-success" data-toggle="tooltip" data-placement="top" title='<fmt:message key="menu.point_hierarchy.add.tooltip"/>'>
			    				<span class="glyphicon glyphicon-plus"></span>
			  				</button>
			  				<button id="editNode" class="btn btn-warning" data-toggle="tooltip" data-placement="top" title='<fmt:message key="menu.point_hierarchy.edit.tooltip"/>'>
			    				<span class="glyphicon glyphicon-pencil"></span>
			  				</button>
			  				<button  id="deleteNode" class="btn btn-danger" data-toggle="tooltip" data-placement="top" title='<fmt:message key="menu.point_hierarchy.delete.tooltip"/>'>
			    				<span class="glyphicon glyphicon-minus"></span>
			  				</button>
			  				<button id="reloadNode" class="btn btn-primary" data-toggle="tooltip" data-placement="top" title='<fmt:message key="menu.point_hierarchy.refresh.tooltip"/>'>
			    				<span class="glyphicon glyphicon-refresh"></span>
			  				</button>
			  				<button id="infoNode" class="btn btn-primary" data-toggle="tooltip" data-placement="top" title='<fmt:message key="menu.point_hierarchy.info.tooltip"/>'>
			    				<span class="glyphicon glyphicon-info-sign"></span>
			  				</button>
						</div>
	     			</div>     
					<div id="tree" class=" panel-body fancytree-colorize-hover fancytree-fade-expander"></div>
 				</div>
  			</c:if>
  		</div>
  </div>
  <table width="100%" cellspacing="0" cellpadding="0" border="0">
    <tr><td colspan="2">&nbsp;</td></tr>
    <tr>
      <td colspan="2" class="footer" align="center">&copy;2016 <fmt:message key="footer.rightsReserved"/></td>
    </tr>
  </table>
</div>
</body>

<script src="resources/app/bower_components/jquery/dist/jquery.min.js"></script>
<script src="resources/app/bower_components/jquery-ui/jquery-ui.min.js"></script>
<script src="resources/app/bower_components/bootstrap/dist/js/bootstrap.min.js"></script> 
<script src="resources/app/bower_components/fancytree/dist/jquery.fancytree-all.min.js"></script>
<script src="resources/app/bower_components/bootstrap3-dialog/dist/js/bootstrap-dialog.min.js"></script>

<script>
    

var messages = {
  move: "<fmt:message key="pointHierarchySLTS.move"/>",
  folderNotMove: "<fmt:message key="pointHierarchySLTS.folderNotMove"/>",
  close: "<fmt:message key="pointHierarchySLTS.close"/>",
  yes: "<fmt:message key="pointHierarchySLTS.yes"/>",
  folder: "<fmt:message key="pointHierarchySLTS.folder"/>",
  folderChange: "<fmt:message key="pointHierarchySLTS.folderChange"/>",
  confirmDelete: "<fmt:message key="pointHierarchySLTS.confirmDelete"/>",
  folderRemoved: "<fmt:message key="pointHierarchySLTS.folderRemoved"/>",
  key: "<fmt:message key="pointHierarchySLTS.key"/>",
  title: "<fmt:message key="pointHierarchySLTS.title"/>",
  msg: "<fmt:message key="pointHierarchySLTS.msg"/>",
  pleaseSelectElement: "<fmt:message key="pointHierarchySLTS.pleaseSelectElement"/>",
  pleaseSelectElementFolder: "<fmt:message key="pointHierarchySLTS.pleaseSelectElementFolder"/>",
  weOnlyEditFolder: "<fmt:message key="pointHierarchySLTS.weOnlyEditFolder"/>",
  editFolder: "<fmt:message key="pointHierarchySLTS.editFolder"/>",
  titleEdit: "<fmt:message key="pointHierarchySLTS.titleEdit"/>",
  oldTitle: "<fmt:message key="pointHierarchySLTS.oldTitle"/>",
  newTitle: "<fmt:message key="pointHierarchySLTS.newTitle"/>",
  folderNotEdit: "<fmt:message key="pointHierarchySLTS.folderNotEdit"/>",
  errorThrown: "<fmt:message key="pointHierarchySLTS.errorThrown"/>",
  move: "<fmt:message key="pointHierarchySLTS.move"/>",
  keyParent: "<fmt:message key="pointHierarchySLTS.keyParent"/>",
  parent: "<fmt:message key="pointHierarchySLTS.parent"/>",
  folderNotRemove: "<fmt:message key="pointHierarchySLTS.folderNotRemove"/>",
  removeFolder: "<fmt:message key="pointHierarchySLTS.removeFolder"/>",
  warning: "<fmt:message key="pointHierarchySLTS.warning"/>",
  pleaseSelectElement: "<fmt:message key="pointHierarchySLTS.pleaseSelectElement"/>",
  info: "<fmt:message key="pointHierarchySLTS.info"/>",
  isFolder: "<fmt:message key="pointHierarchySLTS.isFolder"/>",
  dataSource: "<fmt:message key="pointHierarchySLTS.dataSource"/>",
  xid: "<fmt:message key="pointHierarchySLTS.xid"/>",
  type: "<fmt:message key="pointHierarchySLTS.type"/>",
  changeOfLanguageFailed: "<fmt:message key="pointHierarchySLTS.changeOfLanguageFailed"/>",
  warningDontRemoveDataPointInRoot: "<fmt:message key="pointHierarchySLTS.warningDontRemoveDataPointInRoot"/>",
  moveDataPointToRoot: "<fmt:message key="pointHierarchySLTS.moveDataPointToRoot"/>",
  areYouSureToMoveElement: "<fmt:message key="pointHierarchySLTS.areYouSureToMoveElement"/>",
  movedElement: "<fmt:message key="pointHierarchySLTS.movedElement"/>"
};
	var glyph_opts = {
    	    map: {
    	      doc: "glyphicon glyphicon-file",
    	      docOpen: "glyphicon glyphicon-file",
    	      checkbox: "glyphicon glyphicon-unchecked",
    	      checkboxSelected: "glyphicon glyphicon-check",
    	      checkboxUnknown: "glyphicon glyphicon-share",
    	      dragHelper: "glyphicon glyphicon-play",
    	      dropMarker: "glyphicon glyphicon-arrow-right",
    	      error: "glyphicon glyphicon-warning-sign",
    	      expanderClosed: "glyphicon glyphicon-plus-sign",
              expanderLazy: "glyphicon glyphicon-plus-sign",
              expanderOpen: "glyphicon glyphicon-minus-sign",
    	      folder: "glyphicon glyphicon-folder-close",
    	      folderOpen: "glyphicon glyphicon-folder-open",
    	      loading: "glyphicon glyphicon-refresh glyphicon-spin"
    	    }
    	  };
	var nodeActivate;
	var nodeDragAndDrop;
	var newNode;
	
    $(function () {
    	$('[data-toggle="tooltip"]').tooltip();
    	
    	var pathArray = location.href.split( '/' );
        var protocol = pathArray[0];
        var host = pathArray[2];
        var port = '<c:out value="${appPort}"/>';
        var appScada = '<c:out value="${appName}"/>';
        var url = protocol + '//' + host;
        var myLocation;
        if (!myLocation) {
     	   myLocation = location.protocol + "//" + location.host + "" + appScada + "/";
        }

    	var getParentId = function(node) {
    		if (node != undefined) {
      		  var parentId=0;
      		  try {
      			  parentId = parseInt(node.parent.key);
      			  if (isNaN(parentId)) {
      				  parentId=0;
      			  }
      		  } catch (e) {
      		  }
      		  return parentId;
    		} else {
    			return undefined;
    		}
    	}
    	
    	var toMove ={};
    	$("#tree").fancytree({
    	      extensions: ["dnd","glyph", "wide"],
    	      debugLevel: 0,
    	      checkbox: false,
    	      autoScroll: true,
    	      autoActivate: true,
    	      activeVisible: false,
    	      clickFolderMode: 4,
    	      focusOnSelect: true,
    	      generateIds: false,
    	      keyboard: true,
    	      tabindex: -1,
    	      titlesTabbable: false,
  	          activate: function(event, data) {
  	            nodeActivate = data.node;
  	          },
    	      dnd: {
    	    	autoExpandMS: 400,
    	        focusOnClick: true,    // gb disable becouse when expand (not want change focus)
  	            preventVoidMoves: true, // Prevent dropping nodes 'before self', etc.
  	            preventRecursiveMoves: true, // Prevent dropping nodes on own descendants
    	        dragStart: function(node, data) {    	        	
      			    nodeDragAndDrop = data.node;
    	        	return true; 
    	        },
    	        dragEnter: function(node, data) {
    	        	if( data.node.isFolder() ) {
        			  return true;
    	    	    } else {
    	    	      return false;
    	    	    }
    	        },
    	        dragDrop: function(node, data) {    	        	
    	        	BootstrapDialog.show({
    	 		       title: messages.move +':'+ nodeDragAndDrop.title,
    	 		       message: function(dialog) {
    	 		    	 var newNode = data.node;
    	 		    	 toMove.key = nodeDragAndDrop.key;
    	 		    	 toMove.oldParentId = getParentId(nodeDragAndDrop);
    	 		    	 toMove.newParentId = newNode.key;
					     var $content = $('<div><h3 id="title">'+messages.folder+':</h3>'+
					    		 '<ul><li>'+messages.key+':'+nodeDragAndDrop.key+'</li><li>'+messages.title+':<b>'+nodeDragAndDrop.title+'</b></li><li>'+ messages.keyParent + ':'+nodeDragAndDrop.parent.key+'</li><li>'+messages.parent+':<b>'+nodeDragAndDrop.parent.title+'</b></li></ul>'+
					    		 '<ul><li>'+messages.key+':'+newNode.key+'</li><li>'+messages.title+':<b>'+newNode.title+'</b></li><li>'+messages.keyParent+':'+newNode.parent.key+'</li><li>'+messages.parent+':<b>'+newNode.parent.title+'</b></li></ul>'
					     );
					     
    	 		         dialog.setType(BootstrapDialog.TYPE_WARNING);
    	 		         return $content;
    	 		       },
    	 		       buttons: [{
    	 		         id: 'btn-Yes',
    	 		         label: messages.yes,
    	 		         cssClass: 'btn-warning',
    	 		         action: function(dialog) {
    	 		           dialog.getButton('btn-Close').disable();
    	 		           var $button = this; 
    	 		           $button.disable();
    	 		           $button.spin();
    	 		           dialog.setClosable(false);   	 		           
                           $.ajax({
    	 			            type: "POST",
    	 			        	dataType: "json",
    	 			        	url:myLocation+'/pointHierarchy/move/'+toMove.key+'/'+toMove.oldParentId+'/'+toMove.newParentId+'/'+nodeDragAndDrop.isFolder(), 
    	 			        	success: function(msg){
    	 			        	  nodeDragAndDrop.moveTo(data.node, "child");
    	 			        	  $button.hide();
    	 			 		      $button.stopSpin();
    	 			 		      dialog.setClosable(true);
    	 			 		      dialog.getButton('btn-Close').enable();
    	 			        	},
    	 			        	  error: function(XMLHttpRequest, textStatus, errorThrown) {
    	 			        	    dialog.getModalBody().html('<div><h3>'+messages.folderNotMove+'</h3><p>'+pointHierarchySLTS.errorThrown+':'+errorThrown+'</p></div>');
    	 			        	    $button.hide();
    	 				 		    $button.stopSpin();
    	 				 		    dialog.setClosable(true);
    	 				 		    dialog.getButton('btn-Close').enable();
    	 			        	  }
    	 			       });
    	 		         }
    	 		       },
    	 		       {
    	 		         id: 'btn-Close',
    	 		         label:'Close',
    	 		         action: function(dialog) {
    	 		           dialog.close();
    	 		         }
    	 		       }]
    	 		     });
    	        	
    	        }
    	      },
    	      glyph: glyph_opts,
    	      selectMode: 2,
    	      source: {url: myLocation+"/pointHierarchy/0", debugDelay: 0},
    	      toggleEffect: { effect: "drop", options: {direction: "left"}, duration: 100 },
    	      wide: {
    	        iconWidth: "1em",     // Adjust this if @fancy-icon-width != "16px"
    	        iconSpacing: "0.5em", // Adjust this if @fancy-icon-spacing != "3px"
    	        levelOfs: "1.5em"     // Adjust this if ul padding != "16px"
    	      },
    	      icon: function(event, data){
    	         if( data.node.isFolder() ) {
    	           return "glyphicon glyphicon-book";
    	         }
    	      },
    	      lazyLoad: function(event, data) {
    	    	data.result = {
    	    	 url: myLocation+"/pointHierarchy/"+data.node.key,
    	         cache: false,
    	         debugDelay: 0
    	         };
    	      }
    	    });
    	$("button#addNode").click(()=>{
    		BootstrapDialog.show({
 		      title: messages.folder,
 		      onshown: function(dialog) {
 		    	 dialog.getModalBody().find('input').focus();
 		      },
 		      message: function(dialog) {
 		        var $content = $('<div>'+messages.title+': <input type="text" class="form-control" maxlength="100"></div>');
 		        dialog.setType(BootstrapDialog.TYPE_SUCCESS);
 		        return $content;
 		      },
 		      buttons: [{
 		        id: 'btn-Yes',
 		        label: messages.yes,
 		        cssClass: 'btn-su',
 		        action: function(dialog) {
 		          dialog.getButton('btn-Close').disable();
 		          var $button = this; 
 		          $button.disable();
 		          $button.spin();
 		          dialog.setClosable(false);
 		          $.ajax({
		            type: "POST",
		        	dataType: "json",
		        	url:myLocation+"/pointHierarchy/new/0/"+dialog.getModalBody().find('input').val(), 
		        	success: function(msg){
		        	  var titleNewNode = dialog.getModalBody().find('input').val();
		        	  dialog.getModalBody().html('<div><h3>'+messages.folder+':</h3><ul><li>'+messages.key+':<b>'+msg+'</b></li><li>'+messages.title+':<b>'+titleNewNode+'</b></li></ul></div>');
		        	  $button.hide();
		 		      $button.stopSpin();
		 		      dialog.setClosable(true);
		 		      dialog.getButton('btn-Close').enable();
		 		      var tree = $("#tree").fancytree("getTree"); 
				      var rootNode = tree.getRootNode();
		 		      var childNode = rootNode.addChildren({
		 		         title:    titleNewNode,
		 		         tooltip:  titleNewNode,
		 		         folder:   true,
		 		         key:      msg
		 		       });
		        	  },
		        	  error: function(XMLHttpRequest, textStatus, errorThrown) {
		        	    dialog.getModalBody().html('<div><h3>'+messages.folderNotAdd+'</h3><p>'+ messages.errorThrown +':'+errorThrown+'</p></div>');
		        	    $button.hide();
			 		    $button.stopSpin();
			 		    dialog.setClosable(true);
			 		    dialog.getButton('btn-Close').enable();
		        	  }
		        	});   
 		        }
 		      },
 		      {
 		         id: 'btn-Close',
 		         label: messages.close,
 		         action: function(dialog) {
 		           dialog.close();
 		         }
 		      }]
 		    });
    	});
    	$("button#deleteNode").click(()=>{
    		if (nodeActivate != undefined) {  			
    			if ( (getParentId(nodeActivate)==0) && (nodeActivate.isFolder()==false) ) {
    				BootstrapDialog.show({
                        type: BootstrapDialog.TYPE_WARNING,
                        title: messages.warning,
                        message: messages.warningDontRemoveDataPointInRoot,
                        buttons: [{
                            label: messages.close,
           		           action: function(dialog) {
           		             dialog.close();
           		           }
                        }]
                    });
    				return;
    			} else {
    				if ( (nodeActivate != undefined) && (nodeActivate.isFolder()) ) {
		 		      BootstrapDialog.show({
				       title: messages.removeFolder +':'+nodeActivate.title,
				       message: function(dialog) {
				         var $content = $('<div><h3>'+ messages.confirmDelete+'</h3></div>');
				         dialog.setType(BootstrapDialog.TYPE_DANGER);
				         return $content;
				       },
				       buttons: [{
				         id: 'btn-Yes',
				         label: messages.yes,
				         cssClass: 'btn-danger',
				         action: function(dialog) {
				           dialog.getButton('btn-Close').disable();
				           var $button = this; 
				           $button.disable();
				           $button.spin();
				           dialog.setClosable(false);   
				           $.ajax({
				        	   type: "POST",
				        	   dataType: "json",
				        	   url:myLocation+"/pointHierarchy/del/"+getParentId(nodeActivate)+"/"+nodeActivate.key+"/"+nodeActivate.isFolder(), 
				        	   success: function(msg){
				        		   dialog.getModalBody().html('<div><h3>'+messages.folderRemoved+':</h3><ul><li>'+messages.key+':<b>'+nodeActivate.key+'</b></li><li>'+messages.title+':<b>'+nodeActivate.title+'</b></li><li>'+messages.msg+':'+msg+'</li></ul></div>');
						           $button.hide();
						           $button.stopSpin();
						           dialog.setClosable(true);
						           dialog.getButton('btn-Close').enable();
						           var tree = $("#tree").fancytree("getTree"); 
						           var selNodes = tree.getSelectedNodes();
								   selNodes.push(nodeActivate);
						           selNodes.forEach(function(node) {
						             while( node.hasChildren() ) {
						               node.getFirstChild().moveTo(tree.rootNode, "child");
						             }
						             node.remove();
						           });
				        	   },
				        	   error: function(XMLHttpRequest, textStatus, errorThrown) {
				        		   dialog.getModalBody().html('<div><h3>'+messages.folderNotRemove+'</h3><p>'+messages.errorThrown+':'+errorThrown+'</p></div>');
					        	   $button.hide();
						 		   $button.stopSpin();
						 		   dialog.setClosable(true);
						 		   dialog.getButton('btn-Close').enable();
				        	   }
				        	});   
				         }
				       },
				       {
				         id: 'btn-Close',
				         label:messages.close,
				         action: function(dialog) {
				           dialog.close();
				         }
				       }]
				     });
    				} else {
    					// is not folder
    					BootstrapDialog.show({
    					       title: messages.moveDataPointToRoot +':'+nodeActivate.title,
    					       message: function(dialog) {
    					         var $content = $('<div><h3>'+ messages.areYouSureToMoveElement+'</h3></div>');
    					         dialog.setType(BootstrapDialog.TYPE_DANGER);
    					         return $content;
    					       },
    					       buttons: [{
    					         id: 'btn-Yes',
    					         label: messages.yes,
    					         cssClass: 'btn-danger',
    					         action: function(dialog) {
    					           dialog.getButton('btn-Close').disable();
    					           var $button = this; 
    					           $button.disable();
    					           $button.spin();
    					           dialog.setClosable(false);
    					           $.ajax({
    					        	   type: "POST",
    					        	   dataType: "json",
    					        	   url:myLocation+"/pointHierarchy/del/"+getParentId(nodeActivate)+"/"+nodeActivate.key+"/"+nodeActivate.isFolder(), 
    					        	   success: function(msg){
    					        		   dialog.getModalBody().html('<div><h3>'+messages.movedElement+':</h3><ul><li>'+messages.key+':<b>'+nodeActivate.key+'</b></li><li>'+messages.title+':<b>'+nodeActivate.title+'</b></li><li>'+messages.msg+':'+msg+'</li></ul></div>');
    							           $button.hide();
    							           $button.stopSpin();
    							           dialog.setClosable(true);
    							           dialog.getButton('btn-Close').enable();
    							           var tree = $("#tree").fancytree("getTree"); 
    							           var selNodes = tree.getSelectedNodes();
    									   selNodes.push(nodeActivate);
    							           selNodes.forEach(function(node) {	             
    							             node.moveTo(tree.rootNode, "child");
    							           });
    					        	   },
    					        	   error: function(XMLHttpRequest, textStatus, errorThrown) {
    					        		   dialog.getModalBody().html('<div><h3>'+messages.folderNotRemove+'</h3><p>'+messages.errorThrown+':'+errorThrown+'</p></div>');
    						        	   $button.hide();
    							 		   $button.stopSpin();
    							 		   dialog.setClosable(true);
    							 		   dialog.getButton('btn-Close').enable();
    					        	   }
    					        	});   
    					         }
    					       },
    					       {
    					         id: 'btn-Close',
    					         label:messages.close,
    					         action: function(dialog) {
    					           dialog.close();
    					         }
    					       }]
    					     });
    				}
    			}
    	   } else {
    		   BootstrapDialog.show({
                   type: BootstrapDialog.TYPE_WARNING,
                   title: messages.warning,
                   message: messages.pleaseSelectElement,
                   buttons: [{
                       label: messages.close,
      		           action: function(dialog) {
      		             dialog.close();
      		           }
                   }]
               });     
    	   }
		});
    	$("button#editNode").click(()=>{
    		if ( (nodeActivate != undefined) && (!nodeActivate.isFolder())) {
    			BootstrapDialog.show({
                    type: BootstrapDialog.TYPE_WARNING,
                    title: messages.warning,
                    message: messages.weOnlyEditFolder,
                    buttons: [{
                        label: messages.close,
       		            action: function(dialog) {
       		              dialog.close();
       		           }
                    }]
                });  
    			return;
    		} else if ( (nodeActivate != undefined) && (nodeActivate.isFolder()) ) {
 		      BootstrapDialog.show({
		       title: messages.editFolder+':'+nodeActivate.title,
		       onshown: function(dialog) {
	 		    	 dialog.getModalBody().find('input').focus();
	 		   },
		       message: function(dialog) {
		          var $content = $('<div>'+messages.titleEdit+': <input type="text" class="form-control" value="'+nodeActivate.title+'" maxlength="100"><ul><li>'+messages.key+':'+nodeActivate.key+'</li></ul></div>');
		          dialog.setType(BootstrapDialog.TYPE_WARNING);
		          return $content;
		       },
		       buttons: [{
		         id: 'btn-Yes',
		         label: messages.yes,
		         cssClass: 'btn-warning',
		         action: function(dialog) {
		           dialog.getButton('btn-Close').disable();
		           var $button = this; 
		           $button.disable();
		           $button.spin();
		           dialog.setClosable(false);
		           var newTitle = dialog.getModalBody().find('input').val();
		           $.ajax({
			            type: "POST",
			        	dataType: "json",
			        	url:myLocation+"/pointHierarchy/edit/"+getParentId(nodeActivate)+"/"+nodeActivate.key+"/"+newTitle, 
			        	success: function(msg){
			        	  var titleNewNode = dialog.getModalBody().find('input').val();
			        	  dialog.getModalBody().html('<div><h3>'+messages.folderChange+':</h3><ul><li>'+messages.key+':<b>'+nodeActivate.key+'</b></li><li>'+messages.oldTitle+':<b>'+nodeActivate.title+'</b></li><li>'+messages.newTitle+':<b>'+newTitle+'</b></li></ul></div>');
			        	  $button.hide();
				          $button.stopSpin();
				          dialog.setClosable(true);
				          dialog.getButton('btn-Close').enable();
				          nodeActivate.setTitle(newTitle);
			        	},
			        	error: function(XMLHttpRequest, textStatus, errorThrown) {
			        	    dialog.getModalBody().html('<div><h3>'+messages.folderNotEdit+'</h3><p>'+messages.errorThrown+':'+errorThrown+'</p></div>');
			        	    $button.hide();
				 		    $button.stopSpin();
				 		    dialog.setClosable(true);
				 		    dialog.getButton('btn-Close').enable();
			        	}
			       });
		         }
		       },
		       {
		         id: 'btn-Close',
		         label:messages.close,
		         action: function(dialog) {
		           dialog.close();
		         }
		       }]
		     });
    	   	} else {
    		   BootstrapDialog.show({
                   type: BootstrapDialog.TYPE_WARNING,
                   title: messages.warning,
                   message: messages.pleaseSelectElementFolder,
                   buttons: [{
                       label: messages.close,
      		           action: function(dialog) {
      		             dialog.close();
      		           }
                   }]
               });     
    	   }
		});
    	$("button#reloadNode").click(()=>{
    		location.reload();
    		node=undefined;
    	});
    	$("button#infoNode").click(()=>{
    		if (nodeActivate != undefined) {
 		      BootstrapDialog.show({
		       title: messages.info,
		       message: function(dialog) {
		         var $content = "";
		         if (nodeActivate.isFolder()){
		           $content = $('<div><h3>'+nodeActivate.title+'</h3>'+
		        		 '<ul>'+
		        		 	'<li>'+messages.key+':'+nodeActivate.key+'</li>'+
		        		 	'<li>'+messages.title+':'+nodeActivate.title+'</li>'+
		        		 	'<li>'+messages.keyParent+':'+getParentId(nodeActivate)+'</li>'+
		        		 	'<li>'+messages.isFolder+':'+nodeActivate.isFolder()+'</li>'+
		         		 '</ul></div>');
		         } else {
		        	   $content = $('<div><h3>'+nodeActivate.title+'</h3>'+
			        		 '<ul>'+
			        		 '<li>'+messages.key+':'+nodeActivate.key+'</li>'+
			        		 	'<li>'+messages.title+':'+nodeActivate.title+'</li>'+
			        		 	'<li>'+messages.keyParent+':'+getParentId(nodeActivate)+'</li>'+
			        		 	'<li>'+messages.isFolder+':'+nodeActivate.isFolder()+'</li>'+
			        		 	'<li>'+messages.dataSource+':'+nodeActivate.data.pointHierarchyDataSource.name+''+
			        		 	'<ul>'+
			        		 		'<li>'+messages.key+':'+nodeActivate.data.pointHierarchyDataSource.id+'</li>'+
			        		 		'<li>'+messages.xid+':'+nodeActivate.data.pointHierarchyDataSource.xid+'</li>'+
			        		 		'<li>'+messages.type+':'+nodeActivate.data.pointHierarchyDataSource.dataSourceType+'</li>'+
			        		 	'</ul></li>'+
			         		 '</ul></div>');   	 
		         }
		         dialog.setType(BootstrapDialog.TYPE_INFO);
		         return $content;
		       },
		       buttons: [
		       {
		         id: 'btn-Close',
		         label:messages.close,
		         action: function(dialog) {
		           dialog.close();
		         }
		       }]
		     });
    	   } else {
    		   BootstrapDialog.show({
                   type: BootstrapDialog.TYPE_WARNING,
                   title: messages.warning,
                   message: messages.pleaseSelectElement,
                   buttons: [{
                       label: messages.close,
      		           action: function(dialog) {
      		             dialog.close();
      		           }
                   }]
               });     
    	   }
		});
    	setLocale=function(locale) {
    		 $.ajax({
		            type: "POST",
		        	dataType: "json",
		        	url:myLocation+"/viewutil/"+locale, 
		        	success: function(msg){
		        		location.reload();
		        	},
		        	error: function(XMLHttpRequest, textStatus, errorThrown) {
		        		BootstrapDialog.show({
		                    type: BootstrapDialog.TYPE_WARNING,
		                    title: messages.warning,
		                    message: messages.changeOfLanguageFailed,
		                    buttons: [{
		                       label: messages.close,
		       		           action: function(dialog) {
		       		             dialog.close();
		       		           }
		                    }]
		                })     
		        	}
    	});
    };
    });
    </script>
</html>