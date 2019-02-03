<!-- $Id: rcs_list_body.tpl,v 0.4 23/09/2006 15:58 reddog Exp $ -->

<h1>{L_RCS_MANAGE_TITLE}</h1>

<p>{L_RCS_MANAGE_TITLE_DESC}</p>

<form method="post" action="{S_RCS_ACTION}">
<table class="forumline" cellpadding="4" cellspacing="1" border="0" align="center">
<thead>
<tr>
	<th class="thCornerL">{L_RCS_NAME}</th>
	<th class="thTop">{L_RCS_COLOR}</th>
	<th class="thTop">{L_RCS_SINGLE}</th>
	<th class="thTop">{L_RCS_DISPLAY}</th>
	<th class="thCornerR">{L_ACTION}</th>
</tr>
</thead>
<tfoot>
<tr>
	<td class="catBottom" colspan="5" align="center">{S_HIDDEN_FIELDS}<span class="gensmall">
		<a href="{U_RCS_CREATE}" title="{L_CREATE}"><img src="{I_CREATE}" alt="{L_CREATE}" border="0" /></a>
	</span></td>
</tr>
</tfoot>
<tbody>
<!-- BEGIN empty -->
<tr>
	<td class="row1" colspan="5" height="30" align="center"><span class="gen">{L_EMPTY}</span></td>
</tr>
<!-- END empty -->
<!-- BEGIN rcs -->
<tr>
	<td class="{rcs.ROW_CLASS}" align="center"><span class="genmed">
		<a href="{rcs.U_RCS_EDIT}" title="{L_EDIT}"{rcs.RCS_STYLE}>{rcs.RCS_NAME}</a>
	</span></td>
	<td class="{rcs.ROW_CLASS}" align="center"><span class="genmed">{rcs.RCS_COLOR}</span></td>
	<td class="{rcs.ROW_CLASS}" align="center"><span class="genmed">{rcs.RCS_SINGLE}</span></td>
	<td class="{rcs.ROW_CLASS}" align="center"><span class="genmed">{rcs.RCS_DISPLAY}</span></td>
	<td class="{rcs.ROW_CLASS}" align="center" nowrap="nowrap"><table cellpadding="0" cellspacing="1" border="0">
	<tr>
		<td><a href="{rcs.U_RCS_MOVEUP}" title="{L_MOVEUP}" class="genmed"><img src="{I_MOVEUP}" alt="{L_MOVEUP}" border="0" /></a></td>
		<td><a href="{rcs.U_RCS_EDIT}" title="{L_EDIT}" class="genmed"><img src="{I_EDIT}" alt="{L_EDIT}" border="0" /></a></td>
	</tr>
	<tr>
		<td><a href="{rcs.U_RCS_MOVEDW}" title="{L_MOVEDW}" class="genmed"><img src="{I_MOVEDW}" alt="{L_MOVEDW}" border="0" /></a></td>
		<td><a href="{rcs.U_RCS_DELETE}" title="{L_DELETE}" class="genmed"><img src="{I_DELETE}" alt="{L_DELETE}" border="0" /></a></td>		
	</tr>
	</table></td>
</tr>
<!-- END rcs -->			
</tbody>
</table>
</form>
<br clear="all" />