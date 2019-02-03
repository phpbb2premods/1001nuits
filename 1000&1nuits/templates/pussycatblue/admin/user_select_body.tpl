<!-- $Id: user_select_body.tpl,v 0.1 23/09/2006 13:35 reddog Exp $ -->

<h1>{L_USER_TITLE}</h1>

<p>{L_USER_EXPLAIN}</p>

<form method="post" name="post" action="{S_USER_ACTION}">
<table class="forumline" cellpadding="4" cellspacing="1" border="0" align="center">
<tr>
	<th class="thHead">{L_USER_SELECT}</th>
</tr>
<tr>
	<td class="row1" align="center"><span class="genmed">
		<input type="text" class="post" name="username" maxlength="50" size="20" />
		<input type="hidden" name="mode" value="edit" />
		{S_HIDDEN_FIELDS}
		<input type="image" src="{I_SELECT}" name="submituser" alt="{L_LOOK_UP}" title="{L_LOOK_UP}" style="vertical-align:text-bottom;" />
		<input type="image" src="{I_SEARCH}" name="usersubmit" alt="{L_FIND_USERNAME}" title="{L_FIND_USERNAME}" style="vertical-align:text-bottom;" onclick="window.open('{U_SEARCH_USER}', '_phpbbsearch', 'HEIGHT=250,resizable=yes,WIDTH=400');return false;" />
	</span></td>
</tr>
</table>
</form>