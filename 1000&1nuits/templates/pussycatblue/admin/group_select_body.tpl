<!-- $Id: group_select_body.tpl,v 0.1 23/09/2006 10:02 reddog Exp $ -->

<h1>{L_GROUP_TITLE}</h1>

<p>{L_GROUP_EXPLAIN}</p>

<form method="post" action="{S_GROUP_ACTION}">
<table class="forumline" cellpadding="4" cellspacing="1" border="0" align="center">
<tr>
	<th class="thHead">{L_GROUP_SELECT}</th>
</tr>
<!-- BEGIN select_box -->
<tr>
	<td class="row1" align="center"><span class="genmed">
		{S_GROUP_SELECT}
		<input type="image" src="{I_EDIT}" name="edit" alt="{L_LOOK_UP}" title="{L_LOOK_UP}" style="vertical-align:text-bottom;" />
	</span></td>
</tr>
<!-- END select_box -->
<tr>
	<td class="catBottom" align="center">{S_HIDDEN_FIELDS}<span class="gensmall">
		<input type="image" src="{I_CREATE}" name="new" alt="{L_CREATE_NEW_GROUP}" title="{L_CREATE_NEW_GROUP}" />
	</span></td>
</tr>
</table>
</form>