<h1>{L_USER_TITLE}</h1>

<p>{L_USER_EXPLAIN}</p>

{ERROR_BOX}

<form action="{S_PROFILE_ACTION}" {S_FORM_ENCTYPE} method="post" name="post">
  <table class="forumline" width="98%" cellspacing="1" cellpadding="4" border="0" align="center">
	<tr>
	  <th class="thHead" colspan="2">{L_REGISTRATION_INFO}</th>
	</tr>
	<tr>
	  <td class="row2" colspan="2"><span class="gensmall">{L_ITEMS_REQUIRED}</span></td>
	</tr>
	<tr>
	  <td class="row1" width="38%"><span class="gen">{L_USERNAME}: *</span></td>
	  <td class="row2"><input class="post" type="text" name="username" size="35" maxlength="40" value="{USERNAME}" /></td>
	</tr>
	<tr>
	  <td class="row1"><span class="gen">{L_EMAIL_ADDRESS}: *</span></td>
	  <td class="row2"><input class="post" type="text" name="email" size="35" maxlength="255" value="{EMAIL}" /></td>
	</tr>
	<tr>
	  <td class="row1">
		<span class="gen">{L_NEW_PASSWORD}: *</span><br />
		<span class="gensmall">{L_PASSWORD_IF_CHANGED}</span>
	  </td>
	  <td class="row2"><input class="post" type="password" name="password" size="35" maxlength="32" value="" /></td>
	</tr>
	<tr>
	  <td class="row1">
		<span class="gen">{L_CONFIRM_PASSWORD}: * </span><br />
		<span class="gensmall">{L_PASSWORD_CONFIRM_IF_CHANGED}</span>
	  </td>
	  <td class="row2"><input class="post" type="password" name="password_confirm" size="35" maxlength="32" value="" /></td>
	</tr>
  </table>

  <br class="nav" />
  <table class="forumline" width="98%" cellspacing="1" cellpadding="4" border="0" align="center">
	<tr>
	  <th class="thSides" colspan="2">{L_PROFILE_INFO}</th>
	</tr>
	<tr>
	  <td class="row2" colspan="2"><span class="gensmall">{L_PROFILE_INFO_NOTICE}</span></td>
	</tr>
	<tr>
	  <td class="row1" width="38%"><span class="gen">{L_ICQ_NUMBER}</span></td>
	  <td class="row2"><input class="post" type="text" name="icq" size="10" maxlength="15" value="{ICQ}" /></td>
	</tr>
	<tr>
	  <td class="row1"><span class="gen">{L_AIM}</span></td>
	  <td class="row2"><input class="post" type="text" name="aim" size="20" maxlength="255" value="{AIM}" /></td>
	</tr>
	<tr>
	  <td class="row1"><span class="gen">{L_MESSENGER}</span></td>
	  <td class="row2"><input class="post" type="text" name="msn" size="20" maxlength="255" value="{MSN}" /></td>
	</tr>
	
	
	<tr>
	  <td class="row1"><span class="gen">{L_SKYPE}</span></td>
	  <td class="row2"> 
		<input class="post" type="text" name="skype" size="20" maxlength="255" value="{SKYPE}" />
	  </td>
	</tr>
	
	
	<tr>
	  <td class="row1"><span class="gen">{L_YAHOO}</span></td>
	  <td class="row2"><input class="post" type="text" name="yim" size="20" maxlength="255" value="{YIM}" /></td>
	</tr>
	<tr>
	  <td class="row1"><span class="gen">{L_WEBSITE}</span></td>
	  <td class="row2"><input class="post" type="text" name="website" size="35" maxlength="255" value="{WEBSITE}" /></td>
	</tr>
	<tr>
	  <td class="row1"><span class="gen">{L_LOCATION}</span></td>
	  <td class="row2"><input class="post" type="text" name="location" size="35" maxlength="100" value="{LOCATION}" /></td>
	</tr>
	<tr>
	  <td class="row1"><span class="gen">{L_OCCUPATION}</span></td>
	  <td class="row2"><input class="post" type="text" name="occupation" size="35" maxlength="100" value="{OCCUPATION}" /></td>
	</tr>
	<tr>
	  <td class="row1"><span class="gen">{L_INTERESTS}</span></td>
	  <td class="row2"><input class="post" type="text" name="interests" size="35" maxlength="150" value="{INTERESTS}" /></td>
	</tr>
	<!-- BEGIN flags -->
	<tr>
	  <td class="row1"><span class="gen">{L_FLAG}</span></td>
	  <td class="row2"><span class="genmed">{S_FLAGS_LIST}&nbsp;
		<img name="flag_img" src="{I_FLAG}" border="0" alt="" title="{L_FLAG_TITLE}" />
	  </span></td>
	</tr>
	<!-- END flags -->
<!-- Start add - Gender MOD -->
	<tr> 
	      <td class="row1"><span class="gen">{L_GENDER}:</span></td> 
	      <td class="row2"> 
	      <input type="radio" name="gender" value="0" {GENDER_NO_SPECIFY_CHECKED}/> 
	      <span class="gen">{L_GENDER_NOT_SPECIFY}</span>&nbsp;&nbsp; 
	      <input type="radio" name="gender" value="1" {GENDER_MALE_CHECKED}/> 
	      <span class="gen">{L_GENDER_MALE}</span>&nbsp;&nbsp; 
	      <input type="radio" name="gender" value="2" {GENDER_FEMALE_CHECKED}/> 
	      <span class="gen">{L_GENDER_FEMALE}</span></td> 
	</tr>
<!-- End add - Gender MOD -->
	<tr>
	  <td class="row1" width="35%"><span class="gen">{L_BDAY_BIRTHDATE}:{L_BDAY_REQUIRED}</span></td>
	  <td class="row2"><span class="genmed">
		{L_BDAY_DAY}: {S_BDAY_DAY_OPTIONS}&nbsp;
		{L_BDAY_MONTH}: {S_BDAY_MONTH_OPTIONS}&nbsp;
		{L_BDAY_YEAR}: {S_BDAY_YEAR_OPTIONS}
	  </span></td>
	</tr>
	<!-- BEGIN browsers -->
	<tr>
	  <td class="row1"><span class="gen">{L_BROWSER}</span></td>
	  <td class="row2"><span class="genmed">{S_BROWSERS_LIST}&nbsp;
		<img name="browser_img" src="{I_BROWSER}" align="absmiddle" border="0" alt="" title="{L_BROWSER_TITLE}" />
	  </span></td>
	</tr>
	<!-- END browsers -->
	<tr>
	  <td class="row1">
		<span class="gen">{L_SIGNATURE}</span><br />
		<span class="gensmall">{L_SIGNATURE_EXPLAIN}<br /><br />
		{HTML_STATUS}<br />
		{BBCODE_STATUS}<br />
		{SMILIES_STATUS}</span>
	  </td>
	  <td class="row2"><textarea class="post" name="signature" rows="6" cols="45">{SIGNATURE}</textarea></td>
	</tr>
  </table>

  <br class="nav" />
  <table class="forumline" width="98%" cellspacing="1" cellpadding="4" border="0" align="center">
	<tr>
		<th class="thSides" colspan="2">{L_QP_SETTINGS}</th>
	</tr>
	<!-- BEGIN qpes -->
	<tr>
		<td class="row1"><span class="gen">{qpes.L_QP_TITLE}</span><br /><span class="gensmall">{qpes.L_QP_DESC}</span></td>
		<td class="row2"><span class="gen">
			<input type="radio" name="{qpes.QP_VAR}" value="1" {qpes.QP_YES} /> {L_YES}&nbsp;
			<input type="radio" name="{qpes.QP_VAR}" value="0" {qpes.QP_NO} /> {L_NO}
		</span></td>
	</tr>
	<!-- END qpes -->
	<tr>
		<td class="catsides" colspan="2"><span class="cattitle">&nbsp;</span></td>
	</tr>	
	<tr>
	  <th class="thSides" colspan="2">{L_PREFERENCES}</th>
	</tr>
	<tr>
	  <td class="row1" width="38%"><span class="gen">{L_PUBLIC_VIEW_EMAIL}</span></td>
	  <td class="row2"><span class="gen">
		<input type="radio" name="viewemail" value="1" {VIEW_EMAIL_YES} /> {L_YES}&nbsp;
		<input type="radio" name="viewemail" value="0" {VIEW_EMAIL_NO} /> {L_NO}
	  </span></td>
	</tr>
	<tr>
	  <td class="row1"><span class="gen">{L_HIDE_USER}</span></td>
	  <td class="row2"><span class="gen">
		<input type="radio" name="hideonline" value="1" {HIDE_USER_YES} /> {L_YES}&nbsp;
		<input type="radio" name="hideonline" value="0" {HIDE_USER_NO} /> {L_NO}
	  </span></td>
	</tr>
	<tr>
	  <td class="row1"><span class="gen">{L_NOTIFY_ON_REPLY}</span></td>
	  <td class="row2"><span class="gen">
		<input type="radio" name="notifyreply" value="1" {NOTIFY_REPLY_YES} /> {L_YES}&nbsp;
		<input type="radio" name="notifyreply" value="0" {NOTIFY_REPLY_NO} /> {L_NO}
	  </span></td>
	</tr>
	<tr>
	  <td class="row1"><span class="gen">{L_NOTIFY_ON_PRIVMSG}</span></td>
	  <td class="row2"><span class="gen">
		<input type="radio" name="notifypm" value="1" {NOTIFY_PM_YES} /> {L_YES}&nbsp;
		<input type="radio" name="notifypm" value="0" {NOTIFY_PM_NO} /> {L_NO}
	  </span></td>
	</tr>
	<tr>
	  <td class="row1"><span class="gen">{L_POPUP_ON_PRIVMSG}</span></td>
	  <td class="row2"><span class="gen">
		<input type="radio" name="popup_pm" value="1" {POPUP_PM_YES} /> {L_YES}&nbsp;
		<input type="radio" name="popup_pm" value="0" {POPUP_PM_NO} /> {L_NO}
	  </span></td>
	</tr>
	<tr>
	  <td class="row1"><span class="gen">{L_ALWAYS_ADD_SIGNATURE}</span></td>
	  <td class="row2"><span class="gen">
		<input type="radio" name="attachsig" value="1" {ALWAYS_ADD_SIGNATURE_YES} /> {L_YES}&nbsp;
		<input type="radio" name="attachsig" value="0" {ALWAYS_ADD_SIGNATURE_NO} /> {L_NO}
	  </span></td>
	</tr>
	<tr>
	  <td class="row1"><span class="gen">{L_ALWAYS_ALLOW_BBCODE}</span></td>
	  <td class="row2"><span class="gen">
		<input type="radio" name="allowbbcode" value="1" {ALWAYS_ALLOW_BBCODE_YES} /> {L_YES}&nbsp;
		<input type="radio" name="allowbbcode" value="0" {ALWAYS_ALLOW_BBCODE_NO} /> {L_NO}
	  </span></td>
	</tr>
	<tr>
	  <td class="row1"><span class="gen">{L_ALWAYS_ALLOW_HTML}</span></td>
	  <td class="row2"><span class="gen">
		<input type="radio" name="allowhtml" value="1" {ALWAYS_ALLOW_HTML_YES} /> {L_YES}&nbsp;
		<input type="radio" name="allowhtml" value="0" {ALWAYS_ALLOW_HTML_NO} /> {L_NO}
	  </span></td>
	</tr>
	<tr>
	  <td class="row1"><span class="gen">{L_ALWAYS_ALLOW_SMILIES}</span></td>
	  <td class="row2"><span class="gen">
		<input type="radio" name="allowsmilies" value="1" {ALWAYS_ALLOW_SMILIES_YES} /> {L_YES}&nbsp;
		<input type="radio" name="allowsmilies" value="0" {ALWAYS_ALLOW_SMILIES_NO} /> {L_NO}
	  </span></td>
	</tr>
	<tr>
	  <td class="row1"><span class="gen">{L_BOARD_LANGUAGE}</span></td>
	  <td class="row2">{LANGUAGE_SELECT}</td>
	</tr>
	<tr>
	  <td class="row1"><span class="gen">{L_BOARD_STYLE}</span></td>
	  <td class="row2">{STYLE_SELECT}</td>
	</tr>
	<tr>
	  <td class="row1"><span class="gen">{L_TIMEZONE}</span></td>
	  <td class="row2">{TIMEZONE_SELECT}</td>
	</tr>
	<tr>
	  <td class="row1">
		<span class="gen">{L_DATE_FORMAT}</span><br />
		<span class="gensmall">{L_DATE_FORMAT_EXPLAIN}</span>
	  </td>
	  <td class="row2"><input class="post" type="text" name="dateformat" value="{DATE_FORMAT}" maxlength="16" /></td>
	</tr>
	<tr> 
	  <td class="row1"><span class="gen">{L_USER_ABSENT}</span></td>
	  <td class="row2"> 
		<input type="radio" name="user_absent" value="1" {USER_ABSENT_YES} />
		<span class="gen">{L_YES}</span>&nbsp;&nbsp; 
		<input type="radio" name="user_absent" value="0" {USER_ABSENT_NO} />
		<span class="gen">{L_NO}</span></td>
	</tr>
  </table>

  <br class="nav" />
  <table class="forumline" width="98%" cellspacing="1" cellpadding="4" border="0" align="center">
	<tr>
	  <th class="thSides" colspan="2" height="12" valign="middle">{L_AVATAR_PANEL}</th>
	</tr>
	<tr align="center"> 
	  <td class="row1" colspan="2"><table width="70%" cellspacing="2" cellpadding="0" border="0">
		<tr>
		  <td width="65%"><span class="gensmall">{L_AVATAR_EXPLAIN}</span></td>
		  <td align="center"><span class="gensmall">
			{L_CURRENT_IMAGE}</span><br />
			{AVATAR}<br />
			<input type="checkbox" name="avatardel" /> {L_DELETE_AVATAR}
		  </span></td>
		</tr>
	  </table></td>
	</tr>
	<!-- BEGIN avatar_local_upload -->
	<tr>
	  <td class="row1" width="38%"><span class="gen">{L_UPLOAD_AVATAR_FILE}</span></td>
	  <td class="row2">
		<input type="hidden" name="MAX_FILE_SIZE" value="{AVATAR_SIZE}" />&nbsp;
		<input type="file" name="avatar" class="post" style="width: 200px" />
	  </td>
	</tr>
	<!-- END avatar_local_upload -->
	<!-- BEGIN avatar_remote_upload -->
	<tr>
	  <td class="row1"><span class="gen">{L_UPLOAD_AVATAR_URL}</span></td>
	  <td class="row2"><input class="post" type="text" name="avatarurl" size="40" style="width: 200px" /></td>
	</tr>
	<!-- END avatar_remote_upload -->
	<!-- BEGIN avatar_remote_link -->
	<tr>
	  <td class="row1"><span class="gen">{L_LINK_REMOTE_AVATAR}</span></td>
	  <td class="row2"><input class="post" type="text" name="avatarremoteurl" size="40" style="width: 200px" /></td>
	</tr>
	<!-- END avatar_remote_link -->
	<!-- BEGIN avatar_local_gallery -->
	<tr>
	  <td class="row1"><span class="gen">{L_AVATAR_GALLERY}</span></td>
	  <td class="row2"><input type="submit" name="avatargallery" value="{L_SHOW_GALLERY}" class="liteoption" /></td>
	</tr>
	<!-- END avatar_local_gallery -->
  </table>

  <br class="nav" />
  <table class="forumline" width="98%" cellspacing="1" cellpadding="4" border="0" align="center">
	<tr>
	  <th class="thSides" colspan="2">{L_SPECIAL}</th>
	</tr>
	<tr>
	  <td class="row1" colspan="2"><span class="gensmall">{L_SPECIAL_EXPLAIN}</span></td>
	</tr>
<!-- BEGIN switch_point_system -->
	<tr> 
	  <td class="row1"><span class="gen">{L_POINTS}</span></td>
	  <td class="row2"> 
		<input type="text" name="points" maxlength="12" value="{POINTS}" size="12" />
	  </td>
	</tr>
	<tr> 
	  <td class="row1"><span class="gen">{L_ALLOW_POINTS}</span></td>
	  <td class="row2"> 
		<input type="radio" name="allow_points" value="1" {ALLOW_POINTS_YES} />
		<span class="gen">{L_YES}</span>&nbsp;&nbsp; 
		<input type="radio" name="allow_points" value="0" {ALLOW_POINTS_NO} />
		<span class="gen">{L_NO}</span></td>
	</tr>
<!-- END switch_point_system -->
	<tr> 
	  <td class="row1"><span class="gen">{L_UPLOAD_QUOTA}</span></td>
	  <td class="row2">{S_SELECT_UPLOAD_QUOTA}</td>
	</tr>
	<tr> 
	  <td class="row1"><span class="gen">{L_PM_QUOTA}</span></td>
	  <td class="row2">{S_SELECT_PM_QUOTA}</td>
	</tr>
	<tr>
	  <td class="row1" width="38%"><span class="gen">{L_USER_ACTIVE}</span></td>
	  <td class="row2"><span class="gen">
		<input type="radio" name="user_status" value="1" {USER_ACTIVE_YES} /> {L_YES}&nbsp;
		<input type="radio" name="user_status" value="0" {USER_ACTIVE_NO} /> {L_NO}
	  </span></td>
	</tr>
	<tr>
	  <td class="row1"><span class="gen">{L_ALLOW_PM}</span></td>
	  <td class="row2"><span class="gen">
		<input type="radio" name="user_allowpm" value="1" {ALLOW_PM_YES} /> {L_YES}&nbsp;
		<input type="radio" name="user_allowpm" value="0" {ALLOW_PM_NO} /> {L_NO}
	  </span></td>
	</tr>
	<tr>
	  <td class="row1"><span class="gen">{L_ALLOW_AVATAR}</span></td>
	  <td class="row2"><span class="gen">
		<input type="radio" name="user_allowavatar" value="1" {ALLOW_AVATAR_YES} /> {L_YES}&nbsp;
		<input type="radio" name="user_allowavatar" value="0" {ALLOW_AVATAR_NO} /> {L_NO}
	  </span></td>
	</tr>
	<tr>
	  <td class="row1"><span class="gen">{L_SELECT_RANK}</span></td>
	  <td class="row2"><select name="user_rank">{RANK_SELECT_BOX}</select></td>
	</tr>
	<tr>
	  <td class="row1"><span class="gen">{L_RCS_SELECT_RANK}</span></td>
	  <td class="row2">{LIST_BOX}</td>
	</tr>
	<tr>
	  <td class="row1"><span class="gen">{L_DELETE_USER}?</span></td>
	  <td class="row2"><input type="checkbox" name="deleteuser"> {L_DELETE_USER_EXPLAIN}</td>
	</tr>
	<tr>
	  <td class="catBottom" colspan="2" align="center">
		{S_HIDDEN_FIELDS}
		<input type="submit" name="submit" value="{L_SUBMIT}" class="mainoption" />&nbsp;
		<input type="reset" value="{L_RESET}" class="liteoption" />
	  </td>
	</tr>
  </table>
</form>