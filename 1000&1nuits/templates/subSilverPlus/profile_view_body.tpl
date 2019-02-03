<table width="100%" cellspacing="2" cellpadding="2" border="0">
  <tr>
	<td class="nav">&nbsp;<a href="{U_INDEX}" class="nav">{L_INDEX}</a></td>
  </tr>
</table>

<table width="100%" cellspacing="1" cellpadding="3" border="0">
  <tr> 
	<td width="40%" valign="top"><table width="100%" cellspacing="1" cellpadding="2" border="0">
	  <tr>
		<td><table class="forumline" width="100%" cellspacing="1" cellpadding="4" border="0">
		  <tr>
			<td class="catLeft" height="28" align="center"><b class="gen">{L_AVATAR}</b></td>
		  </tr>
		  <tr>
			<td class="row1" height="6" valign="top" align="center">
				<span class="genmed">{POSTER_RANK}<br />{RANK_IMAGE}</span>
				{RANK_PROGRESSBAR}{AVATAR_IMG}
			</td>
		  </tr>
		</table></td>
	  </tr>
	  <tr>
		<td><table class="forumline" width="100%" cellspacing="1" cellpadding="4" border="0">
		  <tr>
			<td class="catLeft" align="center" height="28" colspan="2"><b class="gen">{L_CONTACT} {USERNAME}</b></td>
		  </tr>
		  <tr>
			<td class="row1" valign="middle" align="right" nowrap="nowrap"><span class="gen">{L_EMAIL_ADDRESS}:</span></td>
			<td class="row1" valign="middle" width="100%"><span class="gen">{EMAIL_IMG}</span></td>
		  </tr>
		  <tr>
			<td class="row1" valign="middle" nowrap="nowrap" align="right"><span class="gen">{L_PM}:</span></td>
			<td class="row1" valign="middle"><span class="gen">{PM_IMG}</span></td>
		  </tr>
		  <tr>
			<td class="row1" valign="middle" nowrap="nowrap" align="right"><span class="gen">{L_MESSENGER}:</span></td>
			<td class="row1" valign="middle"><span class="gen">{MSN}</span></td>
		  </tr>
		  <tr>
			<td class="row1" valign="middle" nowrap="nowrap" align="right"><span class="gen">{L_SKYPE} :</span></td>
			<td class="row1" valign="middle"><span class="gen">{SKYPE_IMG}</span></td>
		  </tr>
		  <tr>
			<td class="row1" valign="middle" nowrap="nowrap" align="right"><span class="gen">{L_YAHOO}:</span></td>
			<td class="row1" valign="middle"><span class="gen">{YIM_IMG}</span></td>
		  </tr>
		  <tr>
			<td class="row1" valign="middle" nowrap="nowrap" align="right"><span class="gen">{L_AIM}:</span></td>
			<td class="row1" valign="middle"><span class="gen">{AIM_IMG}</span></td>
		  </tr>
		  <tr>
			<td class="row1" valign="middle" nowrap="nowrap" align="right"><span class="gen">{L_ICQ_NUMBER}:</span></td>
			<td class="row1" valign="middle"><span class="gen">{ICQ_IMG}</span></td>
		  </tr>
		  <tr> 
			<td class="row1" valign="middle" nowrap="nowrap" align="right"><span class="gen">{L_ONLINE_STATUS} :</span></td>
			<td class="row1" valign="middle"><span class="gen">{ONLINE_STATUS_IMG}</span></td>
		</tr>
		</table></td>
	  </tr>
	</table></td>
	<td width="60%" valign="top"><table width="100%" cellspacing="1" cellpadding="2" border="0">
	  <tr>
		<td><table class="forumline" width="100%" cellspacing="1" cellpadding="4" border="0">
		  <tr>
			<td class="catRight" height="28" align="center" colspan="2"><b class="gen">{L_ABOUT_USER}</b></td>
		  </tr>
		  <tr>
			<td class="row1" valign="middle" align="right" nowrap="nowrap"><span class="gen">{L_JOINED}:</span></td>
			<td class="row1" width="100%"><b class="gen">{JOINED}</b></td>
		  </tr>
		<tr>
		  <td class="row1" valign="middle" align="right" nowrap="nowrap"><span class="gen">{L_VISITED} :</span></td>
		  <td class="row1" width="100%"><b><span class="gen">{VISITED}</span></b></td>
		</tr>
		  <tr>
			<td class="row1" valign="top" align="right" nowrap="nowrap"><span class="gen">{L_TOTAL_POSTS}:</span></td>
			<td class="row1" valign="top"><b class="gen">{POSTS}</b><br /><span class="genmed">[{POST_PERCENT_STATS} / {POST_DAY_STATS}]<br /><a href="{U_SEARCH_USER}" class="genmed">{L_SEARCH_USER_POSTS}</a></span></td>
		  </tr>
		  <tr>
			<td class="row1" valign="middle" align="right" nowrap="nowrap"><span class="gen">{L_LOCATION}:</span></td>
			<td class="row1"><b class="gen">{LOCATION}</b></td>
		  </tr>
		  <tr>
			<td class="row1" valign="middle" align="right" nowrap="nowrap"><span class="gen">{L_WEBSITE}:</span></td>
			<td class="row1"><span class="gen">{WWW_IMG}</span></td>
		  </tr>
		  <tr>
			<td class="row1" valign="middle" align="right" nowrap="nowrap"><span class="gen">{L_OCCUPATION}:</span></td>
			<td class="row1"><b class="gen">{OCCUPATION}</b></td>
		  </tr>
		  <tr>
			<td class="row1" valign="top" align="right" nowrap="nowrap"><span class="gen">{L_INTERESTS}:</span></td>
			<td class="row1"><b class="gen">{INTERESTS}</b></td>
		  </tr>
<!-- BEGIN switch_point_system -->
		<tr>
		  <td class="row1" valign="top" align="right" nowrap="nowrap"><span class="gen">{L_POINTS} :</span></td>
		  <td class="row1"><b><span class="gen">{POINTS}</span></b><span class="genmed">{DONATE_POINTS}</span></td>
		</tr>
<!-- END switch_point_system -->
		<tr>
			<td class="row1" valign="top" align="right" nowrap="nowrap"><span class="gen">{L_FLAG} :</span></td>
			<td class="row1">
			<!-- BEGIN flag -->
			<b class="gen">{FLAG_NAME}</b>&nbsp;{FLAG_IMG}
			<!-- END flag -->
			<!-- BEGIN flag_else -->
			<i class="gen">{L_FLAG_NONE}</i>
			<!-- END flag_else -->
		  </td>
		</tr>
<!-- Start add - Gender MOD --> 
		  <tr> 
			<td class="row1" valign="top" align="right" nowrap="nowrap"><span class="gen">{L_GENDER} :</span></td>
			<td class="row1"><b><span class="gen">{GENDER}</span></b></td>
		  </tr>
<!-- End add - Gender MOD -->
		  <tr>
			<td class="row1" valign="top" align="right" nowrap="nowrap"><span class="gen">{L_BDAY_BIRTHDATE} :</span></td>
			<td class="row1"><span class="gen"><b>{BDAY_DATE}</b>{BDAY_AGE}{BDAY_CAKE}</span></td>
		  </tr>
		  <tr>
			<td class="row1" valign="top" align="right" nowrap="nowrap"><span class="gen">{L_BROWSER} :</span></td>
			<td class="row1">
			<!-- BEGIN browser -->
				<b class="gen">{BROWSER_NAME}</b>&nbsp;{BROWSER_IMG}
			<!-- END browser -->
			<!-- BEGIN browser_else -->
				<i class="gen">{L_BROWSER_NONE}</i>
			<!-- END browser_else -->
			</td>
		</tr>
<!-- BEGIN switch_upload_limits -->
		<tr> 
			<td class="row1" valign="top" align="right" nowrap="nowrap"><span class="gen">{L_UPLOAD_QUOTA} :</span></td>
			<td class="row1"> 
				<table width="175" cellspacing="1" cellpadding="2" border="0" class="bodyline">
				<tr> 
					<td colspan="3" width="100%" class="row2">
						<table cellspacing="0" cellpadding="1" border="0">
						<tr>
							<td bgcolor="{T_TD_COLOR2}"><img src="templates/subSilverPlus/images/spacer.gif" width="{UPLOAD_LIMIT_IMG_WIDTH}" height="8" alt="" title="{UPLOAD_LIMIT_PERCENT}%" /></td>
						</tr>
						</table>
					</td>
				</tr>
				<tr> 
					<td width="33%" class="row1"><span class="gensmall">0%</span></td>
					<td width="34%" align="center" class="row1"><span class="gensmall">50%</span></td>
					<td width="33%" align="right" class="row1"><span class="gensmall">100%</span></td>
				</tr>
				</table>
				<b><span class="genmed">[{UPLOADED} / {QUOTA} / {PERCENT_FULL}]</span> </b><br />
				<span class="genmed"><a href="{U_UACP}" class="genmed">{L_UACP}</a></span></td>
			</td>
		</tr>
<!-- END switch_upload_limits -->
<!-- BEGIN switch_user_sig_block -->
		<tr>
			<td class="row1" valign="top" align="right" nowrap="nowrap"><span class="gen">{L_SIGNATURE}:</span></td>
			<td class="row1"><span class="postbody">{USER_SIG}</span></td>
		</tr>
<!-- END switch_user_sig_block -->
		</table></td>
	  </tr>
	  <tr>
		<td align="right"><span class="nav"><br />{JUMPBOX}</span></td>
	  </tr>
	</table></td>
  </tr>
</table>