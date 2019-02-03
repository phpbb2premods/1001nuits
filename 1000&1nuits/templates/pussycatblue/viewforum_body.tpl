<form method="post" action="{S_POST_DAYS_ACTION}">
  <table width="100%" cellspacing="2" cellpadding="2" border="0">
	<tr>
	  <td align="left" valign="bottom" colspan="2">{FORUM_ICON_IMG}
		<a class="maintitle" href="{U_VIEW_FORUM}">{FORUM_NAME}</a><br />
		<b class="gensmall">{L_MODERATOR}: {MODERATORS}<br />{LOGGED_IN_USER_LIST}</b>
	  </td>
	  <td align="right" valign="bottom" nowrap="nowrap"><b class="gensmall">{PAGINATION}</b></td>
	</tr>
	<tr> 
	  <td align="left" valign="middle" width="50"><a href="{U_POST_NEW_TOPIC}"><img src="{POST_IMG}" border="0" alt="{L_POST_NEW_TOPIC}" /></a></td>
	  <td class="nav" width="100%" align="left" valign="middle">
		<a href="{U_INDEX}" class="nav">{L_INDEX}</a>
<!-- BEGIN switch_parent_link -->
 &raquo; <a class="nav" href="{PARENT_URL}">{PARENT_NAME}</a>
<!-- END switch_parent_link -->
 &raquo; <a class="nav" href="{U_VIEW_FORUM}">{FORUM_NAME}</a>
	  </td>
	  <td class="gensmall" align="right" valign="middle" nowrap="nowrap">{S_TOOLBAR_FORUM}</td>
	</tr>
  </table>



<!-- BEGIN switch_attached_list -->
<table width="100%" cellpadding="2" cellspacing="1" border="0" class="forumline">
  <tr>
	<th colspan="2" class="thCornerL" width="100%" height="25" nowrap="nowrap">&nbsp;{switch_attached_list.L_ATTACHED_FORUM}&nbsp;</th>
	<th width="70" class="thTop" nowrap="nowrap">&nbsp;{switch_attached_list.L_ATTACHED_TOPICS}&nbsp;</th>
	<th width="70" class="thTop" nowrap="nowrap">&nbsp;{switch_attached_list.L_ATTACHED_POSTS}&nbsp;</th>
	<th width="200" class="thCornerR" nowrap="nowrap">&nbsp;{switch_attached_list.L_LAST_POST}&nbsp;</th>
  </tr>

  <tr>
	<td class="catLeft" colspan="2" height="28"><span class="cattitle"><a href="{catrow.U_VIEWCAT}" class="cattitle">{catrow.CAT_DESC}</a></span></td>
	<td class="rowpic" colspan="3" align="right">&nbsp;</td>
  </tr>

  <!-- BEGIN switch_attached_present -->
  <tr>
	<td class="row1" align="center" valign="middle" height="50">
		<img src="{switch_attached_list.switch_attached_present.FORUM_FOLDER_IMG}" alt="{switch_attached_list.switch_attached_present.L_FORUM_FOLDER_ALT}" title="{switch_attached_list.switch_attached_present.L_FORUM_FOLDER_ALT}" />
	<td class="row1" width="100%" height="50">
	<table cellpadding="1" cellspacing="1" width="100%">
	<tr>
		<td align="center" valign="middle">{switch_attached_list.switch_attached_present.FORUM_ICON_IMG}</td>
		<td width="100%" height="50"><span class="forumlink"><a href="{switch_attached_list.switch_attached_present.U_VIEWFORUM}" class="forumlink" {switch_attached_list.switch_attached_present.FORUM_TARGET}>{switch_attached_list.switch_attached_present.FORUM_NAME}</a><br /></span><span class="genmed">{switch_attached_list.switch_attached_present.FORUM_DESC}
<!-- BEGIN row -->
<br /></span><span class="gensmall">{switch_attached_list.switch_attached_present.L_FORUM_MODERATOR} {switch_attached_list.switch_attached_present.FORUM_MODERATORS}</span>
		</td>
	</tr>
	</table>
	</td>
	<td class="row2" align="center" valign="middle" height="50"><span class="gensmall">{switch_attached_list.switch_attached_present.TOPICS}</span></td>
	<td class="row2" align="center" valign="middle" height="50"><span class="gensmall">{switch_attached_list.switch_attached_present.POSTS}</span></td>
	<td class="row2" align="center" valign="middle" height="50" nowrap="nowrap"><span class="gensmall">{switch_attached_list.switch_attached_present.LAST_POST_ID}</span></td>
<!-- END row -->
<!-- BEGIN link -->
	</span></td>
	</tr>
	</table>
	</td>
	<td class="row2" align="center" valign="middle" height="50" colspan="3"><span class="gensmall">{switch_attached_list.switch_attached_present.FORUM_LINK_COUNT}</span></td>
<!-- END link -->
  </tr>
  <!-- END switch_attached_present -->
</table>
<br />
<!-- END switch_attached_list -->


  <table class="forumline" width="100%" cellpadding="4" cellspacing="1" border="0">
	<tr> 
	  <th class="thCornerL" colspan="3" align="center" width="100%" height="25" nowrap="nowrap">&nbsp;{L_TOPICS}&nbsp;</th>
	  <th class="thTop" width="50" align="center" nowrap="nowrap">&nbsp;{L_REPLIES}&nbsp;</th>
	  <th class="thTop" width="100" align="center" nowrap="nowrap">&nbsp;{L_AUTHOR}&nbsp;</th>
	  <th class="thTop" width="50" align="center" nowrap="nowrap">&nbsp;{L_VIEWS}&nbsp;</th>
	  <th class="thCornerR" width="200" align="center" nowrap="nowrap">&nbsp;{L_LASTPOST}&nbsp;</th>
	</tr>
	<!-- BEGIN topicrow -->
	<!-- BEGIN switch_post -->
	<tr>
	  <td class="row2" colspan="7" style="padding-left: 10px;"><span class="gensmall">{topicrow.switch_post.SPLIT_TYPE}</span></td>
	</tr>
	<!-- END switch_post -->
	<tr> 
	  <td class="row1" align="center" valign="middle" width="20"><img src="{topicrow.TOPIC_FOLDER_IMG}" alt="{topicrow.L_TOPIC_FOLDER_ALT}" title="{topicrow.L_TOPIC_FOLDER_ALT}" /></td>
	  <td class="row1" align="center" valign="middle" width="20">{topicrow.ICON}</td>
	  <td class="row1" width="100%">
		<span class="topictitle">{topicrow.NEWEST_POST_IMG}{topicrow.TOPIC_ATTACHMENT_IMG}{topicrow.TOPIC_TYPE}<a href="{topicrow.U_VIEW_TOPIC}" class="topictitle">{topicrow.TOPIC_TITLE}</a></span>
		<span class="gensmall"><br />
		<!-- BEGIN switch_topic_description -->
		{topicrow.TOPIC_DESCRIPTION}<br />
		<!-- END switch_topic_description -->{topicrow.GLOBAL_LINK}{topicrow.GOTO_PAGE}</span>
	  </td>
	  <td class="row2" align="center" valign="middle"><span class="postdetails">{topicrow.REPLIES}</span></td>
	  <td class="row3" align="center" valign="middle"><span class="name">{topicrow.TOPIC_AUTHOR}</span></td>
	  <td class="row2" align="center" valign="middle"><span class="postdetails">{topicrow.VIEWS}</span></td>
	  <td class="row3Right" align="center" valign="middle" nowrap="nowrap"><span class="postdetails">
		{topicrow.LAST_POST_TIME}<br />{topicrow.LAST_POST_AUTHOR} {topicrow.LAST_POST_IMG}
	  </span></td>
	</tr>
	<!-- END topicrow -->
	<!-- BEGIN switch_no_topics -->
	<tr> 
	  <td class="row1" colspan="7" height="30" align="center" valign="middle"><span class="gen">{L_NO_TOPICS}</span></td>
	</tr>
	<!-- END switch_no_topics -->
	<tr> 
	  <td class="catBottom" align="center" valign="middle" colspan="7" height="28"><span class="genmed">
	  	{L_DISPLAY_TOPICS}:&nbsp;{S_SELECT_TOPIC_DAYS}&nbsp;
		<input type="submit" class="liteoption" value="{L_GO}" name="submit" />
	  </span></td>
	</tr>
  </table>

  <table width="100%" cellspacing="2" cellpadding="2" border="0">
	<tr> 
	  <td align="left" valign="middle" width="50"><a href="{U_POST_NEW_TOPIC}"><img src="{POST_IMG}" border="0" alt="{L_POST_NEW_TOPIC}" /></a></td>
	  <td class="nav" align="left" valign="middle" width="100%">
		<a href="{U_INDEX}" class="nav">{L_INDEX}</a>
<!-- BEGIN switch_parent_link -->
 &raquo; <a class="nav" href="{PARENT_URL}">{PARENT_NAME}</a>
<!-- END switch_parent_link -->
 &raquo; <a class="nav" href="{U_VIEW_FORUM}">{FORUM_NAME}</a>
	  </td>
	  <td class="nav" align="right" valign="middle" nowrap="nowrap">{PAGE_NUMBER}<br />{PAGINATION}</td>
	</tr>
  </table>
</form>

<table width="100%" cellspacing="2" cellpadding="0" border="0">
  <tr> 
	<td align="right" valign="top">{JUMPBOX}</td>
  </tr>
</table>

<table width="100%" cellspacing="0" border="0" cellpadding="0" border="0">
  <tr>
	<td align="left" valign="top"><table cellspacing="3" cellpadding="0" border="0">
	  <tr>
		<td width="20" align="center"><img src="{FOLDER_GLOBAL_ANNOUNCE_IMG}" alt="" title="{L_GLOBAL_ANNOUNCEMENT}" /></td>
		<td class="gensmall">{L_GLOBAL_ANNOUNCEMENT}</td>
	  </tr>
	  <tr>
		<td width="20" align="center"><img src="{FOLDER_ANNOUNCE_IMG}" alt="" title="{L_ANNOUNCEMENT}" /></td>
		<td class="gensmall">{L_ANNOUNCEMENT}</td>
		<td>&nbsp;&nbsp;</td>
		<td width="20" align="center"><img src="{FOLDER_STICKY_IMG}" alt="" title="{L_STICKY}" /></td>
		<td class="gensmall">{L_STICKY}</td>
	  </tr>
	  <tr>
		<td width="20" align="left"><img src="{FOLDER_NEW_IMG}" alt="" title="{L_NEW_POSTS}" /></td>
		<td class="gensmall">{L_NEW_POSTS}</td>
		<td>&nbsp;&nbsp;</td>
		<td width="20" align="center"><img src="{FOLDER_IMG}" alt="" title="{L_NO_NEW_POSTS}" /></td>
		<td class="gensmall">{L_NO_NEW_POSTS}</td>
	  </tr>
	  <tr> 
		<td width="20" align="center"><img src="{FOLDER_HOT_NEW_IMG}" alt="" title="{L_NEW_POSTS_HOT}" /></td>
		<td class="gensmall">{L_NEW_POSTS_HOT}</td>
		<td>&nbsp;&nbsp;</td>
		<td width="20" align="center"><img src="{FOLDER_HOT_IMG}" alt="" title="{L_NO_NEW_POSTS_HOT}" /></td>
		<td class="gensmall">{L_NO_NEW_POSTS_HOT}</td>
	  </tr>
	  <tr>
		<td class="gensmall"><img src="{FOLDER_LOCKED_NEW_IMG}" alt="" title="{L_NEW_POSTS_LOCKED}" /></td>
		<td class="gensmall">{L_NEW_POSTS_LOCKED}</td>
		<td>&nbsp;&nbsp;</td>
		<td class="gensmall"><img src="{FOLDER_LOCKED_IMG}" alt="" title="{L_NO_NEW_POSTS_LOCKED}" /></td>
		<td class="gensmall">{L_NO_NEW_POSTS_LOCKED}</td>
	  </tr>
	</table></td>
	<td class="gensmall" align="right">{S_AUTH_LIST}</td>
  </tr>
</table>