<?php
/**
*
* @package class_common_mod
* @version $Id: class_common.php,v 0.4 26/08/2006 20:38 reddog Exp $
* @copyright (c) 2006 reddog - http://www.reddevboard.com/
* @license http://opensource.org/licenses/gpl-license.php GNU Public License 
*
*/

if ( !defined('IN_PHPBB') )
{
	die('Hacking attempt');
}

/**
* common global functions
*/

/**
* _butt
*
* This function is back-ported from Categories Hierarchy 2.1.x by Ptirhiik
* Used with image buttons to return an _x and _y value in the $_POST array
*/
function _butt($var)
{
	global $HTTP_POST_VARS, $HTTP_GET_VARS;

	if ( isset($HTTP_POST_VARS[$var . '_x']) && isset($HTTP_POST_VARS[$var . '_y']) )
	{
		$HTTP_POST_VARS[$var] = true;
	}
	return (isset($HTTP_POST_VARS[$var]) && !empty($HTTP_POST_VARS[$var]));
}

/**
* _cvt_pic_butts
*
* This function is back-ported from Categories Hierarchy 2.1.x by Ptirhiik
* Used to convert pic buttons to standard input
*/
function _cvt_pic_butts()
{
	global $HTTP_POST_VARS;

	if ( !empty($HTTP_POST_VARS) )
	{
		$added = array();
		foreach ($HTTP_POST_VARS as $key => $val)
		{
			$var = substr($key, 0, strlen($key)-2);
			if (($key == $var . '_x') && isset($HTTP_POST_VARS[$var . '_y']))
			{
				$added[$var] = true;
			}
		}
		$HTTP_POST_VARS += $added;
	}
}

/**
* request_var
*
* Used to get passed variable
*/
function request_var($var, $type, $dft='')
{
	global $HTTP_POST_VARS, $HTTP_GET_VARS;

	// adjust with dft
	$val = $dft;

	if ( !empty($var) )
	{
		if ( isset($HTTP_POST_VARS[$var]) || isset($HTTP_GET_VARS[$var]) )
		{
			$val = isset($HTTP_POST_VARS[$var]) ? $HTTP_POST_VARS[$var] : $HTTP_GET_VARS[$var];
		}
	}

	switch ($type)
	{
		case TYPE_INT: // integer
			$res = intval($val);
			break;
		case TYPE_FLOAT: // numeric
			$res = doubleval($val);
			break;
		case TYPE_NO_HTML: // no slashes nor html
			$res = htmlspecialchars(trim($val));
			break;
		default:
			$res = (!empty($val)) ? str_replace('<br />', "\n", $val) : false;
			break;
	}

	return $res;
}

/**
* _hide_build
*
* Build simple hidden fields from array
*/
function _hide_build($field_ary)
{
	global $s_hidden_fields;

	$s_hidden_fields = '';

	if ( !empty($field_ary) && is_array($field_ary) )
	{
		foreach ( $field_ary as $name => $value )
		{
			$s_hidden_fields .= '<input type="hidden" name="' . addslashes(stripslashes($name)) . '" value="' . addslashes(stripslashes($value)) . '" />';
		}

		return $s_hidden_fields;
	}
}

/**
* _hide_send
*
* Send hidden fields to template
*/
function _hide_send($tpl_varname='S_HIDDEN_FIELDS')
{
	global $s_hidden_fields, $template;

	$template->assign_vars(array($tpl_varname => $s_hidden_fields));
}

/**
* Common class
*
* This class contains some functions used by various Modules,
* and allows to gather them in only one place.
*/
class common
{
	/**
	* sql_escape_string
	*
	* This has been back-ported from categories hierarchy 2.1.x
	*/
	function sql_escape_string($str)
	{
		return str_replace(array('\\\'', '\\"'), array('\'\'', '"'), addslashes($str));
	}

	/**
	* _smart
	*
	* Get the float or integer value of a variable
	* Escapes special characters in a string for use in a SQL statement
	*/
	function _smart(&$value)
	{
		// stripslashes
		$value = stripslashes($value);

		if ( is_numeric($value) )
		{
			return ( is_float($value) ) ? doubleval($value) : intval($value);
		}
		if ( is_string($value) || empty($value) )
		{
			return '\'' . $this->sql_escape_string(htmlspecialchars($value)) . '\'';
		}

		// uncastable var : let's do a basic protection on it to prevent sql injection attempt
		return '\'' . $this->sql_escape_string(htmlspecialchars($value)) . '\'';
	}

	/**
	* set_config
	*
	* Set config value. Creates missing config entry.
	*/
	function set_config($config_name, $config_value)
	{
		global $db, $board_config;

		// stripslashes
		$config_name = stripslashes($config_name);

		if ( !isset($board_config[$config_name]) )
		{
			$sql = 'INSERT INTO ' . CONFIG_TABLE . '
				(config_name, config_value) VALUES (\'' . $this->sql_escape_string($config_name) . '\', ' . $this->_smart($config_value) . ')';
		}
		else
		{
			$sql = 'UPDATE ' . CONFIG_TABLE . '
				SET config_value = ' . $this->_smart($config_value) . '
				WHERE config_name = \'' . $this->sql_escape_string($config_name) . '\'';
		}
		$db->sql_query($sql, false, __LINE__, __FILE__);

		$board_config[$config_name] = $config_value;
	}
}

?>