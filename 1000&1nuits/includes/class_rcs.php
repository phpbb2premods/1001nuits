<?php
/**
*
* @package rank_color_system_mod
* @version $Id: class_rcs.php,v 0.10 20/09/2006 17:31 reddog Exp $
* @copyright (c) 2006 reddog - http://www.reddevboard.com/
* @license http://opensource.org/licenses/gpl-license.php GNU Public License 
*
*/

if ( !defined('IN_PHPBB') )
{
	die('Hacking attempt');
}

class rcs_setup
{
	var $ext;
	var $root;
	var $cache_dir;

	var $rcs_cached;
	var $rcs_enabled;
	var $rcs_group_mod;
	var $rcs_group_adm;
	var $rcs_group_stats;

	function rcs_setup()
	{
		global $phpbb_root_path, $board_config;

		// basic parameters
		$this->ext = substr(strrchr(__FILE__, '.'), 0);
		$this->root = &$phpbb_root_path;
		$this->cache_dir = $this->root . 'cache/';

		// common variables
		$this->rcs_cached = $board_config['cache_rcs'];
		$this->rcs_enabled = $board_config['rcs_enable'];
		$this->rcs_group_mod = $board_config['rcs_group_mod'];
		$this->rcs_group_adm = $board_config['rcs_group_admin'];
		$this->rcs_group_stats = $board_config['rcs_group_stats'];

		// basic setup
		$this->_constants();
	}

	function _constants()
	{
		global $table_prefix;

		// table name
		define('RCS_TABLE', $table_prefix . 'rcs');

		// url parameters
		define('RCS_USER_URL', 'uc');
		define('RCS_GROUP_URL', 'gc');
		define('RCS_LEVEL_URL', 'level');
	}

	function get($var_name)
	{
		$this->from_cache = false;

		if ( $this->rcs_cached )
		{
			if ( !$this->_exists($var_name) )
			{
				return false;
			}

			@include($this->cache_dir . 'data_' . $var_name . $this->ext);

			$this->gentime = ( empty($this->gentime) || ($this->gentime < $data_time) ) ? $data_time : $this->gentime;
			$this->from_cache = !empty($data_time);

			return isset($data) ? $data : false;
		}
		else
		{
			return false;
		}
	}

	function put($var_name, $var)
	{
		if ( $this->rcs_cached )
		{
			if ($fp = @fopen($this->cache_dir . 'data_' . $var_name . $this->ext, 'wb'))
			{
				@flock($fp, LOCK_EX);
				@fwrite($fp, "<?php\n\nif ( !defined('IN_PHPBB') ) { die('Hacking attempt'); }\n\n\$data_time = " . time() . ";\n\n\$data = unserialize('" . str_replace('\'', '\\\'', str_replace('\\', '\\\\', serialize($var))) . "');\n\n?>");
				@flock($fp, LOCK_UN);
				@fclose($fp);
				@umask(0000);
				@chmod($this->cache_dir . 'data_' . $var_name . $this->ext, 0666);
			}
		}
	}

	function _exists($var_name)
	{
		return file_exists($this->cache_dir . 'data_' . $var_name . $this->ext);
	}
}

class rcs extends rcs_setup
{
	var $gentime;
	var $from_cache;
	var $list_ids;

	var $id_color;
	var $id_group;

	/**
	* main functions
	*/

	function lng_item($key)
	{
		global $lang;

		return isset($lang[$key]) ? $lang[$key] : $key;
	}

	function constructor($list, $tpl_varname='LIST_BOX')
	{
		global $template;

		$template->assign_vars(array(
			'LIST_NAME' => $list['name'],
			'LIST_WIDTH' => !empty($list['width']) ? ' style="width:' . intval($list['width']) . 'px;"' : '',
			'LIST_HTML' => !empty($list['html']) ? $list['html'] : '',
		));

		$opt = false;
		$curoptgroup = '';
		foreach ( $list['items'] as $elem )
		{
			// build element
			$template->assign_block_vars('element', array(
				'NAME' => $elem['name'],
				'VALUE' => $elem['value'],
				'STYLE' => $elem['style'],
				'SELECTED' => $elem['selected'] ? ' selected="selected"' : '',
			));

			// build optgroup
			if ( isset($elem['optgroup']) && ($elem['optgroup'] != $curoptgroup) )
			{
				if ( $opt )
				{
					$template->assign_block_vars('element.optgroup_close', array());
					$opt = false;
				}
				if ( !empty($elem['optgroup']) )
				{
					$template->assign_block_vars('element.optgroup_open', array(
						'LABEL' => $elem['optgroup'],
					));
					$curoptgroup = $elem['optgroup'];
					$opt = true;
				}
			}
		}

		// close optgroup so still open
		if ( $opt )
		{
			$template->assign_block_vars('optgroup', array());
			$opt = false;
		}

		// send the display
		$template->set_filenames(array('list_box' => 'list_box.tpl'));
		$template->assign_var_from_handle($tpl_varname, 'list_box');
	}

	function get_style($r_name, $r_color)
	{
		return empty($r_color) ? ' class="' . $r_name . '"' : ' style="color:#' . $r_color . '; font-weight:bold;"';
	}

	function select_colors($select, $single=false)
	{
		global $db, $lang;

		$single = !empty($single);
		$sql = 'SELECT *
			FROM ' . RCS_TABLE . '
				WHERE rcs_single = ' . intval($single) . '
			ORDER BY rcs_order ASC';
		if ( !$result = $db->sql_query($sql) )
		{
			message_die(GENERAL_ERROR, 'Could not obtain rank color system data', '', __LINE__, __FILE__, $sql);
		}

		$items = array();
		$items[] = array('name' => $lang['None'], 'value' => 0, 'style' => '', 'selected' => '');
		while ($slct_rcs = $db->sql_fetchrow($result))
		{
			$items[] = array('name' => $this->lng_item($slct_rcs['rcs_name']), 'value' => intval($slct_rcs['rcs_id']), 'style' => $this->get_style($slct_rcs['rcs_name'], $slct_rcs['rcs_color']), 'selected' => ($select == intval($slct_rcs['rcs_id'])));
		}
		$db->sql_freeresult($result);

		$rank_list = array('name' => 'rcs_rank', 'width' => 150, 'items' => $items);
		$this->constructor($rank_list);
	}

	/**
	* cache functions
	*/

	function obtain_ids_colors(&$id_color, $force=false)
	{
		if ( !$this->rcs_enabled )
		{
			return false;
		}

		// try with the cache
		$this->id_color = $this->get('rcs');

		// read tables if no data or force
		if ( (!$this->id_color && !$this->from_cache) || $force )
		{
			global $db;

			$sql = 'SELECT g.group_id, r.rcs_id, r.rcs_name, r.rcs_color, r.rcs_single, r.rcs_display
				FROM (' . RCS_TABLE . ' r
					LEFT JOIN ' . GROUPS_TABLE . ' g ON g.group_color = r.rcs_id )
				ORDER BY rcs_order ASC';
			if ( !$result = $db->sql_query($sql) )
			{
				message_die(GENERAL_ERROR, 'Could not obtain rank color system data', '', __LINE__, __FILE__, $sql);
			}

			$count = 0;
			$this->id_color = array();
			while ($row = $db->sql_fetchrow($result))
			{
				$types = array(
					RCS_GROUP_URL => array('key' => $row['group_id'], 'fields' => array('name', 'color'), 'cond' => ($row['group_id'] && !$row['rcs_single'])),
					RCS_USER_URL => array('key' => $row['rcs_id'], 'fields' => array('name', 'color'), 'cond' => (!$row['group_id'] && $row['rcs_single'])),
					'legend' => array('key' => $count, 'fields' => array('id', 'name', 'color', 'single', 'display')),
				);

				foreach ( $types as $type => $data )
				{
					if ( !isset($data['cond']) || $data['cond'] )
					{
						$fields = array();
						foreach ( $data['fields'] as $field )
						{
							$fields += array_merge($fields, array(
								$field => $row['rcs_' . $field],
							));
						}
						$this->id_color[ $type ][ $data['key'] ] = $fields;
					}
				}
				$count++;
			}
			$db->sql_freeresult($result);

			$this->put('rcs', $this->id_color);
		}

		return;
	}

	/**
	* users functions
	*/

	function get_group_user_ids($group_id=false, $dft=false)
	{
		global $db;

		if ( $group_id === false )
		{
			return false;
		}

		$rows_clause = !empty($dft) ? 'u.user_group_id = ug.group_id' : 'u.user_id = ug.user_id';
		$sql = 'SELECT u.user_id
			FROM ' . USER_GROUP_TABLE . ' ug
				LEFT JOIN ' . USERS_TABLE . ' u
					ON ' . $rows_clause . '
				WHERE ug.group_id = ' . intval($group_id) . '
					AND ug.user_pending <> 1';
		if ( !$result = $db->sql_query($sql) )
		{
			message_die(GENERAL_ERROR, 'Failed to obtain user ids', '', __LINE__, __FILE__, $sql);
		}

		$this->list_ids = array();
		while ($row = $db->sql_fetchrow($result))
		{
			$row_id = $row['user_id'];
			if ( !empty($row_id) )
			{
				$this->list_ids[ intval($row_id) ] = true;
			}
		}
		$db->sql_freeresult($result);
	}

	function update_user_group_id($user_id_ary=false, $group_id=false, $checking=false, $default_id=false)
	{
		global $db;

		if ( !empty($user_id_ary) || !empty($this->list_ids) )
		{
			$user_id_ary = ( !empty($this->list_ids) && empty($user_id_ary) ) ? implode(', ', array_keys($this->list_ids)) : $user_id_ary;
			$checking_mode = ( (intval($group_id) == intval($default_id)) ? '<> ' : '= ' ) . intval($default_id);

			$sql = 'UPDATE ' . USERS_TABLE . '
				SET user_group_id = ' . intval($group_id) . '
				WHERE user_id IN (' . $user_id_ary . ')' .
					( !empty($checking) ? ' AND user_group_id ' . $checking_mode : '' );
			if ( !$db->sql_query($sql) )
			{
				message_die(GENERAL_ERROR, 'Could not update users table', '', __LINE__, __FILE__, $sql);
			}

			unset($user_id_ary);
		}
	}

	function update_colors($usergroup_id_ary, $single=false, $new_color=0)
	{
		global $db;

		if ( !empty($usergroup_id_ary) )
		{
			$sql = 'UPDATE ' . ( !empty($single) ? USERS_TABLE : GROUPS_TABLE ) . '
				SET ' . ( !empty($single) ? 'user_color' : 'group_color' ) . ' = ' . intval($new_color) . '
				WHERE ' . ( !empty($single) ? 'user_id'  : 'group_id' ) . ' IN (' . $usergroup_id_ary . ')';
			if ( !$db->sql_query($sql) )
			{
				message_die(GENERAL_ERROR, 'Could not update users/groups table', '', __LINE__, __FILE__, $sql);
			}

			unset($usergroup_id_ary);
		}
	}

	/**
	* display functions
	*/

	function get_group_class($g_id, $g_name='')
	{
		$group_color = '';
		if ( $this->rcs_enabled )
		{
			$group_color = !empty($g_name) ? '<span' : '';
			$group_color .= $this->get_style($this->id_color[RCS_GROUP_URL][$g_id]['name'], $this->id_color[RCS_GROUP_URL][$g_id]['color']);
			$group_color .= !empty($g_name) ? '>' . $g_name . '</span>' : '';
		}

		return empty($this->rcs_enabled) ? ( empty($g_name) ? '' : $g_name ) : $group_color;
	}

	function get_user_class($u_level, $u_color, $u_id)
	{
		global $theme;

		switch ( $u_level )
		{
			case ADMIN:
				$class_name = 'admincolor';
				$style_color = $theme['rcs_admincolor'];
				break;
			case MOD:
				$class_name = 'modcolor';
				$style_color = $theme['rcs_modcolor'];
				break;
			default:
				$class_name = 'usercolor';
				$style_color = $theme['rcs_usercolor'];
				break;
		}

		if ( $this->rcs_enabled )
		{
			if ( !empty($u_color) )
			{
				$class_name = $this->id_color[RCS_USER_URL][$u_color]['name'];
				$style_color = $this->id_color[RCS_USER_URL][$u_color]['color'];
			}
			else if ( !empty($u_id) && !empty($this->id_color[RCS_GROUP_URL][$u_id]) )
			{
				$class_name = $this->id_color[RCS_GROUP_URL][$u_id]['name'];
				$style_color = $this->id_color[RCS_GROUP_URL][$u_id]['color'];
			}
		}

		return $this->get_style($class_name, $style_color);
	}

	function get_colors($_var, $_user='', $number=false, $_id='', $_color='', $_level='')
	{
		global $db, $theme;

		// initialize vars
		$_id = !$_id ? ( $number ? 'user_group_id' . $number : 'user_group_id' ) : $_id;
		$_color = !$_color ? ( $number ? 'user_color' . $number : 'user_color' ) : $_color;
		$_level = !$_level ? ( $number ? 'user_level' . $number : 'user_level' ) : $_level;

		// get user colour
		$user_color = !empty($_user) ? '<span' : '';
		$user_color .= $this->get_user_class($_var[$_level], $_var[$_color], $_var[$_id]);
		$user_color .= !empty($_user) ? '>' . $_user . '</span>' : '';

		return $user_color;
	}

	function display_legend()
	{
		global $db, $lang, $theme, $template;

		// initialize vars
		$legend = '';

		// get user levels
		$user_levels = array(
			ADMIN => ( $this->rcs_group_adm || !$this->rcs_group_stats || !$this->rcs_enabled ) ? array('txt' => 'Admin_online_color', 'style' => $this->get_style('admincolor', $theme['rcs_admincolor']), 'link_pgm' => 'memberlist', 'link_parms' => ADMIN) : '',
			MOD => ( $this->rcs_group_mod || !$this->rcs_group_stats || !$this->rcs_enabled ) ? array('txt' => 'Mod_online_color', 'style' => $this->get_style('modcolor', $theme['rcs_modcolor']), 'link_pgm' => 'memberlist', 'link_parms' => MOD) : '',
		);

		// build default legend
		foreach ( $user_levels as $user_level => $level_data )
		{
			if ( !empty($level_data['txt']) )
			{
				$level_url = empty($level_data['link_parms']) ? append_sid($level_data['link_pgm'] . $this->ext) : append_sid($level_data['link_pgm'] . $this->ext . '?' . RCS_LEVEL_URL . '=' . $level_data['link_parms']);
				$level_name = $lang[$level_data['txt']];
				$level_style = $level_data['style'];

				$legend .= ( ($legend != '') ? ', ' : '' ) . sprintf($level_name, '<a href="' . $level_url . '"' . $level_style . '>', '</a>');
			}
		}

		// build ranks color legend
		if ( $this->rcs_enabled && $this->rcs_group_stats && !empty($this->id_color['legend']) )
		{
			foreach ( $this->id_color['legend'] as $ranks )
			{
				if ( !empty($ranks['display']) )
				{
					$var = !empty($ranks['single']) ? RCS_USER_URL : RCS_GROUP_URL;
					$rank_url = append_sid('memberlist' . $this->ext . '?' . $var . '=' . $ranks['id']);
					$rank_name = $this->lng_item($ranks['name']);
					$rank_style = $this->get_style($ranks['name'], $ranks['color']);

					$legend .= ( ($legend != '') ? ', ' : '' ) . '<a href="' . $rank_url . '"' . $rank_style . '>' . $rank_name . '</a>';
				}
			}
		}

		// display legend
		$template->assign_vars(array(
			'L_LEGEND' => $lang['Legend'],
			'LEGEND' => $legend,
		));
	}
}

?>