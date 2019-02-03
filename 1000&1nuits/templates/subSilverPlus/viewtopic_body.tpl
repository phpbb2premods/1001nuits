<table width="100%" cellspacing="2" cellpadding="2" border="0">
  <tr>
	<td align="left" valign="bottom" colspan="2">{FORUM_ICON_IMG}
		<a class="maintitle" href="{U_VIEW_TOPIC}">{TOPIC_TITLE}</a><br />
		<b class="gensmall">{PAGINATION}</b>
	</td>
  </tr>
</table>

<table width="100%" cellspacing="2" cellpadding="2" border="0">
  <tr>
	<td class="nav" align="left" valign="bottom" nowrap="nowrap">
		<a class="nav" href="{U_POST_NEW_TOPIC}"><img src="{POST_IMG}" border="0" alt="{L_POST_NEW_TOPIC}" align="middle" /></a>
		<a class="nav" href="{U_POST_REPLY_TOPIC}"><img src="{REPLY_IMG}" border="0" alt="{L_POST_REPLY_TOPIC}" align="middle" /></a>
	</td>
	  <td class="nav" align="left" valign="middle" width="100%">
		<a href="{U_INDEX}" class="nav">{L_INDEX}</a>
<!-- BEGIN switch_parent_link -->
 &raquo; <a class="nav" href="{PARENT_URL}">{PARENT_NAME}</a>
<!-- END switch_parent_link -->
 &raquo; <a class="nav" href="{U_VIEW_FORUM}">{FORUM_NAME}
</a>
	</td>
	<!-- BEGIN toolbar -->
	<td align="right" valign="bottom" nowrap="nowrap"><span class="gensmall">{toolbar.S_TOOLBAR}</span></td>
	<!-- END toolbar -->
  </tr>
</table>

<table class="forumline" width="100%" cellspacing="1" cellpadding="3" border="0">
	{POLL_DISPLAY}
	<!-- BEGIN postrow -->
	<tr align="right">
		<td class="catHead" colspan="2" height="28">
			<span class="name"><a name="{postrow.S_NUM_ROW}" id="{postrow.S_NUM_ROW}"></a></span>
			<span class="nav">{postrow.S_NAV_BUTTONS}</span>
		</td>
	</tr>
  <tr>
	<th class="thLeft" width="150" height="26" nowrap="nowrap">{L_AUTHOR}</th>
	<th class="thRight" nowrap="nowrap">{L_MESSAGE}</th>
  </tr>
  
  <tr>
	<td class="row1" width="150" align="left" valign="top"><b class="name"><a name="{postrow.U_POST_ID}"></a>{postrow.POSTER_NAME}</b>{postrow.I_QP_QUOTE}<br /><span class="postdetails">{postrow.POSTER_RANK}<br />{postrow.RANK_IMAGE}{postrow.RANK_PROGRESSBAR}{postrow.POSTER_AVATAR}<br />{postrow.POSTER_JOINED}<br />{postrow.POSTER_POSTS}<br />{postrow.POSTER_FROM}{postrow.POINTS}{postrow.DONATE_POINTS}<br />{postrow.POSTER_GENDER}<br />{postrow.POSTER_AGE}{postrow.POSTER_CAKE}{postrow.POSTER_FLAG}{postrow.POSTER_BROWSER}</span></td>
	<td class="row1" width="100%" height="28" valign="top"><table width="100%" height="100%" cellspacing="0" cellpadding="0" border="0">
	  <tr>
		<td width="100%"><span class="postdetails">
			<img src="{I_MINITIME}" alt="" title="{L_POSTED}" border="0" />{L_POSTED}: {postrow.POST_DATE}<br /><img src="{postrow.MINI_POST_IMG}" width="12" height="9" alt="" title="{L_POST_SUBJECT}" border="0" />{L_POST_SUBJECT}: {postrow.POST_SUBJECT}
<!-- BEGIN switch_post_description -->
<br /><img src="{postrow.MINI_POST_IMG}" alt="" title="{postrow.L_MINI_POST_ALT}" border="0" />{L_POST_DESCRIPTION}: {postrow.POST_DESCRIPTION}
<!-- END switch_post_description -->
</span></td>
		<td valign="top" nowrap="nowrap">{postrow.QUOTE_IMG} {postrow.EDIT_IMG} {postrow.DELETE_IMG} {postrow.IP_IMG}</td>
	  </tr>
	  <tr>
		<td colspan="2"><hr size="1" /></td>
	  </tr>
	  <tr>
		<td colspan="2" valign="top" height="100%"><div id="message_{postrow.U_POST_ID}"><span class="postbody">{postrow.MESSAGE}</span></div>{postrow.ATTACHMENTS}</td>
	  </tr>
	  <tr>
		<td colspan="2" valign="bottom" align="right"><span class="postbody">{postrow.SIGNATURE}</span><span class="gensmall">{postrow.EDITED_MESSAGE}</span></td>
	  </tr>
	</table></td>
  </tr>
  <tr>
	<td class="row1" width="100%" colspan="2" valign="bottom" nowrap="nowrap"><table width="100%" height="18" cellspacing="0" cellpadding="0" border="0">
	  <tr> 
		<td valign="middle" nowrap="nowrap" width="100%"><span class="nav">
			<a href="#top" class="nav"><img src="{I_TOP}" border="0" alt="{L_BACK_TO_TOP}" title="{L_BACK_TO_TOP}" /></a>
			{postrow.MINI_PROFILE_IMG} {postrow.PROFILE_IMG} {postrow.PM_IMG} {postrow.EMAIL_IMG} {postrow.WWW_IMG} {postrow.AIM_IMG} {postrow.YIM_IMG} {postrow.MSN_IMG} {postrow.SKYPE_IMG} {postrow.ICQ_IMG}
		</span></td>
		<td valign="middle" nowrap="nowrap"><span class="nav">{postrow.POSTER_ONLINE_STATUS_IMG}</span></td>
	  </tr>
	</table></td>
  </tr>
  <tr>
	<td class="spaceRow" colspan="2" height="1"><img src="{I_SPACER}" alt="" width="1" height="1" /></td>
  </tr>
	<!-- BEGIN spacing -->
	</table>
	<br class="nav" />
	<table class="forumline" width="100%" cellspacing="1" cellpadding="3" border="0">
	<!-- END spacing -->
  <!-- END postrow -->
  <tr align="center">
	<td class="catBottom" colspan="2" height="28"><table cellspacing="0" cellpadding="0" border="0">
	  <tr>
		<form method="post" action="{S_POST_DAYS_ACTION}"><td class="gensmall" align="center">
			{L_DISPLAY_POSTS}: {S_SELECT_POST_DAYS}&nbsp;{S_SELECT_POST_ORDER}&nbsp;
			<input type="submit" value="{L_GO}" class="liteoption" name="submit" />
		</td></form>
	  </tr>
	</table></td>
  </tr>
</table>

<table width="100%" cellspacing="2" cellpadding="2" border="0">
  <tr> 
	<td align="left" valign="middle" nowrap="nowrap"><span class="nav"><a href="{U_POST_NEW_TOPIC}"><img src="{POST_IMG}" border="0" alt="{L_POST_NEW_TOPIC}" align="middle" /></a>&nbsp;&nbsp;&nbsp;<a href="{U_POST_REPLY_TOPIC}"><img src="{REPLY_IMG}" border="0" alt="{L_POST_REPLY_TOPIC}" align="middle" /></a>
		<!-- BEGIN qp_form -->
		<!-- BEGIN qp_button -->
		&nbsp;&nbsp;<a href="{qp_form.qp_button.U_QPES}"><img src="{qp_form.qp_button.I_QPES}" border="0" alt="{qp_form.qp_button.L_QPES_ALT}" align="middle" /></a>
		<!-- END qp_button -->
		<!-- END qp_form -->
	</span></td>
	</td>
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

<!-- BEGIN qp_form -->
{QP_BOX}
<!-- END qp_form -->

<table width="100%" cellspacing="2" cellpadding="0" border="0">
  <tr>
	<td width="40%" valign="top" nowrap="nowrap" align="left">{S_TOPIC_ADMIN}</td>
	<td align="right" valign="top" nowrap="nowrap">
		{JUMPBOX}
		<span class="gensmall">{S_AUTH_LIST}</span>
	</td>
  </tr>
</table>