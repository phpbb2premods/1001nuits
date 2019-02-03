<?php
//-- mod : post icon -------------------------------------------------------------------------------
//-- mod : language settings -----------------------------------------------------------------------
//-- mod : mods settings ---------------------------------------------------------------------------
/***************************************************************************
 *                               functions.php
 *                            -------------------
 *   begin                : Saturday, Feb 13, 2001
 *   copyright            : (C) 2001 The phpBB Group
 *   email                : support@phpbb.com
 *
 *   $Id: functions.php,v 1.133.2.47 2006/06/08 21:11:04 grahamje Exp $
 *
 *
 ***************************************************************************/

/***************************************************************************
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation; either version 2 of the License, or
 *   (at your option) any later version.
 *
 *
 ***************************************************************************/

// Added by Attached Forums MOD
function check_unread($forum_id)
{
	global $new_topic_data, $tracking_topics, $tracking_forums, $HTTP_COOKIE_VARS, $board_config;
	if ( !empty($new_topic_data[$forum_id]) )
	{
		$forum_last_post_time = 0;

		while( list($check_topic_id, $check_post_time) = @each($new_topic_data[$forum_id]) )
		{
			if ( empty($tracking_topics[$check_topic_id]) )
			{
				$unread_topics = true;
				$forum_last_post_time = max($check_post_time, $forum_last_post_time);
			}
			else
			{
				if ( $tracking_topics[$check_topic_id] < $check_post_time )
				{
					$unread_topics = true;
					$forum_last_post_time = max($check_post_time, $forum_last_post_time);
				}
			}
		}

		if ( !empty($tracking_forums[$forum_id]) )
		{
			if ( $tracking_forums[$forum_id] > $forum_last_post_time )
			{
				$unread_topics = false;
			}
		}

		if ( isset($HTTP_COOKIE_VARS[$board_config['cookie_name'] . '_f_all']) )
		{
			if ( $HTTP_COOKIE_VARS[$board_config['cookie_name'] . '_f_all'] > $forum_last_post_time )
			{
				$unread_topics = false;
			}
		}
	}
	return $unread_topics;
}
// END Added by Attached Forums MOD

//-- mod : post icon -------------------------------------------------------------------------------
//-- add
function get_icon_title($icon, $empty=0, $topic_type=-1, $admin=false)
{
	global $lang, $images, $phpEx, $phpbb_root_path;

	// get icons parameters
	include($phpbb_root_path . './includes/def_icons.' . $phpEx);

	// admin path
	$admin_path = ($admin) ? '../' : './';

	// alignment
	switch ($empty)
	{
		case 1:
			$align= 'middle';
			break;
		case 2:
			$align= 'bottom';
			break;
		default:
			$align = 'absbottom';
			break;
	}

	// find the icon
	$found = false;
	$icon_map = -1;
	for ($i=0; ($i < count($icones)) && !$found; $i++)
	{
		if ($icones[$i]['ind'] == $icon)
		{
			$found = true;
			$icon_map = $i;
		}
	}

	// icon not found : try a default value
	if (!$found || ($found && empty($icones[$icon_map]['img'])))
	{
		$change = true;
		switch($topic_type)
		{
			case POST_NORMAL:
				$icon = $icon_defined_special['POST_NORMAL']['icon'];
				break;
			case POST_STICKY:
				$icon = $icon_defined_special['POST_STICKY']['icon'];
				break;
			case POST_ANNOUNCE:
				$icon = $icon_defined_special['POST_ANNOUNCE']['icon'];
				break;
			case POST_GLOBAL_ANNOUNCE:
				$icon = $icon_defined_special['POST_GLOBAL_ANNOUNCE']['icon'];
				break;
			case POST_BIRTHDAY:
				$icon = $icon_defined_special['POST_BIRTHDAY']['icon'];
				break;
			case POST_CALENDAR:
				$icon = $icon_defined_special['POST_CALENDAR']['icon'];
				break;
			case POST_PICTURE:
				$icon = $icon_defined_special['POST_PICTURE']['icon'];
				break;
			case POST_ATTACHMENT:
				$icon = $icon_defined_special['POST_ATTACHEMENT']['icon'];
				break;
			default:
				$change=false;
				break;
		}

		// a default icon has been sat
		if ($change)
		{
			// find the icon
			$found = false;
			$icon_map = -1;
			for ($i=0; ($i < count($icones)) && !$found; $i++)
			{
				if ($icones[$i]['ind'] == $icon)
				{
					$found = true;
					$icon_map = $i;
				}
			}
		}
	}

	// build the icon image
	if (!$found || ($found && empty($icones[$icon_map]['img'])))
	{
		switch ($empty)
		{
			case 0:
				$res = '';
				break;
			case 1:
				$res = '<img width="20" align="' . $align . '" src="' . $admin_path . $images['spacer'] . '" alt="" border="0">';
				break;
			case 2:
				$res = isset($lang[ $icones[$icon_map]['alt'] ]) ? $lang[ $icones[$icon_map]['alt'] ] : $icones[$icon_map]['alt'];
				break;
		}
	}
	else
	{
		$res = '<img align="' . $align . '" src="' . ( isset($images[ $icones[$icon_map]['img'] ]) ? $admin_path . $images[ $icones[$icon_map]['img'] ] : $admin_path . $icones[$icon_map]['img'] ) . '" alt="' . ( isset($lang[ $icones[$icon_map]['alt'] ]) ? $lang[ $icones[$icon_map]['alt'] ] : $icones[$icon_map]['alt'] ) . '" border="0">';
	}

	return $res;
}
//-- fin mod : post icon ---------------------------------------------------------------------------

function get_db_stat($mode)
{
	global $db;

	switch( $mode )
	{
		case 'usercount':
			$sql = "SELECT COUNT(user_id) AS total
				FROM " . USERS_TABLE . "
				WHERE user_id <> " . ANONYMOUS;
			break;

		case 'newestuser':
			$sql = "SELECT user_id, username
				FROM " . USERS_TABLE . "
				WHERE user_id <> " . ANONYMOUS . "
				ORDER BY user_id DESC
				LIMIT 1";
//-- mod : rank color system ---------------------------------------------------
//-- add
			$sql = str_replace('SELECT ', 'SELECT user_level, user_color, user_group_id, ', $sql);
//-- fin mod : rank color system -----------------------------------------------
			break;

		case 'postcount':
		case 'topiccount':
			$sql = "SELECT SUM(forum_topics) AS topic_total, SUM(forum_posts) AS post_total
				FROM " . FORUMS_TABLE;
			break;
	}

	if ( !($result = $db->sql_query($sql)) )
	{
		return false;
	}

	$row = $db->sql_fetchrow($result);

	switch ( $mode ) 	{
		case 'usercount':
			return $row['total'];
			break;
		case 'newestuser':
			return $row;
			break;
		case 'postcount':
			return $row['post_total'];
			break;
		case 'topiccount':
			return $row['topic_total'];
			break;
	}

	return false;
} 
// added at phpBB 2.0.11 to properly format the username
function phpbb_clean_username($username)
{
	$username = substr(htmlspecialchars(str_replace("\'", "'", trim($username))), 0, 25);
	$username = phpbb_rtrim($username, "\\");
	$username = str_replace("'", "\'", $username);

	return $username;
}

/**
* This function is a wrapper for ltrim, as charlist is only supported in php >= 4.1.0
* Added in phpBB 2.0.18
*/
function phpbb_ltrim($str, $charlist = false)
{
	if ($charlist === false)
	{
		return ltrim($str);
	}
	
	$php_version = explode('.', PHP_VERSION);

	// php version < 4.1.0
	if ((int) $php_version[0] < 4 || ((int) $php_version[0] == 4 && (int) $php_version[1] < 1))
	{
		while ($str{0} == $charlist)
		{
			$str = substr($str, 1);
		}
	}
	else
	{
		$str = ltrim($str, $charlist);
	}

	return $str;
}

// added at phpBB 2.0.12 to fix a bug in PHP 4.3.10 (only supporting charlist in php >= 4.1.0)
function phpbb_rtrim($str, $charlist = false)
{
	if ($charlist === false)
	{
		return rtrim($str);
	}
	
	$php_version = explode('.', PHP_VERSION);

	// php version < 4.1.0
	if ((int) $php_version[0] < 4 || ((int) $php_version[0] == 4 && (int) $php_version[1] < 1))
	{
		while ($str{strlen($str)-1} == $charlist)
		{
			$str = substr($str, 0, strlen($str)-1);
		}
	}
	else
	{
		$str = rtrim($str, $charlist);
	}

	return $str;
}

/**
* Our own generator of random values
* This uses a constantly changing value as the base for generating the values
* The board wide setting is updated once per page if this code is called
* With thanks to Anthrax101 for the inspiration on this one
* Added in phpBB 2.0.20
*/
function dss_rand()
{
	global $db, $board_config, $dss_seeded;

	$val = $board_config['rand_seed'] . microtime();
	$val = md5($val);
	$board_config['rand_seed'] = md5($board_config['rand_seed'] . $val . 'a');
   
	if($dss_seeded !== true)
	{
		$sql = "UPDATE " . CONFIG_TABLE . " SET
			config_value = '" . $board_config['rand_seed'] . "'
			WHERE config_name = 'rand_seed'";
		
		if( !$db->sql_query($sql) )
		{
			message_die(GENERAL_ERROR, "Unable to reseed PRNG", "", __LINE__, __FILE__, $sql);
		}

		$dss_seeded = true;
	}

	return substr($val, 4, 16);
}


//
// Get Userdata, $user can be username or user_id. If force_str is true, the username will be forced.
//
function get_userdata($user, $force_str = false)
{
	global $db;

	if (!is_numeric($user) || $force_str)
	{
		$user = phpbb_clean_username($user);
	}
	else
	{
		$user = intval($user);
	}

	$sql = "SELECT *
		FROM " . USERS_TABLE . " 
		WHERE ";
	$sql .= ( ( is_integer($user) ) ? "user_id = $user" : "username = '" .  str_replace("\'", "''", $user) . "'" ) . " AND user_id <> " . ANONYMOUS;
	if ( !($result = $db->sql_query($sql)) )
	{
		message_die(GENERAL_ERROR, 'Tried obtaining data for a non-existent user', '', __LINE__, __FILE__, $sql);
	}

	return ( $row = $db->sql_fetchrow($result) ) ? $row : false;
}


function make_jumpbox($action, $match_forum_id = 0)
{
	global $template, $userdata, $lang, $db, $nav_links, $phpEx, $SID;
	global $parent_lookup;

//	$is_auth = auth(AUTH_VIEW, AUTH_LIST_ALL, $userdata);

	$sql = "SELECT c.cat_id, c.cat_title, c.cat_order
		FROM " . CATEGORIES_TABLE . " c, " . FORUMS_TABLE . " f
		WHERE f.cat_id = c.cat_id
		GROUP BY c.cat_id, c.cat_title, c.cat_order
		ORDER BY c.cat_order";
	if ( !($result = $db->sql_query($sql)) )
	{
		message_die(GENERAL_ERROR, "Couldn't obtain category list.", "", __LINE__, __FILE__, $sql);
	}
	
	$category_rows = array();
	while ( $row = $db->sql_fetchrow($result) )
	{
		$category_rows[] = $row;
	}

	if ( $total_categories = count($category_rows) )
	{
		$sql = "SELECT *
			FROM " . FORUMS_TABLE . "
			WHERE forum_link=''
			ORDER BY cat_id, forum_order";
		if ( !($result = $db->sql_query($sql)) )
		{
			message_die(GENERAL_ERROR, 'Could not obtain forums information', '', __LINE__, __FILE__, $sql);
		}

		$boxstring = '<select name="' . POST_FORUM_URL . '" onchange="if(this.options[this.selectedIndex].value != -1){ forms[\'jumpbox\'].submit() }"><option value="-1">' . $lang['Select_forum'] . '</option>';

		$forum_rows = array();
		while ( $row = $db->sql_fetchrow($result) )
		{
			$forum_rows[] = $row;
		}

		if ( $total_forums = count($forum_rows) )
		{
			for($i = 0; $i < $total_categories; $i++)
			{
				$boxstring_forums = '';
				for($j = 0; $j < $total_forums; $j++)
				{				
					if ($parent_lookup==$forum_rows[$j]['forum_id'] && !$assigned)
					{
						$template->assign_block_vars('switch_parent_link', array() );

						$template->assign_vars(array(
							'PARENT_NAME' => $forum_rows[$j]['forum_name'],
							'PARENT_URL'=>append_sid("viewforum.$phpEx?" . POST_FORUM_URL . "=" . $forum_rows[$j]['forum_id'])
							));
						$assigned=TRUE;
					}
					if ( $forum_rows[$j]['cat_id'] == $category_rows[$i]['cat_id'] && $forum_rows[$j]['auth_view'] <= AUTH_REG )
					{

//					if ( $forum_rows[$j]['cat_id'] == $category_rows[$i]['cat_id'] && $is_auth[$forum_rows[$j]['forum_id']]['auth_view'] )
//					{
						$selected = ( $forum_rows[$j]['forum_id'] == $match_forum_id ) ? 'selected="selected"' : '';
						$box_forum_name = ( $forum_rows[$j]['attached_forum_id'] != -1 ) ? '|------' . $forum_rows[$j]['forum_name'] : '|---' . $forum_rows[$j]['forum_name'];
						$boxstring_forums .=  '<option value="' . $forum_rows[$j]['forum_id'] . '"' . $selected . '>' . $box_forum_name . '</option>';

						//
						// Add an array to $nav_links for the Mozilla navigation bar.
						// 'chapter' and 'forum' can create multiple items, therefore we are using a nested array.
						//
						$nav_links['chapter forum'][$forum_rows[$j]['forum_id']] = array (
							'url' => append_sid("viewforum.$phpEx?" . POST_FORUM_URL . "=" . $forum_rows[$j]['forum_id']),
							'title' => $forum_rows[$j]['forum_name']
						);
								
					}
				}

				if ( $boxstring_forums != '' )
				{
					$boxstring .= '<option value="-1">|</option>';
					$boxstring .= '<option value="-1">|-' . $category_rows[$i]['cat_title'] . '</option>';
					$boxstring .= '<option value="-1">|----------------</option>';
					$boxstring .= $boxstring_forums;
				}
			}
		}

		$boxstring .= '</select>';
	}
	else
	{
		$boxstring .= '<select name="' . POST_FORUM_URL . '" onchange="if(this.options[this.selectedIndex].value != -1){ forms[\'jumpbox\'].submit() }"></select>';
	}

	// Let the jumpbox work again in sites having additional session id checks.
//	if ( !empty($SID) )
//	{
		$boxstring .= '<input type="hidden" name="sid" value="' . $userdata['session_id'] . '" />';
//	}

	$template->set_filenames(array(
		'jumpbox' => 'jumpbox.tpl')
	);
	$template->assign_vars(array(
		'L_GO' => $lang['Go'],
		'L_JUMP_TO' => $lang['Jump_to'],
		'L_SELECT_FORUM' => $lang['Select_forum'],

		'S_JUMPBOX_SELECT' => $boxstring,
		'S_JUMPBOX_ACTION' => append_sid($action))
	);
	$template->assign_var_from_handle('JUMPBOX', 'jumpbox');

	return;
}

//
// Initialise user settings on page load
function init_userprefs($userdata)
{
	global $board_config, $theme, $images, $db, $table_prefix;
	global $template, $lang, $phpEx, $phpbb_root_path, $db;
	global $nav_links;

//-- mod : mods settings ---------------------------------------------------------------------------
//-- add
	global $db, $mods, $list_yes_no, $userdata;

	//	get all the mods settings
	$dir = @opendir($phpbb_root_path . 'includes/mods_settings');
	while( $file = @readdir($dir) )
	{
		if( preg_match("/^mod_.*?\." . $phpEx . "$/", $file) )
		{
			include_once($phpbb_root_path . 'includes/mods_settings/' . $file);
		}
	}
	@closedir($dir);
//-- fin mod : mods settings -----------------------------------------------------------------------

	if ( $userdata['user_id'] != ANONYMOUS )
	{
		if ( !empty($userdata['user_lang']))
		{
			$default_lang = phpbb_ltrim(basename(phpbb_rtrim($userdata['user_lang'])), "'");
		}

		if ( !empty($userdata['user_dateformat']) )
		{
			$board_config['default_dateformat'] = $userdata['user_dateformat'];
		}

		if ( isset($userdata['user_timezone']) )
		{
			$board_config['board_timezone'] = $userdata['user_timezone'];
		}
	}
	else
	{
		$default_lang = phpbb_ltrim(basename(phpbb_rtrim($board_config['default_lang'])), "'");
	}

	if ( !file_exists(@phpbb_realpath($phpbb_root_path . 'language/lang_' . $default_lang . '/lang_main.'.$phpEx)) )
	{
		if ( $userdata['user_id'] != ANONYMOUS )
		{
			// For logged in users, try the board default language next
			$default_lang = phpbb_ltrim(basename(phpbb_rtrim($board_config['default_lang'])), "'");
		}
		else
		{
			// For guests it means the default language is not present, try english
			// This is a long shot since it means serious errors in the setup to reach here,
			// but english is part of a new install so it's worth us trying
			$default_lang = 'english';
		}

		if ( !file_exists(@phpbb_realpath($phpbb_root_path . 'language/lang_' . $default_lang . '/lang_main.'.$phpEx)) )
		{
			message_die(CRITICAL_ERROR, 'Could not locate valid language pack');
		}
	}

	// If we've had to change the value in any way then let's write it back to the database
	// before we go any further since it means there is something wrong with it
	if ( $userdata['user_id'] != ANONYMOUS && $userdata['user_lang'] !== $default_lang )
	{
		$sql = 'UPDATE ' . USERS_TABLE . "
			SET user_lang = '" . $default_lang . "'
			WHERE user_lang = '" . $userdata['user_lang'] . "'";

		if ( !($result = $db->sql_query($sql)) )
		{
			message_die(CRITICAL_ERROR, 'Could not update user language info');
		}

		$userdata['user_lang'] = $default_lang;
	}
	elseif ( $userdata['user_id'] === ANONYMOUS && $board_config['default_lang'] !== $default_lang )
	{
		$sql = 'UPDATE ' . CONFIG_TABLE . "
			SET config_value = '" . $default_lang . "'
			WHERE config_name = 'default_lang'";

		if ( !($result = $db->sql_query($sql)) )
		{
			message_die(CRITICAL_ERROR, 'Could not update user language info');
		}
	}

	$board_config['default_lang'] = $default_lang;

	include($phpbb_root_path . 'language/lang_' . $board_config['default_lang'] . '/lang_main.' . $phpEx);
	include($phpbb_root_path . 'language/lang_' . $board_config['default_lang'] . '/lang_cback_ctracker.' . $phpEx);

//-- mod : quick title edition -------------------------------------------------
//-- add
	include($phpbb_root_path . 'language/lang_' . $board_config['default_lang'] . '/lang_quick_title.'.$phpEx);
//-- fin mod : quick title edition ---------------------------------------------

	if ( defined('IN_ADMIN') )
	{
		if( !file_exists(@phpbb_realpath($phpbb_root_path . 'language/lang_' . $board_config['default_lang'] . '/lang_admin.'.$phpEx)) )
		{
			$board_config['default_lang'] = 'english';
		}

		include($phpbb_root_path . 'language/lang_' . $board_config['default_lang'] . '/lang_admin.' . $phpEx);
		include($phpbb_root_path . 'language/lang_' . $board_config['default_lang'] . '/lang_admin_captcha.' . $phpEx);
	}

//-- mod : language settings -----------------------------------------------------------------------
//-- add
	include($phpbb_root_path . './includes/lang_extend_mac.' . $phpEx);
//-- fin mod : language settings -------------------------------------------------------------------

	include_attach_lang();

	//
	// Set up style
	//
	if ( !$board_config['override_user_style'] )
	{
		if ( $userdata['user_id'] != ANONYMOUS && $userdata['user_style'] > 0 )
		{
			if ( $theme = setup_style($userdata['user_style']) )
			{
				return;
			}
		}
	}

		if (IS_ROBOT)
	{
		$sql = "SELECT bot_style FROM " . $table_prefix . "bots WHERE bot_name='" . IS_ROBOT . "'";
		$result = $db->sql_query($sql);
		$row = $db->sql_fetchrow($result);
		$theme = setup_style($row['bot_style']);	
	} else {
		$theme = setup_style($board_config['default_style']);
	}

	//
	// Mozilla navigation bar
	// Default items that should be valid on all pages.
	// Defined here to correctly assign the Language Variables
	// and be able to change the variables within code.
	//
	$nav_links['top'] = array ( 
		'url' => append_sid($phpbb_root_path . 'index.' . $phpEx),
		'title' => sprintf($lang['Forum_Index'], $board_config['sitename'])
	);
	$nav_links['search'] = array ( 
		'url' => append_sid($phpbb_root_path . 'search.' . $phpEx),
		'title' => $lang['Search']
	);
	$nav_links['help'] = array (  		'url' => append_sid($phpbb_root_path . 'faq.' . $phpEx),
		'title' => $lang['FAQ']
	);
	$nav_links['author'] = array ( 
		'url' => append_sid($phpbb_root_path . 'memberlist.' . $phpEx),
		'title' => $lang['Memberlist']
	);

	return;
}

function setup_style($style)
{
	global $db, $board_config, $template, $images, $phpbb_root_path;

	$sql = 'SELECT *
		FROM ' . THEMES_TABLE . '
		WHERE themes_id = ' . (int) $style;
	if ( !($result = $db->sql_query($sql)) )
	{
		message_die(CRITICAL_ERROR, 'Could not query database for theme info');
	}

	if ( !($row = $db->sql_fetchrow($result)) )
	{
		// We are trying to setup a style which does not exist in the database
		// Try to fallback to the board default (if the user had a custom style)
		// and then any users using this style to the default if it succeeds
		if ( $style != $board_config['default_style'])
		{
			$sql = 'SELECT *
				FROM ' . THEMES_TABLE . '
				WHERE themes_id = ' . (int) $board_config['default_style'];
			if ( !($result = $db->sql_query($sql)) )
			{
				message_die(CRITICAL_ERROR, 'Could not query database for theme info');
			}

			if ( $row = $db->sql_fetchrow($result) )
			{
				$db->sql_freeresult($result);

				$sql = 'UPDATE ' . USERS_TABLE . '
					SET user_style = ' . (int) $board_config['default_style'] . "
					WHERE user_style = $style";
				if ( !($result = $db->sql_query($sql)) )
				{
					message_die(CRITICAL_ERROR, 'Could not update user theme info');
				}
			}
			else
			{
				message_die(CRITICAL_ERROR, "Could not get theme data for themes_id [$style]");
			}
		}
		else
		{
			message_die(CRITICAL_ERROR, "Could not get theme data for themes_id [$style]");
		}
	}

	$template_path = 'templates/' ;
	$template_name = $row['template_name'] ;

	$template = new Template($phpbb_root_path . $template_path . $template_name);

	if ( $template )
	{
		$current_template_path = $template_path . $template_name;
		@include($phpbb_root_path . $template_path . $template_name . '/' . $template_name . '.cfg');

//-- mod : bbcode box reloaded -------------------------------------------------
//-- add
		$style = $board_config['bbc_style_path'];
		@include($phpbb_root_path . $template_path . $template_name . '/bbc_box.cfg');
//-- fin mod : bbcode box reloaded ---------------------------------------------

		if ( !defined('TEMPLATE_CONFIG') )
		{
			message_die(CRITICAL_ERROR, "Could not open $template_name template config file", '', __LINE__, __FILE__);
		}

		$img_lang = ( file_exists(@phpbb_realpath($phpbb_root_path . $current_template_path . '/images/lang_' . $board_config['default_lang'])) ) ? $board_config['default_lang'] : 'english';

		while( list($key, $value) = @each($images) )
		{
			if ( !is_array($value) )
			{
				$images[$key] = str_replace('{LANG}', 'lang_' . $img_lang, $value);
			}
		}
	}

	return $row;
}

function encode_ip($dotquad_ip)
{
	$ip_sep = explode('.', $dotquad_ip);
	return sprintf('%02x%02x%02x%02x', $ip_sep[0], $ip_sep[1], $ip_sep[2], $ip_sep[3]);
}

function decode_ip($int_ip)
{
	$hexipbang = explode('.', chunk_split($int_ip, 2, '.'));
	return hexdec($hexipbang[0]). '.' . hexdec($hexipbang[1]) . '.' . hexdec($hexipbang[2]) . '.' . hexdec($hexipbang[3]);
}

//
// Create date/time from format and timezone
//
function create_date($format, $gmepoch, $tz)
{
	global $board_config, $lang;
	static $translate;

	if ( empty($translate) && $board_config['default_lang'] != 'english' )
	{
		@reset($lang['datetime']);
		while ( list($match, $replace) = @each($lang['datetime']) )
		{
			$translate[$match] = $replace;
		}
	}

	return ( !empty($translate) ) ? strtr(@gmdate($format, $gmepoch + (3600 * $tz)), $translate) : @gmdate($format, $gmepoch + (3600 * $tz));
}

//
// Pagination routine, generates
// page number sequence
//
function generate_pagination($base_url, $num_items, $per_page, $start_item, $add_prevnext_text = TRUE)
{
	global $lang;

	$total_pages = ceil($num_items/$per_page);

	if ( $total_pages == 1 )
	{
		return '';
	}

	$on_page = floor($start_item / $per_page) + 1;

	$page_string = '';
	if ( $total_pages > 10 )
	{
		$init_page_max = ( $total_pages > 3 ) ? 3 : $total_pages;

		for($i = 1; $i < $init_page_max + 1; $i++)
		{
			$page_string .= ( $i == $on_page ) ? '<b>' . $i . '</b>' : '<a href="' . append_sid($base_url . "&amp;start=" . ( ( $i - 1 ) * $per_page ) ) . '">' . $i . '</a>';
			if ( $i <  $init_page_max )
			{
				$page_string .= ", ";
			}
		}

		if ( $total_pages > 3 )
		{
			if ( $on_page > 1  && $on_page < $total_pages )
			{
				$page_string .= ( $on_page > 5 ) ? ' ... ' : ', ';

				$init_page_min = ( $on_page > 4 ) ? $on_page : 5;
				$init_page_max = ( $on_page < $total_pages - 4 ) ? $on_page : $total_pages - 4;

				for($i = $init_page_min - 1; $i < $init_page_max + 2; $i++)
				{
					$page_string .= ($i == $on_page) ? '<b>' . $i . '</b>' : '<a href="' . append_sid($base_url . "&amp;start=" . ( ( $i - 1 ) * $per_page ) ) . '">' . $i . '</a>';
					if ( $i <  $init_page_max + 1 )
					{
						$page_string .= ', ';
					}
				}

				$page_string .= ( $on_page < $total_pages - 4 ) ? ' ... ' : ', ';
			}
			else
			{
				$page_string .= ' ... ';
			}

			for($i = $total_pages - 2; $i < $total_pages + 1; $i++)
			{

				$page_string .= ( $i == $on_page ) ? '<b>' . $i . '</b>'  : '<a href="' . append_sid($base_url . "&amp;start=" . ( ( $i - 1 ) * $per_page ) ) . '">' . $i . '</a>';
				if( $i <  $total_pages )
				{
					$page_string .= ", ";
				}
			}
		}
	}
	else
	{
		for($i = 1; $i < $total_pages + 1; $i++)
		{
			$page_string .= ( $i == $on_page ) ? '<b>' . $i . '</b>' : '<a href="' . append_sid($base_url . "&amp;start=" . ( ( $i - 1 ) * $per_page ) ) . '">' . $i . '</a>';
			if ( $i <  $total_pages )
			{
				$page_string .= ', ';
			}
		}
	}

	if ( $add_prevnext_text )
	{
		if ( $on_page > 1 )
		{
			$page_string = ' <a href="' . append_sid($base_url . "&amp;start=" . ( ( $on_page - 2 ) * $per_page ) ) . '">' . $lang['Previous'] . '</a>&nbsp;&nbsp;' . $page_string;
		}

		if ( $on_page < $total_pages )
		{
			$page_string .= '&nbsp;&nbsp;<a href="' . append_sid($base_url . "&amp;start=" . ( $on_page * $per_page ) ) . '">' . $lang['Next'] . '</a>';
		}

	}

	$page_string = $lang['Goto_page'] . ' ' . $page_string;

	return $page_string;
}

//
// This does exactly what preg_quote() does in PHP 4-ish
// If you just need the 1-parameter preg_quote call, then don't bother using this.
//
function phpbb_preg_quote($str, $delimiter)
{
	$text = preg_quote($str);
	$text = str_replace($delimiter, '\\' . $delimiter, $text);
	
	return $text;
}

//
// Obtain list of naughty words and build preg style replacement arrays for use by the
// calling script, note that the vars are passed as references this just makes it easier
// to return both sets of arrays
//
function obtain_word_list(&$orig_word, &$replacement_word)
{
	global $db;

	//
	// Define censored word matches
	//
	$sql = "SELECT word, replacement
		FROM  " . WORDS_TABLE;
	if( !($result = $db->sql_query($sql)) )
	{
		message_die(GENERAL_ERROR, 'Could not get censored words from database', '', __LINE__, __FILE__, $sql);
	}

	if ( $row = $db->sql_fetchrow($result) )
	{
		do 
		{
			$orig_word[] = '#\b(' . str_replace('\*', '\w*?', preg_quote($row['word'], '#')) . ')\b#i';
			$replacement_word[] = $row['replacement'];
		}
		while ( $row = $db->sql_fetchrow($result) );
	}

	return true;
}

//
// This is general replacement for die(), allows templated
// output in users (or default) language, etc.
//
// $msg_code can be one of these constants:
//
// GENERAL_MESSAGE : Use for any simple text message, eg. results 
// of an operation, authorisation failures, etc.
//
// GENERAL ERROR : Use for any error which occurs _AFTER_ the 
// common.php include and session code, ie. most errors in 
// pages/functions
//
// CRITICAL_MESSAGE : Used when basic config data is available but 
// a session may not exist, eg. banned users
//
// CRITICAL_ERROR : Used when config data cannot be obtained, eg
// no database connection. Should _not_ be used in 99.5% of cases
//
function message_die($msg_code, $msg_text = '', $msg_title = '', $err_line = '', $err_file = '', $sql = '')
{
	global $db, $template, $board_config, $theme, $lang, $phpEx, $phpbb_root_path, $nav_links, $gen_simple_header, $images;
	global $userdata, $user_ip, $session_length;
	global $starttime;

	if(defined('HAS_DIED'))
	{
		die("message_die() was called multiple times. This isn't supposed to happen. Was message_die() used in page_tail.php?");
	}
	
	define('HAS_DIED', 1);
	

	$sql_store = $sql;
	
	//
	// Get SQL error if we are debugging. Do this as soon as possible to prevent 
	// subsequent queries from overwriting the status of sql_error()
	//
	if ( DEBUG && ( $msg_code == GENERAL_ERROR || $msg_code == CRITICAL_ERROR ) )
	{
		$sql_error = $db->sql_error();

		$debug_text = '';

		if ( $sql_error['message'] != '' )
		{
			$debug_text .= '<br /><br />SQL Error : ' . $sql_error['code'] . ' ' . $sql_error['message'];
		}

		if ( $sql_store != '' )
		{
			$debug_text .= "<br /><br />$sql_store";
		}

		if ( $err_line != '' && $err_file != '' )
		{
			$debug_text .= '<br /><br />Line : ' . $err_line . '<br />File : ' . basename($err_file);
		}
	}

	if( empty($userdata) && ( $msg_code == GENERAL_MESSAGE || $msg_code == GENERAL_ERROR ) )
	{
		$userdata = session_pagestart($user_ip, PAGE_INDEX);
		init_userprefs($userdata);
	}

	//
	// If the header hasn't been output then do it
	//
	if ( !defined('HEADER_INC') && $msg_code != CRITICAL_ERROR )
	{
		if ( empty($lang) )
		{
			if ( !empty($board_config['default_lang']) )
			{
				include($phpbb_root_path . 'language/lang_' . $board_config['default_lang'] . '/lang_main.'.$phpEx);
			}
			else
			{
				include($phpbb_root_path . 'language/lang_english/lang_main.'.$phpEx);
			}
			
//-- mod : language settings -----------------------------------------------------------------------
//-- add
			include($phpbb_root_path . './includes/lang_extend_mac.' . $phpEx);
//-- fin mod : language settings -------------------------------------------------------------------

		}

		if ( empty($template) || empty($theme) )
		{
			$theme = setup_style($board_config['default_style']);
		}

		//
		// Load the Page Header
		//
		if ( !defined('IN_ADMIN') )
		{
			include($phpbb_root_path . 'includes/page_header.'.$phpEx);
		}
		else
		{
			include($phpbb_root_path . 'admin/page_header_admin.'.$phpEx);
		}
	}

	switch($msg_code)
	{
		case GENERAL_MESSAGE:
			if ( $msg_title == '' )
			{
				$msg_title = $lang['Information'];
			}
			break;

		case CRITICAL_MESSAGE:
			if ( $msg_title == '' )
			{
				$msg_title = $lang['Critical_Information'];
			}
			break;

		case GENERAL_ERROR:
			if ( $msg_text == '' )
			{
				$msg_text = $lang['An_error_occured'];
			}

			if ( $msg_title == '' )
			{
				$msg_title = $lang['General_Error'];
			}
			break; 
		case CRITICAL_ERROR:
			//
			// Critical errors mean we cannot rely on _ANY_ DB information being
			// available so we're going to dump out a simple echo'd statement
			//
			include($phpbb_root_path . 'language/lang_english/lang_main.'.$phpEx);

			if ( $msg_text == '' )
			{
				$msg_text = $lang['A_critical_error'];
			}

			if ( $msg_title == '' )
			{
				$msg_title = 'phpBB : <b>' . $lang['Critical_Error'] . '</b>';
			}
			break;
	}

	//
	// Add on DEBUG info if we've enabled debug mode and this is an error. This
	// prevents debug info being output for general messages should DEBUG be
	// set TRUE by accident (preventing confusion for the end user!)
	//
	if ( DEBUG && ( $msg_code == GENERAL_ERROR || $msg_code == CRITICAL_ERROR ) )
	{
		if ( $debug_text != '' )
		{
			$msg_text = $msg_text . '<br /><br /><b><u>DEBUG MODE</u></b>' . $debug_text;
		}
	}

	if ( $msg_code != CRITICAL_ERROR )
	{
		if ( !empty($lang[$msg_text]) )
		{
			$msg_text = $lang[$msg_text];
		}

		if ( !defined('IN_ADMIN') )
		{
			$template->set_filenames(array(
				'message_body' => 'message_body.tpl')
			);
		}
		else
		{
			$template->set_filenames(array(
				'message_body' => 'admin/admin_message_body.tpl')
			);
		}

		$template->assign_vars(array(
			'MESSAGE_TITLE' => $msg_title,
			'MESSAGE_TEXT' => $msg_text)
		);
		$template->pparse('message_body');

		if ( !defined('IN_ADMIN') )
		{
			include($phpbb_root_path . 'includes/page_tail.'.$phpEx);
		}
		else
		{
			include($phpbb_root_path . 'admin/page_footer_admin.'.$phpEx);
		}
	}
	else
	{
		echo "<html>\n<body>\n" . $msg_title . "\n<br /><br />\n" . $msg_text . "</body>\n</html>";
	}

	exit;
}

//
// This function is for compatibility with PHP 4.x's realpath()
// function.  In later versions of PHP, it needs to be called
// to do checks with some functions.  Older versions of PHP don't
// seem to need this, so we'll just return the original value.
// dougk_ff7 <October 5, 2002>
function phpbb_realpath($path)
{
	global $phpbb_root_path, $phpEx;

	return (!@function_exists('realpath') || !@realpath($phpbb_root_path . 'includes/functions.'.$phpEx)) ? $path : @realpath($path);
}

function redirect($url)
{
	global $db, $board_config;

	if (!empty($db))
	{
		$db->sql_close();
	}

	if (strstr(urldecode($url), "\n") || strstr(urldecode($url), "\r"))
	{
		message_die(GENERAL_ERROR, 'Tried to redirect to potentially insecure url.');
	}

	$server_protocol = ($board_config['cookie_secure']) ? 'https://' : 'http://';
	$server_name = preg_replace('#^\/?(.*?)\/?$#', '\1', trim($board_config['server_name']));
	$server_port = ($board_config['server_port'] <> 80) ? ':' . trim($board_config['server_port']) : '';
	$script_name = preg_replace('#^\/?(.*?)\/?$#', '\1', trim($board_config['script_path']));
	$script_name = ($script_name == '') ? $script_name : '/' . $script_name;
	$url = preg_replace('#^\/?(.*?)\/?$#', '/\1', trim($url));

	// Redirect via an HTML form for PITA webservers
	if (@preg_match('/Microsoft|WebSTAR|Xitami/', getenv('SERVER_SOFTWARE')))
	{
		header('Refresh: 0; URL=' . $server_protocol . $server_name . $server_port . $script_name . $url);
		echo '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html><head><meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"><meta http-equiv="refresh" content="0; url=' . $server_protocol . $server_name . $server_port . $script_name . $url . '"><title>Redirect</title></head><body><div align="center">If your browser does not support meta redirection please click <a href="' . $server_protocol . $server_name . $server_port . $script_name . $url . '">HERE</a> to be redirected</div></body></html>';
		exit;
	}

	// Behave as per HTTP/1.1 spec for others
	header('Location: ' . $server_protocol . $server_name . $server_port . $script_name . $url);
	exit;
}

//-- mod : browsers list -------------------------------------------------------
//-- add
function display_browser($browser, $topics='')
{
	global $phpbb_root_path, $board_config, $template, $lang;

	$data_browser = '';
	$tpl_data = array();
	if ( !empty($browser) )
	{
		$template->assign_block_vars('browser', array());

		$browsers_path = $phpbb_root_path . ( empty($board_config['browsers_path']) ? 'images/browsers' : trim(preg_replace('#(.*)?\/?$#', '\1', trim($board_config['browsers_path']))) );

		$browser_str = str_replace('_', ' ', substr($browser, 0, 0 - strlen(strrchr($browser, '.'))));
		$browser_name = isset($lang[$browser_str]) ? $lang[$browser_str] : ucfirst($browser_str);
		$browser_img = '<img class="gensmall" src="' . $browsers_path . $browser . '" alt="' . $browser_name . '" title="' . $browser_name . '" align="absmiddle" border="0" />';

		$tpl_data = array(
			'BROWSER_NAME' => $browser_name,
			'BROWSER_IMG' => $browser_img,
		);

		$data_browser = ( !empty($topics) ? $lang['browser'] . ': ' : '&nbsp;' ) . $browser_img . ( !empty($topics) ? '<br />' : '' );
	}
	else
	{
		$template->assign_block_vars('browser_else', array());
	}

	// send to template
	$template->assign_vars($tpl_data + array(
		'L_BROWSER' => $lang['browser'],
		'L_BROWSER_NONE' => $lang['browser_none'],
	));

	return $data_browser;
}

function get_browsers_list($browser)
{
	global $phpbb_root_path, $board_config, $template, $lang, $images;

	// get available browsers icons
	$browsers_icons = array();
	$browsers_path = $phpbb_root_path . ( empty($board_config['browsers_path']) ? 'images/browsers' : trim(preg_replace('#(.*)?\/?$#', '\1', trim($board_config['browsers_path']))) );
	$dir = @opendir(phpbb_realpath($browsers_path));
	while ( $file = @readdir($dir) )
	{
		if ( preg_match('/(\.gif$|\.png$|\.jpg|\.jpeg)$/is', $file) )
		{
			$browsers_icons[ $file ] = str_replace('_', ' ', substr($file, 0, 0 - strlen(strrchr($file, '.'))));
		}
	}
	@closedir($dir);

	// build form
	$browsers_list = '';

	if ( !empty($browsers_icons) )
	{
		asort($browsers_icons);

		// html for browser_name field
		$html = ' onChange="if (this.options[selectedIndex].value != \'\') {document.post.browser_img.src = \'' . $browsers_path . '\' + this.options[selectedIndex].value} else {document.post.browser_img.src=\'' . $phpbb_root_path . $images['spacer'] . '\'}"';

		$template->assign_block_vars('browsers', array());

		$data['options'] = array('' => 'no_browser') + $browsers_icons;

		$browsers_list = '<select name="browser"' . $html . '>';
		foreach ( $data['options'] as $val => $desc )
		{
			$selected = ( $val == $browser ) ? ' selected="selected"' : '';
			$browsers_list .= '<option value="' . $val . '"' . $selected . '>' . ( isset($lang[$desc]) ? $lang[$desc] : ucfirst($desc) ) . '</option>';
		}
		$browsers_list .= '</select>';
	}

	// send to template
	$template->assign_vars(array(
		'I_BROWSER' => !empty($browser) ? $browsers_path . $browser : $phpbb_root_path . $images['spacer'],

		'L_BROWSER' => $lang['browser'],
		'L_BROWSER_TITLE' => $lang['browser_icon'],

		'S_BROWSERS_LIST' => $browsers_list,
	));
}
//-- fin mod : browsers list ---------------------------------------------------

//-- mod : flags ---------------------------------------------------------------
//-- add
function display_flag($flag, $topics='')
{
	global $phpbb_root_path, $board_config, $template, $lang;

	$data_flag = '';
	$tpl_data = array();
	if ( !empty($flag) )
	{
		$template->assign_block_vars('flag', array());

		$flags_path = $phpbb_root_path . ( empty($board_config['flags_path']) ? 'images/flags' : trim(preg_replace('#(.*)?\/?$#', '\1', trim($board_config['flags_path']))) );

		$flag_str = str_replace('_', ' ', substr($flag, 0, 0 - strlen(strrchr($flag, '.'))));
		$flag_name = (isset($lang[$flag_str])) ? $lang[$flag_str] : ucfirst($flag_str);
		$flag_img = '<img class="gensmall" src="' . $flags_path . $flag . '" alt="' . $flag_name . '" title="' . $flag_name . '" align="absmiddle" border="0" />';

		$tpl_data = array(
			'FLAG_NAME' => $flag_name,
			'FLAG_IMG' => $flag_img,
		);

		$data_flag = ( !empty($topics) ? $lang['flag_country'] . ': ' : '&nbsp;' ) . $flag_img . ( !empty($topics) ? '<br />' : '' );
	}
	else
	{
		$template->assign_block_vars('flag_else', array());
	}

	// send to template
	$template->assign_vars($tpl_data + array(
		'L_FLAG' => $lang['flag_country'],
		'L_FLAG_NONE' => $lang['flag_none'],
	));

	return $data_flag;
}

function get_flags_list($flag)
{
	global $phpbb_root_path, $board_config, $template, $lang, $images;

	// get available flags icons
	$flags_icons = array();
	$flags_path = $phpbb_root_path . ( empty($board_config['flags_path']) ? 'images/flags' : trim(preg_replace('#(.*)?\/?$#', '\1', trim($board_config['flags_path']))) );
	$dir = @opendir(phpbb_realpath($flags_path));
	while ( $file = @readdir($dir) )
	{
		if ( preg_match('/(\.gif$|\.png$|\.jpg|\.jpeg)$/is', $file) )
		{
			$flags_icons[ $file ] = str_replace('_', ' ', substr($file, 0, 0 - strlen(strrchr($file, '.'))));
		}
	}
	@closedir($dir);

	// build form
	$flags_list = '';

	if ( !empty($flags_icons) )
	{
		asort($flags_icons);

		// html for flag_name field
		$html = ' onChange="if (this.options[selectedIndex].value != \'\') {document.post.flag_img.src = \'' . $flags_path . '\' + this.options[selectedIndex].value} else {document.post.flag_img.src=\'' . $phpbb_root_path . $images['spacer'] . '\'}"';
		$template->assign_block_vars('flags', array());

		$data['options'] = array('' => 'no_flag') + $flags_icons;

		$flags_list = '<select name="flag"' . $html . '>';
		foreach ( $data['options'] as $val => $desc )
		{
			$selected = ( $val == $flag ) ? ' selected="selected"' : '';
			$flags_list .= '<option value="' . $val . '"' . $selected . '>' . ( isset($lang[$desc]) ? $lang[$desc] : ucfirst($desc) ) . '</option>';
		}
		$flags_list .= '</select>';
	}

	// send to template
	$template->assign_vars(array(
		'I_FLAG' => !empty($flag) ? $flags_path . $flag : $phpbb_root_path . $images['spacer'],

		'L_FLAG' => $lang['flag_country'],
		'L_FLAG_TITLE' => $lang['flag_icon'],

		'S_FLAGS_LIST' => $flags_list,
	));
}
//-- fin mod : flags -----------------------------------------------------------

//-- mod : quick post es -------------------------------------------------------
//-- add
function display_qpes_data($qp_acp=false)
{
	global $board_config, $userdata, $lang, $template;

	// reset data
	$user_qp = $user_qp_show = $user_qp_subject = $user_qp_bbcode = $user_qp_smilies = $user_qp_more = 0;

	// is admin
	$qp_admin = $userdata['session_logged_in'] && ($userdata['user_level'] == ADMIN);

	// config data
	if (!empty($board_config['users_qp_settings']))
	{
		list($board_config['user_qp'], $board_config['user_qp_show'], $board_config['user_qp_subject'], $board_config['user_qp_bbcode'], $board_config['user_qp_smilies'], $board_config['user_qp_more']) = explode('-', $board_config['users_qp_settings']);
	}

	// user data
	if (!empty($userdata['user_qp_settings']))
	{
		list($user_qp, $user_qp_show, $user_qp_subject, $user_qp_bbcode, $user_qp_smilies, $user_qp_more) = explode('-', $userdata['user_qp_settings']);
	}

	// check if quick reply is enabled
	$qp_on = intval($board_config['user_qp']);

	// options list
	$options = array(
		array('title' => 'qp_enable', 'desc' => 'qp_enable_explain', 'var' => 'user_qp'),
		array('title' => 'qp_show', 'desc' => 'qp_show_explain', 'var' => 'user_qp_show'),
		array('title' => 'qp_subject', 'desc' => 'qp_subject_explain', 'var' => 'user_qp_subject'),
		array('title' => 'qp_bbcode', 'desc' => 'qp_bbcode_explain', 'var' => 'user_qp_bbcode'),
		array('title' => 'qp_smilies', 'desc' => 'qp_smilies_explain', 'var' => 'user_qp_smilies'),
		array('title' => 'qp_more', 'desc' => 'qp_more_explain', 'var' => 'user_qp_more'),
	);

	// build options form
	foreach ($options as $option => $result)
	{
		$qp_var = $result['var'];
		$qp_cfg = $board_config[$qp_var];

		if (!empty($qp_acp))
		{
			$tpl_data = array(
				'QP_YES' => ($$qp_var) ? ' checked="checked"' : '',
				'QP_NO' => (!$$qp_var) ? ' checked="checked"' : '',
			);
		}
		else
		{
			$tpl_data = array(
				'QP_YES' => ((($qp_var == 'user_qp') ? !$qp_on : (!$qp_cfg || !$qp_on)) && !$qp_admin) ? ' disabled="disabled"' : (($$qp_var) ? ' checked="checked"' : ''),
				'QP_NO' => ((($qp_var == 'user_qp') ? !$qp_on : (!$qp_cfg || !$qp_on)) && !$qp_admin) ?  ' disabled="disabled"' : ((!$$qp_var) ? ' checked="checked"' : ''),
			);
		}

		// options constants
		$template->assign_block_vars('qpes', $tpl_data + array(
			'L_QP_TITLE' => $lang[$result['title']],
			'L_QP_DESC' => $lang[$result['desc']],
			'QP_VAR' => $qp_var,
		));
	}
}
//-- fin mod : quick post es ---------------------------------------------------

//+MOD: DHTML Collapsible Forum Index MOD
function get_cfi_cookie_name()
{
	global $board_config, $HTTP_GET_VARS;

	$k = $board_config['cookie_name'].'_CFI_cats';
	if( isset($board_config['sub_forum']) )
	{
		$k .= '_'.isset($board_config['sub_forum']);
		if( isset($HTTP_GET_VARS['c']) )
		{
			$k .= '_'.$HTTP_GET_VARS['c'];
		}
	}
	return $k;
}
function is_category_collapsed($cat_id)
{
	global $board_config, $HTTP_COOKIE_VARS;
	static $collapsed_cats = false;

	if( intval($board_config['sub_forum']) == 2 )
	{
		return false;
	}
	if( !is_array($collapsed_cats) )
	{
		if( isset($HTTP_COOKIE_VARS[get_cfi_cookie_name()]) )
		{
			$collapsed_cats = explode(':', $HTTP_COOKIE_VARS[get_cfi_cookie_name()]);
		}
		else
		{
			$collapsed_cats = array();
		}
	}
	return in_array($cat_id, $collapsed_cats) ? true : false;
}
//-MOD: DHTML Collapsible Forum Index MOD

// crewstyle's mod : Annonce Globale
function get_annonce_list()
{
	global $phpbb_root_path, $template, $userdata, $lang, $db, $phpEx, $SID;
	global $board_config, $images, $HTTP_COOKIE_VARS, $tracking_topics, $tracking_forums;
	global $rcs;

	//
	// All global announcement data
	//
	$sql_global = 'SELECT t.*, u.username, u.user_id, u2.username as user2, u2.user_id as id2, p.post_time, p.post_username, f.forum_name, f.forum_id,attached_forum_id
		FROM ' . TOPICS_TABLE . ' t, ' . USERS_TABLE . ' u, ' . POSTS_TABLE . ' p, ' . USERS_TABLE . ' u2, ' . FORUMS_TABLE . ' f
		WHERE t.topic_type = ' . POST_GLOBAL_ANNOUNCE . '
			AND t.topic_poster = u.user_id
			AND p.post_id = t.topic_last_post_id
			AND p.poster_id = u2.user_id
			AND f.forum_id = t.forum_id
		ORDER BY t.topic_type DESC, t.topic_last_post_id DESC';
//-- mod : rank color system ---------------------------------------------------
//-- add
	$sql_global = str_replace(', u.user_id', ', u.user_id, u.user_level, u.user_color, u.user_group_id', $sql_global);
	$sql_global = str_replace(', u2.user_id as id2', ', u2.user_id as id2, u2.user_level as level2, u2.user_color as color2, u2.user_group_id as group_id2', $sql_global);
//-- fin mod : rank color system -----------------------------------------------
	if ( !($result_global = $db->sql_query($sql_global)) )
	{
		message_die(GENERAL_ERROR, 'Could not obtain global announcement information', '', __LINE__, __FILE__, $sql_global);
	}


	$global_annonce = 0;
	while( $row = $db->sql_fetchrow($result_global) )
	{
		$is_auth = auth(AUTH_READ, $row['forum_id'], $userdata, $forum_topic_data);

		if( $is_auth['auth_read'] )
		{
			$topic_rowset[] = $row;
			$global_annonce++;
		}
	}
	$db->sql_freeresult($result_global);

	if( $global_annonce )
	{
		$template->assign_block_vars('annonce_globale', array(
			'L_TOPICS' => $lang['Post_Global_Announcements'],
			'L_REPLIES' => $lang['Replies'],
			'L_AUTHOR' => $lang['Author'],
			'L_VIEWS' => $lang['Views'],
			'L_LASTPOST' => $lang['Last_Post']
		));

		$annonce_global=1;
		for($i = 0; $i < $global_annonce; $i++)
		{
			$topic_id = $topic_rowset[$i]['topic_id'];


			//
			// Information
			//
			$topic_title = ( count($orig_word) ) ? preg_replace($orig_word, $replacement_word, $topic_rowset[$i]['topic_title']) : $topic_rowset[$i]['topic_title'];

			if ( $topic_rowset[$i]['title_pos'] )
			{
				$topic_title = (empty($topic_rowset[$i]['title_compl_infos'])) ? $topic_title : $topic_title.' '.'<span style="color:#' . $topic_rowset[$i]['title_compl_color'] . '">' . $topic_rowset[$i]['title_compl_infos'] . '</span>';
			}
			else
			{
				$topic_title = (empty($topic_rowset[$i]['title_compl_infos'])) ? $topic_title : '<span style="color:#' . $topic_rowset[$i]['title_compl_color'] . '">' . $topic_rowset[$i]['title_compl_infos'] . '</span>' .' '.$topic_title;
			}

			$topic_description = ( count($orig_word) ) ? preg_replace($orig_word, $replacement_word, $topic_rowset[$i]['topic_description']) : $topic_rowset[$i]['topic_description'];
			$topic_description = ( $topic_description=='' ) ? $topic_description : '<br />' . $topic_description;

			$replies = $topic_rowset[$i]['topic_replies'];
			$views = $topic_rowset[$i]['topic_views'];


			//
			// Annonce Globale ?
			//
			$topic_type = $lang['Topic_Global_Announcement'] . ' ';

			$global_link = '[ ';
			if ( $topic_rowset[$i]['attached_forum_id'] != '-1' )
			{
				$attach = $topic_rowset[$i]['attached_forum_id'];

				//
				// Get name and id of target forum
				//
				$sql_forum = 'SELECT forum_name FROM ' . FORUMS_TABLE . '
					WHERE forum_id = ' . $attach;
				if ( !($result_forum = $db->sql_query($sql_forum)) )
				{
					message_die(GENERAL_ERROR, 'Could not obtain topic information', '', __LINE__, __FILE__, $sql_forum);
				}
				$row_forum = $db->sql_fetchrow($result_forum);
				$global_link .= '<a href="' . append_sid("viewforum.$phpEx?" . POST_FORUM_URL . "=" . $attach) . '">' . $row_forum['forum_name'] . '</a> &raquo; ';
				$db->sql_freeresult($result_forum);
			}
			$global_link .= '<a href="' . append_sid("viewforum.$phpEx?" . POST_FORUM_URL . "=" . $topic_rowset[$i]['forum_id']) . '">' . $topic_rowset[$i]['forum_name'] . '</a> ]';


			//
			// New post ?
			//
			$folder = $images['folder_global_announce'];
			$folder_new = $images['folder_global_announce_new'];

			$newest_post_img = '';
			if( $userdata['session_logged_in'] )
			{
				if( $topic_rowset[$i]['post_time'] > $userdata['user_lastvisit'] ) 
				{
					if( !empty($tracking_topics) || !empty($tracking_forums) || isset($HTTP_COOKIE_VARS[$board_config['cookie_name'] . '_f_all']) )
					{
						$unread_topics = true;

						if( !empty($tracking_topics[$topic_id]) )
						{
							if( $tracking_topics[$topic_id] >= $topic_rowset[$i]['post_time'] )
							{
								$unread_topics = false;
							}
						}

						if( !empty($tracking_forums[$forum_id]) )
						{
							if( $tracking_forums[$forum_id] >= $topic_rowset[$i]['post_time'] )
							{
								$unread_topics = false;
							}
						}

						if( isset($HTTP_COOKIE_VARS[$board_config['cookie_name'] . '_f_all']) )
						{
							if( $HTTP_COOKIE_VARS[$board_config['cookie_name'] . '_f_all'] >= $topic_rowset[$i]['post_time'] )
							{
								$unread_topics = false;
							}
						}

						if( $unread_topics )
						{
							$folder_image = $folder_new;
							$folder_alt = $lang['New_posts'];

							$newest_post_img = '<a href="' . append_sid("viewtopic.$phpEx?" . POST_TOPIC_URL . "=$topic_id&amp;view=newest") . '"><img src="' . $images['icon_newest_reply'] . '" alt="' . $lang['View_newest_post'] . '" title="' . $lang['View_newest_post'] . '" border="0" /></a> ';
						}
						else
						{
							$folder_image = $folder;
							$folder_alt = ( $topic_rowset[$i]['topic_status'] == TOPIC_LOCKED ) ? $lang['Topic_locked'] : $lang['No_new_posts'];

							$newest_post_img = '';
						}
					}
					else
					{
						$folder_image = $folder_new;
						$folder_alt = ( $topic_rowset[$i]['topic_status'] == TOPIC_LOCKED ) ? $lang['Topic_locked'] : $lang['New_posts'];

						$newest_post_img = '<a href="' . append_sid("viewtopic.$phpEx?" . POST_TOPIC_URL . "=$topic_id&amp;view=newest") . '"><img src="' . $images['icon_newest_reply'] . '" alt="' . $lang['View_newest_post'] . '" title="' . $lang['View_newest_post'] . '" border="0" /></a> ';
					}
				}
				else 
				{
					$folder_image = $folder;
					$folder_alt = ( $topic_rowset[$i]['topic_status'] == TOPIC_LOCKED ) ? $lang['Topic_locked'] : $lang['No_new_posts'];

					$newest_post_img = '';
				}
			}
			else
			{
				$folder_image = $folder;
				$folder_alt = ( $topic_rowset[$i]['topic_status'] == TOPIC_LOCKED ) ? $lang['Topic_locked'] : $lang['No_new_posts'];

				$newest_post_img = '';
			}


			//
			// Goto Page
			//
			if( ( $replies + 1 ) > $board_config['posts_per_page'] )
			{
				$total_pages = ceil( ( $replies + 1 ) / $board_config['posts_per_page'] );
				$goto_page = '<br />[ <img src="' . $images['icon_gotopost'] . '" alt="' . $lang['Goto_page'] . '" title="' . $lang['Goto_page'] . '" />' . $lang['Goto_page'] . ' ';

				$times = 1;
				for($j = 0; $j < $replies + 1; $j += $board_config['posts_per_page'])
				{
					$goto_page .= '<a href="' . append_sid("viewtopic.$phpEx?" . POST_TOPIC_URL . "=" . $topic_id . "&amp;start=$j") . '">' . $times . '</a>';
					if( $times == 1 && $total_pages > 4 )
					{
						$goto_page .= ' ... ';
						$times = $total_pages - 3;
						$j += ( $total_pages - 4 ) * $board_config['posts_per_page'];
					}
					else if ( $times < $total_pages )
					{
						$goto_page .= ', ';
					}
					$times++;
				}
				$goto_page .= ' ] ';
			}
			else
			{
				$goto_page = '';
			}


			//
			// Information
			//
			$view_topic_url = append_sid("viewtopic.$phpEx?" . POST_TOPIC_URL . "=$topic_id");

//-- mod : rank color system ---------------------------------------------------
//-- delete
/*-MOD
			$topic_author = ( $topic_rowset[$i]['user_id'] != ANONYMOUS ) ? '<a href="' . append_sid("profile.$phpEx?mode=viewprofile&amp;" . POST_USERS_URL . '=' . $topic_rowset[$i]['user_id']) . '">' : '';
MOD-*/
//-- add
			$topic_author_color = $rcs->get_colors($topic_rowset[$i]);
			$topic_author = ($topic_rowset[$i]['user_id'] != ANONYMOUS) ? '<a href="' . append_sid('profile.' . $phpEx . '?mode=viewprofile&amp;' . POST_USERS_URL . '=' . $topic_rowset[$i]['user_id']) . '"' . $topic_author_color . '>' : '';
//-- fin mod : rank color system -----------------------------------------------


			$topic_author .= ( $topic_rowset[$i]['user_id'] != ANONYMOUS ) ? $topic_rowset[$i]['username'] : ( ( $topic_rowset[$i]['post_username'] != '' ) ? $topic_rowset[$i]['post_username'] : $lang['Guest'] );
			$topic_author .= ( $topic_rowset[$i]['user_id'] != ANONYMOUS ) ? '</a>' : '';



			$first_post_time = create_date($board_config['default_dateformat'], $topic_rowset[$i]['topic_time'], $board_config['board_timezone']);

			$last_post_time = create_date($board_config['default_dateformat'], $topic_rowset[$i]['post_time'], $board_config['board_timezone']);

//-- mod : rank color system ---------------------------------------------------
//-- delete
/*-MOD
			$last_post_author = ( $topic_rowset[$i]['id2'] == ANONYMOUS ) ? ( ($topic_rowset[$i]['post_username2'] != '' ) ? $topic_rowset[$i]['post_username2'] . ' ' : $lang['Guest'] . ' ' ) : '<a href="' . append_sid("profile.$phpEx?mode=viewprofile&amp;" . POST_USERS_URL . '='  . $topic_rowset[$i]['id2']) . '">' . $topic_rowset[$i]['user2'] . '</a>';
MOD-*/
//-- add
			$last_post_author_color = $rcs->get_colors($topic_rowset[$i], '', false, 'group_id2', 'color2', 'level2');
			$last_post_author = ($topic_rowset[$i]['id2'] == ANONYMOUS) ? (($topic_rowset[$i]['post_username2'] != '') ? $topic_rowset[$i]['post_username2'] : $lang['Guest']) : '<a href="' . append_sid('profile.' . $phpEx . '?mode=viewprofile&amp;' . POST_USERS_URL . '='  . $topic_rowset[$i]['id2']) . '"' . $last_post_author_color . '>' . $topic_rowset[$i]['user2'] . '</a>';
//-- fin mod : rank color system -----------------------------------------------

			$last_post_url = '<a href="' . append_sid("viewtopic.$phpEx?"  . POST_POST_URL . '=' . $topic_rowset[$i]['topic_last_post_id']) . '#' . $topic_rowset[$i]['topic_last_post_id'] . '"><img src="' . $images['icon_latest_reply'] . '" alt="' . $lang['View_latest_post'] . '" title="' . $lang['View_latest_post'] . '" border="0" /></a>';


			$row_color = ( !($i % 2) ) ? $theme['td_color1'] : $theme['td_color2'];
			$row_class = ( !($i % 2) ) ? $theme['td_class1'] : $theme['td_class2'];

			$template->assign_block_vars('annonce_globale.row', array(
				'ROW_COLOR' => $row_color,
				'ROW_CLASS' => $row_class,
				'FORUM_ID' => $forum_id,
				'TOPIC_ID' => $topic_id,
				'TOPIC_FOLDER_IMG' => $folder_image, 
				'TOPIC_AUTHOR' => $topic_author,
				'REPLIES' => $replies,
				'NEWEST_POST_IMG' => $newest_post_img, 
				'TOPIC_TITLE' => $topic_title,
				'TOPIC_ATTACHMENT_IMG' => topic_attachment_image($topic_rowset[$i]['topic_attachment']),

				'GLOBAL_LINK' => $global_link,
				'GOTO_PAGE' => $goto_page,

				'TOPIC_DESCRIPTION' => $topic_description,

				'TOPIC_TYPE' => $topic_type,
				'VIEWS' => $views,
				'FIRST_POST_TIME' => $first_post_time, 
				'LAST_POST_TIME' => $last_post_time, 
				'LAST_POST_AUTHOR' => $last_post_author, 
				'LAST_POST_IMG' => $last_post_url, 

				'L_TOPIC_FOLDER_ALT' => $folder_alt, 

				'U_VIEW_TOPIC' => $view_topic_url)
			);

			$split_type = '';
			if( $annonce_global==1 )
			{
				$split_type = $lang['Topic_Global_Announcement'];
				$annonce_global=0;

				$template->assign_block_vars('annonce_globale.row.switch_post', array(
					'SPLIT_TYPE' => $split_type
				));
			}
		}

		$template->set_filenames(array('annonce_globale' => 'annonce_globale_body.tpl'));
		$template->assign_var_from_handle('ANNONCE_GLOBALE', 'annonce_globale');
	}
}
// crewstyle's mod : Annonce Globale

//-- mod : mini last visit -----------------------------------------------------
//-- add
function display_last_visit($u_id, $u_lastlogin, $u_allow_viewonline)
{
	global $board_config, $userdata, $lang;

	$has_visited = !empty($u_lastlogin);
	$view_allowed = $u_allow_viewonline || ( ($userdata['user_level'] == ADMIN) || ($userdata['user_id'] == intval($u_id)) );

	return $has_visited ? ( $view_allowed ? create_date($board_config['default_dateformat'], intval($u_lastlogin), $board_config['board_timezone']) : $lang['Hidden_last_visit'] ) : $lang['Never_last_visit'];
}
//-- fin mod : mini last visit -------------------------------------------------

// crewstyle's mod : Rank ProgressBar
function get_rank_progressbar($user_id, $username, $user_gender, $user_rank, $user_posts)
{
	global $db, $lang, $images, $board_config;

	if( $board_config['rank_progressbar'] )
	{
		$rank_img = '';
		$rank_alt = '';

		// Rang spécial ?
		if( !empty($user_rank) )
		{
			$rank_img = 'rank_progressbar_special.gif';

// Start add - Gender MOD
			switch ($user_gender)
			{
				case 1 :
					$rank_alt = sprintf($lang['rank_progressbar_special_male'], $username);
					break;
				case 2 :
					$rank_alt = sprintf($lang['rank_progressbar_special_female'], $username);
					break;
				default :
					$rank_alt = sprintf($lang['rank_progressbar_special'], $username);
					break;
			}
// End add - Gender MOD
		}
		else
		{
			// Obtenir toutes les informations concernant le rang courant de l'utilisateur
			$sql = 'SELECT rank_min
				FROM ' . RANKS_TABLE . '
				WHERE rank_special <> 1
					AND rank_min <= ' . $user_posts . '
				ORDER BY rank_min DESC';
			if ( !($result = $db->sql_query($sql)) )
			{
				message_die(GENERAL_ERROR, 'Couldn\'t read standard ranks', '', __LINE__, __FILE__, $sql);
			}
			$row = $db->sql_fetchrow($result);
			$rank_min = ( empty($row['rank_min']) ) ? -1 : $row['rank_min'];
			$db->sql_freeresult($result);


			// Obtenir toutes les informations concernant le rang suivant
			$sql2 = 'SELECT rank_min, rank_title
				FROM ' . RANKS_TABLE . '
				WHERE rank_special <> 1
					AND rank_min >= ' . $rank_min . '
				ORDER BY rank_min ASC
				LIMIT 0,2';
			if ( !($result2 = $db->sql_query($sql2)) )
			{
				message_die(GENERAL_ERROR, 'Couldn\'t read standard ranks', '', __LINE__, __FILE__, $sql2);
			}

			while( $row2 = $db->sql_fetchrow($result2) )
			{
				$rank_max = $row2['rank_min'];
				$rank_title = $row2['rank_title'];
			}
			$db->sql_freeresult($result2);

			$rank_min = ( $rank_min == -1 ) ? 0 : $rank_min;
			$rank_num = ( $rank_max == $rank_min ) ? -1 : 0;

			// Gestion des différentes valeurs
			if( $rank_num == -1 )
			{
				$rank_img = 'rank_progressbar_no.gif';
				$rank_alt = sprintf($lang['rank_progressbar_no'], $username);
			}
			else if( $rank_num == 0 )
			{
				$rank_hig = intval($rank_max - $rank_min);
				$rank_low = intval($user_posts - $rank_min);
				$rank_dif = intval($rank_max - $user_posts);

				if( ($user_posts == 0) || ($rank_low == 0) || ($rank_hig == 0) || ($rank_hig===$rank_low) )
				{
					$rank_per = '0%';
				}
				else
				{
					$rank_num = floor(($rank_low/$rank_hig)*10);
					$rank_per = floor(($rank_low/$rank_hig)*100) . '%';
				}

				$rank_img = 'rank_progressbar_' . $rank_num . '.gif';
				$rank_alt = ($rank_dif == 1) ? sprintf($lang['rank_progressbar'], $username, $rank_per, $rank_title, $rank_dif) : sprintf($lang['rank_progressbars'], $username, $rank_per, $rank_title, $rank_dif);
			}
		}

		$rank_progressbar = '<img src="' . $board_config['rank_progressbar_folder'] . '/' . $rank_img . '" border="0" alt="' . $rank_alt . '" title="' . $rank_alt . '">';
	}
	else
	{
		$rank_progressbar = '';
	}

	return $rank_progressbar;
}
// crewstyle's mod : Rank ProgressBar

//-- mod : toolbar -------------------------------------------------------------
//-- add
function build_toolbar($mode, $l_privmsgs_text='', $s_privmsg_new=0, $forum_id=0, $tlbr_more='')
{
	global $userdata, $template, $lang, $images, $phpEx;

	// restrict mode input to valid options
	$mode = ( in_array($mode, array('default', 'index', 'viewforum', 'viewtopic')) ) ? $mode : '';

	if ( !empty($mode) && $userdata['session_logged_in'] )
	{
		// init vars
		$s_toolbar = '';

		// toolbar actions details display
		$toolbar_actions = array(
			'inbox' => array('link_pgm' => 'privmsg', 'link_parms' => array('folder' => 'inbox'), 'txt' => $l_privmsgs_text, 'img' => !$s_privmsg_new ? 'tlbr_no_new_pm' : 'tlbr_new_pm'),
			'unanswered' => array('link_pgm' => 'search', 'link_parms' => array('search_id' => 'unanswered'), 'txt' => 'Search_unanswered', 'img' => 'tlbr_unanswered'),
			'newposts' => array('link_pgm' => 'search', 'link_parms' => array('search_id' => 'newposts'), 'txt' => 'Search_new', 'img' => 'tlbr_new'),
			'egosearch' => array('link_pgm' => 'search', 'link_parms' => array('search_id' => 'egosearch'), 'txt' => 'Search_your_posts', 'img' => 'tlbr_self'),
			'forums' => array('link_pgm' => 'index', 'link_parms' => array(POST_FORUM_URL => intval($forum_id), 'mark' => 'forums'), 'txt' => 'Mark_all_forums', 'img' => 'tlbr_markall', 'cond' => $mode == 'index'),
			'topics' => array('link_pgm' => 'viewforum', 'link_parms' => array(POST_FORUM_URL => intval($forum_id), 'mark' => 'topics'), 'txt' => 'Mark_all_topics', 'img' => 'tlbr_markall', 'cond' => !empty($forum_id) && ($mode == 'viewforum' || $mode == 'viewtopic')),
			'viewonline' => array('link_pgm' => 'viewonline', 'link_parms' => '', 'txt' => 'Who_is_Online', 'img' => 'tlbr_viewonline', 'cond' => $mode != 'viewtopic'),
		);

		// add additional actions in toolbar so existing
		if ( !empty($tlbr_more) && is_array($tlbr_more) )
		{
			$toolbar_actions = array_merge($toolbar_actions, $tlbr_more);
		}

		// let's go
		foreach ( $toolbar_actions as $action => $data )
		{
			if ( !isset($data['cond']) || $data['cond'] )
			{
				// build url parms
				$url_parms = '';
				if ( !empty($data['link_parms']) )
				{
					foreach ( $data['link_parms'] as $key => $val )
					{
						if ( !empty($key) && !empty($val) )
						{
							$url_parms .= (empty($url_parms) ? '?' : '&amp;') . $key . '=' . $val;
						}
					}
				}

				// build toolbar
				$s_toolbar .= '<a href="' . append_sid($data['link_pgm']. '.' . $phpEx . $url_parms) . '"><img src="' . $images[ $data['img'] ] . '" alt="' . ( $action == 'inbox' ? $data['txt'] : $lang[ $data['txt'] ] ) . '" title="' . ( $action == 'inbox' ? $data['txt'] : $lang[ $data['txt'] ] ) . '" border="0" /></a>';
			}
		}

		// send to template
		if ( !empty($s_toolbar) )
		{
			// constants
			$template->assign_block_vars('toolbar', array(
				'S_TOOLBAR' => $s_toolbar,
			));
		}
	}
}
//-- fin mod : toolbar ---------------------------------------------------------


// 
// Part of bot MOD: This function checks whether the user agent or ip is
// listed as a bot and returns true otherwise false.
// 
function is_robot() 
{ 
	global $db, $HTTP_SERVER_VARS, $table_prefix;

	
	// get required user data
	$user_ip = $HTTP_SERVER_VARS['REMOTE_ADDR'];
	$user_agent = $HTTP_SERVER_VARS['HTTP_USER_AGENT'];

	// get bot table data
	$sql = "SELECT bot_agent, bot_ip, bot_id, bot_visits, last_visit, bot_pages, bot_name 
	FROM " . BOTS_TABLE;

	if ( !($result = $db->sql_query($sql)) )
	{
		message_die(GENERAL_ERROR, 'Could not obtain bot data.', '', __LINE__, __FILE__, $sql);
	}

	// loop through bots table
	while ($row = $db->sql_fetchrow($result))
	{
		// clear vars
		$agent_match = 0;
		$ip_match = 0;

		// check for user agent match
		foreach (explode('|', $row['bot_agent']) as $bot_agent)
		{
			if ($row['bot_agent'] && $bot_agent != '' && preg_match('#' . preg_quote($bot_agent, '#') . '#i', $user_agent)) $agent_match = 1;
		}

		// check for ip match
		foreach (explode('|', $row['bot_ip']) as $bot_ip)
		{
			if ($row['bot_ip'] && $bot_ip != '' && strpos($user_ip, $bot_ip) === 0)
			{
				$ip_match = 1;
				break;
			}
		}

		// if both ip and agent matched update table and return true
		if ($agent_match == 1 && $ip_match == 1)
		{
			// get time - seconds from epoch
			$today = time();

			$last_visits = explode('|', $row['last_visit']);

			// if half an hour has passed since last visit
			if (($today - (($last_visits[0] == '') ? 0 : $last_visits[0])) > 2700)
			{
				for ($i = ((4 > sizeof($last_visits)) ? sizeof($last_visits) : 4); $i >= 0; $i--)
				{
					if ($last_visits[$i-1] != '') $last_visits[$i] = $last_visits[$i-1];
				}

				// increment the new visit counter
				$row['bot_visits']++;

				// clear prior indexed pages
				$row['bot_pages'] = 1;
			} else {
				// add to indexed pages
				$row['bot_pages']++;
			}

			$last_visits[0] = $today;

			// compress it all together
			$last_visit = implode("|", $last_visits);

			// update table
			$sql = "UPDATE " . BOTS_TABLE . " 
			SET last_visit='$last_visit', bot_visits='" . $row['bot_visits'] . "', bot_pages='" . $row['bot_pages'] . "'
			WHERE bot_id = " . $row['bot_id'];

			if ( !($result2 = $db->sql_query($sql)) )
			{
				message_die(GENERAL_ERROR, 'Couldn\'t update data in bots table.', '', __LINE__, __FILE__, $sql);
			}

			return $row['bot_name'];

		} 
		else 
		{
			if ($agent_match == 1 || $ip_match == 1)

			{

				// get data from table
				$sql = "SELECT pending_" . ((!$agent_match) ? 'agent' : 'ip') . " 
				FROM " . BOTS_TABLE . " 
				WHERE bot_id = " . $row['bot_id'];

				if ( !($result2 = $db->sql_query($sql)) )
				{
					message_die(GENERAL_ERROR, 'Could not obtain bot data.', '', __LINE__, __FILE__, $sql);
				}

				$row2 = $db->sql_fetchrow($result2);

				// add ip/agent to the list
				$pending_array = (( $row2['pending_' . ((!$agent_match) ? 'agent' : 'ip')] ) ? explode('|', $row2['pending_' . ((!$agent_match) ? 'agent' :  'ip')]) : array());

				$found = 0;

				if ( sizeof($pending_array) )
				{
					for ($loop = 0; $loop < count($pending_array); $loop+=2)
					{
						if ($pending_array[$loop] == ((!$agent_match) ? $user_agent : $user_ip)) $found = 1;
					}
				}

				if ($found == 0) 
				{
					$pending_array[] = ((!$agent_match) ? str_replace("|", "&#124;", $user_agent) : $user_ip);
					$pending_array[] = ((!$agent_match) ? $user_ip : str_replace("|", "&#124;", $user_agent));
				}
				$pending = implode("|", $pending_array);

				// update table
				$sql = "UPDATE " . BOTS_TABLE . " 
				SET pending_" . ((!$agent_match) ? 'agent' : 'ip') . "='$pending'
				WHERE bot_id = " . $row['bot_id'];

				if ( !($result2 = $db->sql_query($sql)) )
				{
					message_die(GENERAL_ERROR, 'Couldn\'t update data in bots table.', '', __LINE__, __FILE__, $sql);
				}
			}		
		}
	}
	return 0;
}

?>