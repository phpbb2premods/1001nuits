
<script type="text/javascript" src="./../templates/colorpicker.js"></script>
<script type="text/javascript">
//<![CDATA[
<!--
var cp = new ColorPicker();
//-->
//]]>
</script>

<h1>{ADMIN_TITLE}</h1>

<p>{ADMIN_TITLE_EXPLAIN}</p>

<form action="{S_TITLE_ACTION}" method="post"><table class="forumline" cellpadding="4" cellspacing="1" border="0" align="center">
	<tr>
		<th class="thTop" colspan="2">{L_TITLE_TITLE}</th>
	</tr>
	<tr>
		<td class="row1" width="38%"><span class="gen">{L_TITLE_INFO}</span></td>
		<td class="row2"><input class="post" type="text" name="title_info" size="35" maxlength="255" value="{TITLE_INFO}" /></td>
	</tr>
	<tr>
		<td class="row1"><span class="gen">{L_PERM_INFO}</span><br /><span class="gensmall">{L_PERM_EXPLAIN}</span></td>
		<td class="row2"><span class="post"><input type="checkbox" name="admin_auth" {ADMIN_CHECKED}/>&nbsp;{ADMIN}<br /><input type="checkbox" name="mod_auth" {MOD_CHECKED}/>&nbsp;{MODERATOR}<br /><input type="checkbox" name="poster_auth" {POSTER_CHECKED}/>&nbsp;{POSTER}</span></td>
	</tr>
	<tr>
		<td class="row1"><span class="gen">{L_DATE_FORMAT}</span><br /><span class="gensmall">{L_DATE_FORMAT_EXPLAIN}</span></td>
		<td class="row2"><input class="post" type="text" name="date_format" size="15" maxlength="255" value="{DATE_FORMAT}" /></td>
	</tr>
	<tr>
		<td class="row1">{L_TITLE_POS}<br /><span class="gensmall">{L_TITLE_POS_EXPLAIN}</span></td>
		<td class="row2"><input type="radio" name="title_pos" value="0" {S_POS_RIGHT} /> {L_RIGHT}&nbsp;&nbsp;<input type="radio" name="title_pos" value="1" {S_POS_LEFT} /> {L_LEFT}</td>
	</tr>
	<tr>
		<td class="row1" width="38%"><span class="gen">{L_COLOR_INFO}</span><br /><span class="gensmall">{L_COLOR_INFO_EXPLAIN}</span></td>
		<td class="row2"><input class="post" type="text" name="info_color" size="15" maxlength="6" value="{COLOR_INFO}" />
		<a href="javascript:cp.select(document.forms[0].info_color,'pick');" name="pick" id="pick"><img src="./../{I_PICK_COLOR}" border="0" /></a>
		<!-- BEGIN no_info_color -->
		<input class="post" type="text" size="1" style="background-color:#{COLOR_INFO}" disabled="yes" /></td>
		<!-- END no_info_color -->
	</tr>
	<tr>
		<td class="catBottom" colspan="2" align="center"><input type="submit" name="submit" value="{L_SUBMIT}" class="mainoption" />&nbsp;&nbsp;<input type="reset" value="{L_RESET}" class="liteoption" /></td>
	</tr>
</table>
{S_HIDDEN_FIELDS}</form>

<script type="text/javascript">
//<![CDATA[
<!--
cp.writeDiv()
//-->
//]]>
</script>
