#
# Basic DB data for phpBB2 devel
#
# $Id: mysql_basic.sql,v 1.29.2.27 2006/05/20 14:01:48 grahamje Exp $

# -- Config
INSERT INTO phpbb_config (config_name, config_value) VALUES ('config_id','1');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('board_disable','0');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('sitename','votredomaine.com');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('site_desc','Description de votre forum');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('cookie_name','phpbb2mysql');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('cookie_path','/');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('cookie_domain','');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('cookie_secure','0');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('session_length','3600');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('allow_html','0');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('allow_html_tags','b,i,u,pre');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('allow_bbcode','1');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('allow_smilies','1');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('allow_sig','1');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('allow_namechange','0');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('allow_theme_create','0');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('allow_avatar_local','0');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('allow_avatar_remote','0');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('allow_avatar_upload','0');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('override_user_style','0');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('posts_per_page','15');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('topics_per_page','50');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('hot_threshold','25');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('max_poll_options','10');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('max_sig_chars','255');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('max_inbox_privmsgs','50');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('max_sentbox_privmsgs','25');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('max_savebox_privmsgs','50');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('board_email_sig','Cordialement le Staff');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('board_email','votreadresse@votredomaine.com');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('enable_confirm', '1');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('allow_autologin','1');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('max_autologin_time','0');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('smtp_delivery','0');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('smtp_host','');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('smtp_username','');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('smtp_password','');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('sendmail_fix','0');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('require_activation','0');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('flood_interval','15');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('search_flood_interval','15');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('search_min_chars','3');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('max_login_attempts', '5');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('login_reset_time', '30');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('board_email_form','0');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('avatar_filesize','6144');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('avatar_max_width','80');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('avatar_max_height','80');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('avatar_path','images/avatars');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('avatar_gallery_path','images/avatars/gallery');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('smilies_path','images/smiles');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('default_style','1');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('default_dateformat','d M Y à G:i');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('board_timezone','0');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('prune_enable','1');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('privmsg_disable','0');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('gzip_compress','0');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('coppa_fax', '');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('coppa_mail', '');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('record_online_users', '0');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('record_online_date', '0');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('server_name', 'www.votredomaine.tld');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('server_port', '80');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('script_path', '/phpBB2/');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('version', '.0.21');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('rand_seed', '0');


# -- Categories
INSERT INTO phpbb_categories (cat_id, cat_title, cat_order) VALUES (1, 'Catégorie de tests', 10);


# -- Forums
INSERT INTO phpbb_forums (forum_id, forum_name, forum_desc, cat_id, forum_order, forum_posts, forum_topics, forum_last_post_id, auth_view, auth_read, auth_post, auth_reply, auth_edit, auth_delete, auth_announce, auth_sticky, auth_pollcreate, auth_vote, auth_attachments) VALUES (1, 'Forum de tests 1', 'Ceci est juste un forum de tests.', 1, 10, 1, 1, 1, 0, 0, 1, 1, 1, 1, 3, 3, 1, 1, 3);


# -- Users
INSERT INTO phpbb_users (user_id, username, user_level, user_regdate, user_password, user_email, user_icq, user_website, user_occ, user_from, user_interests, user_sig, user_viewemail, user_style, user_aim, user_yim, user_msnm, user_posts, user_attachsig, user_allowsmile, user_allowhtml, user_allowbbcode, user_allow_pm, user_notify_pm, user_allow_viewonline, user_rank, user_avatar, user_lang, user_timezone, user_dateformat, user_actkey, user_newpasswd, user_notify, user_active) VALUES ( -1, 'Anonymous', 0, 0, '', '', '', '', '', '', '', '', 0, NULL, '', '', '', 0, 0, 1, 1, 1, 0, 1, 1, NULL, '', '', 0, '', '', '', 0, 0);

# -- username: admin    password: admin (change this or remove it once everything is working!)
INSERT INTO phpbb_users (user_id, username, user_level, user_regdate, user_password, user_email, user_icq, user_website, user_occ, user_from, user_interests, user_sig, user_viewemail, user_style, user_aim, user_yim, user_msnm, user_posts, user_attachsig, user_allowsmile, user_allowhtml, user_allowbbcode, user_allow_pm, user_notify_pm, user_popup_pm, user_allow_viewonline, user_rank, user_avatar, user_lang, user_timezone, user_dateformat, user_actkey, user_newpasswd, user_notify, user_active) VALUES ( 2, 'Admin', 1, 0, '21232f297a57a5a743894a0e4a801fc3', 'admin@votredomaine.com', '', '', '', '', '', '', 1, 1, '', '', '', 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, '', 'french', 0, 'd M Y à G:i', '', '', 0, 1);


# -- Ranks
INSERT INTO phpbb_ranks (rank_id, rank_title, rank_min, rank_special, rank_image) VALUES ( 1, 'Administrateur', -1, 1, NULL);


# -- Groups
INSERT INTO phpbb_groups (group_id, group_name, group_description, group_single_user) VALUES (1, 'Anonymous', 'Personal User', 1);
INSERT INTO phpbb_groups (group_id, group_name, group_description, group_single_user) VALUES (2, 'Admin', 'Personal User', 1);


# -- User -> Group
INSERT INTO phpbb_user_group (group_id, user_id, user_pending) VALUES (1, -1, 0);
INSERT INTO phpbb_user_group (group_id, user_id, user_pending) VALUES (2, 2, 0);


# -- Demo Topic
INSERT INTO phpbb_topics (topic_id, topic_title, topic_poster, topic_time, topic_views, topic_replies, forum_id, topic_status, topic_type, topic_vote, topic_first_post_id, topic_last_post_id) VALUES (1, 'Bienvenue sur phpBB 2', 2, '972086460', 0, 0, 1, 0, 0, 0, 1, 1);


# -- Demo Post
INSERT INTO phpbb_posts (post_id, topic_id, forum_id, poster_id, post_time, post_username, poster_ip) VALUES (1, 1, 1, 2, 972086460, NULL, '7F000001');
INSERT INTO phpbb_posts_text (post_id, post_subject, post_text) VALUES (1, NULL, 'Ceci est un exemple de message (post) dû à votre installation de phpBB 2.  Vous pouvez supprimer ce message (post), ce sujet (topic) et même ce forum si vous le souhaitez, puisque tout semble fonctionner !');


# -- Themes
INSERT INTO phpbb_themes (themes_id, template_name, style_name, head_stylesheet, body_background, body_bgcolor, body_text, body_link, body_vlink, body_alink, body_hlink, tr_color1, tr_color2, tr_color3, tr_class1, tr_class2, tr_class3, th_color1, th_color2, th_color3, th_class1, th_class2, th_class3, td_color1, td_color2, td_color3, td_class1, td_class2, td_class3, fontface1, fontface2, fontface3, fontsize1, fontsize2, fontsize3, fontcolor1, fontcolor2, fontcolor3, span_class1, span_class2, span_class3, img_size_poll, img_size_privmsg) VALUES (1, 'pussycatblue', 'pussycatblue', 'pussycatblue.css', '', 'ECF0F6', '000000', '006699', '5493B4', '', '1994D1', 'E7E9F8', 'CACEF5', 'BDC2EC', '', '', '', '', '', '', '', '', '', '', '', '', 'row1', 'row2', '', '', '', '', 10, 11, 12, '444444', '006600', 'CC0000', '', '', '', 0, 0);
INSERT INTO phpbb_themes (themes_id, template_name, style_name, head_stylesheet, body_background, body_bgcolor, body_text, body_link, body_vlink, body_alink, body_hlink, tr_color1, tr_color2, tr_color3, tr_class1, tr_class2, tr_class3, th_color1, th_color2, th_color3, th_class1, th_class2, th_class3, td_color1, td_color2, td_color3, td_class1, td_class2, td_class3, fontface1, fontface2, fontface3, fontsize1, fontsize2, fontsize3, fontcolor1, fontcolor2, fontcolor3, span_class1, span_class2, span_class3, img_size_poll, img_size_privmsg) VALUES (2, 'subSilverPlus', 'subSilverPlus', 'subSilverPlus.css', '', 'E5E5E5', '000000', '006699', '5493B4', '', 'DD6900', 'EFEFEF', 'DEE3E7', 'D1D7DC', '', '', '', '98AAB1', '006699', 'FFFFFF', 'cellpic1.gif', 'cellpic3.gif', 'cellpic2.jpg', 'FAFAFA', 'FFFFFF', '', 'row1', 'row2', '', 'Verdana, Arial, Helvetica, sans-serif', 'Trebuchet MS', 'Courier, ''Courier New'', sans-serif', 10, 11, 12, '444444', '006600', 'FFA34F', '', '', '', 0, 0);

INSERT INTO phpbb_themes_name (themes_id, tr_color1_name, tr_color2_name, tr_color3_name, tr_class1_name, tr_class2_name, tr_class3_name, th_color1_name, th_color2_name, th_color3_name, th_class1_name, th_class2_name, th_class3_name, td_color1_name, td_color2_name, td_color3_name, td_class1_name, td_class2_name, td_class3_name, fontface1_name, fontface2_name, fontface3_name, fontsize1_name, fontsize2_name, fontsize3_name, fontcolor1_name, fontcolor2_name, fontcolor3_name, span_class1_name, span_class2_name, span_class3_name) VALUES (1, 'Couleur de la rangée la plus claire', 'Couleur de la rangée moyenne', 'Couleur de la rangée la plus foncée', '', '', '', 'Bordure entourant la page toute entière', 'Bordure externe à la table', 'Bordure interne à la table', 'Image argentée dégradée', 'Image bleutée dégradée', 'Image fondue dégradée', 'Arrière plan du cadre de citation', 'Toutes les zones blanches', '', 'Arrière plan des messages des sujets', '2nd arrière plan des messages des sujets', '', 'Police principale', 'Police additionnelle des titres des sujets', 'Polices de forme', 'Plus petite taille de police', 'Taille de police moyenne', 'Taille de police normale (corps du messages etc...)', 'Texte de citation et du copyright', 'Couleur du texte de code', 'Couleur principale des textes des en-têtes de table', '', '', '');


# -- Smilies
INSERT INTO phpbb_smilies (smilies_id, code, smile_url, emoticon) VALUES ( 1, ':D', 'icon_biggrin.gif', 'Très heureux');
INSERT INTO phpbb_smilies (smilies_id, code, smile_url, emoticon) VALUES ( 2, ':-D', 'icon_biggrin.gif', 'Très heureux');
INSERT INTO phpbb_smilies (smilies_id, code, smile_url, emoticon) VALUES ( 3, ':grin:', 'icon_biggrin.gif', 'Très heureux');
INSERT INTO phpbb_smilies (smilies_id, code, smile_url, emoticon) VALUES ( 4, ':)', 'icon_smile.gif', 'Sourire');
INSERT INTO phpbb_smilies (smilies_id, code, smile_url, emoticon) VALUES ( 5, ':-)', 'icon_smile.gif', 'Sourire');
INSERT INTO phpbb_smilies (smilies_id, code, smile_url, emoticon) VALUES ( 6, ':smile:', 'icon_smile.gif', 'Sourire');
INSERT INTO phpbb_smilies (smilies_id, code, smile_url, emoticon) VALUES ( 7, ':(', 'icon_sad.gif', 'Triste');
INSERT INTO phpbb_smilies (smilies_id, code, smile_url, emoticon) VALUES ( 8, ':-(', 'icon_sad.gif', 'Triste');
INSERT INTO phpbb_smilies (smilies_id, code, smile_url, emoticon) VALUES ( 9, ':sad:', 'icon_sad.gif', 'Triste');
INSERT INTO phpbb_smilies (smilies_id, code, smile_url, emoticon) VALUES ( 10, ':o', 'icon_surprised.gif', 'Surpris');
INSERT INTO phpbb_smilies (smilies_id, code, smile_url, emoticon) VALUES ( 11, ':-o', 'icon_surprised.gif', 'Surpris');
INSERT INTO phpbb_smilies (smilies_id, code, smile_url, emoticon) VALUES ( 12, ':eek:', 'icon_surprised.gif', 'Surpris');
INSERT INTO phpbb_smilies (smilies_id, code, smile_url, emoticon) VALUES ( 13, ':shock:', 'icon_eek.gif', 'Choqué');
INSERT INTO phpbb_smilies (smilies_id, code, smile_url, emoticon) VALUES ( 14, ':?', 'icon_confused.gif', 'Confus');
INSERT INTO phpbb_smilies (smilies_id, code, smile_url, emoticon) VALUES ( 15, ':-?', 'icon_confused.gif', 'Confus');
INSERT INTO phpbb_smilies (smilies_id, code, smile_url, emoticon) VALUES ( 16, ':???:', 'icon_confused.gif', 'Confus');
INSERT INTO phpbb_smilies (smilies_id, code, smile_url, emoticon) VALUES ( 17, '8)', 'icon_cool.gif', 'Cool');
INSERT INTO phpbb_smilies (smilies_id, code, smile_url, emoticon) VALUES ( 18, '8-)', 'icon_cool.gif', 'Cool');
INSERT INTO phpbb_smilies (smilies_id, code, smile_url, emoticon) VALUES ( 19, ':cool:', 'icon_cool.gif', 'Cool');
INSERT INTO phpbb_smilies (smilies_id, code, smile_url, emoticon) VALUES ( 20, ':lol:', 'icon_lol.gif', 'Rigole');
INSERT INTO phpbb_smilies (smilies_id, code, smile_url, emoticon) VALUES ( 21, ':x', 'icon_mad.gif', 'En colère');
INSERT INTO phpbb_smilies (smilies_id, code, smile_url, emoticon) VALUES ( 22, ':-x', 'icon_mad.gif', 'En colère');
INSERT INTO phpbb_smilies (smilies_id, code, smile_url, emoticon) VALUES ( 23, ':mad:', 'icon_mad.gif', 'En colère');
INSERT INTO phpbb_smilies (smilies_id, code, smile_url, emoticon) VALUES ( 24, ':P', 'icon_razz.gif', 'Moqueur');
INSERT INTO phpbb_smilies (smilies_id, code, smile_url, emoticon) VALUES ( 25, ':-P', 'icon_razz.gif', 'Moqueur');
INSERT INTO phpbb_smilies (smilies_id, code, smile_url, emoticon) VALUES ( 26, ':razz:', 'icon_razz.gif', 'Moqueur');
INSERT INTO phpbb_smilies (smilies_id, code, smile_url, emoticon) VALUES ( 27, ':oops:', 'icon_redface.gif', 'Embarassé');
INSERT INTO phpbb_smilies (smilies_id, code, smile_url, emoticon) VALUES ( 28, ':cry:', 'icon_cry.gif', 'Pleure ou Très triste');
INSERT INTO phpbb_smilies (smilies_id, code, smile_url, emoticon) VALUES ( 29, ':evil:', 'icon_evil.gif', 'Démon ou Très en colère');
INSERT INTO phpbb_smilies (smilies_id, code, smile_url, emoticon) VALUES ( 30, ':twisted:', 'icon_twisted.gif', 'Démoniaque');
INSERT INTO phpbb_smilies (smilies_id, code, smile_url, emoticon) VALUES ( 31, ':roll:', 'icon_rolleyes.gif', 'Roulement des yeux');
INSERT INTO phpbb_smilies (smilies_id, code, smile_url, emoticon) VALUES ( 32, ':wink:', 'icon_wink.gif', 'Clin d"oeil');
INSERT INTO phpbb_smilies (smilies_id, code, smile_url, emoticon) VALUES ( 33, ';)', 'icon_wink.gif', 'Clin d"oeil');
INSERT INTO phpbb_smilies (smilies_id, code, smile_url, emoticon) VALUES ( 34, ';-)', 'icon_wink.gif', 'Clin d"oeil');
INSERT INTO phpbb_smilies (smilies_id, code, smile_url, emoticon) VALUES ( 35, ':!:', 'icon_exclaim.gif', 'Exclamation');
INSERT INTO phpbb_smilies (smilies_id, code, smile_url, emoticon) VALUES ( 36, ':?:', 'icon_question.gif', 'Question');
INSERT INTO phpbb_smilies (smilies_id, code, smile_url, emoticon) VALUES ( 37, ':idea:', 'icon_idea.gif', 'Idée');
INSERT INTO phpbb_smilies (smilies_id, code, smile_url, emoticon) VALUES ( 38, ':arrow:', 'icon_arrow.gif', 'Flêche');
INSERT INTO phpbb_smilies (smilies_id, code, smile_url, emoticon) VALUES ( 39, ':|', 'icon_neutral.gif', 'Neutre');
INSERT INTO phpbb_smilies (smilies_id, code, smile_url, emoticon) VALUES ( 40, ':-|', 'icon_neutral.gif', 'Neutre');
INSERT INTO phpbb_smilies (smilies_id, code, smile_url, emoticon) VALUES ( 41, ':neutral:', 'icon_neutral.gif', 'Neutre');
INSERT INTO phpbb_smilies (smilies_id, code, smile_url, emoticon) VALUES ( 42, ':mrgreen:', 'icon_mrgreen.gif', 'Mr. Green');


# -- wordlist
INSERT INTO phpbb_search_wordlist (word_id, word_text, word_common) VALUES ( 1, 'example', 0 );
INSERT INTO phpbb_search_wordlist (word_id, word_text, word_common) VALUES ( 2, 'message', 0 );
INSERT INTO phpbb_search_wordlist (word_id, word_text, word_common) VALUES ( 3, 'phpbb', 0 );
INSERT INTO phpbb_search_wordlist (word_id, word_text, word_common) VALUES ( 4, 'installation', 0 );
INSERT INTO phpbb_search_wordlist (word_id, word_text, word_common) VALUES ( 5, 'suppression', 0 );
INSERT INTO phpbb_search_wordlist (word_id, word_text, word_common) VALUES ( 6, 'sujet', 0 );
INSERT INTO phpbb_search_wordlist (word_id, word_text, word_common) VALUES ( 7, 'forum', 0 );
INSERT INTO phpbb_search_wordlist (word_id, word_text, word_common) VALUES ( 8, 'depuis', 0 );
INSERT INTO phpbb_search_wordlist (word_id, word_text, word_common) VALUES ( 9, 'tout', 0 );
INSERT INTO phpbb_search_wordlist (word_id, word_text, word_common) VALUES ( 10, 'semble', 0 );
INSERT INTO phpbb_search_wordlist (word_id, word_text, word_common) VALUES ( 11, 'au travail', 0 );
INSERT INTO phpbb_search_wordlist (word_id, word_text, word_common) VALUES ( 12, 'bienvenue', 0 );


# -- wordmatch
INSERT INTO phpbb_search_wordmatch (word_id, post_id, title_match) VALUES ( 1, 1, 0 );
INSERT INTO phpbb_search_wordmatch (word_id, post_id, title_match) VALUES ( 2, 1, 0 );
INSERT INTO phpbb_search_wordmatch (word_id, post_id, title_match) VALUES ( 3, 1, 0 );
INSERT INTO phpbb_search_wordmatch (word_id, post_id, title_match) VALUES ( 4, 1, 0 );
INSERT INTO phpbb_search_wordmatch (word_id, post_id, title_match) VALUES ( 5, 1, 0 );
INSERT INTO phpbb_search_wordmatch (word_id, post_id, title_match) VALUES ( 6, 1, 0 );
INSERT INTO phpbb_search_wordmatch (word_id, post_id, title_match) VALUES ( 7, 1, 0 );
INSERT INTO phpbb_search_wordmatch (word_id, post_id, title_match) VALUES ( 8, 1, 0 );
INSERT INTO phpbb_search_wordmatch (word_id, post_id, title_match) VALUES ( 9, 1, 0 );
INSERT INTO phpbb_search_wordmatch (word_id, post_id, title_match) VALUES ( 10, 1, 0 );
INSERT INTO phpbb_search_wordmatch (word_id, post_id, title_match) VALUES ( 11, 1, 0 );
INSERT INTO phpbb_search_wordmatch (word_id, post_id, title_match) VALUES ( 12, 1, 1 );
INSERT INTO phpbb_search_wordmatch (word_id, post_id, title_match) VALUES ( 3, 1, 1 );



# -- ~ 1000 et 1 nuits ~
# -- -- Release 1 - 2.2.1

INSERT INTO phpbb_config (config_name, config_value) VALUES ('premod_version', '2.2.1');

# -- -- -- Absent User Avatar
ALTER TABLE phpbb_users ADD user_absent tinyint(1) NULL DEFAULT 0;
INSERT INTO phpbb_config (config_name, config_value) VALUES ('absent_avatar', 'images/absent_user_avatar.gif');

# -- -- -- Bbc box
INSERT INTO phpbb_bbc_box VALUES (1, 'strike', '1', '0', 's', 's', 'strike', 'strike', '0', '10');
INSERT INTO phpbb_bbc_box VALUES (2, 'spoiler', '1', '0', 'spoil', 'spoil', 'spoiler', 'spoiler', '0', '20');
INSERT INTO phpbb_bbc_box VALUES (3, 'fade', '0', '0', 'fade', 'fade', 'fade', 'fade', '0', '30');
INSERT INTO phpbb_bbc_box VALUES (4, 'rainbow', '1', '0', 'rainbow', 'rainbow', 'rainbow', 'rainbow', '1', '40');
INSERT INTO phpbb_bbc_box VALUES (5, 'justify', '1', '0', 'align=justify', 'align', 'justify', 'justify', '0', '50');
INSERT INTO phpbb_bbc_box VALUES (6, 'right', '1', '0', 'align=right', 'align', 'right', 'right', '0', '60');
INSERT INTO phpbb_bbc_box VALUES (7, 'center', '1', '0', 'align=center', 'align', 'center', 'center', '0', '70');
INSERT INTO phpbb_bbc_box VALUES (8, 'left', '1', '0', 'align=left', 'align', 'left', 'left', '1', '80');
INSERT INTO phpbb_bbc_box VALUES (9, 'link', '1', '0', 'link=', 'link', 'link', 'alink', '0', '90');
INSERT INTO phpbb_bbc_box VALUES (10, 'target', '1', '0', 'target=', 'target', 'target', 'atarget', '1', '100');
INSERT INTO phpbb_bbc_box VALUES (11, 'marqd', '1', '0', 'marq=down', 'marq', 'marqd', 'marqd', '0', '110');
INSERT INTO phpbb_bbc_box VALUES (12, 'marqu', '1', '0', 'marq=up', 'marq', 'marqu', 'marqu', '0', '120');
INSERT INTO phpbb_bbc_box VALUES (13, 'marql', '1', '0', 'marq=left', 'marq', 'marql', 'marql', '0', '130');
INSERT INTO phpbb_bbc_box VALUES (14, 'marqr', '1', '0', 'marq=right', 'marq', 'marqr', 'marqr', '1', '140');
INSERT INTO phpbb_bbc_box VALUES (15, 'email', '1', '0', 'email', 'email', 'email', 'email', '0', '150');
INSERT INTO phpbb_bbc_box VALUES (16, 'flash', '1', '0', 'flash width=250 height=250', 'flash', 'flash', 'flash', '0', '160');
INSERT INTO phpbb_bbc_box VALUES (17, 'video', '1', '0', 'video width=400 height=350', 'video', 'video', 'video', '0', '170');
INSERT INTO phpbb_bbc_box VALUES (18, 'stream', '1', '0', 'stream', 'stream', 'stream', 'stream', '0', '180');
INSERT INTO phpbb_bbc_box VALUES (19, 'real', '1', '0', 'ram width=220 height=140', 'ram', 'real', 'real', '0', '190');
INSERT INTO phpbb_bbc_box VALUES (20, 'quick', '1', '0', 'quick width=480 height=224', 'quick', 'quick', 'quick', '1', '200');
INSERT INTO phpbb_bbc_box VALUES (21, 'sup', '1', '0', 'sup', 'sup', 'sup', 'sup', '0', '210');
INSERT INTO phpbb_bbc_box VALUES (22, 'sub', '1', '0', 'sub', 'sub', 'sub', 'sub', '1', '220');

INSERT INTO phpbb_config (config_name, config_value) VALUES ('bbc_box_on', '1');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('bbc_advanced', '0');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('bbc_per_row', '14');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('bbc_time_regen', '0');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('bbc_style_path', 'default');

# -- -- -- Birthday Event 
ALTER TABLE phpbb_users ADD user_birthday varchar(10) DEFAULT '' NOT NULL;
INSERT INTO phpbb_config (config_name, config_value) VALUES ('birthday_settings', '0-1-5-100');

# -- -- -- Browsers List
ALTER TABLE phpbb_users ADD user_browser varchar(100) DEFAULT '' NOT NULL;
INSERT INTO phpbb_config (config_name, config_value) VALUES ('browsers_path', 'images/browsers/');

# -- -- -- Corbeille
INSERT INTO phpbb_config (config_name, config_value) VALUES ('forum_corbeille', '0');

# -- -- -- Forum Icon
ALTER TABLE phpbb_forums ADD forum_icon VARCHAR( 255 ) default NULL;

# -- -- -- Forum Link
ALTER TABLE phpbb_forums ADD forum_link VARCHAR(255) NULL;
ALTER TABLE phpbb_forums ADD forum_link_count INT(11) NOT NULL DEFAULT '1';
ALTER TABLE phpbb_forums ADD forum_link_date INT(11) NOT NULL DEFAULT '0';

# -- -- -- Gender
ALTER TABLE phpbb_users ADD user_gender TINYINT NOT NULL DEFAULT '0';

# -- -- -- Online-Offline-Hidden
ALTER TABLE phpbb_themes ADD online_color varchar(6) DEFAULT '008500' NOT NULL;
ALTER TABLE phpbb_themes ADD offline_color varchar(6) DEFAULT 'DF0000' NOT NULL;
ALTER TABLE phpbb_themes ADD hidden_color varchar(6) DEFAULT 'EBD400' NOT NULL;
INSERT INTO phpbb_config (config_name, config_value) VALUES ('online_time', '60');

# -- -- -- Post Description
ALTER TABLE phpbb_posts_text ADD post_description VARCHAR(100) NULL AFTER post_subject;
ALTER TABLE phpbb_topics ADD topic_description VARCHAR(150) NOT NULL AFTER topic_title;

# -- -- -- Pseudo sub-forums
ALTER TABLE phpbb_forums ADD attached_forum_id MEDIUMINT(8) DEFAULT '-1' NOT NULL;
ALTER TABLE phpbb_topics ADD INDEX topic_last_post_id(topic_last_post_id);

# -- -- -- Quick Post ES
INSERT INTO phpbb_config (config_name, config_value) VALUES ('users_qp_settings', '1-0-1-1-1-1');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('anons_qp_settings', '1-0-1-1-1-1');
ALTER TABLE phpbb_forums ADD forum_qpes tinyint(1) DEFAULT '1' NOT NULL;
ALTER TABLE phpbb_users ADD user_qp_settings varchar(25) DEFAULT '0' NOT NULL;
UPDATE phpbb_users SET user_qp_settings = '1-0-1-1-1-1' WHERE user_qp_settings = '0';

# -- -- -- Reason
INSERT INTO phpbb_config (config_name, config_value) VALUES ('reason', 'Fermeture du forum pour modifications');

# -- -- -- Skype
ALTER TABLE phpbb_users ADD user_skype VARCHAR( 255 ) AFTER user_msnm;

# -- -- -- Text Visit Counter
INSERT INTO phpbb_config (config_name, config_value) VALUES ('visit_counter', '1');

# -- -- -- Today Userlist
INSERT INTO phpbb_config (config_name, config_value) VALUES ('today_day_selected', '0');



# -- ~ 1000 et 1 nuits ~
# -- -- Release 2 - 2.2.2

UPDATE phpbb_config SET config_value = '2.2.2' WHERE config_name = 'premod_version';

# -- -- -- Attachment
INSERT INTO phpbb_attachments_config (config_name, config_value) VALUES ('upload_dir','files');
INSERT INTO phpbb_attachments_config (config_name, config_value) VALUES ('upload_img','images/icon_clip.gif');
INSERT INTO phpbb_attachments_config (config_name, config_value) VALUES ('topic_icon','images/icon_clip.gif');
INSERT INTO phpbb_attachments_config (config_name, config_value) VALUES ('display_order','0');

INSERT INTO phpbb_attachments_config (config_name, config_value) VALUES ('max_filesize','262144');
INSERT INTO phpbb_attachments_config (config_name, config_value) VALUES ('attachment_quota','52428800');
INSERT INTO phpbb_attachments_config (config_name, config_value) VALUES ('max_filesize_pm','262144');

INSERT INTO phpbb_attachments_config (config_name, config_value) VALUES ('max_attachments','3');
INSERT INTO phpbb_attachments_config (config_name, config_value) VALUES ('max_attachments_pm','1');

INSERT INTO phpbb_attachments_config (config_name, config_value) VALUES ('disable_mod','0');
INSERT INTO phpbb_attachments_config (config_name, config_value) VALUES ('allow_pm_attach','1');
INSERT INTO phpbb_attachments_config (config_name, config_value) VALUES ('attachment_topic_review','0');
INSERT INTO phpbb_attachments_config (config_name, config_value) VALUES ('allow_ftp_upload','0');
INSERT INTO phpbb_attachments_config (config_name, config_value) VALUES ('show_apcp','0');
INSERT INTO phpbb_attachments_config (config_name, config_value) VALUES ('attach_version','2.4.3');
INSERT INTO phpbb_attachments_config (config_name, config_value) VALUES ('default_upload_quota', '0');
INSERT INTO phpbb_attachments_config (config_name, config_value) VALUES ('default_pm_quota', '0');

INSERT INTO phpbb_attachments_config (config_name, config_value) VALUES ('ftp_server','');
INSERT INTO phpbb_attachments_config (config_name, config_value) VALUES ('ftp_path','');
INSERT INTO phpbb_attachments_config (config_name, config_value) VALUES ('download_path','');
INSERT INTO phpbb_attachments_config (config_name, config_value) VALUES ('ftp_user','');
INSERT INTO phpbb_attachments_config (config_name, config_value) VALUES ('ftp_pass','');
INSERT INTO phpbb_attachments_config (config_name, config_value) VALUES ('ftp_pasv_mode','1');

INSERT INTO phpbb_attachments_config (config_name, config_value) VALUES ('img_display_inlined','1');
INSERT INTO phpbb_attachments_config (config_name, config_value) VALUES ('img_max_width','0');
INSERT INTO phpbb_attachments_config (config_name, config_value) VALUES ('img_max_height','0');
INSERT INTO phpbb_attachments_config (config_name, config_value) VALUES ('img_link_width','0');
INSERT INTO phpbb_attachments_config (config_name, config_value) VALUES ('img_link_height','0');
INSERT INTO phpbb_attachments_config (config_name, config_value) VALUES ('img_create_thumbnail','0');
INSERT INTO phpbb_attachments_config (config_name, config_value) VALUES ('img_min_thumb_filesize','12000');
INSERT INTO phpbb_attachments_config (config_name, config_value) VALUES ('img_imagick', '');
INSERT INTO phpbb_attachments_config (config_name, config_value) VALUES ('use_gd2','0');

INSERT INTO phpbb_attachments_config (config_name, config_value) VALUES ('wma_autoplay','0');
INSERT INTO phpbb_attachments_config (config_name, config_value) VALUES ('flash_autoplay','0');

INSERT INTO phpbb_forbidden_extensions (ext_id, extension) VALUES (1,'php');
INSERT INTO phpbb_forbidden_extensions (ext_id, extension) VALUES (2,'php3');
INSERT INTO phpbb_forbidden_extensions (ext_id, extension) VALUES (3,'php4');
INSERT INTO phpbb_forbidden_extensions (ext_id, extension) VALUES (4,'phtml');
INSERT INTO phpbb_forbidden_extensions (ext_id, extension) VALUES (5,'pl');
INSERT INTO phpbb_forbidden_extensions (ext_id, extension) VALUES (6,'asp');
INSERT INTO phpbb_forbidden_extensions (ext_id, extension) VALUES (7,'cgi');

INSERT INTO phpbb_extension_groups (group_id, group_name, cat_id, allow_group, download_mode, upload_icon, max_filesize, forum_permissions) VALUES (1,'Images',1,1,1,'',0,'');
INSERT INTO phpbb_extension_groups (group_id, group_name, cat_id, allow_group, download_mode, upload_icon, max_filesize, forum_permissions) VALUES (2,'Archives',0,1,1,'',0,'');
INSERT INTO phpbb_extension_groups (group_id, group_name, cat_id, allow_group, download_mode, upload_icon, max_filesize, forum_permissions) VALUES (3,'Plain Text',0,0,1,'',0,'');
INSERT INTO phpbb_extension_groups (group_id, group_name, cat_id, allow_group, download_mode, upload_icon, max_filesize, forum_permissions) VALUES (4,'Documents',0,0,1,'',0,'');
INSERT INTO phpbb_extension_groups (group_id, group_name, cat_id, allow_group, download_mode, upload_icon, max_filesize, forum_permissions) VALUES (5,'Real Media',0,0,2,'',0,'');
INSERT INTO phpbb_extension_groups (group_id, group_name, cat_id, allow_group, download_mode, upload_icon, max_filesize, forum_permissions) VALUES (6,'Streams',2,0,1,'',0,'');
INSERT INTO phpbb_extension_groups (group_id, group_name, cat_id, allow_group, download_mode, upload_icon, max_filesize, forum_permissions) VALUES (7,'Flash Files',3,0,1,'',0,'');

INSERT INTO phpbb_extensions (ext_id, group_id, extension, comment) VALUES (1, 1,'gif', '');
INSERT INTO phpbb_extensions (ext_id, group_id, extension, comment) VALUES (2, 1,'png', '');
INSERT INTO phpbb_extensions (ext_id, group_id, extension, comment) VALUES (3, 1,'jpeg', '');
INSERT INTO phpbb_extensions (ext_id, group_id, extension, comment) VALUES (4, 1,'jpg', '');
INSERT INTO phpbb_extensions (ext_id, group_id, extension, comment) VALUES (5, 1,'tif', '');
INSERT INTO phpbb_extensions (ext_id, group_id, extension, comment) VALUES (6, 1,'tga', '');
INSERT INTO phpbb_extensions (ext_id, group_id, extension, comment) VALUES (7, 2,'gtar', '');
INSERT INTO phpbb_extensions (ext_id, group_id, extension, comment) VALUES (8, 2,'gz', '');
INSERT INTO phpbb_extensions (ext_id, group_id, extension, comment) VALUES (9, 2,'tar', '');
INSERT INTO phpbb_extensions (ext_id, group_id, extension, comment) VALUES (10, 2,'zip', '');
INSERT INTO phpbb_extensions (ext_id, group_id, extension, comment) VALUES (11, 2,'rar', '');
INSERT INTO phpbb_extensions (ext_id, group_id, extension, comment) VALUES (12, 2,'ace', '');
INSERT INTO phpbb_extensions (ext_id, group_id, extension, comment) VALUES (13, 3,'txt', '');
INSERT INTO phpbb_extensions (ext_id, group_id, extension, comment) VALUES (14, 3,'c', '');
INSERT INTO phpbb_extensions (ext_id, group_id, extension, comment) VALUES (15, 3,'h', '');
INSERT INTO phpbb_extensions (ext_id, group_id, extension, comment) VALUES (16, 3,'cpp', '');
INSERT INTO phpbb_extensions (ext_id, group_id, extension, comment) VALUES (17, 3,'hpp', '');
INSERT INTO phpbb_extensions (ext_id, group_id, extension, comment) VALUES (18, 3,'diz', '');
INSERT INTO phpbb_extensions (ext_id, group_id, extension, comment) VALUES (19, 4,'xls', '');
INSERT INTO phpbb_extensions (ext_id, group_id, extension, comment) VALUES (20, 4,'doc', '');
INSERT INTO phpbb_extensions (ext_id, group_id, extension, comment) VALUES (21, 4,'dot', '');
INSERT INTO phpbb_extensions (ext_id, group_id, extension, comment) VALUES (22, 4,'pdf', '');
INSERT INTO phpbb_extensions (ext_id, group_id, extension, comment) VALUES (23, 4,'ai', '');
INSERT INTO phpbb_extensions (ext_id, group_id, extension, comment) VALUES (24, 4,'ps', '');
INSERT INTO phpbb_extensions (ext_id, group_id, extension, comment) VALUES (25, 4,'ppt', '');
INSERT INTO phpbb_extensions (ext_id, group_id, extension, comment) VALUES (26, 5,'rm', '');
INSERT INTO phpbb_extensions (ext_id, group_id, extension, comment) VALUES (27, 6,'wma', '');
INSERT INTO phpbb_extensions (ext_id, group_id, extension, comment) VALUES (28, 7,'swf', '');

INSERT INTO phpbb_quota_limits (quota_limit_id, quota_desc, quota_limit) VALUES (1, 'Low', 262144);
INSERT INTO phpbb_quota_limits (quota_limit_id, quota_desc, quota_limit) VALUES (2, 'Medium', 2097152);
INSERT INTO phpbb_quota_limits (quota_limit_id, quota_desc, quota_limit) VALUES (3, 'High', 5242880);

# -- -- -- Flag
ALTER TABLE phpbb_users ADD user_flag varchar(100) DEFAULT '' NOT NULL;
INSERT INTO phpbb_config (config_name, config_value) VALUES ('flags_path', 'images/flags/');

# -- -- -- Mini Last Visit
ALTER TABLE phpbb_users ADD user_lastlogin INT (11) DEFAULT '0' NOT NULL;
UPDATE phpbb_users SET user_lastlogin=user_lastvisit WHERE user_lastlogin='0';

# -- -- -- Rank Color System
INSERT INTO phpbb_rcs VALUES (1, 'Administrator', 'CC0000', 0, 1, 10);

ALTER TABLE phpbb_groups ADD group_color mediumint(8) DEFAULT '0' NOT NULL;

ALTER TABLE phpbb_users ADD user_color mediumint(8) DEFAULT '0' NOT NULL;
ALTER TABLE phpbb_users ADD user_group_id mediumint(8) DEFAULT '0' NOT NULL;

INSERT INTO phpbb_config (config_name, config_value) VALUES ('cache_rcs', '0');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('rcs_enable', '1');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('rcs_group_stats', '1');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('rcs_group_admin', '0');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('rcs_group_mod', '0');

ALTER TABLE phpbb_themes ADD rcs_admincolor varchar(6) DEFAULT '' NOT NULL;
ALTER TABLE phpbb_themes ADD rcs_modcolor varchar(6) DEFAULT '' NOT NULL;
ALTER TABLE phpbb_themes ADD rcs_usercolor varchar(6) DEFAULT '' NOT NULL;
UPDATE phpbb_themes SET rcs_admincolor = 'FFA34F';
UPDATE phpbb_themes SET rcs_modcolor = '006600';
UPDATE phpbb_themes SET rcs_usercolor = '006699';



# -- ~ 1000 et 1 nuits ~
# -- -- Release 3 - 2.2.3

UPDATE phpbb_config SET config_value = '2.2.3' WHERE config_name = 'premod_version';

# -- -- -- Annonce Globale
INSERT INTO phpbb_config (config_name, config_value) VALUES ('annonce_globale_index', '1');
ALTER TABLE phpbb_auth_access ADD auth_global_announce TINYINT(1) NOT NULL AFTER auth_announce;
ALTER TABLE phpbb_forums ADD auth_global_announce TINYINT(2) NOT NULL DEFAULT '5' AFTER auth_announce;

# -- -- -- Quick Title Edition
ALTER TABLE phpbb_topics ADD title_compl_infos VARCHAR(255);
ALTER TABLE phpbb_topics ADD title_compl_color VARCHAR(6) default '' NOT NULL;
ALTER TABLE phpbb_topics ADD title_pos TINYINT(1) DEFAULT '0' NOT NULL;

# -- -- -- Shoutbox
INSERT INTO phpbb_config (config_name, config_value) VALUES ('prune_shouts', '0');



# -- ~ 1000 et 1 nuits ~
# -- -- Release 3 - 2.2.3a

UPDATE phpbb_config SET config_value = '2.2.3a' WHERE config_name = 'premod_version';



# -- ~ 1000 et 1 nuits ~
# -- -- Release 3 - 2.2.3b

UPDATE phpbb_config SET config_value = '2.2.3b' WHERE config_name = 'premod_version';




# -- ~ 1000 et 1 nuits ~
# -- -- Release 3 - 2.2.3c

UPDATE phpbb_config SET config_value = '2.2.3c' WHERE config_name = 'premod_version';



# -- ~ 1000 et 1 nuits ~
# -- -- Release 4 - 2.2.4
# -- -- -- Post icon
ALTER TABLE phpbb_topics ADD topic_icon TINYINT(2);
ALTER TABLE phpbb_posts ADD post_icon TINYINT(2);
ALTER TABLE phpbb_posts ADD INDEX (post_icon);


# -- -- -- Simple Split Topic Type
INSERT INTO phpbb_config (config_name, config_value) VALUES ('simple_split_topic_type', '1');


UPDATE phpbb_config SET config_value = '2.2.4' WHERE config_name = 'premod_version';


ALTER TABLE phpbb_forums ADD auth_download TINYINT(2) DEFAULT '0' NOT NULL;  
ALTER TABLE phpbb_auth_access ADD auth_download TINYINT(1) DEFAULT '0' NOT NULL;  
ALTER TABLE phpbb_posts ADD post_attachment TINYINT(1) DEFAULT '0' NOT NULL;
ALTER TABLE phpbb_topics ADD topic_attachment TINYINT(1) DEFAULT '0' NOT NULL;
ALTER TABLE phpbb_privmsgs ADD privmsgs_attachment TINYINT(1) DEFAULT '0' NOT NULL;
/* Advanced Visual Confirmation */
INSERT INTO phpbb_captcha_config VALUES ('width', '350');
INSERT INTO phpbb_captcha_config VALUES ('height', '90');
INSERT INTO phpbb_captcha_config VALUES ('background_color', '#E5ECF9');
INSERT INTO phpbb_captcha_config VALUES ('jpeg', '0');
INSERT INTO phpbb_captcha_config VALUES ('jpeg_quality', '50');
INSERT INTO phpbb_captcha_config VALUES ('pre_letters', '0');
INSERT INTO phpbb_captcha_config VALUES ('pre_letters_great', '0');
INSERT INTO phpbb_captcha_config VALUES ('font', '0');
INSERT INTO phpbb_captcha_config VALUES ('chess', '0');
INSERT INTO phpbb_captcha_config VALUES ('ellipses', '1');
INSERT INTO phpbb_captcha_config VALUES ('arcs', '0');
INSERT INTO phpbb_captcha_config VALUES ('lines', '1');
INSERT INTO phpbb_captcha_config VALUES ('image', '0');
INSERT INTO phpbb_captcha_config VALUES ('gammacorrect', '0.8');
INSERT INTO phpbb_captcha_config VALUES ('foreground_lattice_x', '15');
INSERT INTO phpbb_captcha_config VALUES ('foreground_lattice_y', '15');
INSERT INTO phpbb_captcha_config VALUES ('lattice_color', '#FFFFFF');
ALTER TABLE phpbb_confirm CHANGE code code CHAR(10) NOT NULL;

ALTER TABLE phpbb_users ADD ct_search_time INT( 11 ) NULL DEFAULT 1 AFTER user_newpasswd;
ALTER TABLE phpbb_users ADD ct_search_count MEDIUMINT( 8 ) NULL DEFAULT 1 AFTER ct_search_time;
ALTER TABLE phpbb_users ADD ct_last_mail INT( 11 ) NULL DEFAULT 1 AFTER ct_search_count;
ALTER TABLE phpbb_users ADD ct_last_post INT( 11 ) NULL DEFAULT 1 AFTER ct_last_mail;
ALTER TABLE phpbb_users ADD ct_post_counter MEDIUMINT( 8 ) NULL DEFAULT 1 AFTER ct_last_post;
ALTER TABLE phpbb_users ADD ct_last_pw_reset INT( 11 ) NULL DEFAULT 1 AFTER ct_post_counter;
ALTER TABLE phpbb_users ADD ct_enable_ip_warn TINYINT( 1 ) NULL DEFAULT 1 AFTER ct_last_pw_reset;
ALTER TABLE phpbb_users ADD ct_last_used_ip VARCHAR( 16 ) NULL DEFAULT '0.0.0.0' AFTER ct_enable_ip_warn;
ALTER TABLE phpbb_users ADD ct_last_ip VARCHAR( 16 ) NULL DEFAULT '0.0.0.0' AFTER ct_last_used_ip;
ALTER TABLE phpbb_users ADD ct_login_count MEDIUMINT( 8 ) NULL DEFAULT 1 AFTER ct_last_used_ip;
ALTER TABLE phpbb_users ADD ct_login_vconfirm TINYINT( 1 ) NULL DEFAULT 0 AFTER ct_login_count;
ALTER TABLE phpbb_users ADD ct_last_pw_change INT( 11 ) NULL DEFAULT 1 AFTER ct_login_vconfirm;
ALTER TABLE phpbb_users ADD ct_global_msg_read TINYINT( 1 ) NULL DEFAULT 0 AFTER ct_last_pw_change;
ALTER TABLE phpbb_users ADD ct_miserable_user TINYINT( 1 ) NULL DEFAULT 0 AFTER ct_global_msg_read;

INSERT INTO phpbb_ctracker_config (ct_config_name, ct_config_value) VALUES ('ipblock_enabled', '1');
INSERT INTO phpbb_ctracker_config (ct_config_name, ct_config_value) VALUES ('ipblock_logsize', '100');
INSERT INTO phpbb_ctracker_config (ct_config_name, ct_config_value) VALUES ('auto_recovery', '1');
INSERT INTO phpbb_ctracker_config (ct_config_name, ct_config_value) VALUES ('vconfirm_guest', '1');
INSERT INTO phpbb_ctracker_config (ct_config_name, ct_config_value) VALUES ('autoban_mails', '1');
INSERT INTO phpbb_ctracker_config (ct_config_name, ct_config_value) VALUES ('detect_misconfiguration', '1');
INSERT INTO phpbb_ctracker_config (ct_config_name, ct_config_value) VALUES ('search_time_guest', '30');
INSERT INTO phpbb_ctracker_config (ct_config_name, ct_config_value) VALUES ('search_time_user', '20');
INSERT INTO phpbb_ctracker_config (ct_config_name, ct_config_value) VALUES ('search_count_guest', '1');
INSERT INTO phpbb_ctracker_config (ct_config_name, ct_config_value) VALUES ('search_count_user', '4');
INSERT INTO phpbb_ctracker_config (ct_config_name, ct_config_value) VALUES ('massmail_protection', '1');
INSERT INTO phpbb_ctracker_config (ct_config_name, ct_config_value) VALUES ('reg_protection', '1');
INSERT INTO phpbb_ctracker_config (ct_config_name, ct_config_value) VALUES ('reg_blocktime', '30');
INSERT INTO phpbb_ctracker_config (ct_config_name, ct_config_value) VALUES ('reg_lastip', '0.0.0.0');
INSERT INTO phpbb_ctracker_config (ct_config_name, ct_config_value) VALUES ('pwreset_time', '20');
INSERT INTO phpbb_ctracker_config (ct_config_name, ct_config_value) VALUES ('massmail_time', '20');
INSERT INTO phpbb_ctracker_config (ct_config_name, ct_config_value) VALUES ('spammer_time', '30');
INSERT INTO phpbb_ctracker_config (ct_config_name, ct_config_value) VALUES ('spammer_postcount', '4');
INSERT INTO phpbb_ctracker_config (ct_config_name, ct_config_value) VALUES ('spammer_blockmode', '1');
INSERT INTO phpbb_ctracker_config (ct_config_name, ct_config_value) VALUES ('loginfeature', '1');
INSERT INTO phpbb_ctracker_config (ct_config_name, ct_config_value) VALUES ('pw_reset_feature', '1');
INSERT INTO phpbb_ctracker_config (ct_config_name, ct_config_value) VALUES ('reg_last_reg', '1155944976');
INSERT INTO phpbb_ctracker_config (ct_config_name, ct_config_value) VALUES ('login_history', '1');
INSERT INTO phpbb_ctracker_config (ct_config_name, ct_config_value) VALUES ('login_history_count', '10');
INSERT INTO phpbb_ctracker_config (ct_config_name, ct_config_value) VALUES ('login_ip_check', '1');
INSERT INTO phpbb_ctracker_config (ct_config_name, ct_config_value) VALUES ('pw_validity', '30');
INSERT INTO phpbb_ctracker_config (ct_config_name, ct_config_value) VALUES ('pw_complex_min', '4');
INSERT INTO phpbb_ctracker_config (ct_config_name, ct_config_value) VALUES ('pw_complex_mode', '1');
INSERT INTO phpbb_ctracker_config (ct_config_name, ct_config_value) VALUES ('pw_control', '0');
INSERT INTO phpbb_ctracker_config (ct_config_name, ct_config_value) VALUES ('pw_complex', '0');
INSERT INTO phpbb_ctracker_config (ct_config_name, ct_config_value) VALUES ('last_file_scan', '1156000091');
INSERT INTO phpbb_ctracker_config (ct_config_name, ct_config_value) VALUES ('last_checksum_scan', '1156000082');
INSERT INTO phpbb_ctracker_config (ct_config_name, ct_config_value) VALUES ('logsize_logins', '100');
INSERT INTO phpbb_ctracker_config (ct_config_name, ct_config_value) VALUES ('logsize_spammer', '100');
INSERT INTO phpbb_ctracker_config (ct_config_name, ct_config_value) VALUES ('reg_ip_scan', '1');
INSERT INTO phpbb_ctracker_config (ct_config_name, ct_config_value) VALUES ('global_message', 'Hello world!');
INSERT INTO phpbb_ctracker_config (ct_config_name, ct_config_value) VALUES ('global_message_type', '1');
INSERT INTO phpbb_ctracker_config (ct_config_name, ct_config_value) VALUES ('logincount', '2');
INSERT INTO phpbb_ctracker_config (ct_config_name, ct_config_value) VALUES ('search_feature_enabled', '1');
INSERT INTO phpbb_ctracker_config (ct_config_name, ct_config_value) VALUES ('spam_attack_boost', '1');
INSERT INTO phpbb_ctracker_config (ct_config_name, ct_config_value) VALUES ('spam_keyword_det', '1');
INSERT INTO phpbb_ctracker_config (ct_config_name, ct_config_value) VALUES ('footer_layout', '3');

INSERT INTO phpbb_ctracker_ipblocker (id, ct_blocker_value) VALUES (1, '*WebStripper*');
INSERT INTO phpbb_ctracker_ipblocker (id, ct_blocker_value) VALUES (2, '*NetMechanic*');
INSERT INTO phpbb_ctracker_ipblocker (id, ct_blocker_value) VALUES (3, '*CherryPicker*');
INSERT INTO phpbb_ctracker_ipblocker (id, ct_blocker_value) VALUES (4, '*EmailCollector*');
INSERT INTO phpbb_ctracker_ipblocker (id, ct_blocker_value) VALUES (5, '*EmailSiphon*');
INSERT INTO phpbb_ctracker_ipblocker (id, ct_blocker_value) VALUES (6, '*WebBandit*');
INSERT INTO phpbb_ctracker_ipblocker (id, ct_blocker_value) VALUES (7, '*EmailWolf*');
INSERT INTO phpbb_ctracker_ipblocker (id, ct_blocker_value) VALUES (8, '*ExtractorPro*');
INSERT INTO phpbb_ctracker_ipblocker (id, ct_blocker_value) VALUES (9, '*SiteSnagger*');
INSERT INTO phpbb_ctracker_ipblocker (id, ct_blocker_value) VALUES (10, '*CheeseBot*');
INSERT INTO phpbb_ctracker_ipblocker (id, ct_blocker_value) VALUES (11, '*ia_archiver*');
INSERT INTO phpbb_ctracker_ipblocker (id, ct_blocker_value) VALUES (12, '*Website Quester*');
INSERT INTO phpbb_ctracker_ipblocker (id, ct_blocker_value) VALUES (13, '*WebZip*');
INSERT INTO phpbb_ctracker_ipblocker (id, ct_blocker_value) VALUES (14, '*moget*');
INSERT INTO phpbb_ctracker_ipblocker (id, ct_blocker_value) VALUES (15, '*WebSauger*');
INSERT INTO phpbb_ctracker_ipblocker (id, ct_blocker_value) VALUES (16, '*WebCopier*');
INSERT INTO phpbb_ctracker_ipblocker (id, ct_blocker_value) VALUES (17, '*WWW-Collector*');
INSERT INTO phpbb_ctracker_ipblocker (id, ct_blocker_value) VALUES (18, '*InfoNaviRobot*');
INSERT INTO phpbb_ctracker_ipblocker (id, ct_blocker_value) VALUES (19, '*Harvest*');
INSERT INTO phpbb_ctracker_ipblocker (id, ct_blocker_value) VALUES (20, '*Bullseye*');
INSERT INTO phpbb_ctracker_ipblocker (id, ct_blocker_value) VALUES (21, '*LinkWalker*');
INSERT INTO phpbb_ctracker_ipblocker (id, ct_blocker_value) VALUES (22, '*LinkextractorPro*');
INSERT INTO phpbb_ctracker_ipblocker (id, ct_blocker_value) VALUES (23, '*WebProxy*');
INSERT INTO phpbb_ctracker_ipblocker (id, ct_blocker_value) VALUES (24, '*BlowFish*');
INSERT INTO phpbb_ctracker_ipblocker (id, ct_blocker_value) VALUES (25, '*WebEnhancer*');
INSERT INTO phpbb_ctracker_ipblocker (id, ct_blocker_value) VALUES (26, '*TightTwatBot*');
INSERT INTO phpbb_ctracker_ipblocker (id, ct_blocker_value) VALUES (27, '*LinkScan*');
INSERT INTO phpbb_ctracker_ipblocker (id, ct_blocker_value) VALUES (28, '*WebDownloader*');
INSERT INTO phpbb_ctracker_ipblocker (id, ct_blocker_value) VALUES (29, 'lwp');
INSERT INTO phpbb_ctracker_ipblocker (id, ct_blocker_value) VALUES (30, '*BruteForce*');
INSERT INTO phpbb_ctracker_ipblocker (id, ct_blocker_value) VALUES (31, 'lwp-*');
INSERT INTO phpbb_ctracker_ipblocker (id, ct_blocker_value) VALUES (32, '*anonym*');

/* Point System */
ALTER TABLE phpbb_forums ADD points_disabled TINYINT(1) NOT NULL AFTER prune_enable;
ALTER TABLE phpbb_users ADD user_notify_donation TINYINT(1) NOT NULL AFTER user_notify_pm;
ALTER TABLE phpbb_users ADD user_points INT NOT NULL;
ALTER TABLE phpbb_users ADD admin_allow_points TINYINT(1) DEFAULT '1' NOT NULL;
INSERT INTO phpbb_config VALUES ('points_reply', '1');
INSERT INTO phpbb_config VALUES ('points_topic', '2');
INSERT INTO phpbb_config VALUES ('points_page', '1');
INSERT INTO phpbb_config VALUES ('points_post', '1');
INSERT INTO phpbb_config VALUES('points_browse', '1');
INSERT INTO phpbb_config VALUES ('points_donate', '1');
INSERT INTO phpbb_config VALUES ('points_name', 'Points');
INSERT INTO phpbb_config VALUES ('points_user_group_auth_ids', '');
INSERT INTO phpbb_config VALUES ('points_system_version', '2.1.1');
INSERT INTO phpbb_config VALUES ('account_delete', '1');

/* Rank ProgressBar */
INSERT INTO phpbb_config (config_name, config_value) VALUES ('rank_progressbar', '1');
INSERT INTO phpbb_config (config_name, config_value) VALUES ('rank_progressbar_folder', 'images/rank_progressbar');


INSERT INTO phpbb_bots (bot_name, bot_agent, bot_ip)
   VALUES ('Googlebot', 'Google', '209.185.108|209.185.253|216.239.33.96|216.239.33.97|216.239.33.98|216.239.33.99|216.239.37.98|216.239.37.99|216.239.39.98|216.239.39.99|216.239.41.96|216.239.41.97|216.239.41.98|216.239.41.99|216.239.45.4|216.239.46|216.239.51.96|216.239.51.97|216.239.51.98|216.239.51.99|216.239.53.98|216.239.53.99|216.239.57.96|216.239.57.97|216.239.57.98|216.239.57.99|216.239.59.98|216.239.59.99|216.33.229.163|64.233.173.193|64.233.173.194|64.233.173.195|64.233.173.196|64.233.173.197|64.233.173.198|64.233.173.199|64.233.173.200|64.233.173.201|64.233.173.202|64.233.173.203|64.233.173.204|64.233.173.205|64.233.173.206|64.233.173.207|64.233.173.208|64.233.173.209|64.233.173.210|64.233.173.211|64.233.173.212|64.233.173.213|64.233.173.214|64.233.173.215|64.233.173.216|64.233.173.217|64.233.173.218|64.233.173.219|64.233.173.220|64.233.173.221|64.233.173.222|64.233.173.223|64.233.173.224|64.233.173.225|64.233.173.226|64.233.173.227|64.233.173.228|64.233.173.229|64.233.173.230|64.233.173.231|64.233.173.232|64.233.173.233|64.233.173.234|64.233.173.235|64.233.173.236|64.233.173.237|64.233.173.238|64.233.173.239|64.233.173.240|64.233.173.241|64.233.173.242|64.233.173.243|64.233.173.244|64.233.173.245|64.233.173.246|64.233.173.247|64.233.173.248|64.233.173.249|64.233.173.250|64.233.173.251|64.233.173.252|64.233.173.253|64.233.173.254|64.233.173.255|64.68.80|64.68.81|64.68.82|64.68.83|64.68.84|64.68.85|64.68.86|64.68.87|64.68.88|64.68.89|64.68.90.1|64.68.90.10|64.68.90.11|64.68.90.12|64.68.90.129|64.68.90.13|64.68.90.130|64.68.90.131|64.68.90.132|64.68.90.133|64.68.90.134|64.68.90.135|64.68.90.136|64.68.90.137|64.68.90.138|64.68.90.139|64.68.90.14|64.68.90.140|64.68.90.141|64.68.90.142|64.68.90.143|64.68.90.144|64.68.90.145|64.68.90.146|64.68.90.147|64.68.90.148|64.68.90.149|64.68.90.15|64.68.90.150|64.68.90.151|64.68.90.152|64.68.90.153|64.68.90.154|64.68.90.155|64.68.90.156|64.68.90.157|64.68.90.158|64.68.90.159|64.68.90.16|64.68.90.160|64.68.90.161|64.68.90.162|64.68.90.163|64.68.90.164|64.68.90.165|64.68.90.166|64.68.90.167|64.68.90.168|64.68.90.169|64.68.90.17|64.68.90.170|64.68.90.171|64.68.90.172|64.68.90.17|64.68.90.174|64.68.90.175|64.68.90.176|64.68.90.177|64.68.90.178|64.68.90.179|64.68.90.18|64.68.90.180|64.68.90.181|64.68.90.182|64.68.90.183|64.68.90.184|64.68.90.185|64.68.90.186|64.68.90.187|64.68.90.188|64.68.90.189|64.68.90.19|64.68.90.190|64.68.90.191|64.68.90.192|64.68.90.193|64.68.90.194|64.68.90.195|64.68.90.196|64.68.90.197|64.68.90.198|64.68.90.199|64.68.90.2|64.68.90.20|64.68.90.200|64.68.90.201|64.68.90.202|64.68.90.203|64.68.90.204|64.68.90.205|64.68.90.206|64.68.90.207|64.68.90.208|64.68.90.21|64.68.90.22|64.68.90.23|64.68.90.24|64.68.90.25|64.68.90.26|64.68.90.27|64.68.90.28|64.68.90.29|64.68.90.3|64.68.90.30|64.68.90.31|64.68.90.32|64.68.90.33|64.68.90.34|64.68.90.35|64.68.90.36|64.68.90.37|64.68.90.38|64.68.90.39|64.68.90.4|64.68.90.40|64.68.90.41|64.68.90.42|64.68.90.43|64.68.90.44|64.68.90.45|64.68.90.46|64.68.90.47|64.68.90.48|64.68.90.49|64.68.90.5|64.68.90.50|64.68.90.51|64.68.90.52|64.68.90.53|64.68.90.54|64.68.90.55|64.68.90.56|64.68.90.57|64.68.90.58|64.68.90.59|64.68.90.6|64.68.90.60|64.68.90.61|64.68.90.62|64.68.90.63|64.68.90.64|64.68.90.65|64.68.90.66|64.68.90.67|64.68.90.68|64.68.90.69|64.68.90.7|64.68.90.70|64.68.90.71|64.68.90.72|64.68.90.73|64.68.90.74|64.68.90.75|64.68.90.76|64.68.90.77|64.68.90.78|64.68.90.79|64.68.90.8|64.68.90.80|64.68.90.9|64.68.91|64.68.92|66.249.64|66.249.65|66.249.66|66.249.67|66.249.68|66.249.69|66.249.70|66.249.71|66.249.72|66.249.78|66.249.79');

INSERT INTO phpbb_bots (bot_name, bot_agent, bot_ip)
   VALUES ('Alexa', 'ia_archiver', '66.28.250.|209.237.238.');

INSERT INTO phpbb_bots (bot_name, bot_agent, bot_ip)
   VALUES ('Inktomi', 'Slurp/', '216.35.116.|66.196.|66.94.230.|202.212.5.');

INSERT INTO phpbb_bots (bot_name, bot_agent, bot_ip)
   VALUES ('Infoseek', 'Infoseek', '195.145.119.24 |195.145.119.25 |198.5.208 |198.5.210 |202.33.250.146 |202.33.250.147 |202.33.250.148 |202.33.250.149 |202.33.250.150 |202.33.250.151 |202.33.250.152 |202.33.250.153 |202.33.250.154 |204.162.96 |204.162.97.1 |204.162.97.152 |204.162.97.17 |204.162.97.2 |204.162.97.205 |204.162.97.228 |204.162.97.231 |204.162.97.3 |204.162.97.32 |204.162.98.11 |204.162.98.12 |204.162.98.124 |204.162.98.126 |204.162.98.151 |204.162.98.161 |204.162.98.168 |204.162.98.18 |204.162.98.192 |204.162.98.2 |204.162.98.237 |204.162.98.27 |204.162.98.3 |204.162.98.36 |204.162.98.38 |204.162.98.4 |204.162.98.45 |204.162.98.48 |204.162.98.49 |204.162.98.5 |204.162.98.6 |204.162.98.7 |204.162.98.8 |204.162.98.80 |204.162.98.88 |204.162.98.9 |204.162.98.91 |204.162.98.98 |204.202.132.19 |205.226.201 |205.226.203.186 |205.226.203.35 |205.226.203.56 |205.226.203.62 |205.226.|204.238 |206.3.30.196 |206.3.30.250 |206.3.30.251 |210.148.160.157 |210.148.160.163 |210.148.160.165 |210.148.160.206 |210.155.157 |210.155.159 |210.236.233.130 |210.236.233.131 |210.236.233.132 |210.236.233.133 |210.236.233.135 |210.236.233.136 |210.236.233.137 |210.236.233.139 |210.236.233.150 |210.236.233.151 |210.236.233.155 |210.236.233.160 |210.236.233.161 |211.13.222.230 |211.18.214.194 |212.185.44.10 |212.185.44.11 |212.185.44.12 |212.185.44.15 ');

INSERT INTO phpbb_bots (bot_name, bot_agent, bot_ip)
   VALUES ('Alta Vista', 'Scooter', '128.177.243 |128.177.244.100 |128.177.244.86 |194.112.94.250 |194.112.94.251 |194.112.94.252 |194.201.146.1 |194.201.146.24 |194.221.84.11 |194.221.84.15 |194.221.84.31 |194.221.84.32 |194.221.84.33 |194.221.84.34 |194.221.84.38 |194.221.84.39 |194.221.84.40 |194.221.84.41 |194.51.33.72 |204.123.13.36 |204.123.13.65 |204.123.13.66 |204.123.2 |204.123.28.10 |204.123.28.11 |204.123.28.20 |204.123.28.21 |204.123.28.27 |204.123.28.30 |204.123.28.31 |204.123.28.32 |204.123.28.33 |204.123.9 |204.152.190 |204.152.191 |205.229.83.18 |208.185.243.148 |208.221.32 |208.221.35.200 |208.221.35.201 |208.221.35.202 |208.221.35.203 |208.221.35.204 |208.221.35.205 |208.221.35.206 |208.221.35.207 |209.247.40.246 |209.73.160.1 |209.73.160.250 |209.73.160.254 |209.73.162 |209.73.164 |209.73.174.250 |209.73.174.251 |209.73.180 |212.187.213.171 |212.187.213.172 |212.187.213.173 |212.187.213.174 |212.187.213.175 |212.187.226 |212.187.226.42 |212.187.226.83 |212.187.226.84 |212.187.226.85 |212.187.226.87 |212.187.226.88 |212.187.226.93 |212.187.226.99 |212.187.227 |216.39.48 |216.39.50 |216.39.51 |216.198.200.119 |64.152.75 |66.17.148.128 |66.17.148.129 |66.17.148.130 |66.17.148.131 |66.17.148.132 |66.17.148.133 |66.17.148.134 |66.17.148.135 |66.17.148.136 |66.17.148.137 |66.17.148.138 |66.17.148.139 |66.17.148.140 |66.17.148.141 |66.17.148.142 |66.17.148.143 |66.17.148.144 |66.17.148.145 |66.17.148.146 |66.17.148.147 |66.17.148.148 |66.17.148.149 |66.17.148.150 |66.17.148.151 |66.17.148.152 |66.17.148.153 |66.17.148.154 |66.17.148.155 |66.17.148.156 |66.17.148.157 |66.17.148.158 |66.17.148.159 |66.17.148.160 |66.17.148.161 |66.17.148.162 |66.17.148.163 |66.17.148.164 |66.17.148.165 |66.17.148.166 |66.17.148.167 |66.17.148.168 |66.17.148.169 |66.17.148.170 |66.17.148.171 |66.17.148.172 |66.17.148.173 |66.17.148.174 |66.17.148.175 |66.17.148.176 |66.17.148.177 |66.17.148.178 |66.17.148.179 |66.17.148.180 |66.17.148.181 |66.17.148.182 |66.17.148.183 |66.17.148.184 |66.17.148.185 |66.17.148.186 |66.17.148.187 |66.17.148.188 |66.17.148.189 |66.17.148.190 |66.17.148.191 |66.163.170.193 ');

INSERT INTO phpbb_bots (bot_name, bot_agent, bot_ip)
   VALUES ('Lycos', 'Lycos', '166.48.225.254 |202.232.118.40 |202.232.118.51 |206.79.171 |207.77.90 |207.77.91.184 |208.146.26 |208.146.27.123 |208.146.27.124 |208.146.27.57 |208.146.27.58 |208.146.27.59 |208.146.27.60 |208.146.27.62 |208.146.27.89 |208.146.27.90 |208.146.27.91 |208.146.27.92 |208.146.27.93 |208.146.27.94 |208.146.27.95 |208.146.27.96 |209.202.192 |209.202.192.147 |209.202.193 |209.202.194.237 |209.202.194.238 |209.202.205.1 |209.202.240.109 |209.202.240.8 |209.202.248.211 |209.202.248.212 |209.202.248.213 |209.202.248.214 |209.67.228 |209.67.229 |211.51.63.4 |213.193.19.35 |64.89.33 ');

INSERT INTO phpbb_bots (bot_name, bot_agent, bot_ip)
   VALUES ('FAST', 'alltheweb', '146.101.142.2|216.35.112.|64.41.254.2|213.188.8.');

INSERT INTO phpbb_bots (bot_name, bot_agent, bot_ip)
   VALUES ('WiseNut', 'WISEnut', '64.241.243.123 |64.241.242.177 |64.241.243.65 |64.241.243.124 |64.242.88.10 |64.242.88.50 |64.242.88.60 |65.116.145.141 |65.113.96.174 |65.116.145 |66.35.208.59 |66.35.208.60 |66.35.208.112 |66.35.208.158 |66.35.208.160 |66.35.208.206 |66.35.208.210 |66.35.208.211 |208.232.154.64 |209.249.66.10 |209.249.66.26 |209.249.66.36 |209.249.67.101 |209.249.67.102 |209.249.67.103 |209.249.67.104 |209.249.67.105 |209.249.67.106 |209.249.67.107 |209.249.67.108 |209.249.67.109 |209.249.67.110 |209.249.67.111 |209.249.67.112 |209.249.67.113 |209.249.67.114 |209.249.67.115 |209.249.67.116 |209.249.67.117 |209.249.67.118 |209.249.67.119 |209.249.67.120 |209.249.67.121 |209.249.67.122 |209.249.67.125 |209.249.67.126 |209.249.67.127 |209.249.67.128 |209.249.67.129 |209.249.67.130 |209.249.67.131 |209.249.67.132 |209.249.67.133 |209.249.67.134 |209.249.67.135 |209.249.67.136 |209.249.67.137 |209.249.67.138 |209.249.67.139 |209.249.67.140 |209.249.67.141 |209.249.67.142 |209.249.67.143 |209.249.67.144 |210.109.141.5 |216.34.42.12 |216.34.42.14 |216.34.42.36 |216.34.42.38 |216.34.42.42 |216.34.42.47 |216.34.42.54 |216.34.42.55 |216.34.42.56 |216.34.42.57 |216.34.42.59 |216.34.42.110 |216.34.42.111 |216.34.42.112 |216.34.42.113 |216.34.42.114 |216.34.42.115 |216.34.42.116 |216.34.42.117 |216.34.42.171 |216.34.42.172 |216.34.42.173 |216.34.42.176 |216.34.42.210 |216.34.42.211 |216.34.42.212 |216.34.42.213 |216.34.42.214 |216.34.42.215 |216.34.42.216 |216.34.42.217 |216.88.158.142 ');

INSERT INTO phpbb_bots (bot_name, bot_agent, bot_ip)
   VALUES ('MSN', 'msnbot/', '131.107.3.|204.95.98.|131.107.1|65.54.164.95|65.54.188.57,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93,65.54.188.93|207.46.98.40|207.46.98.129|65.54.164.69|207.46.98.38,207.46.98.109,207.46.98.38|207.46.98.38|65.54.188.127|65.54.188.61
');

INSERT INTO phpbb_bots (bot_name, bot_agent, bot_ip)
   VALUES ('Looksmart', 'MARTINI', '64.241.242.|207.138.42.212');

INSERT INTO phpbb_bots (bot_name, bot_agent, bot_ip)
   VALUES ('Ask Jeeves', 'teoma', '140.239.126.13 |140.239.251.220 |140.239.251.221 |140.239.251.222 |140.239.251.223 |140.239.251.224 |140.239.251.230 |207.204.132.233 |207.204.132.234 |208.178.104.55 |209.67.252.197 |209.67.252.199 |209.67.252.211 |209.67.252.212 |209.67.252.213 |209.67.252.214 |209.67.252.215 |209.67.252.216 |210.51.25.142 |211.13.230.249 |216.143.191.131 |216.200.130.20 |216.200.130.200 |216.200.130.201 |216.200.130.202 |216.200.130.203 |216.200.130.204 |216.200.130.205 |216.200.130.206 |216.200.130.207 |216.200.130.208 |216.200.130.209 |216.200.130.210 |216.200.130.242 |216.200.130.244 |216.200.130.245 |216.200.130.246 |216.200.130.248 |216.200.130.249 |216.200.130.26 |216.200.130.77 |216.200.130.78 |216.200.130.79 |216.200.130.85 |216.200.130.86 |216.200.130.87 |216.200.130.88 |216.200.130.89 |216.34.121.100 |216.34.121.18 |216.34.121.19 |216.34.121.31 |216.34.121.32 |216.34.121.33 |216.34.121.34 |216.34.121.67 |216.34.121.68 |63.236.92.143 |63.236.92.144 |63.236.92.145 |63.236.92.146 |63.236.92.147 |63.236.92.148 |63.236.92.149 |63.236.92.150 |63.236.92.151 |63.236.92.152 |63.236.92.153 |64.55.148.3 |64.55.148.37 |64.55.148.38 |64.55.148.39 |64.55.148.4 |64.55.148.43 |64.55.148.44 |64.55.148.45 |64.55.148.5 |64.55.148.50 |64.55.148.51 |64.55.148.52 |64.55.148.53 |64.55.148.54 |65.192.195.0 |65.192.195.1 |65.192.195.10 |65.192.195.11 |65.192.195.12 |65.192.195.13 |65.192.195.14 |65.192.195.15 |65.192.195.16 |65.192.195.17 |65.192.195.18 |65.192.195.19 |65.192.195.2 |65.192.195.20 |65.192.195.21 |65.192.195.22 |65.192.195.23 |65.192.195.24 |65.192.195.25 |65.192.195.26 |65.192.195.27 |65.192.195.28 |65.192.195.29 |65.192.195.3 |65.192.195.30 |65.192.195.31 |65.192.195.4 |65.192.195.5 |65.192.195.6 |65.192.195.7 |65.192.195.8 |65.192.195.9 |65.214.32.128 |65.214.32.129 |65.214.32.130 |65.214.32.131 |65.214.32.132 |65.214.32.133 |65.214.32.134 |65.214.32.135 |65.214.32.136 |65.214.32.137 |65.214.32.138 |65.214.32.139 |65.214.32.140 |65.214.32.141 |65.214.32.142 |65.214.32.143 |65.214.32.144 |65.214.32.145 |65.214.32.146 |65.214.32.147 |65.214.32.148 |65.214.32.149 |65.214.32.150 |65.214.32.151 |65.214.32.152 |65.214.32.153 |65.214.32.154 |65.214.32.155 |65.214.32.156 |65.214.32.157 |65.214.32.158 |65.214.32.159 |65.214.32.160 |65.214.32.161 |65.214.32.162 |65.214.32.163 |65.214.32.164 |65.214.32.165 |65.214.32.166 |65.214.32.167 |65.214.32.168 |65.214.32.169 |65.214.32.170 |65.214.32.171 |65.214.32.172 |65.214.32.173 |65.214.32.174 |65.214.32.175 |65.214.32.176 |65.214.32.177 |65.214.32.178 |65.214.32.179 |65.214.32.180 |65.214.32.181 |65.214.32.182 |65.214.32.183 |65.214.32.184 |65.214.32.185 |65.214.32.186 |65.214.32.187 |65.214.32.188 |65.214.32.189 |65.214.32.190 |65.214.32.191 |65.214.32.192 |65.214.32.193 |65.214.32.194 |65.214.32.195 |65.214.32.196 |65.214.32.197 |65.214.32.198 |65.214.32.199 |65.214.32.200 |65.214.32.201 |65.214.32.202 |65.214.32.203 |65.214.32.204 |65.214.32.205 |65.214.32.206 |65.214.32.207 |65.214.32.208 |65.214.32.209 |65.214.32.210 |65.214.32.211 |65.214.32.212 |65.214.32.213 |65.214.32.214 |65.214.32.215 |65.214.32.216 |65.214.32.217 |65.214.32.218 |65.214.32.219 |65.214.32.220 |65.214.32.221 |65.214.32.222 |65.214.32.223 |65.214.32.224 |65.214.32.225 |65.214.32.226 |65.214.32.227 |65.214.32.228 |65.214.32.229 |65.214.32.230 |65.214.32.231 |65.214.32.232 |65.214.32.233 |65.214.32.234 |65.214.32.235 |65.214.32.236 |65.214.32.237 |65.214.32.238 |65.214.32.239 |65.214.32.240 |65.214.32.241 |65.214.32.242 |65.214.32.243 |65.214.32.244 |65.214.32.245 |65.214.32.246 |65.214.32.247 |65.214.32.248 |65.214.32.249 |65.214.32.250 |65.214.32.251 |65.214.32.252 |65.214.32.253 |65.214.32.254 |65.214.32.255 |65.214.36 |65.214.38 |65.214.44 |65.214.45.0 |65.214.45.1 |65.214.45.10 |65.214.45.100 |65.214.45.11 |65.214.45.12 |65.214.45.13 |65.214.45.14 |65.214.45.15 |65.214.45.16 |65.214.45.17 |65.214.45.18 |65.214.45.19 |65.214.45.2 |65.214.45.20 |65.214.45.21 |65.214.45.22 |65.214.45.23 |65.214.45.24 |65.214.45.25 |65.214.45.26 |65.214.45.27 |65.214.45.28 |65.214.45.29 |65.214.45.3 |65.214.45.30 |65.214.45.31 |65.214.45.32 |65.214.45.33 |65.214.45.34 |65.214.45.35 |65.214.45.36 |65.214.45.37 |65.214.45.38 |65.214.45.39 |65.214.45.4 |65.214.45.40 |65.214.45.41 |65.214.45.42 |65.214.45.43 |65.214.45.44 |65.214.45.45 |65.214.45.46 |65.214.45.47 |65.214.45.48 |65.214.45.49 |65.214.45.5 |65.214.45.50 |65.214.45.51 |65.214.45.6 |65.214.45.7 |65.214.45.8 |65.214.45.9');

INSERT INTO phpbb_bots (bot_name, bot_agent, bot_ip)
   VALUES ('Gigabot', 'Gigabot', '64.62.142.231 |64.62.142.233 |64.62.142.235 |64.62.142.237 |64.62.142.239 |64.62.142.241 |64.62.142.243 |64.62.142.245 |64.62.168.0 |64.62.168.1 |64.62.168.2 |64.62.168.3 |64.62.168.4 |64.62.168.5 |64.62.168.6 |64.62.168.7 |64.62.168.8 |64.62.168.9 |64.62.168.10 |64.62.168.11 |64.62.168.12 |64.62.168.13 |64.62.168.14 |64.62.168.15 |64.62.168.16 |64.62.168.17 |64.62.168.18 |64.62.168.19 |64.62.168.20 |64.62.168.21 |64.62.168.22 |64.62.168.23 |64.62.168.24 |64.62.168.25 |64.62.168.26 |64.62.168.27 |64.62.168.28 |64.62.168.29 |64.62.168.30 |64.62.168.31 |64.62.168.32 |64.62.168.33 |64.62.168.34 |64.62.168.35 |64.62.168.36 |64.62.168.37 |64.62.168.38 |64.62.168.39 |64.62.168.40 |64.62.168.41 |64.62.168.42 |64.62.168.43 |64.62.168.44 |64.62.168.45 |64.62.168.46 |64.62.168.47 |64.62.168.48 |64.62.168.49 |64.62.168.50 |64.62.168.51 |64.62.168.52 |64.62.168.53 |64.62.168.54 |64.62.168.55 |64.62.168.56 |64.62.168.57 |64.62.168.58 |64.62.168.59 |64.62.168.60 |64.62.168.61 |64.62.168.62 |64.62.168.63 |64.62.168.64 |64.62.168.65 |64.62.168.66 |64.62.168.67 |64.62.168.68 |64.62.168.69 |64.62.168.70 |64.62.168.71 |64.62.168.72 |64.62.168.73 |64.62.168.74 |64.62.168.75 |64.62.168.76 |64.62.168.77 |64.62.168.78 |64.62.168.79 |64.62.168.80 |64.62.168.81 |64.62.168.82 |64.62.168.83 |64.62.168.84 |64.62.168.85 |64.62.168.86 |64.62.168.87 |64.62.168.88 |64.62.168.89 |64.62.168.90 |64.62.168.91 |64.62.168.92 |64.62.168.93 |64.62.168.94 |64.62.168.95 |64.62.168.96 |64.62.168.97 |64.62.168.98 |64.62.168.99 |64.62.168.100 |64.62.168.101 |64.62.168.102 |64.62.168.103 |64.62.168.104 |64.62.168.105 |64.62.168.106 |64.62.168.107 |64.62.168.108 |64.62.168.109 |64.62.168.110 |64.62.168.111 |64.62.168.112 |64.62.168.113 |64.62.168.114 |64.62.168.115 |64.62.168.116 |64.62.168.117 |64.62.168.118 |64.62.168.119 |64.62.168.120 |64.62.168.121 |64.62.168.122 |64.62.168.123 |64.62.168.124 |64.62.168.125 |64.62.168.126 |64.62.168.127 |64.139.94.202 |64.211.63.145 |64.211.63.146 |66.154.102 |66.154.103 |207.114.174.1 |207.114.174.2 |207.114.174.3 |207.114.174.6 |207.114.174.5 |207.114.174.7 |207.114.174.8 |207.114.174.9 |207.114.174.10 |207.114.174.11 |207.114.174.12 |207.114.174.13 |207.114.174.14 |207.114.174.15 |207.114.174.16 |207.114.174.17 |207.114.174.18 |207.114.174.19 |207.114.174.20 |207.114.174.21 |207.114.174.22 |207.114.174.23 |207.114.174.24 |207.114.174.25 |207.114.174.26 |208.254.87.133 |216.243.113.1 |216.243.113.81 |216.243.113.82 |216.243.113.83 |216.243.113.84 |216.243.113.86 |216.243.113.87 |217.75.103.130');

INSERT INTO phpbb_bots (bot_name, bot_agent, bot_ip)
   VALUES ('Yahoo Slurp', 'Yahoo', '141.185.209|169.207.238|199.177.18.9|202.160.178|202.160.179|202.160.180|202.160.183.182|202.160.183.217|202.160.183.218|202.160.183.219|202.160.183.220|202.160.183.235|202.160.183.239|202.160.183.245|202.165.98|202.165.99|202.212.5.30|202.212.5.32|202.212.5.33|202.212.5.34|202.212.5.35|202.212.5.36|202.212.5.37|202.212.5.38|202.212.5.39|202.212.5.47|202.212.5.48|202.46.19.93|203.123.188.2|203.141.52.41|203.141.52.42|203.141.52.43|203.141.52.44|203.141.52.45|203.141.52.46|203.141.52.47|203.255.234.102|203.255.234.103|203.255.234.105|203.255.234.106|206.190.43.125|206.190.43.81|207.126.239.224|209.1.12|209.1.13.101|209.1.13.231|209.1.13.232|209.1.32.122|209.1.38|209.131.40|209.131.41|209.131.48|209.131.49.37|209.131.50.153|209.131.51.166|209.131.60.169|209.131.60.170|209.131.60.171|209.131.60.19|209.131.62.107|209.131.62.108|209.131.62.109|209.131.62.214|209.185.122|209.185.141|209.185.143|209.191.64.227|209.191.65|209.191.65.249|209.191.65.82|209.191.82.245|209.191.83|209.191.83.220|209.191.87.214|209.191.87.215|209.191.87.216|209.191.87.217|209.191.87.218|209.191.87.219|209.191.87.220|209.191.87.221|209.191.87.222|209.191.87.223|209.67.206.126|209.67.206.127|209.67.206.133|209.73.176.128|209.73.176.129|209.73.176.133|209.73.176.134|209.73.176.136|211.14.8.240|211.169.241.21|213.216.143.37|213.216.143.38|213.216.143.39|216.109.121.70|216.109.121.71|216.109.126.131 |216.109.126.133 |216.109.126.137 |216.109.126.138 |216.109.126.139 |216.109.126.141 |216.109.126.143 |216.109.126.145 |216.109.126.146 |216.109.126.147 |216.109.126.150 |216.109.126.152 |216.109.126.157 |216.109.126.158 |216.109.126.159 |216.109.126.160 |216.109.126.161 |216.136.233.164 |216.145.58.219 |216.155.198.60 |216.155.200 |216.155.202.54 |216.155.204.40 |216.198.200.123 |216.239.193.71 |216.239.193.72 |216.239.193.73 |216.239.193.74 |216.239.193.75 |216.239.193.76 |216.239.193.77 |216.239.193.78 |216.239.193.79 |216.239.193.80 |216.239.193.81 |216.239.193.82 |216.239.193.83 |216.239.193.84 |216.239.193.85 |216.239.193.86 |216.32.237.1 |216.32.237.10 |216.32.237.11 |216.32.237.12 |216.32.237.13 |216.32.237.14 |216.32.237.15 |216.32.237.16 |216.32.237.17 |216.32.237.18 |216.32.237.19 |216.32.237.20 |216.32.237.21 |216.32.237.22 |216.32.237.23 |216.32.237.24 |216.32.237.25 |216.32.237.26 |216.32.237.27 |216.32.237.28 |216.32.237.29 |216.32.237.30 |216.32.237.7 |216.32.237.8 |216.32.237.9 |62.1|72.199.20 |62.1|72.199.21 |62.1|72.199.22 |62.1|72.199.23 |62.1|72.199.24 |62.27.59.245 |63.163.102.180 |63.163.102.181 |63.163.102.182 |64.157.137.219 |64.157.137.220 |64.157.137.221 |64.157.137.225 |64.157.138.103 |64.157.138.108 |64.75.36.42 |64.75.36.43 |64.75.36.44 |64.75.36.45 |64.75.36.47 |64.75.36.77 |64.75.36.79 |64.75.36.80 |66.163.170.157 |66.163.170.159 |66.163.170.161 |66.163.170.162 |66.163.170.166 |66.163.170.167 |66.163.170.170 |66.163.170.172 |66.163.170.176 |66.163.170.178 |66.163.170.179 |66.163.170.180 |66.163.170.184 |66.163.170.185 |66.163.170.190 |66.163.170.192 |66.163.174.65 |66.196.101 |66.196.65 |66.196.67.100 |66.196.67.101 |66.196.67.102 |66.196.67.103 |66.196.67.104 |66.196.67.105 |66.196.67.106 |66.196.67.107 |66.196.67.108 |66.196.67.109 |66.196.67.110 |66.196.67.111 |66.196.67.112 |66.196.67.113 |66.196.67.114 |66.196.67.115 |66.196.67.116 |66.196.67.117 |66.196.67.118 |66.196.67.119 |66.196.67.120 |66.196.67.121 |66.196.67.122 |66.196.67.123 |66.196.67.124 |66.196.67.125 |66.196.67.126 |66.196.67.127 |66.196.67.128 |66.196.67.129 |66.196.67.130 |66.196.67.150 |66.196.67.151 |66.196.67.176 |66.196.67.177 |66.196.67.178 |66.196.67.200 |66.196.67.201 |66.196.67.202 |66.196.67.203 |66.196.67.204 |66.196.67.205 |66.196.67.206 |66.196.67.207 |66.196.67.208 |66.196.67.209 |66.196.67.210 |66.196.67.211 |66.196.67.212 |66.196.67.213 |66.196.67.214 |66.196.67.215 |66.196.67.216 |66.196.67.217 |66.196.67.218 |66.196.67.219 |66.196.67.220 |66.196.67.221 |66.196.67.222 |66.196.67.223 |66.196.67.224 |66.196.67.225 |66.196.67.226 |66.196.67.227 |66.196.67.228 |66.196.67.229 |66.196.67.230 |66.196.67.231 |66.196.67.232 |66.196.67.233 |66.196.67.234 |66.196.67.235 |66.196.67.236 |66.196.67.237 |66.196.67.238 |66.196.67.239 |66.196.67.240 |66.196.67.254 |66.196.67.30 |66.196.67.31 |66.196.67.32 |66.196.67.33 |66.196.67.34 |66.196.67.35 |66.196.67.36 |66.196.67.37 |66.196.67.38 |66.196.67.39 |66.196.67.70 |66.196.67.71 |66.196.67.72 |66.196.67.73 |66.196.67.74 |66.196.67.75 |66.196.67.76 |66.196.67.77 |66.196.67.78 |66.196.67.79 |66.196.67.80 |66.196.67.94 |66.196.67.95 |66.196.67.96 |66.196.67.97 |66.196.67.98 |66.196.67.99 |66.196.72 |66.196.73 |66.196.74 |66.196.77 |66.196.78 |66.196.80 |66.196.81.10 |66.196.81.102 |66.196.81.103 |66.196.81.104 |66.196.81.105 |66.196.81.106 |66.196.81.107 |66.196.81.108 |66.196.81.109 |66.196.81.11 |66.196.81.110 |66.196.81.111 |66.196.81.112 |66.196.81.113 |66.196.81.114 |66.196.81.115 |66.196.81.116 |66.196.81.117 |66.196.81.118 |66.196.81.119 |66.196.81.12 |66.196.81.120 |66.196.81.121 |66.196.81.122 |66.196.81.123 |66.196.81.124 |66.196.81.125 |66.196.81.126 |66.196.81.127 |66.196.81.128 |66.196.81.129 |66.196.81.13 |66.196.81.130 |66.196.81.131 |66.196.81.132 |66.196.81.133 |66.196.81.134 |66.196.81.135 |66.196.81.136 |66.196.81.137 |66.196.81.138 |66.196.81.139 |66.196.81.14 |66.196.81.140 |66.196.81.141 |66.196.81.142 |66.196.81.143 |66.196.81.144 |66.196.81.145 |66.196.81.146 |66.196.81.147 |66.196.81.148 |66.196.81.149 |66.196.81.15 |66.196.81.150 |66.196.81.151 |66.196.81.152 |66.196.81.153 |66.196.81.154 |66.196.81.155 |66.196.81.156 |66.196.81.157 |66.196.81.158 |66.196.81.159 |66.196.81.16 |66.196.81.160 |66.196.81.161 |66.196.81.162 |66.196.81.163 |66.196.81.164 |66.196.81.165 |66.196.81.166 |66.196.81.167 |66.196.81.168 |66.196.81.169 |66.196.81.17 |66.196.81.170 |66.196.81.171 |66.196.81.172 |66.196.81.173 |66.196.81.174 |66.196.81.175 |66.196.81.176 |66.196.81.177 |66.196.81.178 |66.196.81.179 |66.196.81.18 |66.196.81.180 |66.196.81.181 |66.196.81.182 |66.196.81.183 |66.196.81.184 |66.196.81.185 |66.196.81.187 |66.196.81.188 |66.196.81.189 |66.196.81.19 |66.196.81.190 |66.196.81.191 |66.196.81.192 |66.196.81.193 |66.196.81.194 |66.196.81.195 |66.196.81.196 |66.196.81.197 |66.196.81.198 |66.196.81.199 |66.196.81.20 |66.196.81.200 |66.196.81.201 |66.196.81.202 |66.196.81.203 |66.196.81.204 |66.196.81.205 |66.196.81.206 |66.196.81.207 |66.196.81.208 |66.196.81.209 |66.196.81.21 |66.196.81.210 |66.196.81.211 |66.196.81.212 |66.196.81.213 |66.196.81.214 |66.196.81.215 |66.196.81.216 |66.196.81.217 |66.196.81.218 |66.196.81.219 |66.196.81.22 |66.196.81.23 |66.196.81.86 |66.196.81.87 |66.196.81.88 |66.196.81.93 |66.196.81.94 |66.196.81.95 |66.196.81.96 |66.196.90 |66.196.91 |66.196.92 |66.196.93.19 |66.196.93.24 |66.196.93.6 |66.196.93.7 |66.196.97 |66.196.99.20 |66.218.65.52 |66.218.70 |66.228.164 |66.228.165 |66.228.182.177 |66.228.182.183 |66.228.182.185 |66.228.182.187 |66.228.182.188 |66.228.182.190 |66.94.230.100 |66.94.230.101 |66.94.230.102 |66.94.230.103 |66.94.230.104 |66.94.230.105 |66.94.230.106 |66.94.230.107 |66.94.230.108 |66.94.230.109 |66.94.230.110 |66.94.230.160 |66.94.230.161 |66.94.230.162 |66.94.230.163 |66.94.230.96 |66.94.230.97 |66.94.230.98 |66.94.230.99 |66.94.232 |66.94.233 |66.94.238.51 |68.142.195.80 |68.142.195.81 |68.142.203.133 |68.142.230.125 |68.142.230.126 |68.142.230.127 |68.142.230.128 |68.142.230.129 |68.142.230.130 |68.142.230.131 |68.142.230.132 |68.142.230.133 |68.142.230.134 |68.142.230.135 |68.142.230.136 |68.142.230.137 |68.142.230.138 |68.142.230.139 |68.142.230.140 |68.142.230.141 |68.142.230.142 |68.142.230.143 |68.142.230.144 |68.142.230.145 |68.142.230.146 |68.142.230.147 |68.142.230.148 |68.142.230.149 |68.142.230.150 |68.142.230.151 |68.142.230.152 |68.142.230.153 |68.142.230.154 |68.142.230.155 |68.142.230.156 |68.142.230.157 |68.142.230.158 |68.142.230.159 |68.142.230.160 |68.142.230.161 |68.142.230.162 |68.142.230.163 |68.142.230.164 |68.142.230.165 |68.142.230.166 |68.142.230.167 |68.142.230.168 |68.142.230.169 |68.142.230.174 |68.142.230.175 |68.142.230.176 |68.142.230.177 |68.142.230.178 |68.142.230.179 |68.142.230.180 |68.142.230.181 |68.142.230.182 |68.142.230.183 |68.142.230.184 |68.142.230.185 |68.142.230.186 |68.142.230.187 |68.142.230.188 |68.142.230.189 |68.142.230.190 |68.142.230.191 |68.142.230.192 |68.142.230.193 |68.142.230.194 |68.142.230.195 |68.142.230.196 |68.142.230.197 |68.142.230.198 |68.142.230.199 |68.142.230.200 |68.142.230.201 |68.142.230.202 |68.142.230.203 |68.142.230.204 |68.142.230.205 |68.142.230.206 |68.142.230.207 |68.142.230.208 |68.142.230.209 |68.142.230.210 |68.142.230.211 |68.142.230.212 |68.142.230.213 |68.142.230.214 |68.142.230.215 |68.142.230.216 |68.142.230.217 |68.142.230.240 |68.142.230.247 |68.142.230.248 |68.142.230.249 |68.142.230.250 |68.142.230.251 |68.142.230.252 |68.142.230.253 |68.142.230.254 |68.142.230.32 |68.142.230.33 |68.142.230.34 |68.142.230.35 |68.142.230.36 |68.142.230.37 |68.142.230.38 |68.142.230.39 |68.142.230.40 |68.142.230.41 |68.142.230.43 |68.142.230.44 |68.142.230.45 |68.142.230.46 |68.142.230.47 |68.142.230.48 |68.142.230.49 |68.142.231.49 |68.142.246 |68.142.249 |68.142.250 |68.142.251 |72.30.101 |72.30.102 |72.30.103 |72.30.104 |72.30.107 |72.30.110 |72.30.111 |72.30.128 |72.30.129 |72.30.131 |72.30.132 |72.30.133 |72.30.134 |72.30.135 |72.30.142.24 |72.30.142.25 |72.30.177 |72.30.214 |72.30.216 |72.30.221 |72.30.54 |72.30.56 |72.30.60 |72.30.61 |72.30.81 |72.30.87 |72.30.9 |72.30.97 |72.30.98 |72.30.99');


ALTER TABLE phpbb_sessions ADD is_robot VARCHAR(255) DEFAULT '0' NOT NULL;

UPDATE phpbb_bots SET pending_agent='';
UPDATE phpbb_bots SET pending_ip='';

UPDATE phpbb_config SET config_value = '2.2.4' WHERE config_name = 'premod_version';