<table width="100%" cellspacing="2" cellpadding="2" border="0">
  <tr> 
	<td class="maintitle" valign="bottom">{L_SEARCH_MATCHES}</td>
  </tr>
</table>

<table width="100%" cellspacing="2" cellpadding="2" border="0">
  <tr> 
	<td class="nav"><a href="{U_INDEX}" class="nav">{L_INDEX}</a></td>
  </tr>
</table>

<table class="forumline" width="100%" cellpadding="4" cellspacing="1" border="0">
  <tr> 
	<th class="thCornerL" colspan="2" width="100%" height="25" nowrap="nowrap">&nbsp;{L_TOPICS}&nbsp;</th>
	<th class="thTop" width="50" nowrap="nowrap">&nbsp;{L_AUTHOR}&nbsp;</th>
	<th class="thTop" width="100" nowrap="nowrap">&nbsp;{L_REPLIES}&nbsp;</th>
	<th class="thTop" width="50" nowrap="nowrap">&nbsp;{L_VIEWS}&nbsp;</th>
	<th class="thCornerR" width="200" nowrap="nowrap">&nbsp;{L_LASTPOST}&nbsp;</th>
  </tr>
  <!-- BEGIN searchresults -->
  <tr> 
	<td class="row1" align="center" valign="middle"><img src="{searchresults.TOPIC_FOLDER_IMG}" alt="{searchresults.L_TOPIC_FOLDER_ALT}" title="{searchresults.L_TOPIC_FOLDER_ALT}" /></td>
	<td class="row1">
		<span class="topictitle">{searchresults.NEWEST_POST_IMG}{searchresults.TOPIC_TYPE}<a href="{searchresults.U_VIEW_TOPIC}" class="topictitle">{searchresults.TOPIC_TITLE}</a></span><br />
		<span class="gensmall">[&nbsp;<a href="{searchresults.U_VIEW_FORUM}" title="{searchresults.FORUM_DESC}">{searchresults.FORUM_NAME}</a>&nbsp;]
		<br />
		<!-- BEGIN switch_topic_description -->
		<br />{searchresults.TOPIC_DESCRIPTION}
		<!-- END switch_topic_description -->
		<br />{searchresults.GOTO_PAGE}
	</span></td>
	<td class="row2" align="center" valign="middle"><span class="name">{searchresults.TOPIC_AUTHOR}</span></td>
	<td class="row3" align="center" valign="middle"><span class="postdetails">{searchresults.REPLIES}</span></td>
	<td class="row2" align="center" valign="middle"><span class="postdetails">{searchresults.VIEWS}</span></td>
	<td class="row3" align="center" valign="middle" nowrap="nowrap"><span class="postdetails">
		{searchresults.LAST_POST_TIME}<br />{searchresults.LAST_POST_AUTHOR} {searchresults.LAST_POST_IMG}
	</span></td>
  </tr>
  <!-- END searchresults -->
  <tr> 
	<td class="catBottom" colspan="6" height="28" valign="middle">&nbsp;</td>
  </tr>
</table>

<table width="100%" cellspacing="2" cellpadding="2" border="0">
  <tr> 
	<td align="left" valign="top"><span class="nav">{PAGE_NUMBER}</span></td>
	<td align="right" valign="top" nowrap="nowrap"><span class="nav">{PAGINATION}</span></td>
  </tr>
</table>

<table width="100%" cellspacing="2" cellpadding="0" border="0">
  <tr> 
	<td valign="top" align="right">{JUMPBOX}</td>
  </tr>
</table>