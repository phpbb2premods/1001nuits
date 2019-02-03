<?php
/**  
* <b>CrackerTracker File: admin_cracker_tracker.php</b><br><br>
* This File implements all ACP Modules for the CrackerTracker Security System.
* 
* 
* @author Christian Knerr (cback)
* @package ctracker
* @version 5.0.0
* @since 26.07.2006 - 13:27:31
* @copyright (c) 2006 www.cback.de
* 
* @license http://opensource.org/licenses/gpl-license.php GNU Public License 
*/

// CTracker_Ignore: File Checked By Human

// Set constants
define('IN_PHPBB', 1);
define('CTRACKER_ACP', true);


/**
 * <b>Module Number Documentation:</b><br><br>
 * 
 *  1:	acp_module_changedfiles.php	<br>
 *  2:	acp_module_credits.php	<br>
 *  3:	acp_module_filescanner.php	<br>
 *  4:	acp_module_globalmessage.php	<br>
 *  5:	acp_module_ipblocker.php	<br>
 *  6:	acp_module_logmanager.php	<br>
 *  7:	acp_module_maintenance.php	<br>
 *  8:	acp_module_miserableuser.php	<br>
 *  9:	acp_module_settings.php	 <br>
 * 10:	acp_module_systemrestore.php	<br>
 * 11:  acp_module_footer.php <br>
 */


// Generate the Modules we need
if( !empty($setmodules) )
{
	$filename = basename(__FILE__);
	$module['ctracker_module_category']['ctracker_module_1']  = $filename . '?modu=1';
	$module['ctracker_module_category']['ctracker_module_2']  = $filename . '?modu=2';
	$module['ctracker_module_category']['ctracker_module_3']  = $filename . '?modu=3';
	$module['ctracker_module_category']['ctracker_module_4']  = $filename . '?modu=4';
	$module['ctracker_module_category']['ctracker_module_5']  = $filename . '?modu=5';
	$module['ctracker_module_category']['ctracker_module_6']  = $filename . '?modu=6';
	$module['ctracker_module_category']['ctracker_module_7']  = $filename . '?modu=7';
	$module['ctracker_module_category']['ctracker_module_8']  = $filename . '?modu=8';
	$module['ctracker_module_category']['ctracker_module_9']  = $filename . '?modu=9';
	$module['ctracker_module_category']['ctracker_module_10'] = $filename . '?modu=10';
	$module['ctracker_module_category']['ctracker_module_11'] = $filename . '?modu=11';
	return;
}


// phpBB Adminsite
$no_page_header  = TRUE;
$phpbb_root_path = './../';

require($phpbb_root_path . 'extension.inc');
require('./pagestart.' . $phpEx);


// Get module number from URL
$module_number   = $HTTP_GET_VARS['modu'];


// Include CrackerTracker Class Files
include($phpbb_root_path . 'ctracker/classes/class_ct_adminfunctions.' . $phpEx);
include($phpbb_root_path . 'ctracker/classes/class_ct_userfunctions.' . $phpEx);
include($phpbb_root_path . 'ctracker/constants.' . $phpEx);
include_once($phpbb_root_path . 'ctracker/classes/class_log_manager.' . $phpEx);


// Include default & CrackerTracker Admin Header
include('./page_header_admin.' . $phpEx);
include($phpbb_root_path . 'ctracker/admin/acp_header.' . $phpEx);


// Include requested modules
switch ( $module_number )
{
	case 1:		include($phpbb_root_path . 'ctracker/admin/acp_module_changedfiles.' . $phpEx);
				break;
			
	case 2:		include($phpbb_root_path . 'ctracker/admin/acp_module_credits.' . $phpEx);
				break;

	case 3:		include($phpbb_root_path . 'ctracker/admin/acp_module_filescanner.' . $phpEx);
				break;

	case 4:		include($phpbb_root_path . 'ctracker/admin/acp_module_globalmessage.' . $phpEx);
				break;
			
	case 5:		include($phpbb_root_path . 'ctracker/admin/acp_module_ipblocker.' . $phpEx);
				break;
			
	case 6:		include($phpbb_root_path . 'ctracker/admin/acp_module_logmanager.' . $phpEx);
				break;
			
	case 7:		include($phpbb_root_path . 'ctracker/admin/acp_module_maintenance.' . $phpEx);
				break;
			
	case 8:		include($phpbb_root_path . 'ctracker/admin/acp_module_miserableuser.' . $phpEx);
				break;
			
	case 9:		include($phpbb_root_path . 'ctracker/admin/acp_module_settings.' . $phpEx);
				break;

	case 10:	include($phpbb_root_path . 'ctracker/admin/acp_module_systemrestore.' . $phpEx);
				break;
				
	case 11:    include($phpbb_root_path . 'ctracker/admin/acp_module_footer.' . $phpEx);
				break;
			
	default:	message_die(GENERAL_MESSAGE, $lang['ctracker_wrong_module']);
				break;
										
}


// Include default & CrackerTracker Admin Footer
include($phpbb_root_path . 'ctracker/admin/acp_footer.' . $phpEx);
include('./page_footer_admin.' . $phpEx);


?>
