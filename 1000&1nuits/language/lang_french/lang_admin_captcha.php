<?php
/***************************************************************************
 *							lang_admin_captcha.php (french)
 *                         ------------------------
 *   copyright            : (C) 2006 AmigaLink
 *   website              : www.amigalink.de
 *   french translation   : Ram
 *
 ***************************************************************************/ 

$lang['VC_Captcha_Config'] = 'Configuration de CAPTCHA';
$lang['captcha_config_explain'] = 'Ici vous pouvez d�terminer l\'apparence de l\'image, ce qui indique que la confirmation visuel est activ�e.';
$lang['VC_active'] = 'La Confirmation Visuel is activ�e!';
$lang['VC_inactive'] = 'La Confirmation Visuel est d�sactiv�e!';
$lang['background_configs'] = 'Fond';
$lang['Click_return_captcha_config'] = 'Cliquez %sici%s pour retourner � la Configuration de CAPTCHA';

$lang['CAPTCHA_width'] = 'Largeur de l\'image';
$lang['CAPTCHA_height'] = 'Hauteur de l\'image';
$lang['background_color'] = 'Couleur de fond';
$lang['background_color_explain'] = 'Indication en hexadecimal (eg. #0000FF pour la couleur bleu).';
$lang['pre_letters'] = 'Nombres de lettres incluses dans l\'image';
$lang['pre_letters_explain'] = '';
$lang['great_pre_letters'] = 'Augmenter la nuance des lettres';
$lang['great_pre_letters_explain'] = '';
$lang['Random'] = 'Al�atoire';
$lang['random_font_per_letter'] = 'Font al�atoire pour chaque lettre';
$lang['random_font_per_letter_explain'] = 'Chaque lettres utilisent une font al�atoire.';

$lang['back_chess'] = 'Echequier';
$lang['back_chess_explain'] = 'Remplis le fond de l\'image par 16 rectangles.';
$lang['back_ellipses'] = 'Ellipses';
$lang['back_arcs'] = 'Lignes incurv�s';
$lang['back_lines'] = 'Lignes';
$lang['back_image'] = 'Image de fond';
$lang['back_image_explain'] = '(Cette fonction n\'est pas encore int�gr�)';

$lang['foreground_lattice'] = 'Effet "Treillis" au premier plan';
$lang['foreground_lattice_explain'] = '(largeur x hauteur)<br />Generate a white lattice over the CAPTCHA';
$lang['foreground_lattice_color'] = 'Lattice color';
$lang['foreground_lattice_color_explain'] = $lang['background_color_explain'];
$lang['gammacorrect'] = 'Correction du Contraste';
$lang['gammacorrect_explain'] = '(0 = off)<br /> NOTE!!! Changer la valeur a un effet directe sur la lisibilit� du CAPTCHA!';
$lang['generate_jpeg'] = 'Type d\'image';
$lang['generate_jpeg_explain'] = 'Les images au format JPEG ont une meilleur compression que les images PNG, n�anmoins la qualit� des images � une influence directe sur la lisibilit� du CAPTCHA.';
$lang['generate_jpeg_quality'] = 'Qualit�';
?>