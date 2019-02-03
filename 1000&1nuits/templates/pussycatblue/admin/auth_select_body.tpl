<!-- $Id: auth_select_body.tpl,v 0.1 23/09/2006 13:27 reddog Exp $ -->

<h1>{L_AUTH_TITLE}</h1>

<p>{L_AUTH_EXPLAIN}</p>

<form method="post" action="{S_AUTH_ACTION}">
<table class="forumline" cellpadding="4" cellspacing="1" border="0" align="center">
<tr>
	<th class="thHead">{L_AUTH_SELECT}</th>
</tr>
<tr>
	<td class="row1" align="center">{S_HIDDEN_FIELDS}<span class="genmed">
		{S_AUTH_SELECT}
		<input type="image" src="{I_SELECT}" alt="{L_LOOK_UP}" title="{L_LOOK_UP}" style="vertical-align:text-bottom;" />
	</span></td>
</tr>
</table>
</form>