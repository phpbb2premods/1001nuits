<!-- $Id: groupcp_select_body.tpl,v 0.1 22/09/2006 20:20 reddog Exp $ -->

<table width="100%" cellspacing="2" cellpadding="2" border="0">
<tr>
	<td><a href="{U_INDEX}" class="nav">{L_INDEX}</a></td>
</tr>
</table>
<form method="post" action="{S_USERGROUP_ACTION}">
<table class="forumline" width="100%" cellpadding="3" cellspacing="1" border="0" align="center">
<thead>
<tr>
	<th class="thHead" colspan="2">{L_USERGROUPS}</th>
</tr>
</thead>
<tfoot>
<tr>
	<td class="catBottom" colspan="2" align="center">{S_HIDDEN_FIELDS}<span class="gensmall">
		<input type="image" src="{I_SUBMIT}" alt="{L_VIEW_INFORMATION}" title="{L_VIEW_INFORMATION}" />
	</span></td>
</tr>
</tfoot>
<tbody>
<tr>
	<td class="row1" width="38%"><span class="gen">
		{L_SELECT_USERGROUP}</span><br />
		<span class="gensmall">{L_SELECT_USERGROUP_DETAILS}
	</span></td>
	<td class="row2"><span class="gen">{LIST_BOX}</span></td>
</tr>
</tbody>
</table>
</form>
<table width="100%" cellpadding="2" cellspacing="2" border="0">
<tr>
	<td align="right" valign="top"><span class="gensmall">{S_TIMEZONE}</span></td>
</tr>
<tr>
	<td align="right">{JUMPBOX}</td>
</tr>
</table>