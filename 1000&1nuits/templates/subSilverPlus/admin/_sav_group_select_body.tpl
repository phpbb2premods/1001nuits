<h1>{L_GROUP_TITLE}</h1>

<p>{L_GROUP_EXPLAIN}</p>

<form method="post" action="{S_GROUP_ACTION}">
  <table class="forumline" cellspacing="1" cellpadding="4" border="0" align="center">
	<tr>
	  <th class="thHead">{L_GROUP_SELECT}</th>
	</tr>
	<!-- BEGIN select_box -->
	<tr>
	  <td class="row1" align="center">
		{S_GROUP_SELECT}
		<input type="submit" name="edit" value="{L_LOOK_UP}" class="mainoption" />
	  </td>
	</tr>
	<!-- END select_box -->
	<tr>
	  <td class="catBottom" align="center">
		{S_HIDDEN_FIELDS}
		<input type="submit" class="liteoption" name="new" value="{L_CREATE_NEW_GROUP}" />
	  </td>
	</tr>
  </table>
</form>