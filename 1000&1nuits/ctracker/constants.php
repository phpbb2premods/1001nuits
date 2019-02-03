<?php
/**  
* In this file we have some constants we use in some places of the
* CrackerTracker System and we define some definitions for the Spammer
* and Throw-Away Mail detection. Definition Updates will also just be
* a replacement of this file. ;-)
* 
* @author Christian Knerr (cback)
* @package ctracker
* @version 5.0.0
* @since 22.07.2006 - 01:57:01
* @copyright (c) 2006 www.cback.de
* 
* @license http://opensource.org/licenses/gpl-license.php GNU Public License 
*/


if ( !defined('IN_PHPBB') )
{
	die("Hacking attempt!");
}


/*
 * Constants we need
 */
define('CTRACKER_VERSION', '5.0.0');		// CrackerTracker Version
define('CT_FIRST_ADMIN_UID', '2');			// UserID of the first Admin


/*
 * Extended Definitions
 */
$ct_spammer_def = array();					// Reset Definition Array "Spammer"
$ct_mailscn_def = array();					// Reset Definition Array "Mailscan"
$ct_userspm_def = array();					// Reset Definition Array "Userblocks"


$ct_spammer_def = array(
	'*pills*',
	'*viagra*',
	'*phentermine*',
	'*buycheapphenter*',
	'*animalporn*',
	'*online*roulette*',
	'*on*line*casino*',
	'*casino*on*line*',
	'*masterbell.net*',
	'*Your*site*there*is*future*',
	'*online*dating*',
	'*forumgratis.com*',
	'*valium*',
	'*fantasticsex*',
	'*free-sex*',
	'*free*nice*pics*',
	'*you*search*friend*',
	'*dating*',
	'*flirt*',
	'*my_photos*');


$ct_mailscn_def = array(
	'*@bumpymail.com',
	'*@centermail.com',
	'*@centermail.net',
	'*@discardmail.com',
	'*@emailias.com',
	'*@ghosttexter.de',
	'*@jetable.net',
	'*@mailexpire.com',
	'*@mailinator.com',
	'*@messagebeamer.de',
	'*@mytrashmail.com',
	'*@trashmail.net',
	'*@nervmich.net',
	'*@netzidiot.de',
	'*@nurfuerspam.de',
	'*@privacy.net',
	'*@punkass.com',
	'*@sneakemail.com',
	'*@sofort-mail.de',
	'*@spamex.com',
	'*@spamgourmet.com',
	'*@spamhole.com',
	'*@spaminator.de',
	'*@spammotel.com',
	'*@spamtrail.com',
	'*@trash-mail.de',
	'*@emaildienst.de',
	'*@temporarily.de',
	'*@temporaryinbox.com',
	'*@willhackforfood.biz',
	'*@emailto.de',
	'*@dumpmail.de',
	'*@spamoff.de',
	'*@twinmail.de',
	'*@gawab.com',
	'*@mail.ru',
	'*@*boom.ru',
	'*@m-s-n.net',
	'*@*cigarettes.*',
	'*@*pharmacy.*',
	'*@net-search.org',
	'*@my-yep.com',
	'*@ezigaretten.*',
	'*@portsaid.cc',
	'*@pisem.net');
	

$ct_userspm_def = array(
	'funtklakow',
	'jtfoe1974',
	'unmmyns',
	'coldsorin',
	'fairlande',
	'largepafilis',
	'pirsrv',
	'sadlatour',
	'bighor-lam',
	'greatfintan',
	'budowa_cepa',
	'cepelin',
	'yuriyhoy',
	'printerxp',
	'kololos');

?>
