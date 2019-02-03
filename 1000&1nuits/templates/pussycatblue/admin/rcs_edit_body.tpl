<!-- $Id: rcs_edit_body.tpl,v 0.3 23/09/2006 16:02 reddog Exp $ -->

<script type="text/javascript" src="./../templates/colorpicker.js"></script>
<script type="text/javascript">
//<![CDATA[
<!--
var cp = new ColorPicker();
//-->
//]]>
</script>

<!-- BEGIN edit -->
<h1>{edit.L_RCS_EDIT_TITLE}</h1>

<p>{edit.L_RCS_EDIT_TITLE_DESC}</p>
<!-- END edit -->
<!-- BEGIN add -->
<h1>{add.L_RCS_ADD_TITLE}</h1>

<p>{add.L_RCS_ADD_TITLE_DESC}</p>
<!-- END add -->
<form method="post" action="{S_RCS_ACTION}" name="post">
<table class="forumline" cellpadding="4" cellspacing="1" border="0" align="center">
<thead>
<tr>
	<th class="thTop" colspan="2">
		<!-- BEGIN edit -->
		{edit.L_RCS_EDIT_TITLE}
		<!-- END edit -->
		<!-- BEGIN add -->
		{add.L_RCS_ADD_TITLE}
		<!-- END add -->
	</th>
</tr>
</thead>
<tfoot>
<tr>
	<td class="catBottom" colspan="2" align="center">{S_HIDDEN_FIELDS}<span class="gensmall">
		<input type="image" src="{I_SUBMIT}" name="submit_form" alt="{L_SUBMIT}" title="{L_SUBMIT}" />&nbsp;
		<input type="image" src="{I_CANCEL}" name="cancel_form" alt="{L_SUBMIT}" title="{L_CANCEL}" />
	</span></td>
</tr>
</tfoot>
<tbody>
<tr>
	<td class="row1" width="38%"><span class="gen">
		{L_RCS_NAME}:</span><br />
		<span class="gensmall">{L_RCS_NAME_DESC}
	</span></td>
	<td class="row2"><span class="genmed">
		<input class="post" type="text" name="rcs_name" size="35" maxlength="40" value="{RCS_NAME}" />
	</span></td>
</tr>
<tr>
	<td class="row1"><span class="gen">
		{L_RCS_COLOR}:</span><br />
		<span class="gensmall">{L_RCS_COLOR_DESC}
	</span></td>
	<td class="row2"><span class="genmed">
		<input class="post" type="text" name="rcs_color" size="6" maxlength="6" value="{RCS_COLOR}" />
		<a href="javascript:cp.select(document.forms[0].rcs_color,'pick');" name="pick" id="pick"><img alt="{L_PICK_COLOR}" src="{I_PICK_COLOR}" border="0" /></a>
	</span></td>
</tr>
<tr>
	<td class="row1"><span class="gen">
		{L_RCS_SINGLE}:</span><br />
		<span class="gensmall">{L_RCS_SINGLE_DESC}
	</span></td>
	<td class="row2"><span class="genmed">
		<input type="radio" id="rcs_single_1" name="rcs_single" value="1"{RCS_SINGLE} /><label for="rcs_single_1">{L_YES}</label>&nbsp;
		<input type="radio" id="rcs_single_0" name="rcs_single" value="0"{RCS_NOT_SINGLE} /><label for="rcs_single_0">{L_NO}</label>
	</span></td>
</tr>
<tr>
	<td class="row1"><span class="gen">
		{L_RCS_DISPLAY}:</span><br />
		<span class="gensmall">{L_RCS_DISPLAY_DESC}
	</span></td>
	<td class="row2"><span class="genmed">
		<input type="radio" id="rcs_display_1" name="rcs_display" value="1"{RCS_DISPLAY} /><label for="rcs_display_1">{L_YES}</label>&nbsp;
		<input type="radio" id="rcs_display_0" name="rcs_display" value="0"{RCS_NOT_DISPLAY} /><label for="rcs_display_0">{L_NO}</label>
	</span></td>
</tr>
<tr>
	<td class="row1"><span class="gen">{L_RCS_MOVE_AFTER}</span></td>
	<td class="row2"><span class="genmed">{LIST_ORDER}</span></td>
</tr>
</tbody>
</table>
</form>

<script type="text/javascript">
//<![CDATA[
<!--
cp.writeDiv()
//-->
//]]>
</script>