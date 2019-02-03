<h1>{L_AUTH_TITLE}</h1>

<p>{L_AUTH_EXPLAIN}</p>

<form method="post" action="{S_AUTH_ACTION}">
  <table class="forumline" cellspacing="1" cellpadding="4" border="0" align="center">
	<tr>
	  <th class="thHead" align="center">{L_AUTH_SELECT}</th>
	</tr>
	<tr>
	  <td class="row1" align="center">
		{S_HIDDEN_FIELDS}
		{S_AUTH_SELECT}&nbsp;
		<input type="submit" value="{L_LOOK_UP}" class="mainoption" />
	  </td>
	</tr>
  </table>
</form>
