<h1>{L_FORUM_TITLE}</h1>

<p>{L_FORUM_EXPLAIN}</p>

<form action="{S_FORUM_ACTION}" method="post">
  <table class="forumline" width="100%" cellpadding="4" cellspacing="1" border="0" align="center">
	<tr>
	  <th class="thHead" colspan="2">{L_FORUM_SETTINGS}</th>
	</tr>
	<tr>
	  <td class="row1">{L_FORUM_NAME}</td>
	  <td class="row2"><input type="text" size="25" name="forumname" value="{FORUM_NAME}" class="post" /></td>
	</tr>
	<tr>
	  <td class="row1">{L_FORUM_LINK}<span class="gensmall"><br />{L_FORUM_LINK_EXPLAIN}</span></td>
	  <td class="row2"><input type="text" size="25" name="forumlink" value="{FORUM_LINK}" class="post" /></td>
	</tr>
	<tr> 
	  <td class="row1">{L_FORUM_ICON}</td>
	  <td class="row2"><input type="text" size="35" name="forumicon" value="{ICON}" class="post" />&nbsp;&nbsp;&nbsp;{ICON_DISPLAY}</td>
	</tr>
	<tr>
	  <td class="row1">{L_FORUM_DESCRIPTION}</td>
	  <td class="row2"><textarea rows="5" cols="45" wrap="virtual" name="forumdesc" class="post">{DESCRIPTION}</textarea></td>
	</tr>
	<tr>
	  <td class="row1">{L_CATEGORY}</td>
	  <td class="row2"><select name="c">{S_CAT_LIST}</select></td>
	</tr>
		<tr>
		<td class="row1">{L_ATTACHED_FORUM}</td>
		<td class="row2">
		<!-- BEGIN switch_attached_yes -->
		<select name="attached_forum_id">{S_ATTACHED_FORUM_ID}</select>
		<!-- END switch_attached_yes -->
		<!-- BEGIN switch_attached_no -->
		{L_DETACH_DESC} <input type="checkbox" name="detach_enabled" value="1" {S_DETACH_ENABLED} /><br />
		<!-- END switch_attached_no -->
		{L_ATTACHED_DESC}
		</td>
	</tr>
	<tr>
	  <td class="row1">{L_FORUM_STATUS}</td>
	  <td class="row2"><select name="forumstatus">{S_STATUS_LIST}</select></td>
	</tr>
<!-- BEGIN switch_point_system -->
	<tr> 
	  <td class="row1">{L_POINTS_DISABLED}</td>
	  <td class="row2"><select name="points_disabled">{S_POINTS_LIST}</select></td>
	</tr>
<!-- END switch_point_system -->
	<tr>
	  <td class="row1">{L_QP_TITLE}</td>
	  <td class="row2">
	  	<input type="radio" name="forum_qpes" value="1" {FORUM_QP_YES} /> {L_YES}&nbsp;
	  	<input type="radio" name="forum_qpes" value="0" {FORUM_QP_NO} /> {L_NO}
	  </td>
	</tr>	
	<tr>
	  <td class="row1">{L_AUTO_PRUNE}</td>
	  <td class="row2"><table cellspacing="0" cellpadding="1" border="0">
		<tr>
		  <td align="right" valign="middle">{L_ENABLED}</td>
		  <td align="left" valign="middle"><input type="checkbox" name="prune_enable" value="1" {S_PRUNE_ENABLED} /></td>
		</tr>
		<tr>
		  <td align="right" valign="middle">{L_PRUNE_DAYS}</td>
		  <td align="left" valign="middle"><input type="text" name="prune_days" value="{PRUNE_DAYS}" size="5" class="post" /> {L_DAYS}</td>
		</tr>
		<tr>
		  <td align="right" valign="middle">{L_PRUNE_FREQ}</td>
		  <td align="left" valign="middle"><input type="text" name="prune_freq" value="{PRUNE_FREQ}" size="5" class="post" /> {L_DAYS}</td>
		</tr>
	  </table></td>
	</tr>
	<tr>
	  <td class="catBottom" colspan="2" align="center">
		{S_HIDDEN_FIELDS}
		<input type="submit" name="submit" value="{S_SUBMIT_VALUE}" class="mainoption" />
	  </td>
	</tr>
  </table>
</form>
<br clear="all" />