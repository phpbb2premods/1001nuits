<h1>{L_HEADLINE}</h1>
<p>{L_SUBHEADLINE}</p>

<br />
<!-- BEGIN infobox -->
<div align="center">
<table width="80%" cellspacing="1" cellpadding="3" border="0" class="forumline">
	<tr>
		<td align="center" style="background-color:#DBFFCF;"><b>{L_MESSAGE_TEXT}</b></td>
	</tr>
</table>
</div>

<br /><br />
<!-- END infobox -->

<div align="center">
<form action="{S_FORM_ACTION}" method="post">
<table width="80%" cellspacing="1" cellpadding="3" border="0" class="forumline">
	<tr> 
		<th colspan="2">{L_SELECT_FOOTER}</th>
	</tr>
<!-- BEGIN footer_output -->
	<tr> 
		<td class="{footer_output.ROW_CLASS}" align="center"><br /><br />{footer_output.IMG_FOOTER}<br /><br /></td>
		<td class="{footer_output.ROW_CLASS}" align="center" style="vertical_align:center;"><input type="radio" name="footer_layout" value="{footer_output.S_SELECT}"{footer_output.S_SELECTED}></td>
	</tr>
<!-- END footer_output -->
	<tr>
		<td class="catBottom" colspan="2" align="center"><input type="Submit" name="submit" value="{L_SUBMIT_BUTTON}" class="mainoption"></td>
	</tr>
</table>
</form>
</div>