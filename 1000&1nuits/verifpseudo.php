<?php
/***************************************************************************
 *                               verifpseudo.php
 *                            -------------------
 *   Cr�ation            : Jeudi 20 avril 2006
 *   Licence             : Cr�atives Commons
 *                        Vous �tes libres :
 *                           - de reproduire, distribuer et communiquer cette cr�ation au public
 *                           - de modifier cette cr�ation
 *                        Selon les conditions suivantes :
 *                           Vous devez citer le nom de l'auteur original.
 *                           - � chaque r�utilisation ou distribution, vous devez faire appara�tre clairement aux autres les conditions contractuelles de mise � disposition de cette cr�ation.
 *                           - chacune de ces conditions peut �tre lev�e si vous obtenez l'autorisation du titulaire des droits.
 *                        Pour toutes questions ou informations contacter moi par email.
 *   Email               : lefkeo @ gmail.com
 *   Remerciement        : Merci a Krucial   http://www.editeurjavascript.com/trucs/35,ajax_interrogez_votre_serveur_avec_javascript.php
 *
 *
 ***************************************************************************/

define('IN_PHPBB', true);
$phpbb_root_path = './';
include($phpbb_root_path . 'extension.inc');
include($phpbb_root_path . 'common.'.$phpEx);

// On v�rifie si le pseudo existe d�ja.
$sql = 'SELECT username FROM  '.USERS_TABLE.' WHERE username = \''.$HTTP_GET_VARS['username'].'\';';
if( !($result = $db->sql_query($sql)) )
{
   message_die(GENERAL_ERROR, 'Could not query username list', '', __LINE__, __FILE__, $sql);
}

if( $db->sql_numrows($result) >= 1 )
{
   echo '1';
}
else
{
   echo '2';
}
$db->sql_freeresult($result);

?>