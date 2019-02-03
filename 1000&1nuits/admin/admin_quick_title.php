<?php
/***************************************************************************
*                             admin_quick_title.php
*                              -------------------
*     begin                : Tue July 15, 2003
*     copyright            : (C) 2003 Xavier Olive
*     email                : xavier@2037.biz
*
*     begin                : Mon May 15, 2006
*     copyright            : Oxytanium Team
*     email                : webmaster@oxytanium.com
*
*     $Id: admin_quick_title.php,v 1.1.3 2006/06/06 11:26:00
*
****************************************************************************/

/***************************************************************************
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation; either version 2 of the License, or
 *   (at your option) any later version.
 *
 ***************************************************************************/

define('IN_PHPBB', 1);

if( !empty($setmodules) )
{
	$file = basename(__FILE__);
	$module['General']['Title_infos'] = $file;
	return;
}

/**
* Let's set the root dir for phpBB
*/
$phpbb_root_path = './../';
require($phpbb_root_path . 'extension.inc');
require('./pagestart.' . $phpEx);
$start = ( isset($HTTP_GET_VARS['start']) ) ? $HTTP_GET_VARS['start'] : 0;
if( isset($HTTP_GET_VARS['mode']) || isset($HTTP_POST_VARS['mode']) )
{
	$mode = ($HTTP_GET_VARS['mode']) ? $HTTP_GET_VARS['mode'] : $HTTP_POST_VARS['mode'];
	$mode = htmlspecialchars($mode);
}
else 
{
  /**
  * These could be entered via a form button
  */
	if( isset($HTTP_POST_VARS['add']) )
	{
		$mode = 'add';
	}
	else if( isset($HTTP_POST_VARS['save']) )
	{
		$mode = 'save';
	}
	else
	{
		$mode = '';
	}
}

if( $mode != '' )
{
  if( $mode == 'edit' || $mode == 'add' )
	{
    /**
    * They want to add a new title info, show the form
    */
		$title_id = ( isset($HTTP_GET_VARS['id']) ) ? intval($HTTP_GET_VARS['id']) : 0;
		$s_hidden_fields = '';

		if( $mode == 'edit' )
		{
		  if( empty($title_id) )
			{
				message_die(GENERAL_MESSAGE, $lang['Must_select_title']);
			}

			$sql = 'SELECT * FROM ' . TITLE_INFOS_TABLE . '
				WHERE id = '.$title_id;
			if(!$result = $db->sql_query($sql))
			{
				message_die(GENERAL_ERROR, 'Couldn\'t obtain title data', '', __LINE__, __FILE__, $sql);
			}

			$title_info = $db->sql_fetchrow($result);
			$s_hidden_fields .= '<input type="hidden" name="id" value="' . $title_id . '" />';
		}
		else
		{
		}

		$s_hidden_fields .= '<input type="hidden" name="mode" value="save" />';
		$template->set_filenames(array(
			'body' => "admin/title_edit_body.tpl")
		);

		$title_pos_left = ( $title_info['title_pos'] ) ? "checked=\"checked\"" : '';
		$title_pos_right = ( !$title_info['title_pos'] ) ? "checked=\"checked\"" : '';

		if ( !empty($title_info['info_color']) )
		{
			$template->assign_block_vars('no_info_color', array());
		}

		$template->assign_vars(array(
			'S_TITLE_ACTION'        => append_sid("admin_quick_title.$phpEx"),
			'S_HIDDEN_FIELDS'       => $s_hidden_fields,

			'TITLE_INFO'            => str_replace("\"", "'", $title_info['title_info']),
			'ADMIN_CHECKED'         => ($title_info['admin_auth']==1) ? 'CHECKED' : '',
			'MOD_CHECKED'           => ($title_info['mod_auth']==1) ? 'CHECKED' : '',
			'POSTER_CHECKED'        => ($title_info['poster_auth']==1) ? 'CHECKED' : '',
			'DATE_FORMAT'           => $title_info['date_format'],
			'S_POS_LEFT'            => $title_pos_left,
			'S_POS_RIGHT'           => $title_pos_right,
			'COLOR_INFO'            => str_replace("\"", "'", $title_info['info_color']),

			'L_TITLE_TITLE'         => $lang['Add_new_title_info'],
			'ADMIN_TITLE'           => $lang['Title_infos'],
			'ADMIN_TITLE_EXPLAIN'   => $lang['Quick_title_explain'],

			'L_TITLE_INFO'          => $lang['Title_info'],
			'L_PERM_EXPLAIN'        => $lang['Title_perm_info_explain'],

			'L_PERM_INFO'           => $lang['Title_perm_info'],
			'ADMIN'                 => $lang['Administrator'],
			'MODERATOR'             => $lang['Moderator'],
			'POSTER'                => $lang['Topic_poster'],

			'L_DATE_FORMAT'         => $lang['Date_format'],
			'L_DATE_FORMAT_EXPLAIN' => $lang['Date_format_explain'],

			'L_TITLE_POS'           => $lang['Title_pos'],
			'L_TITLE_POS_EXPLAIN'   => $lang['Title_pos_explain'],
			'L_RIGHT'               => $lang['Title_Right'],
			'L_LEFT'                => $lang['Title_Left'],

			'L_COLOR_INFO'          => $lang['Color_info'],
			'L_COLOR_INFO_EXPLAIN'  => $lang['Color_info_explain'],

// -- This part comes from reddog's Rank Color System --------------------------
// -- add
			'I_PICK_COLOR'          => $images['rcs_pick_color'],
// -- End Add ------------------------------------------------------------------

			'L_SUBMIT'              => $lang['Submit'],
			'L_RESET'               => $lang['Reset'])
		);
	}
	else if( $mode == 'save' )
	{
    /**
    * Ok, they sent us our info, let's update it
    */
		$title_id   = ( isset($HTTP_POST_VARS['id']) ) ? intval($HTTP_POST_VARS['id']) : 0;
		$name       = ( isset($HTTP_POST_VARS['title_info']) ) ? trim($HTTP_POST_VARS['title_info']) : '';
		$admin      = (!empty($HTTP_POST_VARS['admin_auth']) ) ? 1 : 0 ;
		$mod        = (!empty($HTTP_POST_VARS['mod_auth']) ) ? 1 : 0 ;
		$poster     = (!empty($HTTP_POST_VARS['poster_auth']) ) ? 1 : 0 ;
		$date       = ( isset($HTTP_POST_VARS['date_format']) ) ? trim($HTTP_POST_VARS['date_format']) : '';
		$title_pos  = (!empty($HTTP_POST_VARS['title_pos']) ) ? 1 : 0 ;
		$info_color = ( isset($HTTP_POST_VARS['info_color']) ) ? trim($HTTP_POST_VARS['info_color']) : '';

		if( $name == '' )
		{
			message_die(GENERAL_MESSAGE, $lang['Must_select_title']);
		}

    /**
    * Format hexa no valid - User error
    */
		if ( !empty($info_color) )
		{
			if ( ctype_xdigit($info_color) == false || strlen($info_color) <> 6 )
			{
				message_die(GENERAL_MESSAGE, '<br />' .$lang['Field_error'] . $lang['Color_info'] . '<br /><br />' . $lang['Format_error'], $lang['Title_infos']);
			}
		}

		if ($title_id)
		{
			$sql = "UPDATE " . TITLE_INFOS_TABLE . " 
				SET title_info = '" . str_replace("\'", "''", $name) . "', info_color = '" . str_replace("\'", "''", $info_color) . "', date_format = '" . str_replace("\'", "''", $date) . "', title_pos = $title_pos, admin_auth = $admin, mod_auth = $mod, poster_auth = $poster
				WHERE id = $title_id";
			$message = $lang['Title_updated'];
		}
		else
		{
			$sql = "INSERT INTO " . TITLE_INFOS_TABLE . " (title_info, info_color, admin_auth, mod_auth, poster_auth, date_format, title_pos)
				VALUES ('" . str_replace("\'", "''", $name) . "','" . str_replace("\'", "''", $info_color) . "', $admin, $mod, $poster,'" . str_replace("\'", "''", $date) . "', $title_pos)";
			$message = $lang['Title_added'];
		}

		if( !$result = $db->sql_query($sql) )
		{
			message_die(GENERAL_ERROR, 'Couldn\'t update/insert into title_infos table', '', __LINE__, __FILE__, $sql);
		}
		$message .= '<br /><br />' . sprintf($lang['Click_return_titleadmin'], "<a href=\"" . append_sid("admin_quick_title.$phpEx") . "\">", "</a>") . "<br /><br />" . sprintf($lang['Click_return_admin_index'], "<a href=\"" . append_sid("index.$phpEx?pane=right") . "\">", "</a>");

		message_die(GENERAL_MESSAGE, $message);
	}
	else if( $mode == 'delete' )
	{
		/**
		* Ok, they want to delete their title
		*/
		if( isset($HTTP_POST_VARS['id']) || isset($HTTP_GET_VARS['id']) )
		{
			$title_id = ( isset($HTTP_POST_VARS['id']) ) ? intval($HTTP_POST_VARS['id']) : intval($HTTP_GET_VARS['id']);
		}
		else
		{
			$title_id = 0;
		}

		if( $title_id )
		{
			$sql = 'DELETE FROM ' . TITLE_INFOS_TABLE . ' 
				WHERE id = '.$title_id;
			if( !$result = $db->sql_query($sql) )
			{
				message_die(GENERAL_ERROR, 'Couldn\'t delete title data', '', __LINE__, __FILE__, $sql);
			}
			$message = $lang['Title_removed'] . '<br /><br />' . sprintf($lang['Click_return_titleadmin'], "<a href=\"" . append_sid("admin_quick_title.$phpEx") . "\">", "</a>") . "<br /><br />" . sprintf($lang['Click_return_admin_index'], "<a href=\"" . append_sid("index.$phpEx?pane=right") . "\">", "</a>");

			message_die(GENERAL_MESSAGE, $message);
		}
		else
		{
			message_die(GENERAL_MESSAGE, $lang['Must_select_title']);
		}
	}
	else
	{
		/**
		* They didn't feel like giving us any information. Oh, too bad, we'll just display the list then...
		*/
		$template->set_filenames(array(
			'body' => "admin/title_list_body.tpl")
		);

		$sql = 'SELECT * FROM ' . TITLE_INFOS_TABLE . '  
			ORDER BY id ASC';
		if( !$result = $db->sql_query($sql) )
		{
			message_die(GENERAL_ERROR, 'Couldn\'t obtain title data', '', __LINE__, __FILE__, $sql);
		}

		$title_rows  = $db->sql_fetchrowset($result);
		$title_count = count($title_rows);

		$template->assign_vars(array(
			'S_TITLE_ACTION'      => append_sid("admin_quick_title.$phpEx"),

			'ADMIN_TITLE'         => $lang['Title_infos'],
			'ADMIN_TITLE_EXPLAIN' => $lang['Quick_title_explain'],

			'HEAD_TITLE'          => $lang['Title_head'],
			'L_COLOR_INFO'        => $lang['Color_info'],
			'HEAD_AUTH'           => $lang['Title_auth'],
			'HEAD_DATE'           => $lang['Date_format'],
			'HEAD_POS'            => $lang['Title_pos'],

			'ADD_NEW'             => $lang['Add_new'],
			'L_EDIT'              => $lang['Edit'],
			'L_DELETE'            => $lang['Delete'])
		);

		for( $i = 0; $i < $title_count; $i++)
		{
			$title_id  = $title_rows[$i]['id'];
			$row_color = ( !($i % 2) ) ? $theme['td_color1'] : $theme['td_color2'];
			$perm      = ($title_rows[$i]['admin_auth']==1) ? $lang['Administrator'].'</br>' : '';
			$perm     .= ($title_rows[$i]['mod_auth']==1) ? $lang['Moderator'].'</br>' : '';
			$perm     .= ($title_rows[$i]['poster_auth']==1) ? $lang['Topic_poster'] : '';
			$row_class = ( !($i % 2) ) ? $theme['td_class1'] : $theme['td_class2'];

			$template->assign_block_vars("title", array(
				'TITLE'          => $title_rows[$i]['title_info'],
				'ROW_COLOR'      => "#" . $row_color,
				'COLOR_INFO'     => trim($title_rows[$i]['info_color']),
				'PERMISSIONS'    => $perm,
				'ROW_CLASS'      => $row_class,
				'DATE_FORMAT'    => $title_rows[$i]['date_format'],
				'TITLE_POS'      => $title_rows[$i]['title_pos'],

				'U_TITLE_EDIT'   => append_sid("admin_quick_title.$phpEx?mode=edit&amp;id=$title_id"),
				'U_TITLE_DELETE' => append_sid("admin_quick_title.$phpEx?mode=delete&amp;id=$title_id"))
			);
		}
	}
}
else
{
	/**
	* Show the default page
	*/
	$template->set_filenames(array(
		'body' => "admin/title_list_body.tpl")
	);

	$sql = "SELECT * FROM " . TITLE_INFOS_TABLE . "  
		ORDER BY id ASC LIMIT $start, 40";
	if( !$result = $db->sql_query($sql) )
	{
		message_die(GENERAL_ERROR, 'Couldn\'t obtain title data', '', __LINE__, __FILE__, $sql);
	}
		
	$title_rows  = $db->sql_fetchrowset($result);
	$title_count = count($title_rows);

	$sql = 'SELECT count(*) AS total
	  FROM ' . TITLE_INFOS_TABLE;
	if ( !($result = $db->sql_query($sql)) ) 
	{ 
	  message_die(GENERAL_ERROR, 'Error getting total informations for title', '', __LINE__, __FILE__, $sql); 
	}

	if ( $total = $db->sql_fetchrow($result) ) 
	{ 
	  $total_records = $total['total']; 
	  $pagination = generate_pagination("admin_quick_title.$phpEx?mode=$mode", $total_records, 40, $start). ' '; 
	} 

	$template->assign_vars(array(
	  'ADMIN_TITLE'         => $lang['Title_infos'],
		'ADMIN_TITLE_EXPLAIN' => $lang['Quick_title_explain'],
		'HEAD_TITLE'          => $lang['Title_head'],
		'L_COLOR_INFO'        => $lang['Color_info'],
		'HEAD_AUTH'           => $lang['Title_auth'],
		'HEAD_DATE'           => $lang['Date_format'],
		'HEAD_POS'            => $lang['Title_pos'],
		'L_EDIT'              => $lang['Edit'],
		'L_DELETE'            => $lang['Delete'],
		'PAGINATION'          => $pagination,
		'ADD_NEW'             => $lang['Add_new'],
		'S_TITLE_ACTION'      => append_sid("admin_quick_title.$phpEx"))
	);
		
	for( $i = 0; $i < $title_count; $i++)
	{
		$title_id  = $title_rows[$i]['id'];
		$row_color = ( !($i % 2) ) ? $theme['td_color1'] : $theme['td_color2'];
		$row_class = ( !($i % 2) ) ? $theme['td_class1'] : $theme['td_class2'];
		$perm      = ($title_rows[$i]['admin_auth']==1) ? $lang['Administrator'].'</br>' : '';
		$perm     .= ($title_rows[$i]['mod_auth']==1) ? $lang['Moderator'].'</br>' : '';
		$perm     .= ($title_rows[$i]['poster_auth']==1) ? $lang['Topic_poster'] : '';

	  if ( $title_rows[$i]['title_pos'] )
	  {
			$title_pos_translation = $lang['Title_Left'];
		}
		else
		{
			$title_pos_translation = $lang['Title_Right'];
		}

		$template->assign_block_vars("title", array(
			'TITLE'          => '<span style="color:#' . trim($title_rows[$i]['info_color']) . '">' . $title_rows[$i]['title_info'] . '</span>',
			'COLOR_INFO'     => trim($title_rows[$i]['info_color']),
			'ROW_COLOR'      => "#" . $row_color,
			'ROW_CLASS'      => $row_class,
			'PERMISSIONS'    => $perm,
			'DATE_FORMAT'    => $title_rows[$i]['date_format'],
			'TITLE_POS'      => $title_pos_translation,

			'U_TITLE_EDIT'   => append_sid("admin_quick_title.$phpEx?mode=edit&amp;id=$title_id"),
			'U_TITLE_DELETE' => append_sid("admin_quick_title.$phpEx?mode=delete&amp;id=$title_id"))
		);
  }
}

$template->pparse('body');
include('./page_footer_admin.'.$phpEx);

?>
