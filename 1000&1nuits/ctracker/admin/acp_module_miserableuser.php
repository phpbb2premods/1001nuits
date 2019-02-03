<?php
/**  
* <b>acp_module_miserableuser.php</b><br>
* Here you can manage users wich you marked as "Miserable User"
* 
* @author Christian Knerr (cback)
* @package ctracker
* @version 5.0.0
* @since 26.07.2006 - 13:29:09
* @copyright (c) 2006 www.cback.de
* 
* @license http://opensource.org/licenses/gpl-license.php GNU Public License 
*/

// Constant check
if ( !defined('IN_PHPBB') || !defined('CTRACKER_ACP') )
{
	die('Hacking attempt!');
}


/*
 * Template definition
 */
$template->set_filenames(array(
	'ct_body' => 'ctracker/acp/acp_miserableuser.tpl')
);


if ( isset($HTTP_POST_VARS['submit']) )
{
	$user_id 	= 0;
	$user_level = 0;
	$this_userdata = get_userdata($HTTP_POST_VARS['username'], true);
	
	if( !$this_userdata )
	{
		message_die(GENERAL_MESSAGE, $lang['No_user_id_specified'] );
	}
	
	
	if ( $this_userdata['user_level'] == ADMIN || $this_userdata['user_level'] == MOD )
	{
		// Admin or Mods can not be defined as miserable user
		$template->assign_block_vars('infobox', array(
				'COLOR'				=> 'FFDFDF',
				'L_MESSAGE_TEXT'	=> $lang['ctracker_mu_error_admin'])
		);
	}
	else
	{
		// Mark user as miserable user
		$sql = 'UPDATE ' . USERS_TABLE . ' SET ct_miserable_user = 1 WHERE user_id = ' . $this_userdata['user_id'];
				
		// Execute SQL Command in database
		if ( !$result = $db->sql_query($sql) )
		{
			message_die(GENERAL_ERROR, $lang['ctracker_error_updating_userdata'], '', __LINE__, __FILE__, $sql);
		}		
		
		$template->assign_block_vars('infobox', array(
				'COLOR'				=> 'DBFFCF',
				'L_MESSAGE_TEXT'	=> $lang['ctracker_mu_success'])
		);
	}
}
else if ( $HTTP_GET_VARS['mode'] == 'unmis' )
{
	$userid = intval($HTTP_GET_VARS['userid']);
	$sql = 'UPDATE ' . USERS_TABLE . ' SET ct_miserable_user = 0 WHERE user_id = ' . $userid;
				
	// Execute SQL Command in database
	if ( !$result = $db->sql_query($sql) )
	{
		message_die(GENERAL_ERROR, $lang['ctracker_error_updating_userdata'], '', __LINE__, __FILE__, $sql);
	}
	
	$template->assign_block_vars('infobox', array(
			'COLOR'				=> 'DBFFCF',
			'L_MESSAGE_TEXT'	=> $lang['ctracker_mu_deleted'])
	);
}


// List output
$sql = 'SELECT * FROM ' . USERS_TABLE . ' WHERE ct_miserable_user = 1';
		
if ( !($result = $db->sql_query($sql)) )
{
	message_die(GENERAL_ERROR, $lang['ctracker_error_loading_config'], '', __LINE__, __FILE__, $sql);
}

// Define some vars
$row_class = false;
$entry_def = false;
		
while ( $row = $db->sql_fetchrow($result) )
{
	$row_class = !$row_class;	// row class changer without counter
	$entry_def = true;			// yes, we have users in our list!
	
	$template->assign_block_vars('output', array(
			'ROW_CLASS'		=>	($row_class)? 'row1' : 'row2',
			'U_DELLINK'		=> append_sid('admin_cracker_tracker.' . $phpEx . '?modu=8&mode=unmis&userid=' . $row['user_id']),
			'L_USERNAME'	=> $row['username'])
	);
}

// No entry in List?
($entry_def)? null: $template->assign_block_vars('no_entry', array());

/*
 * Send some vars to the template
 */
$template->assign_vars(array(
		'U_SEARCH_USER' 	=> append_sid("./../search.$phpEx?mode=searchuser"),
		'S_FORM_ACTION'	 	=> append_sid('admin_cracker_tracker.' . $phpEx . '?modu=8'),
		'L_HEADLINE'		=> $lang['ctracker_mu_head'],
		'L_SUBHEADLINE' 	=> $lang['ctracker_mu_subhead'],
		'L_MARK_MU'			=> $lang['ctracker_mu_select'],
		'L_LOOK_UP'			=> $lang['ctracker_mu_send'],
		'L_FIND_USERNAME'	=> $lang['ctracker_mu_find'],
		'L_USER_ENTR'		=> $lang['ctracker_mu_entr'],
		'L_TH1'				=> $lang['ctracker_mu_uname'],
		'L_TH2'				=> $lang['ctracker_mu_remove'],
		'L_DELETE'			=> $lang['ctracker_ipb_delete'],
		'L_NOTHING'			=> $lang['ctracker_mu_no_defined'])
  );
  

// Generate the page
$template->pparse('ct_body');


?>
