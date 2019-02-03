<?php
/**  
* <b>CrackerTracker File: ct_varsetter.php</b><br><br>
* 
* This file handles resets of used vars in the board to bring in a higher
* level of security because unsecure scripts can't tell an attacker anymore
* wich values a var had before. (For example sensible vars from the config.php)
* 
* 
* @author Christian Knerr (cback)
* @package ctracker
* @version 5.0.0
* @since 16.07.2006 - 01:38:41
* @copyright (c) 2006 www.cback.de
* 
* @license http://opensource.org/licenses/gpl-license.php GNU Public License 
*/

if( !defined('IN_PHPBB') )
{
	die("Hacking attempt!");
}


/*
 * Here we unset some vars used before, for examplte to connect to the Database.
 * These values are not needed anymore so they just are a higher security risk
 * if someone could access these vars over an insecure script file.
 */

unset($dbname);					// Unset Database Name
unset($dbuser);					// Unset Database Username
unset($dbpasswd);				// Unset Database Password var
unset($db->password);			// Unset Database Password in DB Class
unset($message);				// Unset Message var (for example used for posts)
unset($highlight);				// Unset Highlighting Var
unset($sql);					// Unset maybe injected SQL Commands in this var




/*
 * In this step we include the CBACK CrackerTracker Database Class and
 * we load the CrackerTracker Configuration from Database in our Settings-Object
 * to use it all over the board where we need it.
 */
include($phpbb_root_path . 'ctracker/classes/class_ct_database.' . $phpEx);
$ctracker_config = new ct_database();


// Tell the self test that this file was included correctly
define('protection_unit_two', true);

?>
