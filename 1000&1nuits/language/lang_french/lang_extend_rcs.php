<?php
/**
*
* @package rank_color_system_mod [French]
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
	$lang['Config_rcs_acp'] = 'Rangs de couleur';
	$lang['rcs_a_settings'] = 'Configuration';
	$lang['rcs_b_manage'] = 'Gestion';

	// rcs settings part
	$lang['rcs_settings_title'] = 'Configuration du syst�me des rangs de couleurs';
	$lang['rcs_settings_title_desc'] = 'En utilisant ce formulaire, vous pouvez g�rer la configuration du syst�me des rangs de couleurs.';
	$lang['rcs_style_settings'] = 'Configuration du th�me';
	$lang['rcs_cache_settings'] = 'Configuration du cache';
	$lang['rcs_main_settings'] = 'Configuration g�n�rale';

	$lang['rcs_enable'] = 'Activer le syst�me des rangs de couleurs';
	$lang['rcs_enable_desc'] = 'Afficher les couleurs des utilisateurs et des groupes sur l\'ensemble du forum.';
	$lang['rcs_group_stats'] = 'Groupes de couleur';
	$lang['rcs_group_stats_desc'] = 'Afficher les groupes de couleur sur l\'index du forum.';
	$lang['rcs_groups_level'] = 'Groupes de niveau';
	$lang['rcs_groups_level_desc'] = 'Afficher les groupes de niveau sur l\'index du forum.';
	$lang['rcs_group_admin'] = 'Administrateur';
	$lang['rcs_group_mod'] = 'Mod�rateur';

	$lang['rcs_select_style'] = 'S�lectionner le th�me';
	$lang['rcs_admincolor'] = 'Couleur du groupe administrateur';
	$lang['rcs_modcolor'] = 'Couleur du groupe mod�rateur';
	$lang['rcs_usercolor'] = 'Couleur du groupe utilisateur';

	$lang['rcs_cache_regen'] = 'R�g�n�rer le cache';
	$lang['rcs_cache_last_generation'] = 'Derni�re r�g�n�ration';
	$lang['rcs_cache'] = 'Activer le cache du syst�me des rangs de couleurs';

	// rcs management part
	$lang['rcs_manage_title'] = 'Gestion du syst�me des rangs de couleur';
	$lang['rcs_manage_title_desc'] = 'Vous pouvez ici �diter, supprimer, cr�er et trier les rangs de couleur.';
	$lang['rcs_add_title'] = 'Ajouter un nouveau rang de couleur';
	$lang['rcs_add_title_desc'] = 'Vous pouvez ici d�finir les champs du nouveau rang de couleur.';
	$lang['rcs_edit_title'] = 'Edition du rang de couleur <span%s>%s</span>';
	$lang['rcs_edit_title_desc'] = 'Vous pouvez ici modifier les champs du rang de couleur s�lectionn�.';

	$lang['rcs_name'] = 'Nom du rang';
	$lang['rcs_name_desc'] = 'Vous pouvez utiliser une cl� du tableau $lang[] (cf. language/lang_<i>votre_language</i>/lang_*.php), ou entrer le nom en clair.';
	$lang['rcs_color'] = 'Couleur du rang';
	$lang['rcs_color_desc'] = 'Vous pouvez s�lectionner une couleur depuis le <i>color picker</i>, ou entrer directement la valeur (sans #). Laisser vide pour utiliser une classe CSS nomm�e comme le rang.';
	$lang['rcs_single'] = 'Rang individuel';
	$lang['rcs_single_desc'] = 'ce rang ne pourra �tre attribu� qu\'� des utilisateurs.';
	$lang['rcs_display'] = 'Afficher le rang';
	$lang['rcs_display_desc'] = 'Afficher le rang sur l\'index du forum.';
	$lang['rcs_move_after'] = 'Positionner ce rang apr�s';

	$lang['rcs_pick_color'] = 'S�lectionner une couleur';

	// actions
	$lang['rcs_updated'] = 'Le rang a �t� mis � jour avec succ�s.';
	$lang['rcs_added'] = 'Le rang a �t� ajout� avec succ�s.';
	$lang['rcs_removed'] = 'Le rang a �t� supprim� avec succ�s.';
	$lang['rcs_order_updated'] = 'Le positionnement du rang a �t� mis � jour avec succ�s.';
	$lang['rcs_confirm_delete'] = '�tes-vous s�r de vouloir supprimer ce rang ?';
	$lang['rcs_confirm_delete_selected'] = '�tes-vous s�r de vouloir supprimer les rangs s�lectionn�s ?';

	$lang['rcs_setup_updated'] = 'La configuration du syst�me des rangs de couleur a �t� mise � jour.';
	$lang['rcs_cache_succeed'] = 'La mise en cache du syst�me des rangs de couleur a abouti.';
	$lang['rcs_cache_failed'] = 'La mise en cache du syst�me des rangs de couleur a �chou�. Le cache a �t� d�sactiv�.';
	$lang['rcs_cache_disabled'] = 'Le cache est d�sactiv�. Activez le avant de le r�g�n�rer.';
	$lang['rcs_style_updated'] = 'Les couleurs des groupes de niveau ont �t� mise � jour avec succ�s.';

	$lang['rcs_click_return'] = 'Cliquez %sici%s pour revenir � la page pr�c�dente.';
	$lang['rcs_click_return_settings'] = 'Cliquez %sici%s pour retourner � la configuration du syst�me des rangs de couleur.';
	$lang['rcs_click_return_manage'] = 'Cliquez %sici%s pour retourner � la gestion du syst�me des rangs de couleur.';

	// errors
	$lang['rcs_not_exists'] = 'Ce rang n\'existe pas.';
	$lang['rcs_must_select'] = 'Vous devez s�lectionner un rang.';
	$lang['rcs_must_fill'] = 'Vous devez remplir tous les champs.';
	$lang['rcs_no_valid_action'] = 'Cette action n\'est pas support�e.';
	$lang['rcs_no_ranks_create'] = 'Aucune rang n\'est disponible. Cliquez sur "Cr�er" pour en ajouter un.';

	// groups and users edition
	$lang['Top'] = '___ D�but ___';
	$lang['rcs_select_rank'] = 'S�lectionner un rang de couleur';
}

// group control panel
$lang['usergroups_list'] = 'Liste des groupes d\'utilisateurs';
$lang['select_usergroup'] = 'S�lectionner un groupe d\'utilisateurs';
$lang['select_usergroup_details'] = 's�lectionner un groupe d\'utilisateurs pour en voir les informations.';

// usergroups management
$lang['rcs_change_default'] = 'Changer le groupe par d�faut';

// display
$lang['Legend'] = 'L�gende';
$lang['Administrator'] = 'Administrateur';
$lang['Moderator'] = 'Mod�rateur';
$lang['User'] = 'Utilisateur';

?>