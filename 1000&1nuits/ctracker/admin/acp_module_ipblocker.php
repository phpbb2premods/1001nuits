<?php
/**  
* <b>acp_module_ipblocker.php</b><br>
* The IP, Proxy and UserAgent Blocker of CrackerTracker
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
 * Define Template File
 */
$template->set_filenames(array(
	'ct_body' => 'ctracker/acp/acp_ipblocker.tpl')
);


/*
 * Delete entry?
 */
if ( $HTTP_GET_VARS['mode'] == 'remove' )
{
	$ctracker_config->delete_from_blocklist($HTTP_GET_VARS['id']);
	$template->assign_block_vars('deleted', array(
			'L_SUCCESSFULLY_DELETED' => $lang['ctracker_ipb_deleted'])
	);
}
else if ( $HTTP_GET_VARS['mode'] == 'add' )
{
	$ctracker_config->save_to_blocklist($HTTP_POST_VARS['entry']);
	$template->assign_block_vars('added', array(
			'L_SUCCESSFULLY_ADDED' => $lang['ctracker_ipb_added'])
	);	
}

/*
 * Load CrackerTracker Blocklist from the Database
 */
$ctracker_config->verbose = true;
$ctracker_config->load_blocklist();
$row_class = false;

for ( $i = 0; $i < $ctracker_config->blocklist_count; $i++ )
{
	$row_class = !$row_class;

	$template->assign_block_vars('ipblocker', array(
		'ROW_CLASS'		=> ( $row_class )? 'row1': 'row2',
		'BLOCKER_VALUE'	=> $ctracker_config->blocklist[$i],
		'BLOCKER_ID'	=> append_sid('admin_cracker_tracker.' . $phpEx . '?modu=5&mode=remove&id=' . $ctracker_config->blocklist_id[$i]),
		'IMG_ICON'		=> $phpbb_root_path . $images['ctracker_global_res'],
		'L_DELETE'		=> $lang['ctracker_ipb_delete'])
	);
}


/*
 * Send some vars to the template
 */
$template->assign_vars(array(
		'L_BLOCKLIST'	=> $lang['ctracker_ipb_blocklist'],
		'L_HEADLINE'	=> $lang['ctracker_ipb_head'],
		'L_SUBHEADLINE' => $lang['ctracker_ipb_description'],
		'L_NEW_ENTRY'	=> $lang['ctracker_ipb_new_entry'],
		'L_ADD_NOW'		=> $lang['ctracker_ipb_add_now'],
		
		'IMG_INFO'		=> $phpbb_root_path . $images['ctracker_fc_icon_2'],
		'IMG_DELETED'	=> $phpbb_root_path . $images['ctracker_global_res'],
				
		'S_FORM_ACTION' => append_sid('admin_cracker_tracker.' . $phpEx . '?modu=5&mode=add'))
  );
  

// Generate the page
$template->pparse('ct_body');


?>
