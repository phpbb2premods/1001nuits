<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html dir="ltr">
<head>
<title>{SITENAME} - {PAGE_TITLE}</title>

<meta http-equiv="Content-Type" content="text/html; charset={S_CONTENT_ENCODING}">
<meta http-equiv="Content-Style-Type" content="text/css">

<meta name="Identifier-URL" content="http://reddevboard.com/">
<meta name="Author" content="reddog - reddevboard.com">
<meta name="Robots" content="all">

<meta name="DC.Creator" content="reddog - reddevboard.com">
<meta name="DC.Rights" content="Attribution-NonCommercial-ShareAlike 2.5, http://creativecommons.org/licenses/by-nc-sa/2.5/">
{META}{NAV_LINKS}

<link rel="shortcut icon" href="favicon.ico" />
<link rel="stylesheet" type="text/css" href="{STYLE_PATH}/{T_HEAD_STYLESHEET}" media="all">

<script language="javascript" type="text/javascript" src="templates/tooltips.js"></script>

<!--[if IE]>
<script type="text/javascript" type="text/javascript" src="templates/pngfix.js"></script>
<![endif]-->

<!-- start mod : Resize Posted Images Based on Max Width -->
<script type="text/javascript">
//<![CDATA[
<!--
var rmw_max_width = 500; // you can change this number, this is the max width in pixels for posted images
var rmw_border_1 = '1px solid {T_BODY_LINK}';
var rmw_border_2 = '2px dotted {T_BODY_LINK}';
var rmw_image_title = '{L_RMW_IMAGE_TITLE}';
//-->
//]]>
</script>
<script type="text/javascript" src="{U_RMW_JSLIB}"></script>
<!-- fin mod : Resize Posted Images Based on Max Width -->

<!-- start gradualshine script -->
<style type="text/css">
<!--
.gradualshine {
	filter: alpha(opacity=30);
	-moz-opacity: .30;
}
-->
</style>
<script language="javascript" type="text/javascript" src="templates/gradualshine.js"></script>
<!-- end gradualshine script -->

<link rel="stylesheet" href="{BBC_BOX_SHEET}" type="text/css">

</head>
<body>

<a name="top" id="top"></a>

<!-- BEGIN switch_enable_pm_popup -->
<table class="pmline" id="new_pm_popup" cellspacing="1" cellpadding="4">
  <tr>
	<td style="height:100px; width:300px;"><span class="gen">
		<a href="{U_PRIVATEMSGS}" class="gen">{PRIVATE_MESSAGE_INFO}</a><br /><br />
		<a href="" onClick="getElementById('new_pm_popup').style.display = 'none'; return false;" class="genmed"><img alt="" src="{I_CLOSE}" border="0" /></a>
	</span></td>
  </tr>
</table> 

<script language="javascript" type="text/javascript">
<!--
	if ( {PRIVATE_MESSAGE_NEW_FLAG} ) 
	{ 
		pmWindow = window.open('{U_PRIVATEMSGS_POPUP}', '_phpbbprivmsg', 'HEIGHT=225,resizable=yes,WIDTH=400');
		if (!window.pmWindow)
		{ 
			document.getElementById('new_pm_popup').style.display = 'inline'; 
		} 
	} 
//-->
</script>
<!-- END switch_enable_pm_popup --> 

<table width="100%" cellspacing="0" cellpadding="10" border="0" align="center"> 
  <tr>
	<td class="bodyline"><table width="100%" cellspacing="0" cellpadding="0" border="0">
	  <tr>
		<td align="center" class="mainmenu">
			<a href="{U_FAQ}" class="mainmenu"><img src="{I_FAQ}" border="0" alt="{L_FAQ}" hspace="3" class="absbottom" />{L_FAQ}</a>
			&nbsp;<a href="{U_SEARCH}" class="mainmenu"><img src="{I_SEARCH}" border="0" alt="{L_SEARCH}" hspace="3" class="absbottom" />{L_SEARCH}</a>
			&nbsp;<a href="{U_MEMBERLIST}" class="mainmenu"><img src="{I_MEMBERS}" border="0" alt="{L_MEMBERLIST}" hspace="3" class="absbottom" />{L_MEMBERLIST}</a>
			&nbsp;<a href="{U_GROUP_CP}" class="mainmenu"><img src="{I_GROUPS}" border="0" alt="{L_USERGROUPS}" hspace="3" class="absbottom" />{L_USERGROUPS}</a>
			<!-- BEGIN switch_user_logged_out -->
			&nbsp;<a href="{U_REGISTER}" class="mainmenu"><img src="{I_REGISTER}" border="0" alt="{L_REGISTER}" hspace="3" class="absbottom" />{L_REGISTER}</a>
			<!-- END switch_user_logged_out -->
			<!-- BEGIN login_sec_link -->
			&nbsp;<a href="{U_LOGIN_SEC}" class="mainmenu"><img src="templates/subSilverPlus/ctracker/images/ct.gif" border="0" alt="{L_LOGIN_SEC}" hspace="3" class="absbottom" />{L_LOGIN_SEC}</a>
			<!-- END login_sec_link -->
		</td>
	  </tr>
	</table>
	<table width="100%" cellspacing="0" cellpadding="0" border="0">
	  <tr>
		<td align="center" width="100%" valign="middle">
			<a href="{U_INDEX}" class="maintitle"><img src="{I_LOGO}" alt="{SITENAME}" title="{SITENAME}" border="0" /></a>
		</td>
	  </tr>
	</table>
	<table width="100%" cellspacing="0" cellpadding="0" border="0">
	  <tr>
		<td align="center" class="mainmenu">
			<a href="{U_PROFILE}" class="mainmenu"><img src="{I_PROFILE}" border="0" alt="{L_PROFILE}" hspace="3" class="absbottom" />{L_PROFILE}</a>
			&nbsp;<a href="{U_PRIVATEMSGS}" class="mainmenu"><img src="{PRIVMSG_IMG}" border="0" alt="{PRIVATE_MESSAGE_INFO}" hspace="3" class="absbottom" />{PRIVATE_MESSAGE_INFO}</a>
			&nbsp;<a href="{U_LOGIN_LOGOUT}" class="mainmenu"><img src="{I_LOGIN}" border="0" alt="{L_LOGIN_LOGOUT}" hspace="3" class="absbottom" />{L_LOGIN_LOGOUT}</a>
		</td>
	  </tr>
	</table>
<!-- BEGIN ctracker_message -->
<br />
<div align="center">
<table width="80%" cellspacing="1" cellpadding="3" border="0" class="forumline">
	<tr>
		<td align="center" style="background-color:#{ctracker_message.ROW_COLOR};"><img src="{ctracker_message.ICON_GLOB}" alt="" title="" border="0"></td>
		<td align="center" style="background-color:#{ctracker_message.ROW_COLOR};"><span class="gensmall">{ctracker_message.L_MESSAGE_TEXT}</span></td>
	</tr>
	<tr>
		<td align="center" class="row2" colspan="2"><span class="gensmall"><b><a href="{ctracker_message.U_MARK_MESSAGE}">{ctracker_message.L_MARK_MESSAGE}</a></b></span></td>
	</tr>
</table>
</div>
<br />
<!-- END ctracker_message -->

<br />
	<br class="nav" />