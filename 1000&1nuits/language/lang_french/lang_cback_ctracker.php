<?php
/**
* <b>lang_cback_ctracker.php</b><br><br>
* English Language File for the CBACK Cracker Tracker
*
* @author Christian Knerr (cback)
* @translator Marc Renninger (mc-dragon)
* @french translators Ram et Spitfire Pat
* @package ctracker
* @version 5.0.0
* @since 21.07.2006 - 17:26:28
* @copyright (c) 2006 www.cback.de
*
* @license http://opensource.org/licenses/gpl-license.php GNU Public License
*/


/*
 * Language Strings used for the ACP Menu points
 */
$lang['ctracker_module_category'] 		  = 'CrackerTracker';
$lang['ctracker_module_1']                = 'Scanner les sommes de contr�le';
$lang['ctracker_module_2']                = 'Cr�dits';
$lang['ctracker_module_3']                = 'Scanner les fichiers';
$lang['ctracker_module_4']                = 'Messages globaux';
$lang['ctracker_module_5']                = 'Bloquage IP et Agents';
$lang['ctracker_module_6']                = 'Gestion rapports';
$lang['ctracker_module_7']                = 'Maintenance & Tests';
$lang['ctracker_module_8']                = 'Utilisateur mis�rable';
$lang['ctracker_module_9']                = 'Param�tres';
$lang['ctracker_module_10']               = 'Restauration';
$lang['ctracker_module_11']               = 'Pied de page';


/*
 * Language Strings used in ACP Modules itself
 */
$lang['ctracker_wrong_module']			  = 'Num�ro de module inconnu';
$lang['ctracker_img_descriptions']		  = 'Images';
$lang['ctracker_set_catname1']			  = 'Bloqueur d\'IP, Proxys & Agents';
$lang['ctracker_set_catname2']			  = 'Syst�me de protection de la Recherche';
$lang['ctracker_set_catname3']			  = 'Syst�me de protection des connexions';
$lang['ctracker_set_catname4']			  = 'D�tection automatique des spams';
$lang['ctracker_set_catname5']			  = 'Syst�me de protection des enregistrements';
$lang['ctracker_set_catname6']			  = 'V�rification du mot de passe	';
$lang['ctracker_set_catname7']			  = 'Fonctionnalit�s g�n�rales de s�curit�';
$lang['ctracker_set_catname8']			  = 'Autres param�tres';
$lang['ctracker_settings_head']           = 'Param�tres de CrackerTracker';
$lang['ctracker_settings_expl']           = 'Ici vous pouvez g�rer tous les param�tres du Syst�me de S�curit� CBACK CrackerTracker.';
$lang['ctracker_button_submit']			  = 'Sauvegarder param�tres';
$lang['ctracker_button_reset']			  = 'Restaurer';

$lang['ctracker_settings_m1']			  = 'Activer le bloqueur d\'IP';
$lang['ctracker_settings_e1']			  = 'Active ou d�sactive le bloqueur d\'IPs, Proxys et Agents.';
$lang['ctracker_settings_m2']			  = 'Taille du rapport de bloquage d\'IPs';
$lang['ctracker_settings_e2']			  = 'Ici vous pouvez indiquer le nombre d\'entr�es du fichier de rapport du bloqueur d\'IP. Si le nombre d\'entr�es exc�de la limite, le fichier de rapport sera automatiquement supprim� pour sauver de l\'espace web.';
$lang['ctracker_settings_m3']			  = 'Activer la Protection de la Recherche';
$lang['ctracker_settings_e3']			  = 'Ici vous pouvez activer ou d�sactiver le Syst�me de Protection de la Recherche.';
$lang['ctracker_settings_m4']			  = 'D�lai de recherche pour les utilisateurs';
$lang['ctracker_settings_e4']			  = 'Il s\'agit du d�lai (en secondes) au del� duquel un utilisateur enregistr� peut effectuer une nouvelle recherche, si la protection de la Recherche est activ�e. ';
$lang['ctracker_settings_m5']			  = 'Nombre de recherches pour les utilisateurs';
$lang['ctracker_settings_e5']			  = 'Ici vous pouvez ajuster le nombre de recherches qui peuvent �tre effectu�es dans l\'intervalle de temps indiqu� ci-dessus par un utilisateur enregistr�. Si ce nombre est d�pass�, les recherches ult�rieures seront bloqu�es pendant l\'intervalle indiqu� afin de pr�server la bande passante du serveur.';
$lang['ctracker_settings_m6']			  = 'D�lai de recherche pour les invit�s';
$lang['ctracker_settings_e6']			  = 'Intervalle de temps (en secondes) pendant lequel les invit�s doivent attendre, si la protection de la Recherche est activ�e.';
$lang['ctracker_settings_m7']			  = 'Nombre de recherches pour les invit�s';
$lang['ctracker_settings_e7']			  = 'Ici vous pouvez ajuster le nombre de recherches qui peuvent �tre effectu�es dans l\'intervalle de temps indiqu� ci-dessus par un invit�. Si ce nombre est d�pass�, les recherches ult�rieures seront bloqu�es pendant l\'intervalle indiqu� afin de pr�server la bande passante du serveur.';
$lang['ctracker_settings_m8']			  = 'Activer la protection de la connexion';
$lang['ctracker_settings_e8']			  = 'Ici vous pouvez activer ou d�sactiver le Syst�me de Protection des Connexions de CrackerTracker.';
$lang['ctracker_settings_m9']			  = 'Taille du rapport des connexions erron�es';
$lang['ctracker_settings_e9']			  = 'Ici vous pouvez indiquer combien d\'entr�es pour connexions �chou�es seront sauvegard�es et au del� desquelels le fichier sera automatiquement supprim� afin de sauvegarder de l\'espace web.';
$lang['ctracker_settings_m10']			  = 'Nombre de connexions jusqu\'� la confirmation visuelle';
$lang['ctracker_settings_e10']			  = 'Combien de fois un utilisateur peut-il �chouer � se connecter jusqu\'� ce que le Syst�me de Protection contre les attaques par force brute et la confirmation visuelle soient activ�s.';
$lang['ctracker_settings_m11']			  = 'Historique des connexions';
$lang['ctracker_settings_e11']			  = 'Ici vous pouvez activer ou d�sactiver l\'historique de connexions des utilisateurs.';
$lang['ctracker_settings_m12']			  = 'Entr�es de l\'historique de connexions par utilisateur';
$lang['ctracker_settings_e12']			  = 'Ici vous pouvez fixer combien de connexions r�ussies de chaque utilisateur seront sauvegard�es dans l\'Historique. Chaque utilsateur a la possibilit� de g�rer les heures et adresses IP de ses connexions.';
$lang['ctracker_settings_m13']			  = 'Fonctionnalit� de connexion IP';
$lang['ctracker_settings_e13']			  = 'Active ou d�sactive le syst�me de connexion IP. Chaque utilisateur a la possibilit� d\'activer ou de d�sactiver le syst�me dans son profil. Le syst�me de protection IP v�rifie les changements d\'adresse IP. L\'utilisateur sera inform� si l\'adresse IP a chang� depuis sa derni�re connexion. Ici vous verrez si quelqu\'un s\'est connect� depuis une adresse diff�rente.';
$lang['ctracker_settings_m14']			  = 'D�tection des spammeurs';
$lang['ctracker_settings_e14']			  = 'Ici le mode de d�tection automatique des spammeurs peut �tre activ�.';
$lang['ctracker_settings_m15']			  = 'Spammeurs: Intervalle de temps';
$lang['ctracker_settings_e15']			  = 'Intervalle pendant lequel les messages des utilisateurs seront d�compt�s par la d�tection de spam. (en Secondes)';
$lang['ctracker_settings_m16']			  = 'Spammeurs: nombre de messages';
$lang['ctracker_settings_e16']			  = 'Nombre autoris� de messages pendant l\'intervalle de temps fix� ci-dessus. Si ce nombre est d�pass�, l\'utilisateur sera identifi� comme un spammeur.';
$lang['ctracker_settings_m17']			  = 'Taille du rapport de spams';
$lang['ctracker_settings_e17']			  = 'Taille du fichier de rapport dans lequel seront enregistr�s les spammeurs identifi�s.';
$lang['ctracker_settings_m18']			  = 'Protection des enregistrements';
$lang['ctracker_settings_e18']			  = 'Ici vous pouvez activer ou d�sactiver la protection des enregistrements.';
$lang['ctracker_settings_m19']			  = 'Blocage temporel des enregistrements';
$lang['ctracker_settings_e19']			  = 'Ici vous pouvez fixer le d�lai minimum entre deux enregistrements. (en secondes)';

$lang['ctracker_settings_m21']			  = 'V�rification d\'IP';
$lang['ctracker_settings_e21']			  = 'Si cette fonction est activ�e, un utilisateur avec une adresse IP identique � celle du dernier utilisateur enregistr� ne pourra s\'enregistrer qu\'apr�s que quelqu\'un se soit enregsitr� avec une adresse IP diff�rente.';
$lang['ctracker_settings_m22']			  = 'Validit� du mot de passe';
$lang['ctracker_settings_e22']			  = 'Active la v�rification de la validit� du mot de passe pour tous les utilisateurs.';
$lang['ctracker_settings_m23']			  = 'Dur�e de la validit� du mot de passe';
$lang['ctracker_settings_e23']			  = 'Pour quelle dur�e (en jours) le mot de passe restera-t-il valide, avant que l\'int�ress� ne recoive une note l\'invitant � changer de mot de passe.';
$lang['ctracker_settings_m24']			  = 'V�rifier la complexit� du mot de passe';
$lang['ctracker_settings_e24']			  = 'cette fonction v�rifie la complexit� du mot de passe.';
$lang['ctracker_settings_m25']			  = 'Mode de complexit� du mot de passe';
$lang['ctracker_settings_e25']			  = 'Ici peut-�tre d�cid� si le mot de passe doit imp�rativement comporter des symboles.';
$lang['ctracker_settings_m26']			  = 'Longueur minimum du mot de passe';
$lang['ctracker_settings_e26']			  = 'Ici vous pouver fixer le nombre minimum de lettres du mot de passe.';
$lang['ctracker_settings_m27']			  = 'V�rificateur d\'annulation de mot de passe';
$lang['ctracker_settings_e27']			  = 'Ne permet l\'annulation de mot de passe (lien "mot de passe oubli� ?") qu\'au bout d\'un certain d�lai. Ceci afin d\'�viter que des attaquants n\'utilisent cette fonction pour spamer les utilisateurs.';
$lang['ctracker_settings_m28']			  = 'D�lai d\'annulation du mot de passe';
$lang['ctracker_settings_e28']			  = 'Intervalle de temps avant qu\'un utilisateur puisse � nouveau annuler son mot de passe(en minutes)';
$lang['ctracker_settings_m29']			  = 'Monitorage d\'E-mail';
$lang['ctracker_settings_e29']			  = 'Ici vous pouvez activer la fonction permettant � l\'utilisateur de n\'utiliser la fonction Mail interne qu\'une fois pendnat l\'intervalle de temps ci-dessous, ceci afin de pr�venir le spam.';
$lang['ctracker_settings_m30']			  = 'Laps de temps entre 2 E-mails';
$lang['ctracker_settings_e30']			  = 'intervalle entre deux E-Mails que l\'utilisateur peut envoyer en utilisant la fonction mail interne (en minutes)';
$lang['ctracker_settings_m31']			  = 'Auto Restauration';
$lang['ctracker_settings_e31']			  = 'Active la fonction de sauvegarde automatique des param�tres du forum. Si �a ne fonctionne pas vous pouvez utimiser la derni�re configuration connue comme fonctionnelle.';
$lang['ctracker_settings_m32']			  = 'Confirmation Visuelle pour Invit�s';
$lang['ctracker_settings_e32']			  = 'Quand vous activez cette fonction, les Invit�s doivent entrer un code visuel pour pouvoir poster. Autrement ils ne pourront pas envoyer le message. Ceci prot�ge des robots spammeurs.';
$lang['ctracker_settings_m33']			  = 'Protection contre les Emails jetables';
$lang['ctracker_settings_e33']			  = 'CrackerTracker dispose d\'une liste interne de services d\'Emails "jetables". Si vous activez cette fonction, les utilisateurs avec de telles adresses eMail seront incapables de s\'enregistrer.';
$lang['ctracker_settings_m34']			  = 'D�pistage de configurations incorrectes';
$lang['ctracker_settings_e34']			  = 'Quand vous activez cette fonction, CrackerTracker v�rifie la validit� de la configuration g�n�rale du forum. Ainsi vous ne pouvez endommager votre forum du fait d\'une mauvaise configuration!';
$lang['ctracker_settings_m35']			  = 'D�tection pouss�e des spammeurs';
$lang['ctracker_settings_e35']			  = 'Si vous activez cette fonction, CrackerTracker examinera les spammeurs humains et les messages. Beaucoup d\'entre eux seront bloqu�s.';
$lang['ctracker_settings_m36']			  = 'V�rification des mots-cl�s des spammeurs';
$lang['ctracker_settings_e36']			  = 'Si vous activez la fonction "D�tection pouss�e des spammeurs", certains mot-cl�s dans les profils et les messages seront pass�s en revue afin de d�tecter les spammeurs.<br /><br /><b>ATTENTION</b> Il existe ici un risque important de d�tection erron�e chez les nouveaux utilisateurs. V�rifiez le fichier de rapport de la d�tection des spammeurs.';


$lang['ctracker_settings_on']			  = 'Activer';
$lang['ctracker_settings_off']			  = 'D�sactiver';
$lang['ctracker_blockmode_0']			  = 'Off';
$lang['ctracker_blockmode_1']			  = 'Bannir l\'utilisateur';
$lang['ctracker_blockmode_2']			  = 'Verrouiller l\'utilisateur';
$lang['ctracker_complex_1']				  = '[0-9]';
$lang['ctracker_complex_2']				  = '[a-z]';
$lang['ctracker_complex_3']				  = '[A-Z]';
$lang['ctracker_complex_4']				  = '[0-9][a-z]';
$lang['ctracker_complex_5']				  = '[0-9][A-Z]';
$lang['ctracker_complex_6']				  = '[0-9][a-z][A-Z]';
$lang['ctracker_complex_7']				  = '[0-9][*]';
$lang['ctracker_complex_8']				  = '[0-9][a-z][*]';
$lang['ctracker_complex_9']				  = '[0-9][a-z][A-Z][*]';


/*
 * Credits page in ACP
 */
$lang['ctracker_credits_head']			  = 'Credits';
$lang['ctracker_credits_subhead']         = 'Credits du MOD CBACK CrackerTracker. Ici vous trouvez plus d\'informations � propos de la s�curit� et �galement un moyen de dire "Merci".';
$lang['ctracker_credits_donate']          = 'Faire un don';
$lang['ctracker_credits_donate_expl']     = 'Vous aimez <b>CBACK CrackerTracker Professional</b>? Then it would be nice, if you donated the CBACK Project using PayPal Donation. Further Development and the costs of the server will help do go on with our non-profit project. So we will be able to provide CrackerTracker for free in the future. <br /><br />Merci beaucoup pour votre aide.';
$lang['ctracker_credits_credits']		  = 'Credits';
$lang['ctracker_credits_credits_1']		  = 'Id�e & Mise en oeuvre';
$lang['ctracker_credits_credits_2']		  = 'Auteurs et Support';
$lang['ctracker_credits_credits_3']		  = 'Icones';
$lang['ctracker_credits_credits_4']		  = 'Site de t�l�chargement officiel';
$lang['ctracker_credits_moddownload']	  = 'CrackerTracker MOD Download';
$lang['ctracker_credits_thanks']		  = 'Merci �...';
$lang['ctracker_credits_thanks_text']	  = 'Je tiens � remercier les personnes suivantes:';
$lang['ctracker_credits_thanks_to']		  = '<b>Id�es, tests de s�curit� et correction des failles</b><br />Tekin Bird�zen<br /><i>(<a href="http://www.cybercosmonaut.de" target="_blank">cYbercOsmOnauT</a>)</i><br /><br /><br /><br /><b>Id�es:</b><br />Bernhard Jaud<br /><i>(GenuineParts)</i><br /><br /><br /><br /><b>Traducteur (English)</b><br />Marc Renninger<br /><i>(mc-dragon)</i><br /><br /><br /><br /><b>Correcteur (English)</b><br />George <br />Sommerset<br /><i>(<a href="http://www.englisch-hilfen.de" target="_blank">www.englisch-hilfen.de</a>)</i><br /><br /><br /><br /><b>Correcteur (Deutsch)</b><br />Johnny (diegoriv)<br /><i>(<a href="http://alpinum.at" target="_blank">Alpinum.at</a>)</i><br /><br /><br /><br /><b>Beta Testeurs</b><br />Merci � tout les participants du Beta-Test<br />aux utilisateurs de CBACK Premium et bien s�r �<br />nos coll�gues de la "Mod-Scene" Qui nous ont aid�s avec les Beta Tests et les corrections.</i>';
$lang['ctracker_credits_info']			  = 'Plus de S�curit�?';
$lang['ctracker_credits_info_text']		  = 'L\'add-on parfait pour phpBB and the CrackerTracker: Pour une s�curit� optimale nous recommandons le Mod <b>Advanced Visual Confirmation</b> par AmigaLink. Ce MOD am�liore la fonction CAPTCHA de phpBB et de CrackerTracker Professional avec un syst�me plus complexe qui ne peut �tre lu par les Robots. Ce MOD peut �tre t�l�charg� sur <a href="http://www.amigalink.de" target="_blank">www.AmigaLink.de</a>.<br /><br /><br /><br />Nous vous sugg�rons d\'int�grer �galement ce MOD dans votre forum pour une excellente s�curit�';


/*
 * File Hash Check in ACP
 */
$lang['ctracker_fchk_head']				  = 'Scanner de sommes de contr�le CrackerTracker';
$lang['ctracker_fchk_subhead']			  = 'Ce scanner cr�e une somme de contr�le de chaque fichier PHP de votre forum quand vous cliquez "Cr�er ou mettre � jour les sommes de contr�le". Apr�s cel� vous avez la possibilit� avec �Chercher modifications des fichiers� de d�terminer si un fichier a �t� ou non modifi� depuis la derni�re production de v�rifications de totaux. Vous pouvez ainsi voir si des fichiers ont �t� chang�s sans que vous ayiez fait quoique ce soit. C\'est habituelelment le signe que quelqu\'un a obtenu un acc�s au volume de donn�es de votre forum. V�rifiez la date de derni�re v�rification pour voir si une personne non autoris�e a activ� le scanner!<br /><br /><br /><b>Information:</b> Tous les serveurs ne permettent pas cette fonctionnalit�. Il peut parfois survenir un Timeout si le serveur prend trop de temps � produire la liste des fichiers phpBB. D\'autres serveurs stoppent le processus car il s\'agit d\'une proc�dure intensive.<br /><br /><br />&raquo; La derni�re actualisation de la v�rification a eu lieu le <b>%s</b>.';
$lang['ctracker_fchk_funcheader']		  = 'Fonctionnalit�s';
$lang['ctracker_fchk_tableheader']		  = 'Sortie syst�me';
$lang['ctracker_fchk_option1']			  = 'Cr�er ou mettre � jour sommes de contr�le';
$lang['ctracker_fchk_option2']			  = 'V�rifier changements des fichiers';
$lang['ctracker_fchk_select_action']	  = 'Merci de choisir une action!';
$lang['ctracker_fchk_update_action']	  = 'Sommes de contr�le mises � jour!';
$lang['ctracker_fchk_tablehead1']		  = 'Chemin';
$lang['ctracker_fchk_tablehead2']		  = 'Etat';
$lang['ctracker_file_unchanged']		  = 'NON MODIFIE';
$lang['ctracker_file_changed']		 	  = 'MODIFIE';


/*
 * File Safety Scanner in ACP
 */
$lang['ctracker_fscan_complete']		  = 'Le scan des fichiers a �t� �x�cut� avec succ�s. Merci de cliquer sur "Voir r�sultats". Vous pouvez corriger les fichiers.<br /><br /><br /><br /><u>ASTUCE:</u><br /><br />I peut arriver parfois que CrackerTracker d�tecte un fichier comme peu s�r. Ceci peu arriver dans le cas de fichiers PHP tr�s, tr�s diff�rents et parfois un programmeur souhaite que son code soit transpos� � partir de sources ext�rieures. Dans ce cas - et UNIQUEMENT si vous en �tes absolument s�r - vous pouvez dire � CRACKERTRACKER qu\'il s\'agit d\'un fichier s�curis�. Ecrivez simplement dans ce fichier, � son tout d�but: <?php le code suivant: <br /><br /><br /><i>// CTracker_Ignore: File Checked By Human</i><br /><br /><br />Si vous avez un doute, vous pouvez �galement vous adresser � la <a href="http://www.community.cback.de" target="_blank">Communut� CBACK</a> pour davantage d\'instructions.';
$lang['ctracker_fscan_unchecked']		  = 'NON VERIFIE';
$lang['ctracker_fscan_ok']                = 'SUR';
$lang['ctracker_fscan_prob_1']			  = 'extension.inc probablement non inclus ou trop tard';
$lang['ctracker_fscan_prob_2']			  = '$phpbb_root_path probablement non initialis� correctement';
$lang['ctracker_fscan_prob_3']			  = 'common.php / pagestart.php probablement non inclus ou trop tard';
$lang['ctracker_fscan_prob_4']			  = 'Le Code du fichier est possiblement �x�cutable en dehors de phpBB';
$lang['ctracker_fscan_prob_5']			  = 'extension.inc est manquant et/ou $phpbb_root_path et/ou  constante non trouv�e';
$lang['ctracker_fscan_prob_def']		  = 'Une erreur ind�finie est survenue pendant le scanning';
$lang['ctracker_fscan_important']		  = 'Votre attention s\'il vous pla�t!';
$lang['ctracker_fscan_sel_action']		  = 'Pour d�marrer la v�rification de tous vos fichiers merci de cliquer sur "D�marrer v�rification des fichiers". Une fois accompli cliquez sur "Voir r�sultats" pour voir les r�sultatsde la v�rifcation. Cette liste peut �tre retrouv�e � tout moment sur le panneau d\'administration jusqu\'� ce qu\'une nouvelle v�rification soit d�marr�e.<br /><br /><br />Pour des raisons techniques il n\'est pas possible de d�livrer une information <u>sans ambig�it�</u> et <u>infaillible</u> sur la s�curit� d\'un script PHP. Aussi ne vous endormez pas sur de fausses impressions de s�curit�. Il peut arriver que le scanner classe un fichier s�r comme non s�r et vice versa. PHP est si complexe et les codes d�pendent de tant de facteurs qu\'il ne peut y avoir cent pour cent de s�curit�. Sinon il n\'y aurait plus de scripts ins�curis�s. ;-)<br /><br /><br />Ce scanner est sp�cialis� dans les failles de s�curit� des fichiers inclus en cherchant les secteurs du forum accessibles de l\'ext�rieur, offrant ainsi une surface d\'attaque que CrackerTracker ne peut surveiller, lui-m�me travaillant � l\'int�rieur du forum. Avec ce scanner vous pouvez chercher facilement et �liminer une grande partie de ces dangers.<br /><br /><br />Pour davantages de d�tails et d\'assistance, comme par exemple comment corriger les fichiers class�s comme incertains, vous trouverez beaucoup de r�ponses avec la fonction de recherche de la communaut� CBACK!<br /><br /><br />';
$lang['ctracker_fscan_head']			  = 'Scanner de S�curit� CBACK CrackerTracker';
$lang['ctracker_fscan_subhead']			  = 'Ce scanner de s�curit� examine tous les fichiers PHP de votre forum sur de s�rieux probl�mes de s�curit� et y porte une attention particuli�re afin qu\'il n\'y ait pas de failles de s�cuirit� pouvant �tre exploit�es par des vers. Ces failles peuvent �tre exploit�es de l\'ext�rieur sans utiliser les fichiers du forum. Aussi le syst�me CrackerTracker restera-t-il inactif et ne pourra pas prot�ger les fichiers. Avec ce module vous avez la possibilit� de chercher de telles failles et de les �liminer.<br /><br /><br /><b>Veuillez noter:</b> Tous les serveurs n\'acceptent pas cette fonctionnalit�! Avce de tr�s grands forums il peut arriver que ce syst�me de scan, tr�s gourmand en ressources, outrepasse le temps d\'ex�cution PHP. L\'algorithme de ce scanner a �t� optimis� au mieux afin de se cantonner dans les limites, toutefois cela peut malheureusement survenir sur certaines machines. Nous vous prions de bien vouloir le prendre en compte.<br /><br /><br />&raquo; La derni�re v�rification a �t� effectu�e le <b>%s</b>.';
$lang['ctracker_fscan_option1']			  = 'D�marrer v�rification des fichiers';
$lang['ctracker_fscan_option2']			  = 'Voir r�sultats';


/*
 * Global message in ACP
 */
$lang['ctracker_glob_msg_head']			  = 'Message Global';
$lang['ctracker_glob_msg_subhead']		  = 'Ici vous pouvez d�livrer un message global � l\'intention de tous les utilisateurs, message que l\'utilisateur lira lors de sa prochaine connexion. Vous avez la possibilit� de vous ref�rer � un lien ou d\'�crire votre propre texte (255 caract�res). ;)';
$lang['ctracker_glob_msg_entry']          = 'Param�trer le message ';
$lang['ctracker_glob_msg_submit']		  = 'Ins�rer';
$lang['ctracker_glob_msg_reset']		  = 'Annuler';
$lang['ctracker_glob_msg_type']			  = 'Type du message global';
$lang['ctracker_glob_type_1']			  = 'Texte';
$lang['ctracker_glob_type_2']			  = 'Lien';
$lang['ctracker_glob_msg_txt']			  = 'Texte du message';
$lang['ctracker_glob_msg_link']			  = 'Lien de destination du message';
$lang['ctracker_glob_msg_reset']		  = 'Annuler message actuel';
$lang['ctracker_glob_res_txt']			  = 'Si vous cliquez sur "Annuler message actuel", un message enregistr� sera supprim�.';
$lang['ctracker_glob_msg_saved']		  = 'Le message global a �t� enregistr� avec succ�s.<br /><br />Cliquez <a href="%s">ICI</a> pour revenir au gestionnaire CrackerTracker.';
$lang['ctracker_glob_msg_reset_ok']		  = 'Le message global a �t� effac� de la table des utilisateurs. le message entr� ne sera plus affich�e.<br /><br />Cliquez <a href="%s">ICI</a> pour revenir au gestionnaire CrackerTracker.';


/*
 * IP&Agent Blocker
 */
$lang['ctracker_ipb_delete']			  = 'Supprimer entr�e';
$lang['ctracker_ipb_blocklist']			  = 'Liste des bloqu�s';
$lang['ctracker_ipb_head']                = 'Bloqueur de Proxys, IP & Agents';
$lang['ctracker_ipb_description']		  = 'ici vous pouvez g�rer la liste des bloqu�s du Bloqueur de Proxys, IP & Agents CrackerTracker. Vous pouvez suuprimer des entr�es existantes ou en ajouter de nouvelles. Avec une nouvelle entr�e vous disposez du joker (*) pour ajouter n\'importe quelle combinaison au filtre de la liste. Par exemple: lwp* bloquera lwp-1 aussi bien que lwp-simple etc. ou bien 100.*.*.* bloquera toutes les adresses IP commen�ant par 100. .<br /><br /><b>ATTENTION</b> Veillez � ne pas bloquer votre propre User-Agent ou adresse IP. Autrement vous seriez �ject� de votre forum!';
$lang['ctracker_ipb_new_entry']			  = 'Nouvelle entr�e';
$lang['ctracker_ipb_added']               = 'Entr�e ajout�e avec succ�s!';
$lang['ctracker_ipb_deleted']			  = 'Entr�e supprim�e avec succ�s!';
$lang['ctracker_ipb_add_now']			  = 'Ajouter une entr�e';


/*
 * Log Manager
 */
$lang['ctracker_log_manager_title']		  = 'Gestionnaire des rapports';
$lang['ctracker_log_manager_subtitle']	  = 'Ici vous pouvez consulter ou supprimer tous les fichiers de rapports de CrackerTracker.';
$lang['ctracker_log_manager_overview']	  = 'Vue d\'ensemble du gestionnaire de rapports';
$lang['ctracker_log_manager_blocked']	  = 'CrackerTracker a bloqu� <b>%s</b> attaques jusqu\'alors.';
$lang['ctracker_log_manager_overview']	  = 'Vue d\'ensemble du fichier de rapport';
$lang['ctracker_log_manager_head1']		  = 'Nom du rapport';
$lang['ctracker_log_manager_head2']		  = 'Nombre d\'entr�es';
$lang['ctracker_log_manager_head3']		  = 'Fonctions';
$lang['ctracker_log_manager_name2']		  = 'Protection contre Vers & Exploits';
$lang['ctracker_log_manager_name3']		  = 'Bloqueur de Proxys, IP & Agents';
$lang['ctracker_log_manager_name4']		  = 'Connexions incorrectes';
$lang['ctracker_log_manager_name5']		  = 'Spammeurs bloqu�s';
$lang['ctracker_log_manager_view']		  = 'VOIR';
$lang['ctracker_log_manager_delete']	  = 'SUPPRIMER';
$lang['ctracker_log_manager_delete_all']  = 'Supprim� tous les fichiers de rapports';
$lang['ctracker_log_manager_deleted']	  = 'Le fichier de rapport a �t� supprim� avec succ�s!';
$lang['ctracker_log_manager_all_deleted'] = 'Tous les fichiers de rapport ont �t� supprim�s avec succ�s!';
$lang['ctracker_log_manager_showheader1'] = 'Il y a <b>une</b> entr�e dans ce fichier de rapport. Cliquez <b><a href="%s">ICI</a></b> pour retourner � la vue d\'ensemble.';
$lang['ctracker_log_manager_showheader']  = 'Il y a <b>%s</b> entr�es dans ce fichier de rapport. Cliquez <b><a href="%s">ICI</a></b> pour retourner � la vue d\'ensemble.';
$lang['ctracker_log_manager_showlog']	  = 'Voir fichier';
$lang['ctracker_log_manager_cell_1']	  = 'Date / Heure';
$lang['ctracker_log_manager_cell_2a']	  = 'Appel';
$lang['ctracker_log_manager_cell_2b']	  = 'Pseudo';
$lang['ctracker_log_manager_cell_3']	  = 'Referer';
$lang['ctracker_log_manager_cell_4']	  = 'User-Agent';
$lang['ctracker_log_manager_cell_5']	  = 'Adresse IP';
$lang['ctracker_log_manager_cell_6']	  = 'H�te distant';
$lang['ctracker_log_manager_sysmsg']	  = 'Le dernier nettoyage du fichier de rapport remonte � <b>%s</b>.';


/*
 * Footer configuration
 */
$lang['ctracker_footer_head']			  = 'Gestion du bas de page';
$lang['ctracker_footer_subhead']		  = 'Ici vous pouvez choisir le bas de page que CrackerTracker affichera dans votre Forum. Merci de ne pas modifier ce bas de page ainsi que le lien vers www.cback.de!';
$lang['ctracker_select_footer']			  = 'Choisissez votre bas de page';
$lang['ctracker_footer_saveit']			  = 'Accepter la disposition du bas de page';
$lang['ctracker_footer_done']			  = 'Les modifications du bas d epage ont �t� sauvegard�es avec succ�s!';


/*
 * Maintenance Module in ACP
 */
$lang['ctracker_ma_unknown']			  = '<font color="#FFB900"><b>INCONNU</b></font>';
$lang['ctracker_ma_secure']			  	  = '<font color="#1CBF00"><b>SECURISE</b></font>';
$lang['ctracker_ma_warning']			  = '<font color="#FF0000"><b>ATTENTION</b></font>';
$lang['ctracker_ma_active']			  	  = '<font color="#1CBF00"><b>ACTIF</b></font>';
$lang['ctracker_ma_inactive']			  = '<font color="#FF0000"><b>INACTIF</b></font>';
$lang['ctracker_ma_on']				  	  = 'ACTIVE';
$lang['ctracker_ma_off']				  = 'DESACTIVE';
$lang['ctracker_ma_ca']				  	  = '<font color="#1CBF00"><b>OK</b></font>';
$lang['ctracker_ma_ci']					  = '<font color="#FF0000"><b>NON PARAMETRE</b></font>';
$lang['ctracker_ma_head']				  = 'Maintenance et v�rification syst�me';
$lang['ctracker_ma_subhead']			  = 'Ce syst�me examine automatiquement les fonctionnalit�s des modules de s�curit� de CrackerTracker et vous propose des astuces pour optimiser votre syst�me.';
$lang['ctracker_ma_systest']			  = 'Test automatique du Syst�me';
$lang['ctracker_ma_sectest']			  = 'Test de s�curit�';
$lang['ctracker_ma_maint']				  = 'Fonction de service';
$lang['ctracker_ma_name_1']				  = 'Syst�me de protection contre Vers & Exploits';
$lang['ctracker_ma_name_2']				  = 'Unit� de contr�le des variables';
$lang['ctracker_ma_name_3']				  = 'Unit� de protection contre IP, Proxys & Agents ';
$lang['ctracker_ma_name_4']				  = 'Groupe de d�finitions heuristiques des Vers - Nombre de Definitions: <b>%s</b>';
$lang['ctracker_ma_syshead_1']			  = 'Module de s�curit�';
$lang['ctracker_ma_syshead_2']			  = 'Statut';
$lang['ctracker_ma_seccheck_1']			  = 'Pont de v�rification';
$lang['ctracker_ma_seccheck_2']			  = 'Version / Statut';
$lang['ctracker_ma_seccheck_3']			  = 'Ref�rence';
$lang['ctracker_ma_seccheck_4']			  = 'Statut';
$lang['ctracker_ma_scheck_1']			  = 'Version de PHP (<a href="http://www.php.net" target="_blank">Visitez le site</a>)';
$lang['ctracker_ma_scheck_2']			  = '&raquo; PHP SAFE MODE';
$lang['ctracker_ma_scheck_3']			  = '&raquo; PHP GLOBALS';
$lang['ctracker_ma_scheck_4']			  = 'Version de phpBB (<a href="http://www.phpbb.com" target="_blank">Visitez le site</a>)';
$lang['ctracker_ma_scheck_4a']			  = '&raquo; Confirmation Visuelle';
$lang['ctracker_ma_scheck_4b']			  = '&raquo; Activation du compte';
$lang['ctracker_ma_scheck_5']			  = 'CBACK CrackerTracker (<a href="http://www.cback.de" target="_blank">Visitez le site</a>)';
$lang['ctracker_ma_chmod']				  = '<b>Statut CHMOD777 :</b> ';
$lang['ctracker_ma_desc_link']			  = 'EXECUTER MAINTENANT';
$lang['ctracker_ma_desc1']				  = '<b>Effacer Table IP, Proxy & Agents</b><br />Ici vous pouvez supprimer <u>toutes</u> les entr�es de la Table des IP, Proxy & Agents.';
$lang['ctracker_ma_desc2']				  = '<b>Param�tres d\'origine: Bloqueur d\'IP, Proxys & Agents Blocker</b><br />Ici vous pouvez restaurer le statut d\'origine de la table des IP, Proxy & Agents . Vos filtres seront perdus!';
$lang['ctracker_ma_desc3']				  = '<b>Supprimer l\'Historique des Connexions</b><br />Ici vous pouvez supprimer toutes les entr�es de l\'historique des connexions, ind�pendamment des utilisateurs et ind�pendamment du nombre de sauvegardes par utilisateur.';
$lang['ctracker_ma_desc4']				  = '<b>Effacer fichier v�rification des tables de hachage</b><br />Supprime toutes les entr�es sauvegard�es du fichier de v�rification de la table de hachage.';
$lang['ctracker_ma_desc5']				  = '<b>Effacer la Table du scanner de s�curit�</b><br />Efface tous les r�sultats qui avaient �t� enregistr�s dans la base de donn�es pendant l\'examen de s�curit� des fichiers.';
$lang['ctracker_ma_succ_main']			  = 'Processus ex�cut� avec succ�s!';
$lang['ctracker_ma_err_main']			  = 'Echec du Processus!';


/*
 * Miserable User Module in ACP...
 */
$lang['ctracker_mu_success']			  = 'L\'utilisateur a �t� marqu� comme "Utilisateur Mis�rable" et rencontrera d�s maintenant quelques probl�mes pour naviguer sur votre forum. ;)';
$lang['ctracker_mu_error_admin']		  = 'ADMINS ou MODs ne peuvent pas �tre marqu�s comme "Utilisateur Mis�rable"!';
$lang['ctracker_mu_deleted']			  = 'Les utilisateurs s�lectionn�s ont �t� retir�s avec succ�s de la liste des Utilisateurs mis�rables.';
$lang['ctracker_mu_head']				  = 'Utilisateur Mis�rable';
$lang['ctracker_mu_subhead']			  = 'Si un utilisateur ne se comporte pas comme il devrait, le risque est grand, et cela s\'est d�j� produit, qu\'il se r�inscrive sous un autre compte apr�s avoir �t� banni. Il existe une fonctionnalit� appel�e "Utilisateur mis�rable" qui a �t� fr�quememnt demand�e. Le syst�me CrackerTracker ne l\'associe pas avec "Nous solutionnons par l\'envoi de messages d\'erreur absurdes", qui est relativement transparent, mais proc�de selon le principe  "N\'alimentez pas le singe": Si un utilisateur est ainsi marqu� "Utilisateur Mis�rable", ses messages ne pourront �tre lus que par l\'administrateur. Pour les autres utilisateurs, ses contributions seront invisibles et il n\'y aura par cons�quent personne pour dialoguer avec le fauteur de troubles. Celui-ci va vite s\'ennuyer et quitter le forum.';
$lang['ctracker_mu_select']				  = 'Marquer l\'utilisateur comme Utilisateur Mis�rable';
$lang['ctracker_mu_find']				  = 'Chercher un Pseudonyme';
$lang['ctracker_mu_send']				  = 'Entrer Pseudonyme';
$lang['ctracker_mu_entr']				  = 'Pseudonyme marqu�s';
$lang['ctracker_mu_uname']				  = 'Pseudonyme entr�';
$lang['ctracker_mu_remove']				  = 'Supprimer les entr�es';
$lang['ctracker_mu_no_defined']			  = 'Il n\'y a, � ce jour, aucun utilisateur marqu� comme "Utilisateur Mis�rable".';


/*
 * Recovery feature in ACP
 */
$lang['ctracker_rec_head']				  = 'Restauration du Syst�me';
$lang['ctracker_rec_subhead']			  = 'Ici vous pouvez effectuer une sauvegarde de la Table de Configuration de votre forum ou r�cup�rer la derni�re configuration fonctionnelle. Si vous avez activ� cette fonction dans les param�tres g�n�raux de CrackerTracker, alors il sera proc�d� � une sauvegarde chaque fois que vous changerez la configuration g�n�rale. (ATTENTION! Ce n\'est <b>PAS</b> une sauvegarde de toute la Base de donn�es!)<br /><br />Si vous n\'�tes pas dans le Panneau d\'Admin apr�s avoir modifi� les param�tres, il vous est possible de r�activer la derni�re configuration en utilisant la console d\'urgence de CrackerTracker, too. Merci de lire les commentaires du fichier <i>ctracker/emergency.php</i> pour davantage d\'instructions sur les configurations de forums en cas d\'urgence. Veuillez noter que ce fichier doit �tre activ� avant usage.<br /><br /><b>ATTENTION!</b> Cetet fonctionnalit� ne doit �tre utilis�e qu\'en cas de s�rieux probl�mes!';
$lang['ctracker_rec_last_saved']		  = 'Derni�re sauvegarde de la Table de Configuration: <b>%s</b>';
$lang['ctracker_rec_never_saved']		  = 'La table de Configuration n\'a pas �t� sauvegard�e � ce jour!';
$lang['ctracker_rec_backup']			  = 'Sauvegarde de la Table de Configuration';
$lang['ctracker_rec_restore']			  = 'R�staurer la derni�re Configuration fonctionnelle';
$lang['ctracker_rec_succ']				  = 'La proc�dure de Base de donn�es a �t� ex�cut�e avec succ�s.';
$lang['ctracker_rec_pab']				  = 'La restauration n\'est pas disponible tant que vous n\'aurez pas effectu� une sauvegarde avec succ�s!';


/*
 * Language Strings used at multiple places
 */
$lang['ctracker_error_updating_userdata'] = 'CBACK CrackerTracker a �chou� dans l\'ex�cution d\'une op�ration de base de donn�es dans la Table des utilisateurs.';
$lang['ctracker_error_database_op']       = 'CBACK CrackerTracker ne parvient pas � ex�cuter correctement l\'op�ration de base de donn�es.';
$lang['ctracker_message_dialog_title']    = 'CBACK CrackerTracker Professionel';


/*
 * Language Strings used for the footer itself
 */
$lang['ctracker_fdisplay_imgdesc']		  = 'Panneau de S�curit�';
$lang['ctracker_fdisplay_n'] 			  = '<a href="http://www.cback.de" target="_blank">Securis�</a> par <a href="http://www.cback.de" target="_blank">CBACK CrackerTracker</a>.';
$lang['ctracker_fdisplay_c'] 			  = 'Prot�g� par <a href="http://www.cback.de" target="_blank">CBACK CrackerTracker</a><br /><b>%s</b> Attaques bloqu�es.';
$lang['ctracker_fdisplay_g'] 			  = '<b>%s</b> Attaques bloqu�es';


/*
 * Language Strings for the class_ct_database.php
 */
$lang['ctracker_error_loading_config']    = 'Echec du chargement de la Configuration de CBACK CrackerTracker � partir de la base de donn�es. Avez vous bien ex�cut� le script d\'installation et modifi� correctement le fichier "includes/constants.php" ?';
$lang['ctracker_error_updating_config']   = 'Echec de la mise � jour de la Configuration de CBACK CrackerTracker. Avez vous bien ex�cut� le script d\'installation et modifi� correctement le fichier "includes/constants.php" ?';
$lang['ctracker_error_loading_blocklist'] = 'Echec du chargement de la liste des bloqu�s de CBACK CrackerTracker � partir de la base de donn�es. Avez vous bien ex�cut� le script d\'installation et modifi� correctement le fichier "includes/constants.php" ?';
$lang['ctracker_error_insert_blocklist']  = 'Echec de l\'ajout de donn�es � la liste des bloqu�s de CBACK CrackerTracker. Avez vous bien ex�cut� le script d\'installation et modifi� correctement le fichier "includes/constants.php" ?';
$lang['ctracker_error_delete_blocklist']  = 'Echec de la suppression de donn�es � la liste des bloqu�s de CBACK CrackerTracker. Avez vous bien ex�cut� le script d\'installation et modifi� correctement le fichier "includes/constants.php" ?';
$lang['ctracker_error_login_history']     = 'Une erreur est survenue pendant une op�ration de base de donn�es sur l\'historique des connexions de CBACK CrackerTracker. Avez vous bien ex�cut� le script d\'installation et modifi� correctement le fichier "includes/constants.php" ?';
$lang['ctracker_error_del_login_history'] = 'L\'historique des connexions de CrackerTracker ne peut pas �tre vid�.';


/*
 * Language Strings used in class_ct_userfunctions.php
 */
$lang['ctracker_info_search_time']        = "Pour des raisons de s�curit� la recherche n'est possible que %s fois par p�riodes de  %s secondes. ce nombre �tant d�pass�, il vous faudra attendre <span id=\"waittime\">%s</span> secondes, pour effectuer une nouvelle recherche. <script type=\"text/javascript\"><!-- \n var wait = %s; var waitt = wait * 1000; for(i=1; i <= wait; i++) { window.setTimeout(\"newoutput(\" + i + \")\", i * 1000); } function newoutput(waitcounter) { if ( (waitt/1000) == waitcounter ) { document.getElementById(\"waittime\").innerHTML = \"0\"; } else { document.getElementById(\"waittime\").innerHTML = (waitt/1000) - waitcounter; } } //--></script>";
$lang['ctracker_info_regist_time']        = "Pour des raisons de s�curit� un enregistrement n'est possible que toutes les %s secondes. si ce d�lai n'�tant pas atteint, il vous reste <span id=\"waittime\">%s</span> secondes, pour demander � vous enregistrer. <script type=\"text/javascript\"><!-- \n var wait = %s; var waitt = wait * 1000; for(i=1; i <= wait; i++) { window.setTimeout(\"newoutput(\" + i + \")\", i * 1000); } function newoutput(waitcounter) { if ( (waitt/1000) == waitcounter ) { document.getElementById(\"waittime\").innerHTML = \"0\"; } else { document.getElementById(\"waittime\").innerHTML = (waitt/1000) - waitcounter; } } //--></script>";
$lang['ctracker_info_regip_double']		  = 'Il y a d�j� eu un enregsitrement � partir de cette adresse IP. Pour des raisons de s�curit� un seul enregsitrement provenant de la m�me adresse IP est possible.';
$lang['ctracker_info_profile_spammer']	  = 'Cet enregistrement a �t� identifi� comme un compte de spam! Si vous pensez que ce n\'est pas le cas, veuillez contacter l\'administrateur de ce forum afin qu\'il v�rifie votre compte.';
$lang['ctracker_info_password_minlng']    = 'L\'administrateur a d�cid� que le mot de passe devait contenir au moins <b>%s</b> caract�res. Celui que vous avez choisi n\'en contient que has only <b>%s</b>. Veuillez cliquez sur "retour" pour entrer un nouveau mot de passe.';
$lang['ctracker_info_password_cmplx']	  = 'L\'administrateur a d�cid� que le mot de passe devait contenir au <b>minimum</b> les choses suivantes: %s';
$lang['ctracker_info_password_cmplx_1']	  = 'Figures';
$lang['ctracker_info_password_cmplx_2']	  = 'Minuscules';
$lang['ctracker_info_password_cmplx_3']	  = 'Capitales';
$lang['ctracker_info_password_cmplx_4']	  = 'Caract�res sp�ciaux';
$lang['ctracker_info_pw_expired']		  = 'L\'administrateur a param�tr� le forum afin que le mot de passe ne soit valide que pendant <b>%s jours</b>. Nous vous recommendons, pour de sraisons de s�curit�, de changer votre mot de passe maintenant. (Profil)';


/*
 * Language Strings used in ct_visual_confirm.php
 */
$lang['ctracker_login_wrong']   = 'Le Code de Confirmation Visuelle entr� est incorrect!';
$lang['ctracker_code_dbconn']   = 'Echec du chargement, � partir de la base de donn�es, du Code de Confirmation Visuelle! Si vous avez phpBB Plus, vous devez installer le module pour Confirmation Visuelle. Veuillez consulter les r�f�rences � phpBB plus dans le r�pertoire "add_ons" du package du Mod CrackerTracker!';
$lang['ctracker_login_success'] = 'Votre compte a �t� activ� � nouveau.<br /><br />Cliquez <a href="%s">ICI</a> pour retourner � la page de connexion.';
$lang['ctracker_code_count']    = 'Le nombre d\'entr�es de la Confirmation Visuelle a d�pass� les limites de cette session.';


/*
 * Language Strings used in ctracker_login.php
 */
$lang['ctracker_login_title']   = 'Activation du Compte de CrackerTracker';
$lang['ctracker_login_logged']  = 'Les utilisateurs enregistr�s ne peuvent acc�der au site.';
$lang['ctracker_login_confim']  = 'Le nombre maximum de connexions erron�es � votre compte a �t� atteint. Aussi votre compte a-t-il �t� bloqu�. Il devra �tre r�activ� en utilisant la Confirmation Visuelle.<br /><br />Veuillez taper le code affich� ci-dessus puis cliquer sur "Activer" pour d�verrouiller votre compte. Une fois effectu�, vous pourrez retourner � la page de connexion.';
$lang['ctracker_login_button']  = 'Activer';


/*
 * Language Strings for IP Warning Engine
 */
$lang['ctracker_ipwarn_info']	= 'Le scan de vos adresses IP est <b>%s</b>';
$lang['ctracker_ipwarn_prof']	= 'Scanner des adresses IP';
$lang['ctracker_ipwarn_pdes']	= 'Le Scanner des adresses IP v�rifie, si activ�, Les modifications d\'adresses IP. Si quelqu\'un se connecte sur votre compte avec une autre adresse, vous recevrez un bref message ( Et �galement, bien s�r, si vous vous connectez � partir d\'adresses diff�rentes). . V�rifiez r�guli�rement que la fonction d\'alerte est activ�e, un individu malveillant pouvant l\'avoir d�sactiv�e. L\'enregistrement de l\'historique des connections se poursuit toutefois, vous avez donc toujours la possibilit� de v�rifier les modifications apr�s r�activation.';
$lang['ctracker_ipwarn_chng']	= '<b>&raquo; AVIS &laquo;</b><br />L\'adresse IP de votre compte a chang�. La connexion actuelle provient de  <b>%s</b>, la pr�c�dente de <b>%s</b>. Si vous ne vous �tes pas connect� � partir d\'une autre adresse, alors peut-�tre un aggresseur a-t-il utilis� votre compte sans autorisation!';
$lang['ctracker_ipwarn_welc']	= '<b>&raquo; AVIS &laquo;</b><br />La gamme des adresses IP de votre compte n\'a pas encore �t� initialis�e. Ceci survient apr�s deux connexions. Si vous souhaitez initialiser le scanner maintenant, alors connectez-vous et d�connectez-vous deux fois.';
$lang['ctracker_ipwarn_send']	= 'Accepter param�tres';


/*
 * Language Strings for Login History
 */
$lang['ctracker_lhistory_h']	= 'Historique des connexions';
$lang['ctracker_lhistory_i']	= 'Ici vous pouver jeter un oeil sur vos adresses IP enregistr�es et les horaires de vos <b>%s</b> derni�res connexions. Vous pourrez ainsi voir si votre compte a �t� utilis� par quelqu\'un d\'autre. S\'il y a des horaires de connexion ou des adresses IP inconnues, il est alors possible qu\'un individu ait d�rob� votre mot de passe. Dans ce cas vous devriez changer votre mot de passe et v�rifier �galement votre compte E-Mail.';
$lang['ctracker_lhistory_h1']	= 'Date et heure de connexion';
$lang['ctracker_lhistory_h2']	= 'Addresses IP sauvegard�es';
$lang['ctracker_lhistory_nav']	= 'Historique des connexions CBACK CrackerTracker';
$lang['ctracker_lhistory_err']  = 'Vous devez �tre connect� pour utiliser les fonctionnalit�s de CrackerTracker.';
$lang['ctracker_lhistory_off']  = 'L\'Historique des connexions a �t� d�sactiv�e par l\'admin.';


/*
 * Other Language Strings used in the Board itself
 */
$lang['ctracker_gmb_link']		= 'L\'administrateur a �crit une note importante destin�e � tous les utilisateurs. Cette note peut �tre lue ici:<br /><br /><a href="%s">%s</a><br />';
$lang['ctracker_gmb_mark']		= 'Marquer le message comme lu';
$lang['ctracker_gmb_markip']	= 'Supprimer l\'astuce';
$lang['ctracker_gmb_loginlink']	= 'S�curit� des Connexions';
$lang['ctracker_gmb_1stadmin']	= 'Les param�tres du premier admin ne peuvent pas �tre chang�s.';
$lang['ctracker_gmb_pu_1']		= '<b>CBACK CrackerTracker - Mauvaise configuration</b><br /><br />le Port 21 est utilis� par les services FTP. Si le forum est redirig� via ce port, il ne sera normalement plus ex�cutable, car les navigateurs utilisent �galement ce port pour les acc�s ftp.';
$lang['ctracker_gmb_pu_2']		= '<b>CBACK CrackerTracker - Mauvaise configuration</b><br /><br />La dur�e de session est trop courte! Sans doute serz-vous d�connect� sans arr�t avant de pouvoir modifier ce param�tre.';
$lang['ctracker_gmb_pu_3']		= '<b>CBACK CrackerTracker - Mauvaise configuration</b><br /><br />Le chemin du script commence et/ou se termine avec autre chose qu\'un slash  ( comme /forum/) ou ne comporte pas uniquement un slash (/)!';
$lang['ctracker_gmb_pu_4']		= '<b>CBACK CrackerTracker - Mauvaise configuration</b><br /><br />Le nom du serveur ne doit pas se terminer par un slash (/) !';
$lang['ctracker_binf_spammer']	= 'Le syst�me de s�curit� anti-spam vous surveille. Vous avez atteint le nombre maximum de messages permis par p�riodes de %s secondes. Si vous essayez de poster un nouveau message avant les <b>%s</b> prochaines secondes, votre compte sera <b>blocked!</b><br /><br />Merci d\'attendre un peu. D�sol� de vous prendre de votre temps, mais c\'est n�cessaire pour des raisons de s�curit�.';
$lang['ctracker_binf_sban']		= 'Le syst�me de blocage des spams vous a banni car vous avez �t� identifi� comme un spammeur.';
$lang['ctracker_sendmail_info'] = 'Pour des raisons de s�curit� vous n\'�tes autoris� a envoyer un e-mail que toutes les % minutes.';
$lang['ctracker_pwreset_info']	= 'Pour des raisons de s�curit�, il ne vous est possible de changer de mot de passe que toutes les % minutes. Merci de contacter l\'administrateur si vous avez des probl�mes!';
$lang['ctracker_vc_guest_post'] = 'Confirmation Visuelle pour Invit�s';
$lang['ctracker_vc_guest_expl'] = 'Merci d\'entrer le code suivant avant d\'envoyer votre message. Ceci est n�cessaire avec les invit�s pour des raisons de s�curit� anti-spam.';

?>
