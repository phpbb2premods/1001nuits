<?php
/**
*
* @package rank_color_system_mod [English]
* @version $Id: lang_extend_rcs.php,v 0.7 21/09/2006 18:49 reddog Exp $
* @copyright (c) 2006 reddog - http://www.reddevboard.com/
* @license http://opensource.org/licenses/gpl-license.php GNU Public License 
*
*/

if ( !defined('IN_PHPBB') )
{
	die('Hacking attempt');
}

// admin part
if ($lang_extend_admin)
{
	// acp menu
	$lang['Config_rcs_acp'] = 'Ranks color';
	$lang['rcs_a_settings'] = 'Settings';
	$lang['rcs_b_manage'] = 'Manage';

	// rcs settings part
	$lang['rcs_settings_title'] = 'Rank Color System Settings';
	$lang['rcs_settings_title_desc'] = 'Using this form you can manage Rank Color System settings.';
	$lang['rcs_style_settings'] = 'Style settings';
	$lang['rcs_cache_settings'] = 'Cache settings';
	$lang['rcs_main_settings'] = 'Main settings';

	$lang['rcs_enable'] = 'Enable rank color system';
	$lang['rcs_enable_desc'] = 'Display users and groups colors on the whole board.';
	$lang['rcs_group_stats'] = 'Groups color';
	$lang['rcs_group_stats_desc'] = 'Display groups color on the board index.';
	$lang['rcs_groups_level'] = 'Level groups';
	$lang['rcs_groups_level_desc'] = 'Display level groups on the board index.';
	$lang['rcs_group_admin'] = 'Administrator';
	$lang['rcs_group_mod'] = 'Moderator';

	$lang['rcs_select_style'] = 'Select style';
	$lang['rcs_admincolor'] = 'Administrator group colour';
	$lang['rcs_modcolor'] = 'Moderator group colour';
	$lang['rcs_usercolor'] = 'User group colour';

	$lang['rcs_cache_regen'] = 'Regenerate the cache';
	$lang['rcs_cache_last_generation'] = 'Data last regeneration';
	$lang['rcs_cache'] = 'Enable rank color system cache';

	// rcs management part
	$lang['rcs_manage_title'] = 'Rank Color System Management';
	$lang['rcs_manage_title_desc'] = 'Here you can edit, delete, create and re-order ranks color.';
	$lang['rcs_add_title'] = 'Add a new rank color';
	$lang['rcs_add_title_desc'] = 'Here you can define the new rank color fields.';
	$lang['rcs_edit_title'] = 'Edit <span%s>%s</span> rank color';
	$lang['rcs_edit_title_desc'] = 'Here you can modify the fields of the selected rank color.';

	$lang['rcs_name'] = 'Rank name';
	$lang['rcs_name_desc'] = 'You can use a lang entry key (check your language/lang_<i>your_language</i>/lang_*.php), or enter directly the rank name.';
	$lang['rcs_color'] = 'Rank color';
	$lang['rcs_color_desc'] = 'You can select a value from the color picker or enter directly it (without #). Leave blank to use a CSS class named like the rank.';
	$lang['rcs_single'] = 'Individual rank';
	$lang['rcs_single_desc'] = 'this rank could be only selected for users.';
	$lang['rcs_display'] = 'Display rank';
	$lang['rcs_display_desc'] = 'Display the rank on the board index.';
	$lang['rcs_move_after'] = 'Move this rank after';

	$lang['rcs_pick_color'] = 'Pick a color';

	// actions
	$lang['rcs_updated'] = 'The rank was successfully updated.';
	$lang['rcs_added'] = 'The rank was successfully added.';
	$lang['rcs_removed'] = 'The rank was successfully removed.';
	$lang['rcs_order_updated'] = 'Ranks order was successfully updated.';
	$lang['rcs_confirm_delete'] = 'Are you sure you want to delete this rank?';
	$lang['rcs_confirm_delete_selected'] = 'Are you sure you want to delete the selected ranks?';

	$lang['rcs_setup_updated'] = 'The rank color system setup has been updated.';
	$lang['rcs_cache_succeed'] = 'Rank color system cache succeed.';
	$lang['rcs_cache_failed'] = 'Rank color system cache failed. The cache has been disabled.';
	$lang['rcs_cache_disabled'] = 'The cache is disabled. Enable before regenerating it.';
	$lang['rcs_style_updated'] = 'Level groups colors succeed.';

	$lang['rcs_click_return'] = 'Click %sHere%s to return to the previous page.';
	$lang['rcs_click_return_settings'] = 'Click %sHere%s to return to the rank color system settings.';
	$lang['rcs_click_return_manage'] = 'Click %sHere%s to return to rank color system management.';

	// errors
	$lang['rcs_not_exists'] = 'This rank does not exist.';
	$lang['rcs_must_select'] = 'You must select a rank.';
	$lang['rcs_must_fill'] = 'You must fill all fields.';
	$lang['rcs_no_valid_action'] = 'The action you are trying to perform is not supported.';
	$lang['rcs_no_ranks_create'] = 'No ranks are available. Please hit "Create" to add some.';

	// groups and users edition
	$lang['Top'] = '___Top___';
	$lang['rcs_select_rank'] = 'Select Rank Color';
}

// group control panel
$lang['usergroups_list'] = 'Usergroups List';
$lang['select_usergroup'] = 'Select Usergroup';
$lang['select_usergroup_details'] = 'select an usergroup to view information of them.';

// usergroups management
$lang['rcs_change_default'] = 'Change default group';

// display
$lang['Legend'] = 'Legend';
$lang['Administrator'] = 'Administrator';
$lang['Moderator'] = 'Moderator';
$lang['User'] = 'User';

?>