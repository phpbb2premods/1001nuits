<?php
/***************************************************************************
 *                              page_tail.php
 *                            -------------------
 *   begin                : Saturday, Feb 13, 2001
 *   copyright            : (C) 2001 The phpBB Group
 *   email                : support@phpbb.com
 *
 *   $Id: page_tail.php,v 1.27.2.4 2005/09/14 18:14:30 acydburn Exp $
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
 ***************************************************************************/

if ( !defined('IN_PHPBB') )
{
	die('Hacking attempt');
}

global $do_gzip_compress;


//
// Show the overall footer.
//
$admin_link = ( $userdata['user_level'] == ADMIN ) ? '<a href="admin/index.' . $phpEx . '?sid=' . $userdata['session_id'] . '">' . $lang['Admin_panel'] . '</a><br /><br />' : '';

$template->set_filenames(array(
	'overall_footer' => ( empty($gen_simple_header) ) ? 'overall_footer.tpl' : 'simple_footer.tpl')
);

include_once($phpbb_root_path . 'ctracker/engines/ct_footer.' . $phpEx);
$output_login_status = ($userdata['ct_enable_ip_warn'])? $lang['ctracker_ma_on'] : $lang['ctracker_ma_off'];

$template->assign_vars(array(
	'TRANSLATION_INFO' => (isset($lang['TRANSLATION_INFO'])) ? $lang['TRANSLATION_INFO'] : ((isset($lang['TRANSLATION'])) ? $lang['TRANSLATION'] : ''),
	'CRACKER_TRACKER_FOOTER' => create_footer_layout($ctracker_config->settings['footer_layout']),
	'L_STATUS_LOGIN' => ($ctracker_config->settings['login_ip_check'])? sprintf($lang['ctracker_ipwarn_info'], $output_login_status) : '',	
	'ADMIN_LINK' => $admin_link)
);

//-- Board Generation Time Info ------------------------------------------------
//-- Disable
/*-MOD
$template->pparse('overall_footer');
MOD-*/
//-- End MOD Board Generation Time Info ----------------------------------------

//
// Close our DB connection.
//
$db->sql_close();

//
// Compress buffered output if required and send to browser
//
if ( $do_gzip_compress )
{
	//
	// Borrowed from php.net!
	//
	$gzip_contents = ob_get_contents();
	ob_end_clean();

	$gzip_size = strlen($gzip_contents);
	$gzip_crc = crc32($gzip_contents);

	$gzip_contents = gzcompress($gzip_contents, 9);
	$gzip_contents = substr($gzip_contents, 0, strlen($gzip_contents) - 4);

	echo "\x1f\x8b\x08\x00\x00\x00\x00\x00";
	echo $gzip_contents;
	echo pack('V', $gzip_crc);
	echo pack('V', $gzip_size);
}

//-- Board Generation Time Info ------------------------------------------------
//-- Add
$endtime = microtime(); 
$endtime = explode(" ", microtime()); 
$endtime = $endtime[1] + $endtime[0]; 
$gentime = round(($endtime - $starttime), 5);

$template->assign_vars(array(
  'L_GZIP' => ($board_config['gzip_compress']) ? $lang['L_GZIP_ENABLED'] : $lang['L_GZIP_DISABLED'],
  'L_NUMBER_QUERIES' => sprintf($lang['L_MYSQL_QUERIES'],  $db->num_queries),
  'L_GENERATION_TIME' => sprintf($lang['L_GENERATION_TIME'], $gentime)
  )
);

$template->pparse('overall_footer');
//-- End MOD Board Generation Time Info ----------------------------------------

exit;

?>