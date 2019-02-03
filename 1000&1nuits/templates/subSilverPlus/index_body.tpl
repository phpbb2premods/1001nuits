{ANNONCE_GLOBALE}

<script language="javascript" type="text/javascript" src="{U_CFI_JSLIB}"></script>
<script language="javascript" type="text/javascript">
<!--

var CFIG_Version = "DHTML Collapsible Forum Index MOD v1.1.1";

var CFIG = new _CFIG('CFIG',
		['{IMG_PLUS}', '{IMG_MINUS}'],
		['{IMG_DW_ARROW}', '{IMG_UP_ARROW}'],
		['{COOKIE_PATH}', '{COOKIE_DOMAIN}', (('{COOKIE_SECURE}' == '0') ? false : true)]);
	CFIG.T['cookie'] = '{CFI_COOKIE_NAME}';
	CFIG.T['title'] = ['{L_CFI_OPTIONS}', '{L_CFI_OPTIONS_EX}'];
	CFIG.T['close'] = '{L_CFI_CLOSE}';
	CFIG.T['delete'] = '{L_CFI_DELETE}';
	CFIG.T['restore'] = '{L_CFI_RESTORE}';
	CFIG.T['save'] = '{L_CFI_SAVE}';
	CFIG.T['expand_all'] = '{L_CFI_EXPAND_ALL}';
	CFIG.T['collapse_all'] = '{L_CFI_COLLAPSE_ALL}';
	CFIG.T['u_index'] = '{U_INDEX}';
	CFIG.allowed = true;

	if( CFIG.IsEnabled() && parseInt(CFIG.getQueryVar('c')) > 0 )
	{
		window.location.replace('{U_INDEX}');
	}
// -->
</script>

<table width="100%" cellspacing="0" cellpadding="2" border="0" align="center">
  <tr>
	<td align="left" valign="bottom"><span class="gensmall">
		<!-- BEGIN switch_user_logged_in -->
		{LAST_VISIT_DATE}<br />
		<!-- END switch_user_logged_in -->
			{CURRENT_TIME}<br /></span>
<script language="javascript" type="text/javascript">
<!--
	CFIG.writeButton();
// -->
</script>
		<span class="nav"><a href="{U_INDEX}" class="nav">{L_INDEX}</a>
	</span></td>
	<td align="right" valign="bottom"><span class="gensmall">
		<!-- BEGIN toolbar -->
		{toolbar.S_TOOLBAR}
		<!-- END toolbar -->
		<!-- BEGIN switch_user_logged_out -->
		<a href="{U_SEARCH_UNANSWERED}" class="gensmall">{L_SEARCH_UNANSWERED}</a>
		<!-- END switch_user_logged_out -->
	</span>
	</td>
  </tr>
</table>

<script language="javascript" type="text/javascript">
<!--
	CFIG.writePanel();

<!-- BEGIN catrow -->
CFIG.C['cat_{catrow.CAT_ID}'] = new _CFIC('{catrow.CAT_ID}', '{catrow.DISPLAY}');
<!-- BEGIN forumrow -->
if( CFIG.C['cat_{catrow.CAT_ID}'] ) CFIG.C['cat_{catrow.CAT_ID}'].add('forum_{catrow.CAT_ID}_{catrow.forumrow.FORUM_ID}');
<!-- END forumrow -->
<!-- END catrow -->

function CFIG_slideCat(cat_id, isLink)
{
	if( CFIG && CFIG.currentStep <= 0 )
	{
		if( CFIG.IsEnabled() && CFIG.C['cat_'+cat_id] )
		{
			if( isLink ) return false;
			CFIG.createQueue();
			CFIG.slideForums(cat_id);
			CFIG.execQueue();
			CFIG.saveIndexState(CFIG.T['cookie']);
			return false;	// omit the default action of the link.
		}
		if( !isLink )
		{
			var u_index = CFIG.T['u_index'];
			u_index += ( u_index.indexOf('?') > 0 ? '&' : '?' ) + 'c=' + parseInt(cat_id);
			window.location.replace(u_index);
			return false;
		}
	}
	return true;	// let the link do its job.
}
function CFIG_onLoad()
{
	if( CFIG_oldOnLoad )
	{
		CFIG_oldOnLoad();
		CFIG_oldOnLoad = null;
	}
	if( CFIG && CFIG.IsEnabled() )
	{
		CFIG.restoreIndexState(CFIG.T['cookie']);
	}
}
var CFIG_oldOnLoad = window.onload;
window.onload = CFIG_onLoad;
// -->
</script>

<!-- BEGIN catrow -->
<table width="100%" cellpadding="2" cellspacing="1" border="0" class="forumline">
<tr>
	<th colspan="2" class="thCornerL" width="100%" height="25" nowrap="nowrap">{L_FORUM}</th>
	<th width="70" class="thTop" nowrap="nowrap">{L_TOPICS}</th>
	<th width="70" class="thTop" nowrap="nowrap">{L_POSTS}</th>
	<th width="200" class="thCornerR" nowrap="nowrap">{L_LASTPOST}</th>
</tr>
<tr onclick="CFIG_slideCat('{catrow.CAT_ID}', false);" style="cursor:hand;"  title="{catrow.CAT_DESC}">
	<td class="catLeft" colspan="2" height="28"><span class="cattitle">&nbsp;&nbsp;<img name="icon_sign_{catrow.CAT_ID}" src="{SPACER}" border="0" />&nbsp;&nbsp;<a href="{catrow.U_VIEWCAT}" class="cattitle" onclick="return CFIG_slideCat('{catrow.CAT_ID}', false);" onfocus="this.blur();">{catrow.CAT_DESC}</a></span></td>
	<td class="rowpic" colspan="3" align="right">&nbsp;</td>
  </tr>
  <!-- BEGIN forumrow -->
  <tr id="forum_{catrow.CAT_ID}_{catrow.forumrow.FORUM_ID}" style="display:{catrow.forumrow.DISPLAY};">
	<td class="row1" align="center" valign="middle" height="50"><img src="{catrow.forumrow.FORUM_FOLDER_IMG}" alt="{catrow.forumrow.L_FORUM_FOLDER_ALT}" title="{catrow.forumrow.L_FORUM_FOLDER_ALT}" /></td>
	<td class="row1" width="100%" height="50">
	<table cellpadding="1" cellspacing="1" width="100%">
	<tr>
		<td align="center" valign="middle">{catrow.forumrow.FORUM_ICON_IMG}</td>
		<td width="100%"><span class="forumlink"><a href="{catrow.forumrow.U_VIEWFORUM}" class="forumlink" {catrow.forumrow.FORUM_TARGET}>{catrow.forumrow.FORUM_NAME}</a><br /></span><span class="genmed">{catrow.forumrow.FORUM_DESC}
<!-- BEGIN row -->
<br /></span><span class="gensmall">{catrow.forumrow.L_MODERATOR} {catrow.forumrow.MODERATORS}
<!-- END row -->
</span>
<!-- BEGIN switch_attached_forums -->
<!-- BEGIN br -->
		<br />
<!-- END br -->
		<span class="genmed">{catrow.forumrow.switch_attached_forums.L_ATTACHED_FORUMS}:
<!-- BEGIN attached_forums -->
		<a class="nav" href="{catrow.forumrow.switch_attached_forums.attached_forums.U_VIEWFORUM}" {catrow.forumrow.switch_attached_forums.attached_forums.FORUM_TARGET}><img alt="{catrow.forumrow.switch_attached_forums.attached_forums.L_FORUM_IMAGE}" border="0" src="{catrow.forumrow.switch_attached_forums.attached_forums.FORUM_IMAGE}" title="{catrow.forumrow.switch_attached_forums.attached_forums.L_FORUM_IMAGE}" />{catrow.forumrow.switch_attached_forums.attached_forums.FORUM_NAME}</a>
<!-- END attached_forums -->
		<span class="genmed">
<!-- END switch_attached_forums -->
		</td>
	</tr>
	</table>
	</td>
<!-- BEGIN row -->
	<td class="row2" align="center" valign="middle" height="50"><span class="gensmall">{catrow.forumrow.TOPICS}</span></td>
	<td class="row2" align="center" valign="middle" height="50"><span class="gensmall">{catrow.forumrow.POSTS}</span></td>
	<td class="row2" align="center" valign="middle" height="50" nowrap="nowrap"><span class="gensmall">{catrow.forumrow.LAST_POST}</span></td>
<!-- END row -->
<!-- BEGIN link -->
	<td class="row2" align="center" valign="middle" height="50" colspan="3"><span class="gensmall">{catrow.forumrow.FORUM_LINK_COUNT}</span></td>
<!-- END link -->
  </tr>
  <!-- END forumrow -->
</table>
<br class="nav" /> 
<!-- END catrow -->

<table width="100%" cellspacing="0" border="0" align="center" cellpadding="2">
  <tr>
 	<!-- BEGIN switch_user_logged_in -->
 	<td class="gensmall" align="left"><a href="{U_MARK_READ}" class="gensmall">{L_MARK_FORUMS_READ}</a></td>
 	<!-- END switch_user_logged_in -->
	<td class="gensmall" align="right">{S_TIMEZONE}</td>
  </tr>
</table>

<!-- Start add - Fully integrated shoutbox MOD -->
<table width="100%" cellspacing="0" border="0" align="center" cellpadding="2" class="forumline"> 
      <tr> 
         <td align="center" nowrap="nowrap" class="catHead"><span class="cattitle"><a href="{U_SHOUTBOX_MAX}">{L_SHOUTBOX}</a></span></td> 
      </tr> 
      <tr>
         <td> 
          <iframe src="{U_SHOUTBOX}" scrolling="NO" width="100%" height="180" frameborder="0" marginheight="0" marginwidth="0" allowtransparency="true"></iframe> 
         </td> 
  </tr> 
</table>
<!-- End add - Fully integrated shoutbox MOD -->

<table width="100%" cellspacing="0" border="0" align="center" cellpadding="2">
  <tr>
 	<!-- BEGIN switch_user_logged_in -->
 	<td class="gensmall" align="left"><a href="{U_MARK_READ}" class="gensmall">{L_MARK_FORUMS_READ}</a></td>
 	<!-- END switch_user_logged_in -->
	<td class="gensmall" align="right">{S_TIMEZONE}</td>
  </tr>
</table>
<br class="nav" /> 

<table width="100%" cellpadding="3" cellspacing="1" border="0" class="forumline">
  <tr>
	<td class="catHead" colspan="2" height="28"><span class="cattitle"><a href="{U_VIEWONLINE}" class="cattitle">{L_WHO_IS_ONLINE}</a></span></td>
  </tr>
  <tr>
	<td class="row1" align="center" valign="middle" rowspan="4"><img src="{I_WHOSONLINE}" alt="{L_WHO_IS_ONLINE}" /></td>
	<td class="row1" align="left" width="100%"><span class="gensmall">
		{TOTAL_POSTS}<br />{TOTAL_USERS}<br />{NEWEST_USER}<br />{VISIT_COUNTER}
	</span></td>
  </tr>
  <tr>
	<td class="row1" align="left"><span class="gensmall">{TOTAL_USERS_ONLINE}<br />{RECORD_USERS}<br />{LOGGED_IN_USER_LIST}</span></td>
  </tr>
  <tr>
  	<td class="row1" align="left"><span class="gensmall">{L_TOTAL_TODAY}{TOTAL_TODAY_USERS}<br />{TOTAL_HOUR_USERS}<br />{L_REGISTERED_USERS} {S_TODAY_USERLIST}</span></td>
  </tr>
  <tr>
  	<td class="row1" align="left"><span class="gensmall"><b>{L_LEGEND} ::</b> {LEGEND}</span></td>
  </tr>
</table>

<table width="100%" cellpadding="1" cellspacing="1" border="0">
  <tr>
	<td class="gensmall" valign="top">{L_ONLINE_EXPLAIN}</td>
  </tr>
</table>
{BDAYS_BOX}

<!-- BEGIN switch_user_logged_out -->
<form method="post" action="{S_LOGIN_ACTION}">
  <table width="100%" cellpadding="3" cellspacing="1" border="0" class="forumline">
	<tr>
	  <td class="catHead" height="28"><a name="login"></a><span class="cattitle">{L_LOGIN_LOGOUT}</span></td>
	</tr>
	<tr>
	  <td class="row1" align="center" valign="middle" height="28"><span class="gensmall">
		<label for="username">{L_USERNAME}: </label>
		<input class="post" id="username" name="username" type="text" size="10" />
		<label for="mdp">{L_PASSWORD}: </label>
		<input class="post" id="mdp" maxlength="32" name="password" type="password" size="10" />
		<!-- BEGIN switch_allow_autologin -->
		<label for="autologin">{L_AUTO_LOGIN}</label>
		<input class="text" id="autologin" name="autologin" type="checkbox" />
		<!-- END switch_allow_autologin -->
		<input class="mainoption" name="login" type="submit" value="{L_LOGIN}" />
	  </span></td>
	</tr>
  </table>
</form>
<!-- END switch_user_logged_out -->

<br class="nav" />
<table cellspacing="3" border="0" align="center" cellpadding="0">
  <tr>
	<td width="20" align="center"><img src="{I_FOLDER_NEW_BIG}" alt="{L_NEW_POSTS}"/></td>
	<td><span class="gensmall">{L_NEW_POSTS}</span></td>
	<td width="20" align="center"><img src="{I_FOLDER_BIG}" alt="{L_NO_NEW_POSTS}" /></td>
	<td><span class="gensmall">{L_NO_NEW_POSTS}</span></td>
	<td width="20" align="center"><img src="{I_FOLDER_LOCKED_BIG}" alt="{L_FORUM_LOCKED}" /></td>
	<td><span class="gensmall">{L_FORUM_LOCKED}</span></td>
	<td width="20" align="center"><img src="{FORUM_LINK_IMG}" alt="" title="{L_FORUM_LINK}" /></td>
	<td><span class="gensmall">{L_FORUM_LINK}</span></td>
  </tr>
</table>