<?php

/***************************************************************************
 *                             lang_bot_admin.php
 *                            --------------------
 *   begin                : Sunday, February 13, 2005
 *   copyright            : (C) 2004 Adam Marcus
 *  
 *
 *
 ***************************************************************************/

/***************************************************************************
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation; either version 2 of the License, or
 *   (at your option) any later version.
 *
 ***************************************************************************/

$lang['Manage_Bots'] = "Gérer les Bots";
$lang['Bot_Explain'] = "Bots (aussi connu sous le nom de crawlers) are automated agents most commonly used to index information on the internet. Very few of these bots support sessions and can therefore fail to index your site correctly. Here you can define the assigning of session ids to these bots to solve this problem.";
$lang['L_SUPPORT'] = '<a href="http://www.searchmebaby.com" target="_blank">Support Forum</a>';
$lang['Pending_Bots'] = "Pending Bots";
$lang['Pending_Explain'] = "Listed below are users that matched some but not all of your bot criteria. In other words the user only matched either the user agent or ip. The mismatched data is the highlighted next to the bot name. You can choose to either add this info which will then appear as part of that bots criteria or ignore it.";

$lang['Bot_Agent'] = "Bot agent";
$lang['Bot_Name'] = "Bot name";
$lang['Bots'] = "Bots"; 
$lang['Agent_Match'] = "Agent match";
$lang['Bot_Ip'] = "Bot IP";
$lang['Bot_Style'] = "Bot style";

$lang['Last_Visit'] = "Dernière visit";
$lang['Visits'] = "Visites";
$lang['Pages'] = "Pages";
$lang['Never'] = "Jamais";
$lang['Options'] = "Options";
$lang['Result'] = "Résultat";
$lang['Ok'] = "Ok";
$lang['Mark'] = "Marquer";
$lang['Ignore'] = "Ignorer";
$lang['Add'] = "Ajouter";

$lang['Submit'] = "Envoyer";
$lang['Delete'] = "Supprimer";
$lang['Reset'] = "Mise à zéro";
$lang['Edit'] = "Editer";

$lang['ip'] = "ip";
$lang['agent'] = "agent";

$lang['No_Bots'] = "Désolé, il n'y a actuellement aucun bots dans la base de donnée!";
$lang['No_Pending_Bots'] = "Sorry there are currently no pending bots in the database!";
$lang['Bot_Added_Or_Modified'] = "L'information sur le bot a été ajoutée/ignorée correctement."; 
$lang['Bot_Result_Explain'] = "Ici vous pouvez voir le résultat de votre requête.";
$lang['Bot_Settings_Changed'] = "La configuration du bot a été modifiée/ajoutée avec succès.";

$lang['Bot_Edit_Or_Add_Explain'] = "Here you can either add or modify an existing bot entry. You are able to supply either a matching user agent or a range of ip's to use.";
$lang['Bot_Name_Explain'] = "Used for your use only.";
$lang['Bot_Agent_Explain'] = "A matching user agent. Partial matches are allowed. Seperate agents with a single '|'.";
$lang['Bot_Ip_Explain'] = "Partial matches are allowed. Séparer les adresses IP avec un seul '|'.";
$lang['Bot_Style_Explain'] = "Style bot sees when visiting your site.";

$lang['Error_No_Agent_Or_Ip'] = "Vous n'avez pas rentrer un nom d'agent ou une IP valide.";
$lang['Error_No_Bot_Name'] = "Vous n'avez pas donné de nom à ce bot.";
$lang['Error_Bot_Name_Taken'] = "Le nom de ce bot existe déjà.";
$lang['Error_Own_Ip'] = "Vous ne pouvez utiliser votre propre IP comme une IP de bot, utiliser votre propre IP va vous empêcher d'accèder à l'administration de votre forum. Si vous avez besoin de tester le script Google search for a spider simulator.";
?>