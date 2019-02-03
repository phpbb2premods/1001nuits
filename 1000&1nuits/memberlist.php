<?php
/***************************************************************************
 *                              memberlist.php
 *                            -------------------
 *   begin                : Friday, May 11, 2001
 *   copyright            : (C) 2001 The phpBB Group
 *   email                : support@phpbb.com
 *
 *   $Id: memberlist.php,v 1.36.2.12 2006/02/07 20:42:51 grahamje Exp $
 *
 ***************************************************************************/

/***************************************************************************
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation; either version 2 of the License, or
 *   (at your option) any later version.
 *
 ***************************************************************************/

define('IN_PHPBB', true);
$phpbb_root_path = './';
include($phpbb_root_path . 'extension.inc');
include($phpbb_root_path . 'common.'.$phpEx);

//
// Start session management
//
$userdata = session_pagestart($user_ip, PAGE_VIEWMEMBERS);
init_userprefs($userdata);
//
// End session management
//

//-- mod : rank color system ---------------------------------------------------
//-- add
$parms = array(
	'rcs_uc' => RCS_USER_URL,
	'rcs_gc' => RCS_GROUP_URL,
	'rcs_level' => RCS_LEVEL_URL,
);

foreach ($parms as $parm => $val)
{
	// get values
	$$parm = request_var($val, TYPE_INT);

	// display
	$disp[$parm] = (empty($$parm) ? '' : '&amp;' . $val . '=' . $$parm);
}

// hidden fields
_hide_build(array(RCS_USER_URL => $rcs_uc, RCS_GROUP_URL => $rcs_gc, RCS_LEVEL_URL => $rcs_level));
_hide_send();

// extra selection
$sql_join = '';
$sql_where = (!empty($rcs_level)) ? 'user_level = ' . intval($rcs_level) . ' AND ' : ((!empty($rcs_uc)) ? 'user_color = ' . intval($rcs_uc) . ' AND ' : '');

if (!empty($rcs_gc))
{
	$sql_join = ', ' . GROUPS_TABLE . ' g, ' . USER_GROUP_TABLE . ' ug';
	$sql_where = 'g.group_color = ' . intval($rcs_gc) . '
				AND g.group_id = ug.group_id
				AND ug.user_pending = 0
				AND u.user_id = ug.user_id
				AND ';
}

// display
$display = empty($rcs_uc) ? (empty($rcs_gc) ? (empty($rcs_level) ? '' : $disp['rcs_level']) : $disp['rcs_gc']) : $disp['rcs_uc'];
//-- fin mod : rank color system -----------------------------------------------

$start = ( isset($HTTP_GET_VARS['start']) ) ? intval($HTTP_GET_VARS['start']) : 0;

if ( isset($HTTP_GET_VARS['mode']) || isset($HTTP_POST_VARS['mode']) )
{
	$mode = ( isset($HTTP_POST_VARS['mode']) ) ? htmlspecialchars($HTTP_POST_VARS['mode']) : htmlspecialchars($HTTP_GET_VARS['mode']);
}
else
{
	$mode = 'joined';
}

if(isset($HTTP_POST_VARS['order']))
{
	$sort_order = ($HTTP_POST_VARS['order'] == 'ASC') ? 'ASC' : 'DESC';
}
else if(isset($HTTP_GET_VARS['order']))
{
	$sort_order = ($HTTP_GET_VARS['order'] == 'ASC') ? 'ASC' : 'DESC';
}
else
{
	$sort_order = 'ASC';
}

//
// Memberlist sorting
//

//-- mod : browsers list -------------------------------------------------------
// here we added
//	, $lang['browser']
//	, 'browser'
//-- modify
//-- mod : flags ---------------------------------------------------------------
// here we added
//	, $lang['flag_country']
//	, 'flag'
//-- modify
//-- mod : mini last visit -----------------------------------------------------
// here we added
//	, $lang['Sort_Visited']
//	, 'lastlogin'
//-- modify
$mode_types_text = array($lang['Sort_Joined'], $lang['Sort_Visited'], $lang['Sort_Username'], $lang['browser'], $lang['Sort_Location'], $lang['Sort_Posts'], $lang['Sort_Email'],  $lang['Sort_Website'], $lang['flag_country'], $lang['Sort_Top_Ten']);
$mode_types = array('joined', 'lastlogin', 'username', 'browser', 'location', 'posts', 'email', 'website', 'flag', 'topten');
//-- fin mod : browsers list ---------------------------------------------------
//-- fin mod : flags -----------------------------------------------------------
//-- fin mod : mini last visit -------------------------------------------------

$select_sort_mode = '<select name="mode">';
for($i = 0; $i < count($mode_types_text); $i++)
{
	$selected = ( $mode == $mode_types[$i] ) ? ' selected="selected"' : '';
	$select_sort_mode .= '<option value="' . $mode_types[$i] . '"' . $selected . '>' . $mode_types_text[$i] . '</option>';
}
$select_sort_mode .= '</select>';

$select_sort_order = '<select name="order">';
if($sort_order == 'ASC')
{
	$select_sort_order .= '<option value="ASC" selected="selected">' . $lang['Sort_Ascending'] . '</option><option value="DESC">' . $lang['Sort_Descending'] . '</option>';
}
else
{
	$select_sort_order .= '<option value="ASC">' . $lang['Sort_Ascending'] . '</option><option value="DESC" selected="selected">' . $lang['Sort_Descending'] . '</option>';
}
$select_sort_order .= '</select>';

//
// Generate page
//
$page_title = $lang['Memberlist'];
include($phpbb_root_path . 'includes/page_header.'.$phpEx);

$template->set_filenames(array(
	'body' => 'memberlist_body.tpl')
);
make_jumpbox('viewforum.'.$phpEx);

$template->assign_vars(array(
	'L_SELECT_SORT_METHOD' => $lang['Select_sort_method'],
	'L_EMAIL' => $lang['Email'],
	'L_WEBSITE' => $lang['Website'],
	'L_FROM' => $lang['Location'],
	'L_ORDER' => $lang['Order'],
	'L_SORT' => $lang['Sort'],
	'L_SUBMIT' => $lang['Sort'],
	'L_AIM' => $lang['AIM'],
	'L_YIM' => $lang['YIM'],
	'L_MSNM' => $lang['MSNM'],
	'L_ICQ' => $lang['ICQ'], 
	'L_JOINED' => $lang['Joined'],

//-- mod : mini last visit -----------------------------------------------------
//-- add
	'L_VISITED' => $lang['Visited'],
//-- fin mod : mini last visit -------------------------------------------------

	'L_POSTS' => $lang['Posts'], 
	'L_ONLINE_STATUS' => $lang['Online_status'],	
	'L_PM' => $lang['Private_Message'], 

	'S_MODE_SELECT' => $select_sort_mode,
	'S_ORDER_SELECT' => $select_sort_order,
	'S_MODE_ACTION' => append_sid("memberlist.$phpEx"))
);

switch( $mode )
{
	case 'joined':
		$order_by = 'user_regdate '.$sort_order.' LIMIT '.$start.', ' . $board_config['topics_per_page'];
		break;

//-- mod : mini last visit -----------------------------------------------------
//-- add
	case 'lastlogin':
		$order_by = 'user_lastlogin ' . $sort_order . ' LIMIT ' . $start . ', ' . $board_config['topics_per_page'];
		break;
//-- fin mod : mini last visit -------------------------------------------------

	case 'username':
		$order_by = 'username '.$sort_order.' LIMIT '.$start.', ' . $board_config['topics_per_page'];
		break;
	case 'location':
		$order_by = 'user_from $sort_order LIMIT '.$start.', ' . $board_config['topics_per_page'];
		break;
	case 'posts':
		$order_by = 'user_posts $sort_order LIMIT  '.$start.', ' . $board_config['topics_per_page'];
		break;
	case 'email':
		$order_by = 'user_email $sort_order LIMIT  '.$start.', ' . $board_config['topics_per_page'];
		break;
	case 'website':
		$order_by = 'user_website $sort_order LIMIT  '.$start.', ' . $board_config['topics_per_page'];
		break;

//-- mod : flags ---------------------------------------------------------------
//-- add
	case 'flag':
		$order_by = 'user_flag ' . $sort_order . ' LIMIT ' . $start . ', ' . $board_config['topics_per_page'];
		break;
//-- fin mod : flags -----------------------------------------------------------

//-- mod : browsers list -------------------------------------------------------
//-- add
	case 'browser':
		$order_by = 'user_browser ' . $sort_order . ' LIMIT ' . $start . ', ' . $board_config['topics_per_page'];
		break;
//-- fin mod : browsers list ---------------------------------------------------

	case 'topten':
		$order_by = 'user_posts '$sort_order.' LIMIT 10';
		break;
	default:
		$order_by = 'user_regdate '.$sort_order.' LIMIT  '.$start.', '. $board_config['topics_per_page'];
		break;
}

$sql = 'SELECT username, user_id, user_viewemail, user_posts, user_regdate, user_from, user_website, user_email, user_icq, user_aim, user_yim, user_msnm, user_avatar, user_avatar_type, user_allowavatar, user_allow_viewonline, user_session_time 
	FROM ' . USERS_TABLE . '
	WHERE user_id <> ' . ANONYMOUS . '
	ORDER BY $order_by';

//-- mod : mini last visit -----------------------------------------------------
//-- add
$sql = str_replace('SELECT ', 'SELECT user_lastlogin, user_allow_viewonline, ', $sql);
//-- fin mod : mini last visit -------------------------------------------------

//-- mod : flags ---------------------------------------------------------------
//-- add
$sql = str_replace('SELECT ', 'SELECT user_flag, ', $sql);
//-- fin mod : flags -----------------------------------------------------------

//-- mod : browsers list -------------------------------------------------------
//-- add
$sql = str_replace('SELECT ', 'SELECT user_browser, ', $sql);
//-- fin mod : browsers list ---------------------------------------------------

//-- mod : rank color system ---------------------------------------------------
//-- add
$sql = str_replace('SELECT ', 'SELECT user_level, user_color, user_group_id, ', $sql);

if (!empty($sql_join))
{
	$sql = str_replace('username', 'u.username', $sql);
	$sql = str_replace('user_', 'u.user_', $sql);
	$sql = str_replace('FROM ' . USERS_TABLE, 'FROM ' . USERS_TABLE . ' u' . $sql_join, $sql);
	$sql = str_replace('ORDER BY', 'GROUP BY username ORDER BY', $sql);
}

if (!empty($sql_where))
{
	$sql = str_replace('WHERE ', 'WHERE ' . $sql_where, $sql);
}
//-- fin mod : rank color system -----------------------------------------------

if( !($result = $db->sql_query($sql)) )
{
	message_die(GENERAL_ERROR, 'Could not query users', '', __LINE__, __FILE__, $sql);
}

if ( $row = $db->sql_fetchrow($result) )
{
	$i = 0;
	do
	{
		$username = $row['username'];
		$user_id = $row['user_id'];

		$from = ( !empty($row['user_from']) ) ? $row['user_from'] : '&nbsp;';
		$joined = create_date($lang['DATE_FORMAT'], $row['user_regdate'], $board_config['board_timezone']);
		$posts = ( $row['user_posts'] ) ? $row['user_posts'] : 0;

		$poster_avatar = '';
		if ( $row['user_avatar_type'] && $user_id != ANONYMOUS && $row['user_allowavatar'] )
		{
			switch( $row['user_avatar_type'] )
			{
				case USER_AVATAR_UPLOAD:
					$poster_avatar = ( $board_config['allow_avatar_upload'] ) ? '<img src="' . $board_config['avatar_path'] . '/' . $row['user_avatar'] . '" alt="" border="0" />' : '';
					break;
				case USER_AVATAR_REMOTE:
					$poster_avatar = ( $board_config['allow_avatar_remote'] ) ? '<img src="' . $row['user_avatar'] . '" alt="" border="0" />' : '';
					break;
				case USER_AVATAR_GALLERY:
					$poster_avatar = ( $board_config['allow_avatar_local'] ) ? '<img src="' . $board_config['avatar_gallery_path'] . '/' . $row['user_avatar'] . '" alt="" border="0" />' : '';
					break;
			}
		}

		if ( !empty($row['user_viewemail']) || $userdata['user_level'] == ADMIN )
		{
			$email_uri = ( $board_config['board_email_form'] ) ? append_sid("profile.$phpEx?mode=email&amp;" . POST_USERS_URL .'=' . $user_id) : 'mailto:' . $row['user_email'];

			$email_img = '<a href="' . $email_uri . '"><img src="' . $images['icon_email'] . '" alt="' . $lang['Send_email'] . '" title="' . $lang['Send_email'] . '" border="0" /></a>';
			$email = '<a href="' . $email_uri . '">' . $lang['Send_email'] . '</a>';
		}
		else
		{
			$email_img = '&nbsp;';
			$email = '&nbsp;';
		}

		$temp_url = append_sid('profile.'.$phpEx.'?mode=viewprofile&amp;' . POST_USERS_URL . '='.$user_id);
		$profile_img = '<a href="' . $temp_url . '"><img src="' . $images['icon_profile'] . '" alt="' . $lang['Read_profile'] . '" title="' . $lang['Read_profile'] . '" border="0" /></a>';
		$profile = '<a href="' . $temp_url . '">' . $lang['Read_profile'] . '</a>';

		$temp_url = append_sid('privmsg.'.$phpEx.'?mode=post&amp;' . POST_USERS_URL . '='.$user_id);
		$pm_img = '<a href="' . $temp_url . '"><img src="' . $images['icon_pm'] . '" alt="' . $lang['Send_private_message'] . '" title="' . $lang['Send_private_message'] . '" border="0" /></a>';
		$pm = '<a href="' . $temp_url . '">' . $lang['Send_private_message'] . '</a>';

		$www_img = ( $row['user_website'] ) ? '<a href="' . $row['user_website'] . '" target="_userwww"><img src="' . $images['icon_www'] . '" alt="' . $lang['Visit_website'] . '" title="' . $lang['Visit_website'] . '" border="0" /></a>' : '';
		$www = ( $row['user_website'] ) ? '<a href="' . $row['user_website'] . '" target="_userwww">' . $lang['Visit_website'] . '</a>' : '';

		if ( !empty($row['user_icq']) )
		{
			$icq_status_img = '<a href="http://wwp.icq.com/' . $row['user_icq'] . '#pager"><img src="http://web.icq.com/whitepages/online?icq=' . $row['user_icq'] . '&img=5" width="18" height="18" border="0" /></a>';
			$icq_img = '<a href="http://wwp.icq.com/scripts/search.dll?to=' . $row['user_icq'] . '"><img src="' . $images['icon_icq'] . '" alt="' . $lang['ICQ'] . '" title="' . $lang['ICQ'] . '" border="0" /></a>';
			$icq =  '<a href="http://wwp.icq.com/scripts/search.dll?to=' . $row['user_icq'] . '">' . $lang['ICQ'] . '</a>';
		}
		else
		{
			$icq_status_img = '';
			$icq_img = '';
			$icq = '';
		}

		$aim_img = ( $row['user_aim'] ) ? '<a href="aim:goim?screenname=' . $row['user_aim'] . '&amp;message=Hello+Are+you+there?"><img src="' . $images['icon_aim'] . '" alt="' . $lang['AIM'] . '" title="' . $lang['AIM'] . '" border="0" /></a>' : '';
		$aim = ( $row['user_aim'] ) ? '<a href="aim:goim?screenname=' . $row['user_aim'] . '&amp;message=Hello+Are+you+there?">' . $lang['AIM'] . '</a>' : '';

		$temp_url = append_sid("profile.$phpEx?mode=viewprofile&amp;" . POST_USERS_URL . "=$user_id");
		$msn_img = ( $row['user_msnm'] ) ? '<a href="' . $temp_url . '"><img src="' . $images['icon_msnm'] . '" alt="' . $lang['MSNM'] . '" title="' . $lang['MSNM'] . '" border="0" /></a>' : '';
		$msn = ( $row['user_msnm'] ) ? '<a href="' . $temp_url . '">' . $lang['MSNM'] . '</a>' : '';

		$yim_img = ( $row['user_yim'] ) ? '<a href="http://edit.yahoo.com/config/send_webmesg?.target=' . $row['user_yim'] . '&amp;.src=pg"><img src="' . $images['icon_yim'] . '" alt="' . $lang['YIM'] . '" title="' . $lang['YIM'] . '" border="0" /></a>' : '';
		$yim = ( $row['user_yim'] ) ? '<a href="http://edit.yahoo.com/config/send_webmesg?.target=' . $row['user_yim'] . '&amp;.src=pg">' . $lang['YIM'] . '</a>' : '';

		$temp_url = append_sid("search.$phpEx?search_author=" . urlencode($username) . "&amp;showresults=posts");
		$search_img = '<a href="' . $temp_url . '"><img src="' . $images['icon_search'] . '" alt="' . sprintf($lang['Search_user_posts'], $username) . '" title="' . sprintf($lang['Search_user_posts'], $username) . '" border="0" /></a>';
		$search = '<a href="' . $temp_url . '">' . sprintf($lang['Search_user_posts'], $username) . '</a>';

// Start add - Online/Offline/Hidden Mod
		if ($row['user_session_time'] >= (time()-$board_config['online_time']))
		{
			if ($row['user_allow_viewonline'])
			{
				$online_status_img = '<a href="' . append_sid("viewonline.$phpEx") . '"><img src="' . $images['icon_online'] . '" alt="' . sprintf($lang['is_online'], $username) . '" title="' . sprintf($lang['is_online'], $username) . '" /></a>';
				$online_status = '<strong><a href="' . append_sid("viewonline.$phpEx") . '" title="' . sprintf($lang['is_online'], $username) . '"' . $online_color . '>' . $lang['Online'] . '</a></strong>';
			}
			else if ($userdata['user_level'] == ADMIN || $userdata['user_id'] == $user_id)
			{
				$online_status_img = '<a href="' . append_sid("viewonline.$phpEx") . '"><img src="' . $images['icon_hidden'] . '" alt="' . sprintf($lang['is_hidden'], $username) . '" title="' . sprintf($lang['is_hidden'], $username) . '" /></a>';
				$online_status = '<strong><em><a href="' . append_sid("viewonline.$phpEx") . '" title="' . sprintf($lang['is_hidden'], $username) . '"' . $hidden_color . '>' . $lang['Hidden'] . '</a></em></strong>';
			}
			else
			{
				$online_status_img = '<img src="' . $images['icon_offline'] . '" alt="' . sprintf($lang['is_offline'], $username) . '" title="' . sprintf($lang['is_offline'], $username) . '" />';
				$online_status = '<span title="' . sprintf($lang['is_offline'], $username) . '"' . $offline_color . '><strong>' . $lang['Offline'] . '</strong></span>';
			}
		}
		else
		{
			$online_status_img = '<img src="' . $images['icon_offline'] . '" alt="' . sprintf($lang['is_offline'], $username) . '" title="' . sprintf($lang['is_offline'], $username) . '" />';
			$online_status = '<span title="' . sprintf($lang['is_offline'], $username) . '"' . $offline_color . '><strong>' . $lang['Offline'] . '</strong></span>';
		}
// End add - Online/Offline/Hidden Mod

		$row_color = ( !($i % 2) ) ? $theme['td_color1'] : $theme['td_color2'];
		$row_class = ( !($i % 2) ) ? $theme['td_class1'] : $theme['td_class2'];

		$template->assign_block_vars('memberrow', array(
			'ROW_NUMBER' => $i + ( $start + 1 ),
			'ROW_COLOR' => '#' . $row_color,
			'ROW_CLASS' => $row_class,
			'USERNAME' => $username,
			'FROM' => $from,
			'JOINED' => $joined,
//-- mod : mini last visit -----------------------------------------------------
//-- add
			'VISITED' => display_last_visit($row['user_id'], $row['user_lastlogin'], $row['user_allow_viewonline']),
//-- fin mod : mini last visit -------------------------------------------------
			'POSTS' => $posts,
			'AVATAR_IMG' => $poster_avatar,
			'PROFILE_IMG' => $profile_img, 
			'PROFILE' => $profile, 
			'SEARCH_IMG' => $search_img,
			'SEARCH' => $search,
			'PM_IMG' => $pm_img,
			'PM' => $pm,
			'EMAIL_IMG' => $email_img,
			'EMAIL' => $email,
			'WWW_IMG' => $www_img,
			'WWW' => $www,
			'ICQ_STATUS_IMG' => $icq_status_img,
			'ICQ_IMG' => $icq_img, 
			'ICQ' => $icq, 
			'AIM_IMG' => $aim_img,
			'AIM' => $aim,
			'MSN_IMG' => $msn_img,
			'MSN' => $msn,
			'YIM_IMG' => $yim_img,
			'YIM' => $yim,

//-- mod : rank color system ---------------------------------------------------
//-- add
			'STYLE' => $rcs->get_colors($row),
//-- fin mod : rank color system -----------------------------------------------

//-- mod : flags ---------------------------------------------------------------
//-- add
			'L_FLAG' => $lang['flag_country'],
			'FLAG_IMG' => display_flag($row['user_flag']),
//-- fin mod : flags ----------------------------------------------------------

// Start add - Online/Offline/Hidden Mod
			'ONLINE_STATUS_IMG' => $online_status_img,
			'ONLINE_STATUS' => $online_status,
// End add - Online/Offline/Hidden Mod

//-- mod : browsers list -------------------------------------------------------
//-- add
			'BROWSER_IMG' => display_browser($row['user_browser']),
//-- fin mod : browsers list ---------------------------------------------------

			'U_VIEWPROFILE' => append_sid("profile.$phpEx?mode=viewprofile&amp;" . POST_USERS_URL . "=$user_id"))
		);

		$i++;
	}
	while ( $row = $db->sql_fetchrow($result) );
	$db->sql_freeresult($result);
}

//-- mod : rank color system ---------------------------------------------------
//-- add
else
{
	$message = $lang['No_match'] . '<br /><br />' . sprintf($lang['Click_return_index'], '<a href="' . append_sid('index.' . $phpEx) . '">', '</a>');

	message_die(GENERAL_MESSAGE, $message);
}
//-- fin mod : rank color system -----------------------------------------------

if ( $mode != 'topten' || $board_config['topics_per_page'] < 10 )
{
	$sql = 'SELECT count(*) AS total
		FROM ' . USERS_TABLE . '
		WHERE user_id <> ' . ANONYMOUS;

//-- mod : rank color system ---------------------------------------------------
//-- add
	if (!empty($sql_join))
	{
		$sql = str_replace('username', 'u.username', $sql);
		$sql = str_replace('user_', 'u.user_', $sql);
		$sql = str_replace('FROM ' . USERS_TABLE, 'FROM ' . USERS_TABLE . ' u' . $sql_join, $sql);
	}

	if (!empty($sql_where))
	{
		$sql = str_replace('WHERE ', 'WHERE ' . $sql_where, $sql);
	}
//-- fin mod : rank color system -----------------------------------------------

	if ( !($result = $db->sql_query($sql)) )
	{
		message_die(GENERAL_ERROR, 'Error getting total users', '', __LINE__, __FILE__, $sql);
	}

	if ( $total = $db->sql_fetchrow($result) )
	{
		$total_members = $total['total'];

//-- mod : rank color system ---------------------------------------------------
// here we added
//	$display
//-- modify
		$pagination = generate_pagination("memberlist.$phpEx?mode=$mode$display&amp;order=$sort_order", $total_members, $board_config['topics_per_page'], $start). '&nbsp;';
//-- fin mod : rank color system -----------------------------------------------
	}
	$db->sql_freeresult($result);
}
else
{
	$pagination = '&nbsp;';
	$total_members = 10;
}

$template->assign_vars(array(
	'PAGINATION' => $pagination,
	'PAGE_NUMBER' => sprintf($lang['Page_of'], ( floor( $start / $board_config['topics_per_page'] ) + 1 ), ceil( $total_members / $board_config['topics_per_page'] )), 

	'L_GOTO_PAGE' => $lang['Goto_page'])
);

$template->pparse('body');

include($phpbb_root_path . 'includes/page_tail.'.$phpEx);

?>