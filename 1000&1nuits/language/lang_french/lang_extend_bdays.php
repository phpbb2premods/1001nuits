<?php
/**
*
* @package birthday_event_mod
* @version $Id: lang_extend_bdays.php,v 0.1 28/04/2006 18:08 reddog Exp $
* @copyright (c) 2006 reddog - http://www.reddevboard.com/
* @license http://opensource.org/licenses/gpl-license.php GNU Public License 
*
*/

if (!defined('IN_PHPBB'))
{
	die('Hacking attempt');
}

// date format
$lang['bday_date_format'] =  'd F Y';

// admin part
if ($lang_extend_admin)
{
	// configuration
	$lang['bday_settings'] = 'Options des anniversaires';
	$lang['bday_required'] = 'Anniversaire obligatoire';
	$lang['bday_required_explain'] = 'Obliger les membres à valider une date de naissance';
	$lang['bday_greeting'] = 'Joyeux anniversaire';
	$lang['bday_greeting_explain'] = 'Fêter les anniversaires des utilisateurs ayant validé leur date de naissance, et lister ces derniers sur l\'index du forum';
	$lang['bday_min_age'] = 'Age minimum de l\'utilisateur';
	$lang['bday_max_age'] = 'Age maximum de l\'utilisateur';
}

// main
$lang['bday_birthdays'] = 'Anniversaires';
$lang['bday_required'] = 'Votre date de naissance est exigée sur ce forum';
$lang['bday_day'] = 'Jour';
$lang['bday_month'] = 'Mois';
$lang['bday_year'] = 'Année';
$lang['bday_birthdate'] = 'Date de naissance';
$lang['bday_greeting'] = 'Félicitations à:';
$lang['bday_no_today'] = 'Aucun anniversaire aujourd\'hui';
$lang['bday_none'] = 'Non spécifiée';
$lang['bday_born'] = 'né(e) le %s';
$lang['bday_age'] = 'Age';
$lang['bday_happy'] = 'Joyeux anniversaire à %s';

?>