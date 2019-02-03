<table width="100%" cellspacing="2" cellpadding="2" border="0">
  <tr> 
	<td class="nav"><a href="{U_INDEX}" class="nav">{L_INDEX}</a></span></td>
  </tr>
</table>

<table class="forumline" width="100%" cellpadding="4" cellspacing="1" border="0">
  <!-- BEGIN switch_groups_joined -->
  <tr> 
	<th colspan="2" align="center" class="thHead" height="25">{L_GROUP_MEMBERSHIP_DETAILS}</th>
  </tr>
  <!-- BEGIN switch_groups_member -->
  <tr> 
	<td class="row1"><span class="gen">{L_YOU_BELONG_GROUPS}</span></td>
	<td class="row2"><table width="90%" cellspacing="0" cellpadding="0" border="0">
	  <tr><form method="get" action="{S_USERGROUP_ACTION}">
		<td width="100%"><span class="gensmall">
			{GROUP_MEMBER_SELECT}&nbsp;
			<input type="submit" value="{L_VIEW_INFORMATION}" class="liteoption" />
			{S_HIDDEN_FIELDS}
		</span></td>
	  </form></tr>
	</table></td>
  </tr>
  <!-- END switch_groups_member -->
  <!-- BEGIN switch_groups_pending -->
  <tr> 
	<td class="row1"><span class="gen">{L_PENDING_GROUPS}</span></td>
	<td class="row2"><table width="90%" cellspacing="0" cellpadding="0" border="0">
	  <tr><form method="get" action="{S_USERGROUP_ACTION}">
		<td width="100%"><span class="gensmall">
			{GROUP_PENDING_SELECT}&nbsp;
			<input type="submit" value="{L_VIEW_INFORMATION}" class="liteoption" />
			{S_HIDDEN_FIELDS}
		</span></td>
	  </form></tr>
	</table></td>
  </tr>
  <!-- END switch_groups_pending -->
  <!-- END switch_groups_joined -->
  <!-- BEGIN switch_groups_remaining -->
  <tr> 
	<th colspan="2" align="center" class="thHead" height="25">{L_JOIN_A_GROUP}</th>
  </tr>
  <tr> 
	<td class="row1"><span class="gen">{L_SELECT_A_GROUP}</span></td>
	<td class="row2"><table width="90%" cellspacing="0" cellpadding="0" border="0">
	  <tr><form method="get" action="{S_USERGROUP_ACTION}">
		<td width="100%"><span class="gensmall">
			{GROUP_LIST_SELECT}&nbsp;
			<input type="submit" value="{L_VIEW_INFORMATION}" class="liteoption" />
			{S_HIDDEN_FIELDS}
		</span></td>
	  </form></tr>
	</table></td>
  </tr>
  <!-- END switch_groups_remaining -->
</table>
<br class="nav" />

<table width="100%" cellspacing="0" cellpadding="0" border="0">
  <tr> 
	<td valign="top" align="right">{JUMPBOX}</td>
  </tr>
</table>