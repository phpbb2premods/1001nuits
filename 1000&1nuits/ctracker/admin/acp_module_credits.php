<?php
/**  
* <b>acp_module_credits.php</b><br>
* ACP Module to display the CrackerTracker Credits
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
 * Output the page
 */
$template->set_filenames(array(
	'ct_body' => 'ctracker/acp/acp_credits.tpl')
  );


/*
 * Send some vars to the template
 */
$template->assign_vars(array(
	'L_HEADLINE' 		=> $lang['ctracker_credits_head'],
	'L_SUBHEADLINE' 	=> $lang['ctracker_credits_subhead'],
	
	'L_PICTURE_ALT'		=> $lang['ctracker_img_descriptions'],
	
	'L_DONATE'			=> $lang['ctracker_credits_donate'],
	'L_DONATE_EXPL'		=> $lang['ctracker_credits_donate_expl'],
	'L_CREDITS'			=> $lang['ctracker_credits_credits'],
	'L_CREDITS_P1'		=> $lang['ctracker_credits_credits_1'],
	'L_CREDITS_P2'		=> $lang['ctracker_credits_credits_2'],
	'L_CREDITS_P3'		=> $lang['ctracker_credits_credits_3'],
	'L_CREDITS_P4'		=> $lang['ctracker_credits_credits_4'],
	'L_MOD_DOWNLOAD'	=> $lang['ctracker_credits_moddownload'],
	'L_THANKS_TO'		=> $lang['ctracker_credits_thanks'],
	'L_THANKS_TO_TEXT'	=> $lang['ctracker_credits_thanks_text'],
	'L_THANKS_TO_PERS'  => $lang['ctracker_credits_thanks_to'],
	'L_INFO'			=> $lang['ctracker_credits_info'],
	'L_INFO_TEXT'		=> $lang['ctracker_credits_info_text'],
	
	'IMG_ICON_1'		=> $phpbb_root_path . $images['ctracker_icon_cred_1'],
	'IMG_ICON_2'		=> $phpbb_root_path . $images['ctracker_icon_cred_2'],
	'IMG_ICON_3'		=> $phpbb_root_path . $images['ctracker_icon_cred_3'],
	'IMG_ICON_4'		=> $phpbb_root_path . $images['ctracker_icon_cred_4'])
  );
  

// Generate the page
$template->pparse('ct_body');


?>