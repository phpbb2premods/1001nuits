<form method="post" action="{S_MODCP_ACTION}">
  <table width="100%" cellspacing="2" cellpadding="2" border="0">
	<tr>
	  <td class="nav"><a href="{U_INDEX}" class="nav">{L_INDEX}</a> &raquo; <a href="{U_VIEW_FORUM}" class="nav">{FORUM_NAME}</a></td>
	</tr>
  </table>

  <table class="forumline" width="100%" cellpadding="3" cellspacing="1" border="0">
	<tr>
	  <td class="catHead" colspan="7" align="center" height="28"><span class="cattitle">{L_MOD_CP}</span></td>
	</tr>
	<tr>
	  <td class="row2" colspan="7" align="center"><span class="gensmall">{L_MOD_CP_EXPLAIN}</span></td>
	</tr>
	<tr>
	  <th class="thCornerL" width="4%" nowrap="nowrap">&nbsp;</th>
	  <th class="thTop" nowrap="nowrap">&nbsp;{L_TOPICS}&nbsp;</th>
	  <th class="thTop" width="8%" nowrap="nowrap">&nbsp;{L_REPLIES}&nbsp;</th>
	  <th width="15%" nowrap="nowrap">&nbsp;{L_AUTHOR}&nbsp;</th>
	  <th width="8%" nowrap="nowrap">&nbsp;{L_VIEWS}&nbsp;</th>
	  <th class="thTop" width="17%" nowrap="nowrap">&nbsp;{L_LASTPOST}&nbsp;</th>
	  <th class="thCornerR" width="5%" nowrap="nowrap">&nbsp;{L_SELECT}&nbsp;</th>
	</tr>
	<!-- BEGIN topicrow -->
  <!-- BEGIN switch_post -->
	<tr>
	  <td class="row2" colspan="7" style="padding-left: 10px;"><span class="gensmall">{topicrow.switch_post.SPLIT_TYPE}</span></td>
	</tr>
  <!-- END switch_post -->
	<tr>
	  <td class="row1" align="center" valign="middle"><img src="{topicrow.TOPIC_FOLDER_IMG}" alt="{topicrow.L_TOPIC_FOLDER_ALT}" title="{topicrow.L_TOPIC_FOLDER_ALT}" /></td>
	  <td class="row1"><span class="topictitle">{topicrow.TOPIC_ATTACHMENT_IMG}{topicrow.TOPIC_TYPE}<a href="{topicrow.U_VIEW_TOPIC}" class="topictitle">{topicrow.TOPIC_TITLE}</a></span></td>
	  <td class="row2" align="center" valign="middle"><span class="postdetails">{topicrow.REPLIES}</span></td>
	  <td class="row3" align="center" valign="middle"><span class="name">{topicrow.TOPIC_AUTHOR}</span></td>
	  <td class="row2" align="center" valign="middle"><span class="postdetails">{topicrow.VIEWS}</span></td>
	  <td class="row1" align="center" valign="middle"><span class="postdetails">{topicrow.LAST_POST_TIME}<br />{topicrow.LAST_POST_AUTHOR} {topicrow.LAST_POST_IMG}</span></td>
	  <td class="row2" align="center" valign="middle"><input type="checkbox" name="topic_id_list[]" value="{topicrow.TOPIC_ID}" /></td>
	</tr>
	<!-- END topicrow -->
	<tr align="right"> 
	  <td class="catBottom" colspan="7" height="29">
		{S_HIDDEN_FIELDS}
		<input type="submit" name="delete" class="liteoption" value="{L_DELETE}" />&nbsp;
		<input type="submit" name="move" class="liteoption" value="{L_MOVE}" />&nbsp;
		<input type="submit" name="lock" class="liteoption" value="{L_LOCK}" />&nbsp;
		<input type="submit" name="unlock" class="liteoption" value="{L_UNLOCK}" />
		&nbsp;
		{SELECT_TITLE}
		&nbsp;
		<input type="submit" name="quick_title_edit" class="liteoption" value="{L_EDIT_TITLE}" />
	  </td>
	</tr>
  </table>
  <table width="100%" cellspacing="2" cellpadding="2" border="0">
	<tr>
	  <td align="left" valign="middle"><b class="nav">{PAGE_NUMBER}</b></td>
	  <td align="right" valign="top" nowrap="nowrap"><span class="nav">{PAGINATION}</span></td>
	</tr>
  </table>
</form>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
	<td align="right">{JUMPBOX}</td>
  </tr>
</table>