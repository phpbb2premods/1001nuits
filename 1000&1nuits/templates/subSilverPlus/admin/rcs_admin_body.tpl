<!-- $Id: rcs_admin_body.tpl,v 0.4 23/09/2006 16:04 reddog Exp $ -->

<script type="text/javascript" src="./../templates/colorpicker.js"></script>
<script type="text/javascript">
//<![CDATA[
<!--
var cp = new ColorPicker();
//-->
//]]>
</script>

<h1>{L_RCS_SETTINGS_TITLE}</h1>

<p>{L_RCS_SETTINGS_TITLE_DESC}</p>

<form action="{S_RCS_ACTION}" method="post">
<table class="forumline" width="100%" cellpadding="4" cellspacing="1" border="0">
<tr>
	<th class="thHead" colspan="2">{L_RCS_STYLE_SETTINGS}</th>
</tr>
<tr>
	<td class="row1" width="38%"><span class="genmed">{L_RCS_SELECT_STYLE}</span></td>
	<td class="row2"><span class="genmed">{LIST_BOX}</span></td>
</tr>
<!-- BEGIN style -->
<tr>
	<td class="row1"><span class="genmed">{style.L_OPTION_TITLE}:</span></td>
	<td class="row2"><span class="genmed">
		<input class="post" type="text" size="6" maxlength="6" name="{style.OPTION_NAME}" value="{style.OPTION_VALUE}" />
		<a href="javascript:cp.select(document.forms[0].{style.OPTION_NAME},'pick_{style.OPTION_NAME}');" name="pick_{style.OPTION_NAME}" id="pick_{style.OPTION_NAME}"><img alt="{L_PICK_COLOR}" src="{I_PICK_COLOR}" border="0" /></a>
	</span></td>
</tr>
<!-- END style -->
<tr>
	<td class="catBottom" colspan="2" align="center">{S_HIDDEN_FIELDS}<span class="gensmall">
		<input type="image" src="{I_SUBMIT}" name="updated_style" alt="{L_SUBMIT}" title="{L_SUBMIT}" />
	</span></td>
</tr>
</table>
<br class="nav" />
<!-- BEGIN cache -->
<table class="forumline" width="100%" cellpadding="4" cellspacing="1" border="0">
<tr>
	<th class="thHead" colspan="2">{L_RCS_CACHE_SETTINGS}</th>
</tr>
<tr>
	<td class="row1" width="38%"><span class="genmed">{cache.L_RCS_CACHE}</span></td>
	<td class="row2"><span class="genmed">
		<input type="radio" id="cache_rcs_1" name="cache_rcs" value="1"{cache.CACHE_RCS_YES} /><label for="cache_rcs_1">{L_YES}</label>&nbsp;
		<input type="radio" id="cache_rcs_0" name="cache_rcs" value="0"{cache.CACHE_RCS_NO} /><label for="cache_rcs_0">{L_NO}</label>&nbsp;
		<input type="image" src="{I_REGEN}" name="regen_cache_rcs" alt="{L_REGEN}" title="{L_REGEN}" /><br />
		<span class="gensmall"><strong>{cache.L_LAST_REGEN}:</strong> {cache.L_RCS_REGEN_TIME}</span>
	</span></td>
</tr>
</table>
<br class="nav" />
<!-- END cache -->
<table class="forumline" width="100%" cellpadding="4" cellspacing="1" border="0">
<tr>
	<th class="thHead" colspan="2">{L_RCS_MAIN_SETTINGS}</th>
</tr>
<!-- BEGIN config -->
<tr>
	<td class="row1" width="38%"><span class="genmed">
		{config.L_OPTION_TITLE}</span><br />
		<span class="gensmall">{config.L_OPTION_DESC}
	</span></td>
	<td class="row2"><span class="genmed">
		<input type="radio" id="{config.OPTION_NAME}_1" name="{config.OPTION_NAME}" value="1"{config.OPTION_YES} /><label for="{config.OPTION_NAME}_1">{L_YES}</label>&nbsp;
		<input type="radio" id="{config.OPTION_NAME}_0" name="{config.OPTION_NAME}" value="0"{config.OPTION_NO} /><label for="{config.OPTION_NAME}_0">{L_NO}</label>
	</span></td>
</tr>
<!-- END config -->
<tr>
	<td class="row1"><span class="genmed">
		{L_RCS_GROUPS_LEVEL}</span><br />
		<span class="gensmall">{L_RCS_GROUPS_LEVEL_DESC}
	</span></td>
	<td class="row2"><table width="100%" cellspacing="0" cellpadding="0" border="0">
	<!-- BEGIN level_groups -->
	<tr>
		<td><span class="gensmall">{level_groups.L_OPTION_TITLE}</span></td>
		<td width="100%"><span class="genmed">
			<input type="radio" id="{level_groups.OPTION_NAME}_1" name="{level_groups.OPTION_NAME}" value="1"{level_groups.OPTION_YES} /><label for="{level_groups.OPTION_NAME}_1">{L_YES}</label>&nbsp;
			<input type="radio" id="{level_groups.OPTION_NAME}_0" name="{level_groups.OPTION_NAME}" value="0"{level_groups.OPTION_NO} /><label for="{level_groups.OPTION_NAME}_0">{L_NO}</label>
		</span></td>
	</tr>
	<!-- END level_groups -->
	</table></td>
</tr>
<tr>
	<td class="catBottom" colspan="2" align="center">{S_HIDDEN_FIELDS}<span class="gensmall">
		<input type="image" src="{I_SUBMIT}" name="submit_form" alt="{L_SUBMIT}" title="{L_SUBMIT}" />
	</span></td>
</tr>
</table>
</form>

<script type="text/javascript">
//<![CDATA[
<!--
cp.writeDiv()
//-->
//]]>
</script>

<br clear="all" />