<?php
/**
* <b>CrackerTracker File: ct_security.php</b><br><br>
* 
* This file is responsible for the worm protection Unit of the CrackerTracker
* Security System. The File includes a definition Array wich is used to
* heuristically scan URL requests for attacks.
* 
* We included some virtual Troopers for you. ;-)
* 
*    
* @author Christian Knerr (cback)
* @package ctracker
* @version 5.0.0
* @since 15.07.2006 - 21:36:24
* @copyright (c) 2006 www.cback.de
* 
* @license http://opensource.org/licenses/gpl-license.php GNU Public License 
*/

if( !defined('IN_PHPBB') )
{
	die("Hacking attempt!");
}


/*
 * The first thing we do now is checking the integrity of the $phpbb_root_path
 * because CrackerTracker will need it later. With this step we prevent that
 * scripts without the $phpbb_root_path or without a validated $phpbb_root_path
 * can be executed.
 */
if ( !preg_match('/^[.\/]{1,}$/', $phpbb_root_path) || empty($phpbb_root_path) )
{
	/*
	 * Create a HTML error Message output
	 */
	$htmloutput = '<html>
				     <head>
    				   <title>CBACK CrackerTracker :: Security Alert</title>
  					 </head>
  					 <body>
    				   <br>
    				   <div align="center">
      				   <table style="border:2px solid #000000" border="0" width="600" cellpadding="10" cellspacing="0">
         			     <tr>
          				   <td align="left" bgcolor="#000000"><font face="Tahoma, Arial, Helvetica" size="4" color="#FFFFFF"><b>SECURITY ALERT &raquo; &raquo; &raquo; &raquo;</b></font></td>
        				 </tr>
        				 <tr>
          				   <td bgcolor="#FFF4BF" align="left">
          						<font face="Tahoma, Arial, Helvetica" size="2" color="#000000">
          						  CBACK CrackerTracker stopped your script because the engine detected
          						  that the script you want to execute has not initialized the var
          						  <b>$phpbb_root_path</b> correctly.
          						  <br><br>
          						  This could be a potential security risk for this board.
          						  <br><br>
          						  If you are not the admin of this Board please contact him and tell him from
          						  this warning message and what you have done that he has the possibility to
          						  fix that problem.
          						</font>
          				    </td>
        				   </tr>
      				     </table>
    				   </div>
  					 </body>
				   </html>';
				   
	// Lets stop the script
	die($htmloutput);
}


/*
 * Now we define an array where all definition data is saved in.
 * After that we check URL committals for potential worm acitivities
 */
$ct_rules = array('http_', '_server', 'delete%20', 'drop%20', 'create%20',
				  'update%20', 'insert%20', 'select%20', 'bulk%20', 'union%20',
				  'or%20', 'and%20', 'exec', '@@', '%22', 'openquery',
				  'openrowset', 'msdasql', 'sqloledb', 'sysobjects', 'syscolums',
				  'syslogins', 'sysxlogins', 'char%20', 'into%20', 'load%20',
				  '*', 'msys', 'alert%20', 'eval%20', 'onkeyup', 'x5cx',
				  'fromcharcode', 'javascript:', 'javascript.', 'vbscript:',
				  'vbscript.', 'http-equiv', '->', 'expression%20', 'url%20',
				  'innerhtml', 'document.', 'style%20', 'dynsrc', 'jsessionid',
				  'phpsessid', '<applet', '<div', '<emded', '<iframe', '<img',
				  '<meta', '<object', '<script', '<textarea', 'onabort', 'onblur',
				  'onchange', 'onclick', 'ondblclick', 'ondragdrop', 'onerror',
				  'onfocus', 'onkeydown', 'onkeypress', 'onload', 'onmouse',
				  'onmove', 'onreset', 'onresize', 'onselect', 'onsubmit',
				  'onunload', 'onreadystatechange', 'xmlhttp', 'uname%20',
				  'id%20', 'ls%20', 'cat%20', 'rm%20', 'kill%20', 'mail%20',
				  'wget%20', 'wget(', 'pwd%20', 'objectclass', 'objectcategory',
				  '<!-%20', 'total%20', 'http%20request', 'phpb8b4f2a0',
				  'phpinfo', 'php:', 'globals', '%2527', '%2e', 'chr(',
				  'chr=', 'chr%20', '%20chr', 'cmd=', 'cmd%20', '%20cmd', 'rush=',
				  '%20rush', 'rush%20', 'union%20', '%20union', 'union(', 'union=',
				  '%20echr', 'esystem', 'cp%20', 'cp(', '%20cp', 'mdir%20',
				  '%20mdir', 'mdir(', 'mcd%20', 'mrd%20', 'rm%20', '%20mcd',
				  '%20mrd', '%20rm', 'mcd(', 'mrd(', 'rm(', 'mcd=', 'mrd=', 'mv%20',
				  'rmdir%20', 'mv(', 'rmdir(', 'chmod(', 'chmod%20', 'cc%20',
				  '%20chmod', 'chmod(', 'chmod=', 'chown%20', 'chgrp%20', 'chown(',
				  'chgrp(', 'locate%20', 'grep%20', 'locate(', 'grep(', 'diff%20',
				  'kill%20', 'kill(', 'killall', 'passwd%20', '%20passwd',
				  'passwd(', 'telnet%20', 'vi(', 'vi%20', 'nigga(', '%20nigga',
				  'nigga%20', 'fopen', 'fwrite', '%20like', 'like%20', '$_',
				  '$get', '.system', 'http_php', '%20getenv', 'getenv%20',
				  'new_password', '/password', 'etc/', '/groups', '/gshadow',
				  'http_user_agent', 'http_host', 'bin/', 'wget%20', 'uname%5c',
				  'uname\\', 'usr', '/chgrp', '=chown', 'usr/bin', 'g%5c',
				  'g\\', 'bin/python', 'bin/tclsh', 'bin/nasm', 'perl%20',
				  'traceroute%20', 'tracert%20', 'ping%20', '.pl',
				  '/usr/x11r6/bin/xterm', 'lsof%20', '/mail', '.conf', 'motd%20',
				  'http/1.', '.inc.php', 'config.php', 'cgi-', '.eml', 'file%5c://',
				  'file\:', 'file://', 'window.open', 'img src', 'img%20src',
				  '.jsp', 'ftp.', 'xp_enumdsn', 'xp_availablemedia',
				  'xp_filelist', 'nc.exe', '.htpasswd', 'servlet', '/etc/passwd',
				  'wwwacl', '~root', '~ftp', '.js', '.jsp', '.history',
				  'bash_history', '~nobody', 'server-info', 'server-status',
				  '%20reboot', '%20halt', '%20powerdown', '/home/ftp', '=reboot',
				  'www/', 'init%20','=halt', '=powerdown', 'ereg(', 'secure_site',
				  'chunked', 'org.apache', '/servlet/con', 'robot.txt',
				  '/robot', 'mod_gzip_status', '.inc', '.system', 'getenv',
				  'http_', '_php', 'php_', 'phpinfo()', '<?php', '?>', '%3Fphp',
				  '%3F>', 'sql=', '_global', 'global_', 'global[', '_server',
				  'server_', 'server[', '/modules', 'modules/', 'phpadmin',
				  'root_path', '_globals', 'globals_', 'globals[', 'iso-8859-1',
				  '?hl=', '%3fhl=', '.txt', '.exe', '.sh', '%00', '_env');

// Initialize detector var
$ct_attack_detection = false;

// Write query String in the var $cracktrack and make it lowercase
$cracktrack = $HTTP_SERVER_VARS['QUERY_STRING'];
$cracktrack = strtolower($cracktrack);

// Prevent tricks wich comment out SQL commands
$cracktrack = str_replace('/', '', $cracktrack);
$cracktrack = str_replace('*', '', $cracktrack);

// Now we do a very simple method to mark potential Worm activities
$checkworm = str_replace($ct_rules, '*', $cracktrack);
if ( $cracktrack != $checkworm )
{
	$ct_attack_detection = true;
}

// Now we have a look to $HTTP_POST_VARS
foreach ( $HTTP_POST_VARS as $post_var_fieldname => $post_var_field_value )
{
	// Some fields in $HTTP_POST_VARS don't get checked to prevent wrong detection
	$unchecked_fields   = array('username', 'password', 'subject', 'message',
								'poll_title', 'poll_option', 'poll_delete',
								'email', 'confirm_code', 'aim', 'msn', 'yim',
								'interests', 'occupation', 'signature', 'website',
								'location', 'search', 'sitename', 'word',
								'replacement', 'help', 'last_msg', 'quote',
								'preview', 'post', 'mode');
	$is_unchecked_field = str_replace($unchecked_fields, '', $post_var_fieldname);
	
	if ( $is_unchecked_field == $post_var_fieldname )
	{
		// Prevent tricks wich comment out SQL commands
		$post_var_field_value = str_replace('/', '', $post_var_field_value);
		$post_var_field_value = str_replace('*', '', $post_var_field_value);
		
		// Now we do a very simple method to mark potential Worm activities
		$check_post_var = str_replace($ct_rules, '*', $post_var_field_value);
		if ( $post_var_field_value != $check_post_var )
		{
			$ct_attack_detection = true;
			break;
		}		
	}	
}


if ( $ct_attack_detection )
{
	// include class for Logfile Management
	include_once($phpbb_root_path . 'ctracker/classes/class_log_manager.' . $phpEx);
	
	// write data into logfile
	$logfile = new log_manager();
	$logfile->write_worm();
	unset($logfile);
	
	// generate HTML Message
	$htmloutput = '<html>
				     <head>
    				   <title>CBACK CrackerTracker :: Security Alert</title>
  					 </head>
  					 <body>
    				   <br>
    				   <div align="center">
      				   <table style="border:2px solid #000000" border="0" width="600" cellpadding="10" cellspacing="0">
         			     <tr>
          				   <td align="left" bgcolor="#000000"><font face="Tahoma, Arial, Helvetica" size="4" color="#FFFFFF"><b>SECURITY ALERT &raquo; &raquo; &raquo; &raquo;</b></font></td>
        				 </tr>
        				 <tr>
          				   <td bgcolor="#FFDFDF" align="left">
          						<font face="Tahoma, Arial, Helvetica" size="2" color="#000000">
          						  <b>CBACK CrackerTracker</b> has detected a potential attack on this site with a worm
          						  or exploit script so the Security System stopped the script.
          						  <br><br><br>
          						  If you can see this page after including a new MOD into your board or after clicking
          						  on a link please contact the Board Administrator with this error message and a description
          						  what you have done before you could see this page, that the Admin has the possibility to
          						  fix the problem.
          						</font>
          				    </td>
        				   </tr>
      				     </table>
    				   </div>
  					 </body>
				   </html>';
				   
	// stop the script
	die($htmloutput);
}

// Tell the self test that this script was included correctly
define('protection_unit_one', true);

?>