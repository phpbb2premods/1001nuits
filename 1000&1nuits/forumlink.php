<?php
/***************************************************************************
 * forumlink.php
 * -----------------
 * begin		: Vendredi 15 Septembre 2006
 * copyright	: crewstyle - http://crewstyle.free.fr <crewstyle@free.fr>
 * version		: 2.0.6 - 15/09/2006 17:55
 *
 * $Id		: forumlink.php, v 2.0.6 - 15/09/2006 17:55 - crewstyle Exp $
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

if (defined('IN_PHPBB'))
{
	die('Hacking attempt');
	exit;
}

define('IN_PHPBB', true);
$phpbb_root_path = './';
include($phpbb_root_path . 'extension.inc');
include($phpbb_root_path . 'common.' . $phpEx);

//
// Start initial var setup
//
if ( isset($HTTP_GET_VARS[POST_FORUM_URL]) || isset($HTTP_POST_VARS[POST_FORUM_URL]) )
{
	$forum_id = ( isset($HTTP_GET_VARS[POST_FORUM_URL]) ) ? intval($HTTP_GET_VARS[POST_FORUM_URL]) : intval($HTTP_POST_VARS[POST_FORUM_URL]);
}
else if ( isset($HTTP_GET_VARS['forum']))
{
	$forum_id = intval($HTTP_GET_VARS['forum']);
}
else
{
	$forum_id = '';
}

$sql = 'SELECT forum_link
	FROM ' . FORUMS_TABLE . '
	WHERE forum_id=' . $forum_id;
if ( !($result = $db->sql_query($sql)) )
{
	message_die(GENERAL_ERROR, 'Could not obtain forum information', '', __LINE__, __FILE__, $sql);
}
if ( !($row = $db->sql_fetchrow($result)) )
{
	message_die(GENERAL_MESSAGE, 'This forum doesn\'t exist !');
}

if( !empty($row['forum_link']) )
{
	$sql = 'UPDATE ' . FORUMS_TABLE . '
		SET forum_link_count=forum_link_count+1
		WHERE forum_id=' . $forum_id;
	if ( !($result = $db->sql_query($sql)) )
	{
		message_die(GENERAL_ERROR, 'Could not update forum information', '', __LINE__, __FILE__, $sql);
	}

	$forum_link = ( (!preg_match('#^(http|ftp):\/\/#i', $row['forum_link'])) ? 'http://' : '') . $row['forum_link'];

	$header_location = ( @preg_match('/Microsoft|WebSTAR|Xitami/', getenv('SERVER_SOFTWARE') ) ) ? 'Refresh: 0; URL=' : 'Location: ';
	header($header_location . append_sid($forum_link, true) );
	exit();
}
else
{
	$header_location = ( @preg_match('/Microsoft|WebSTAR|Xitami/', getenv('SERVER_SOFTWARE') ) ) ? 'Refresh: 0; URL=' : 'Location: ';
	header($header_location . append_sid("index.$phpEx", true) );
	exit();
}
$db->sql_freeresult($result);

?>