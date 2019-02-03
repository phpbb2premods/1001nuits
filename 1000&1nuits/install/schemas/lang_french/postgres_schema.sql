/*
 phpBB2 PostgreSQL DB schema - phpBB group 2001


 $Id: postgres_schema.sql,v 1.1.2.9 2006/02/12 16:14:58 grahamje Exp $
*/

CREATE SEQUENCE phpbb_banlist_id_seq start 1 increment 1 maxvalue 2147483647 minvalue 1 cache 1;
CREATE SEQUENCE phpbb_bbc_box_id_seq start 1 increment 1 maxvalue 2147483647 minvalue 1 cache 1;
CREATE SEQUENCE phpbb_categories_id_seq start 2 increment 1 maxvalue 2147483647 minvalue 1 cache 1;
CREATE SEQUENCE phpbb_disallow_id_seq start 1 increment 1 maxvalue 2147483647 minvalue 1 cache 1;
CREATE SEQUENCE phpbb_posts_id_seq start 2 increment 1 maxvalue 2147483647 minvalue 1 cache 1;
CREATE SEQUENCE phpbb_privmsgs_id_seq start 1 increment 1 maxvalue 2147483647 minvalue 1 cache 1;
CREATE SEQUENCE phpbb_ranks_id_seq start 2 increment 1 maxvalue 2147483647 minvalue 1 cache 1;
CREATE SEQUENCE phpbb_search_wordlist_id_seq start 13 increment 1 maxvalue 2147483647 minvalue 1 cache 1;
CREATE SEQUENCE phpbb_smilies_id_seq start 42 increment 1 maxvalue 2147483647 minvalue 1 cache 1;
CREATE SEQUENCE phpbb_themes_id_seq start 7 increment 1 maxvalue 2147483647 minvalue 1 cache 1;
CREATE SEQUENCE phpbb_topics_id_seq start 2 increment 1 maxvalue 2147483647 minvalue 1 cache 1;
CREATE SEQUENCE phpbb_users_id_seq start 3 increment 1 maxvalue 2147483647 minvalue 1 cache 1;
CREATE SEQUENCE phpbb_words_id_seq start 1 increment 1 maxvalue 2147483647 minvalue 1 cache 1;
CREATE SEQUENCE phpbb_groups_id_seq start 3 increment 1 maxvalue 2147483647 minvalue 1 cache 1;
CREATE SEQUENCE phpbb_forum_prune_id_seq start 1 increment 1 maxvalue 2147483647 minvalue 1 cache 1;
CREATE SEQUENCE phpbb_vote_desc_id_seq start 1 increment 1 maxvalue 2147483647 minvalue 1 cache 1;
CREATE SEQUENCE phpbb_extensions_id_seq start 1 increment 1 maxvalue 2147483647 minvalue 1 cache 1;
CREATE SEQUENCE phpbb_forbidden_extensions_id_seq start 1 increment 1 maxvalue 2147483647 minvalue 1 cache 1;
CREATE SEQUENCE phpbb_extension_groups_id_seq start 1 increment 1 maxvalue 2147483647 minvalue 1 cache 1;
CREATE SEQUENCE phpbb_attachments_desc_id_seq start 1 increment 1 maxvalue 2147483647 minvalue 1 cache 1;
CREATE SEQUENCE phpbb_quota_limits_id_seq start 1 increment 1 maxvalue 2147483647 minvalue 1 cache 1;

/* --------------------------------------------------------
  Table structure for table phpbb_auth_access
-------------------------------------------------------- */
CREATE TABLE phpbb_auth_access (
   group_id int DEFAULT '0' NOT NULL,
   forum_id int2 DEFAULT '0' NOT NULL,
   auth_view int2 DEFAULT '0' NOT NULL,
   auth_read int2 DEFAULT '0' NOT NULL,
   auth_post int2 DEFAULT '0' NOT NULL,
   auth_reply int2 DEFAULT '0' NOT NULL,
   auth_edit int2 DEFAULT '0' NOT NULL,
   auth_delete int2 DEFAULT '0' NOT NULL,
   auth_sticky int2 DEFAULT '0' NOT NULL,
   auth_announce int2 DEFAULT '0' NOT NULL,
   auth_vote int2 DEFAULT '0' NOT NULL,
   auth_pollcreate int2 DEFAULT '0' NOT NULL,
   auth_attachments int2 DEFAULT '0' NOT NULL,
   auth_mod int2 DEFAULT '0' NOT NULL,
   CONSTRAINT phpbb_auth_access_pkey PRIMARY KEY (group_id, forum_id)
);


/* --------------------------------------------------------
  Table structure for table phpbb_confirm
-------------------------------------------------------- */
CREATE TABLE phpbb_confirm (
   confirm_id char(32) DEFAULT '' NOT NULL,
   session_id char(32) DEFAULT '' NOT NULL,
   code char(6) DEFAULT '' NOT NULL,
   CONSTRAINT phpbb_confirm_pkey PRIMARY KEY (session_id, confirm_id)
);


/* --------------------------------------------------------
  Table structure for table phpbb_groups
-------------------------------------------------------- */
CREATE TABLE phpbb_groups (
   group_id int DEFAULT nextval('phpbb_groups_id_seq'::text) NOT NULL,
   group_name varchar(40) NOT NULL,
   group_type int2 DEFAULT '1' NOT NULL,
   group_description varchar(255) NOT NULL,
   group_moderator int4 DEFAULT '0' NOT NULL,
   group_single_user int2 DEFAULT '0' NOT NULL,
   CONSTRAINT phpbb_groups_pkey PRIMARY KEY (group_id)
);


/* --------------------------------------------------------
  Table structure for table phpbb_banlist
-------------------------------------------------------- */
CREATE TABLE phpbb_banlist (
   ban_id int4 DEFAULT nextval('phpbb_banlist_id_seq'::text) NOT NULL,
   ban_userid int4,
   ban_ip char(8),
   ban_email varchar(255),
   CONSTRAINT phpbb_banlist_pkey PRIMARY KEY (ban_id)
);
CREATE  INDEX ban_userid_phpbb_banlist_index ON phpbb_banlist (ban_userid);


/* --------------------------------------------------------
  Table structure for table phpbb_bbc_box
-------------------------------------------------------- */
CREATE TABLE phpbb_bbc_box (
	bbc_id int4 unsigned NOT NULL auto_increment,
	bbc_name varchar(255) NOT NULL,
	bbc_value varchar(255) NOT NULL,
	bbc_auth varchar(255) NOT NULL,
	bbc_before varchar(255) NOT NULL,
	bbc_after varchar(255) NOT NULL,
	bbc_helpline varchar(255) NOT NULL,
	bbc_img varchar(255) NOT NULL,
	bbc_divider varchar(255) NOT NULL,
	bbc_order int4 DEFAULT '1' NOT NULL,
	CONSTRAINT phpbb_bbc_box_pkey PRIMARY KEY (bbc_id)
);


/* --------------------------------------------------------
  Table structure for table phpbb_categories
-------------------------------------------------------- */
CREATE TABLE phpbb_categories (
   cat_id int4 DEFAULT nextval('phpbb_categories_id_seq'::text) NOT NULL,
   cat_title varchar(100),
   cat_order int4,
   CONSTRAINT phpbb_categories_pkey PRIMARY KEY (cat_id)
);


/* --------------------------------------------------------
  Table structure for table phpbb_config
-------------------------------------------------------- */
CREATE TABLE phpbb_config (
   config_name varchar(255) NOT NULL,
   config_value varchar(255) NOT NULL,
   CONSTRAINT phpbb_config_pkey PRIMARY KEY (config_name)
);


/* --------------------------------------------------------
 Table structure for table 'phpbb_ctracker_filechk'
-------------------------------------------------------- */
CREATE TABLE phpbb_ctracker_filechk (
	filepath text,
	hash varchar(32) default NULL
);


/* --------------------------------------------------------
 Table structure for table 'phpbb_ctracker_filescanner'
-------------------------------------------------------- */
CREATE TABLE phpbb_ctracker_filescanner (
	id smallint(5) NOT NULL,
	filepath text,
	safety smallint(1) NOT NULL default '0',
	CONSTRAINT phpbb_ctracker_filescanner_pkey PRIMARY KEY  (id)
);


/* --------------------------------------------------------
 Table structure for table 'phpbb_ctracker_ipblocker'
-------------------------------------------------------- */
CREATE TABLE phpbb_ctracker_ipblocker (
	id mediumint(8) unsigned NOT NULL,
	ct_blocker_value varchar(250) default NULL,
	CONSTRAINT phpbb_ctracker_ipblocker_pkey PRIMARY KEY  (id)
) AUTO_INCREMENT=33;


/* --------------------------------------------------------
 Table structure for table 'phpbb_ctracker_loginhistory'
-------------------------------------------------------- */
CREATE TABLE phpbb_ctracker_loginhistory (
	ct_user_id int(10) default NULL,
	ct_login_ip varchar(16) default NULL,
	ct_login_time int(11) NOT NULL default '0'
); 


/* --------------------------------------------------------
 Table structure for table 'phpbb_guests_visit'
-------------------------------------------------------- */
CREATE TABLE phpbb_guests_visit (
	guest_time INT( 11 ) NOT NULL DEFAULT '0',
	guest_visit INT( 11 ) NOT NULL DEFAULT '0',
	CONSTRAINT phpbb_guests_visit_pkey PRIMARY KEY  ( guest_time )
);


/* --------------------------------------------------------
  Table structure for table phpbb_disallow
-------------------------------------------------------- */
CREATE TABLE phpbb_disallow (
   disallow_id int4 DEFAULT nextval('phpbb_disallow_id_seq'::text) NOT NULL,
   disallow_username varchar(25),
   CONSTRAINT phpbb_disallow_pkey PRIMARY KEY (disallow_id)
);


/* --------------------------------------------------------
  Table structure for table phpbb_forums
-------------------------------------------------------- */
CREATE TABLE phpbb_forums (
   forum_id int4 DEFAULT '0' NOT NULL,
   cat_id int4,
   forum_name varchar(150),
   forum_desc text,
   forum_status int2 DEFAULT '0' NOT NULL,
   forum_order int4 DEFAULT '1' NOT NULL,
   forum_posts int4 DEFAULT '0' NOT NULL,
   forum_topics int4 DEFAULT '0' NOT NULL,
   forum_last_post_id int4 DEFAULT '0' NOT NULL,
   prune_enable int2 DEFAULT '0' NOT NULL,
   prune_next int,
   auth_view int2 DEFAULT '0' NOT NULL,
   auth_read int2 DEFAULT '0' NOT NULL,
   auth_post int2 DEFAULT '0' NOT NULL,
   auth_reply int2 DEFAULT '0' NOT NULL,
   auth_edit int2 DEFAULT '0' NOT NULL,
   auth_delete int2 DEFAULT '0' NOT NULL,
   auth_announce int2 DEFAULT '0' NOT NULL,
   auth_sticky int2 DEFAULT '0' NOT NULL,
   auth_pollcreate int2 DEFAULT '0' NOT NULL,
   auth_vote int2 DEFAULT '0' NOT NULL,
   auth_attachments int2 DEFAULT '0' NOT NULL,
   CONSTRAINT phpbb_forums_pkey PRIMARY KEY (forum_id)
);
CREATE  INDEX cat_id_phpbb_forums_index ON phpbb_forums (cat_id);
CREATE  INDEX forum_id_phpbb_forums_index ON phpbb_forums (forum_id);
CREATE  INDEX forums_order_phpbb_forums_index ON phpbb_forums (forum_order);
CREATE  INDEX forum_last_post_id_phpbb_forums_index ON phpbb_forums (forum_last_post_id);


/* --------------------------------------------------------
  Table structure for table phpbb_forum_prune
-------------------------------------------------------- */
CREATE TABLE phpbb_forum_prune (
   prune_id int4 DEFAULT nextval('phpbb_forum_prune_id_seq'::text) NOT NULL,
   forum_id int4 NOT NULL,
   prune_days int4 NOT NULL,
   prune_freq int4 NOT NULL,
   CONSTRAINT phpbb_forum_prune_pkey PRIMARY KEY (prune_id)
);
CREATE  INDEX prune_id_phpbb_forum_prune_index ON phpbb_forum_prune (prune_id);
CREATE  INDEX forum_id_phpbb_forum_prune_index ON phpbb_forum_prune (forum_id);


/* --------------------------------------------------------
  Table structure for table phpbb_posts
-------------------------------------------------------- */
CREATE TABLE phpbb_posts (
   post_id int4 DEFAULT nextval('phpbb_posts_id_seq'::text) NOT NULL,
   topic_id int4 DEFAULT '0' NOT NULL,
   forum_id int4 DEFAULT '0' NOT NULL,
   poster_id int4 DEFAULT '0' NOT NULL,
   post_time int4 DEFAULT '0' NOT NULL,
   post_username varchar(25),
   poster_ip char(8) DEFAULT '' NOT NULL,
   enable_bbcode int2 DEFAULT '1' NOT NULL,
   enable_html int2 DEFAULT '0' NOT NULL,
   enable_smilies int2 DEFAULT '1' NOT NULL,
   enable_sig int2 DEFAULT '1' NOT NULL,
   post_edit_time int4,
   post_edit_count int2 DEFAULT '0' NOT NULL,
   CONSTRAINT phpbb_posts_pkey PRIMARY KEY (post_id)
);
CREATE  INDEX forum_id_phpbb_posts_index ON phpbb_posts (forum_id);
CREATE  INDEX post_time_phpbb_posts_index ON phpbb_posts (post_time);
CREATE  INDEX poster_id_phpbb_posts_index ON phpbb_posts (poster_id);
CREATE  INDEX topic_id_phpbb_posts_index ON phpbb_posts (topic_id);


/* --------------------------------------------------------
  Table structure for table phpbb_posts_text
-------------------------------------------------------- */
CREATE TABLE phpbb_posts_text (
   post_id int4 DEFAULT '0' NOT NULL,
   bbcode_uid varchar(10) DEFAULT '' NOT NULL,
   post_subject varchar(60),
   post_text text,
   CONSTRAINT phpbb_posts_text_pkey PRIMARY KEY (post_id)
);


/* --------------------------------------------------------
  Table structure for table phpbb_privmsgs
-------------------------------------------------------- */
CREATE TABLE phpbb_privmsgs (
   privmsgs_id int4 DEFAULT nextval('phpbb_privmsgs_id_seq'::text) NOT NULL,
   privmsgs_type int2 DEFAULT '0' NOT NULL,
   privmsgs_subject varchar(255) DEFAULT '0' NOT NULL,
   privmsgs_from_userid int4 DEFAULT '0' NOT NULL,
   privmsgs_to_userid int4 DEFAULT '0' NOT NULL,
   privmsgs_date int4 DEFAULT '0' NOT NULL,
   privmsgs_ip char(8) NOT NULL,
   privmsgs_enable_bbcode int2 DEFAULT '1' NOT NULL,
   privmsgs_enable_html int2 DEFAULT '0' NOT NULL,
   privmsgs_enable_smilies int2 DEFAULT '1' NOT NULL,
   privmsgs_attach_sig int2 DEFAULT '1' NOT NULL,
   CONSTRAINT phpbb_privmsgs_pkey PRIMARY KEY (privmsgs_id)
);
CREATE  INDEX privmsgs_from_userid_phpbb_privmsgs_index ON phpbb_privmsgs (privmsgs_from_userid);
CREATE  INDEX privmsgs_to_userid_phpbb_privmsgs_index ON phpbb_privmsgs (privmsgs_to_userid);


/* --------------------------------------------------------
  Table structure for table phpbb_privmsgs_text
-------------------------------------------------------- */
CREATE TABLE phpbb_privmsgs_text (
   privmsgs_text_id int4 DEFAULT '0' NOT NULL,
   privmsgs_bbcode_uid char(10) DEFAULT '0' NOT NULL,
   privmsgs_text text,
   CONSTRAINT phpbb_privmsgs_text_pkey PRIMARY KEY (privmsgs_text_id)
);


/* --------------------------------------------------------
  Table structure for table phpbb_ranks
-------------------------------------------------------- */
CREATE TABLE phpbb_ranks (
   rank_id int4 DEFAULT nextval('phpbb_ranks_id_seq'::text) NOT NULL,
   rank_title varchar(50) DEFAULT '' NOT NULL,
   rank_min int4 DEFAULT '0' NOT NULL,
   rank_special int2 DEFAULT '0',
   rank_image varchar(255),
   CONSTRAINT phpbb_ranks_pkey PRIMARY KEY (rank_id)
);


/* --------------------------------------------------------
  Table structure for table phpbb_rcs
-------------------------------------------------------- */
CREATE TABLE phpbb_rcs (
	rcs_id int4 UNSIGNED NOT NULL auto_increment,
	rcs_name varchar(50) DEFAULT '' NOT NULL,
	rcs_color varchar(6) DEFAULT '' NOT NULL,
	rcs_single int2 DEFAULT '0' NOT NULL,
	rcs_display int2 DEFAULT '0' NOT NULL,
	rcs_order int4 UNSIGNED NOT NULL,
	CONSTRAINT phpbb_rcs_pkey PRIMARY KEY (rcs_id)
);


/* --------------------------------------------------------
  Table structure for table phpbb_search_results
-------------------------------------------------------- */
CREATE TABLE phpbb_search_results (
  search_id int4 NOT NULL default '0',
  session_id char(32) NOT NULL default '',
  search_time int4 DEFAULT '0' NOT NULL,
  search_array text NOT NULL,
  CONSTRAINT phpbb_search_results_pkey PRIMARY KEY (search_id)
);
CREATE  INDEX session_id_phpbb_search_results_index ON phpbb_search_results (session_id);


/* --------------------------------------------------------
  Table structure for table phpbb_search_wordlist
-------------------------------------------------------- */
CREATE TABLE phpbb_search_wordlist (
  word_id int4 DEFAULT nextval('phpbb_search_wordlist_id_seq'::text) NOT NULL,
  word_text varchar(50) NOT NULL DEFAULT '',
  word_common int2 NOT NULL DEFAULT '0',
  CONSTRAINT phpbb_search_wordlist_pkey PRIMARY KEY (word_text)
);
CREATE  INDEX word_id_phpbb_search_wordlist_index ON phpbb_search_wordlist (word_id);


/* --------------------------------------------------------
  Table structure for table phpbb_search_wordmatch
-------------------------------------------------------- */
CREATE TABLE phpbb_search_wordmatch (
  post_id int4 NOT NULL default '0',
  word_id int4 NOT NULL default '0',
  title_match int2 NOT NULL default '0'
);
CREATE  INDEX word_id_phpbb_search_wordmatch_index ON phpbb_search_wordmatch (word_id);
CREATE  INDEX post_id_phpbb_search_wordmatch_index ON phpbb_search_wordmatch (post_id);


/* --------------------------------------------------------
  Table structure for table phpbb_sessions
-------------------------------------------------------- */
CREATE TABLE phpbb_sessions (
   session_id char(32) DEFAULT '0' NOT NULL,
   session_user_id int4 DEFAULT '0' NOT NULL,
   session_start int4 DEFAULT '0' NOT NULL,
   session_time int4 DEFAULT '0' NOT NULL,
   session_ip char(8) DEFAULT '0' NOT NULL,
   session_page int4 DEFAULT '0' NOT NULL,
   session_logged_in int2 DEFAULT '0' NOT NULL,
   session_admin int2 DEFAULT '0' NOT NULL,
   CONSTRAINT phpbb_session_pkey PRIMARY KEY (session_id)
);
CREATE INDEX session_user_id_phpbb_sessions_index ON phpbb_sessions (session_user_id);
CREATE INDEX session_id_ip_user_id_phpbb_sessions_index ON phpbb_sessions (session_id, session_ip, session_user_id);

/* --------------------------------------------------------
  Table structure for table phpbb_sessions_keys
-------------------------------------------------------- */
CREATE TABLE phpbb_sessions_keys (
  key_id char(32) DEFAULT '0' NOT NULL,
  user_id int4 DEFAULT '0' NOT NULL,
  last_ip char(8) DEFAULT '0' NOT NULL,
  last_login int4 DEFAULT '0' NOT NULL,
  CONSTRAINT phpbb_sessions_keys_pkey PRIMARY KEY (key_id, user_id)
);
CREATE INDEX last_login_phpbb_sessions_keys_index ON phpbb_sessions_keys (last_login);

/* --------------------------------------------------------
  Table structure for table phpbb_shout
-------------------------------------------------------- */
CREATE TABLE phpbb_shout (
   shout_id MEDIUMINT(8) UNSIGNED NOT NULL auto_increment,
   shout_username VARCHAR(25) NOT NULL,
   shout_user_id MEDIUMINT(8) NOT NULL,
   shout_group_id MEDIUMINT(8) NOT NULL,
   shout_session_time INT(11) NOT NULL,
   shout_ip CHAR(8) NOT NULL,
   shout_text TEXT NOT NULL,
   shout_active MEDIUMINT(8) NOT NULL,
   enable_bbcode TINYINT (1) NOT NULL,
   enable_html TINYINT (1) NOT NULL,
   enable_smilies TINYINT (1) NOT NULL,
   enable_sig TINYINT (1) NOT NULL,
   shout_bbcode_uid VARCHAR(10) NOT NULL,
   CONSTRAINT phpbb_shout_keys_pkey PRIMARY KEY (shout_id)
);
CREATE INDEX shout_id_phpbb_shout_keys_index ON phpbb_shout_keys (shout_id);

/* --------------------------------------------------------
  Table structure for table phpbb_smilies
-------------------------------------------------------- */
CREATE TABLE phpbb_smilies (
   smilies_id int4 DEFAULT nextval('phpbb_smilies_id_seq'::text) NOT NULL,
   code varchar(50),
   smile_url varchar(100),
   emoticon varchar(75),
   CONSTRAINT phpbb_smilies_pkey PRIMARY KEY (smilies_id)
);


/* --------------------------------------------------------
  Table structure for table phpbb_themes
-------------------------------------------------------- */
CREATE TABLE phpbb_themes (
   themes_id int4 DEFAULT nextval('phpbb_themes_id_seq'::text) NOT NULL,
   style_name varchar(30),
   template_name varchar(30) NOT NULL DEFAULT '',
   head_stylesheet varchar(100),
   body_background varchar(100),
   body_bgcolor char(6),
   body_text char(6),
   body_link char(6),
   body_vlink char(6),
   body_alink char(6),
   body_hlink char(6),
   tr_color1 char(6),
   tr_color2 char(6),
   tr_color3 char(6),
   tr_class1 varchar(25),
   tr_class2 varchar(25),
   tr_class3 varchar(25),
   th_color1 char(6),
   th_color2 char(6),
   th_color3 char(6),
   th_class1 varchar(25),
   th_class2 varchar(25),
   th_class3 varchar(25),
   td_color1 char(6),
   td_color2 char(6),
   td_color3 char(6),
   td_class1 varchar(25),
   td_class2 varchar(25),
   td_class3 varchar(25),
   fontface1 varchar(50),
   fontface2 varchar(50),
   fontface3 varchar(50),
   fontsize1 int2,
   fontsize2 int2,
   fontsize3 int2,
   fontcolor1 char(6),
   fontcolor2 char(6),
   fontcolor3 char(6),
   span_class1 varchar(25),
   span_class2 varchar(25),
   span_class3 varchar(25),
   img_size_poll int2,
   img_size_privmsg int2,
   CONSTRAINT phpbb_themes_pkey PRIMARY KEY (themes_id)
);


/* --------------------------------------------------------
  Table structure for table phpbb_themes_name
-------------------------------------------------------- */
CREATE TABLE phpbb_themes_name (
   themes_id int4 DEFAULT '0' NOT NULL,
   tr_color1_name char(50),
   tr_color2_name char(50),
   tr_color3_name char(50),
   tr_class1_name varchar(50),
   tr_class2_name varchar(50),
   tr_class3_name varchar(50),
   th_color1_name char(50),
   th_color2_name char(50),
   th_color3_name char(50),
   th_class1_name varchar(50),
   th_class2_name varchar(50),
   th_class3_name varchar(50),
   td_color1_name char(50),
   td_color2_name char(50),
   td_color3_name char(50),
   td_class1_name varchar(50),
   td_class2_name varchar(50),
   td_class3_name varchar(50),
   fontface1_name varchar(50),
   fontface2_name varchar(50),
   fontface3_name varchar(50),
   fontsize1_name varchar(50),
   fontsize2_name varchar(50),
   fontsize3_name varchar(50),
   fontcolor1_name char(50),
   fontcolor2_name char(50),
   fontcolor3_name char(50),
   span_class1_name varchar(50),
   span_class2_name varchar(50),
   span_class3_name varchar(50),
   CONSTRAINT phpbb_themes_name_pkey PRIMARY KEY (themes_id)
);


/* --------------------------------------------------------
  Table structure for table phpbb_title_infos
-------------------------------------------------------- */
CREATE TABLE phpbb_title_infos (
  id INT(11) auto_increment NOT NULL,
  title_info VARCHAR(255) default '' NOT NULL,
  info_color VARCHAR(6) default '' NOT NULL,
  date_format VARCHAR(25) default NULL,
  title_pos TINYINT(1) DEFAULT '0' NOT NULL,
  admin_auth TINYINT(1) default '0',
  mod_auth TINYINT(1) default '0',
  poster_auth TINYINT(1) default '0',
  CONSTRAINT phpbb_title_infos_keys_pkey PRIMARY KEY (id)
);


/* --------------------------------------------------------
  Table structure for table phpbb_topics
-------------------------------------------------------- */
CREATE TABLE phpbb_topics (
   topic_id int4 DEFAULT nextval('phpbb_topics_id_seq'::text) NOT NULL,
   forum_id int4 DEFAULT '0' NOT NULL,
   topic_title varchar(60) DEFAULT '' NOT NULL,
   topic_poster int4 DEFAULT '0' NOT NULL,
   topic_time int4 DEFAULT '0' NOT NULL,
   topic_views int4 DEFAULT '0' NOT NULL,
   topic_replies int4 DEFAULT '0' NOT NULL,
   topic_status int2 DEFAULT '0' NOT NULL,
   topic_vote int2 DEFAULT '0' NOT NULL,
   topic_type int2 DEFAULT '0' NOT NULL,
   topic_first_post_id int4 DEFAULT '0' NOT NULL,
   topic_last_post_id int4 DEFAULT '0' NOT NULL,
   topic_moved_id int4 DEFAULT '0' NOT NULL,
   CONSTRAINT phpbb_topics_pkey PRIMARY KEY (topic_id)
);
CREATE  INDEX forum_id_phpbb_topics_index ON phpbb_topics (forum_id);
CREATE  INDEX topic_moved_id_phpbb_topics_index ON phpbb_topics (topic_moved_id);
CREATE  INDEX topic_first_post_id_phpbb_topics_index ON phpbb_topics (topic_first_post_id);
CREATE  INDEX topic_last_post_id_phpbb_topics_index ON phpbb_topics (topic_last_post_id);
CREATE  INDEX topic_status_phpbb_topics_index ON phpbb_topics (topic_status);
CREATE  INDEX topic_type_phpbb_topics_index ON phpbb_topics (topic_type);


/* --------------------------------------------------------
  Table structure for table phpbb_topics_watch
-------------------------------------------------------- */
CREATE TABLE phpbb_topics_watch (
  topic_id int4,
  user_id int4,
  notify_status int2 NOT NULL default '0'
);
CREATE  INDEX topic_id_phpbb_topics_watch_index ON phpbb_topics_watch (topic_id);
CREATE  INDEX user_id_phpbb_topics_watch_index ON phpbb_topics_watch (user_id);


/* --------------------------------------------------------
  Table structure for table phpbb_user_group
-------------------------------------------------------- */
CREATE TABLE phpbb_user_group (
   group_id int DEFAULT '0' NOT NULL,
   user_id int DEFAULT '0' NOT NULL,
   user_pending int2
);
CREATE  INDEX group_id_phpbb_user_group_index ON phpbb_user_group (group_id);
CREATE  INDEX user_id_phpbb_user_group_index ON phpbb_user_group (user_id);


/* --------------------------------------------------------
  Table structure for table phpbb_users
-------------------------------------------------------- */
CREATE TABLE phpbb_users (
   user_id int4 DEFAULT nextval('phpbb_users_id_seq'::text) NOT NULL,
   user_active int2,
   username varchar(25) DEFAULT '' NOT NULL,
   user_regdate int4 DEFAULT '0' NOT NULL,
   user_password varchar(32) DEFAULT '' NOT NULL,
   user_session_time int4 DEFAULT '0' NOT NULL,
   user_session_page int2 DEFAULT '0' NOT NULL,
   user_lastvisit int4 DEFAULT '0' NOT NULL,
   user_email varchar(255),
   user_icq varchar(15),
   user_website varchar(100),
   user_occ varchar(100),
   user_from varchar(100),
   user_interests varchar(255),
   user_sig text,
   user_sig_bbcode_uid char(10),
   user_style int4,
   user_aim varchar(255),
   user_yim varchar(255),
   user_msnm varchar(255),
   user_posts int4 DEFAULT '0' NOT NULL,
   user_new_privmsg int2 DEFAULT '0' NOT NULL,
   user_unread_privmsg int2 DEFAULT '0' NOT NULL,
   user_last_privmsg int4 DEFAULT '0' NOT NULL,
   user_login_tries int2 DEFAULT '0' NOT NULL,
   user_last_login_try int4 DEFAULT '0' NOT NULL,
   user_emailtime int4,
   user_viewemail int2,
   user_attachsig int2,
   user_allowhtml int2 DEFAULT '1',
   user_allowbbcode int2 DEFAULT '1',
   user_allowsmile int2 DEFAULT '1',
   user_allow_pm int2 DEFAULT '1' NOT NULL,
   user_allowavatar int2 DEFAULT '1' NOT NULL,
   user_allow_viewonline int2 DEFAULT '1' NOT NULL,
   user_rank int4 DEFAULT '0',
   user_avatar varchar(100),
   user_avatar_type int2 DEFAULT '0' NOT NULL,
   user_level int4 DEFAULT '0',
   user_lang varchar(255),
   user_timezone decimal(5,2) DEFAULT '0.0' NOT NULL,
   user_dateformat varchar(14) DEFAULT 'd M Y H:i' NOT NULL,
   user_notify_pm int2 DEFAULT '0' NOT NULL,
   user_popup_pm int2 DEFAULT '0' NOT NULL,
   user_notify int2,
   user_actkey varchar(32),
   user_newpasswd varchar(32),
   CONSTRAINT phpbb_users_pkey PRIMARY KEY (user_id)
);

CREATE  INDEX user_session_time_phpbb_users_index ON phpbb_users (user_session_time);

/* --------------------------------------------------------
  Table structure for table phpbb_vote_desc
-------------------------------------------------------- */
CREATE TABLE phpbb_vote_desc (
  vote_id int4 DEFAULT nextval('phpbb_vote_desc_id_seq'::text) NOT NULL ,
  topic_id int4 NOT NULL DEFAULT '0',
  vote_text text NOT NULL,
  vote_start int4 DEFAULT '0' NOT NULL,
  vote_length int4 DEFAULT '0' NOT NULL,
  CONSTRAINT phpbb_vote_dsc_pkey PRIMARY KEY (vote_id)
);
CREATE INDEX topic_id_phpbb_vote_desc_index ON phpbb_vote_desc (topic_id);

/* --------------------------------------------------------
 Table structure for table phpbb_vote_results
-------------------------------------------------------- */
CREATE TABLE phpbb_vote_results (
  vote_id int4 NOT NULL DEFAULT '0',
  vote_option_id int4 NOT NULL DEFAULT '0',
  vote_option_text varchar(255) NOT NULL,
  vote_result int4 NOT NULL DEFAULT '0'
);
CREATE INDEX option_id_phpbb_vote_results_index ON phpbb_vote_results (vote_option_id);

/* --------------------------------------------------------
 Table structure for table phpbb_vote_voters
-------------------------------------------------------- */
CREATE TABLE phpbb_vote_voters (
  vote_id int4 NOT NULL DEFAULT '0',
  vote_user_id int4 NOT NULL DEFAULT '0',
  vote_user_ip char(8) NOT NULL
);
CREATE INDEX vote_id_phpbb_vote_voters_index ON phpbb_vote_voters (vote_id);
CREATE INDEX vote_user_id_phpbb_vote_voters_index ON phpbb_vote_voters (vote_user_id);
CREATE INDEX vote_user_ip_phpbb_vote_voters_index ON phpbb_vote_voters (vote_user_ip);

/* --------------------------------------------------------
  Table structure for table phpbb_words
-------------------------------------------------------- */
CREATE TABLE phpbb_words (
   word_id int4 DEFAULT nextval('phpbb_words_id_seq'::text) NOT NULL,
   word varchar(100) DEFAULT '' NOT NULL,
   replacement varchar(100) DEFAULT '' NOT NULL,
   CONSTRAINT phpbb_words_pkey PRIMARY KEY (word_id)
);

/* --- Table structure for table 'phpbb_attachments_config' */
CREATE TABLE phpbb_attachments_config (
   config_name varchar(255) NOT NULL,
   config_value varchar(255) NOT NULL,
   CONSTRAINT phpbb_attachments_config_pkey PRIMARY KEY (config_name)
);

/* --- Table structure for table 'phpbb_forbidden_extensions' */
CREATE TABLE phpbb_forbidden_extensions (
  ext_id int2 DEFAULT nextval('phpbb_forbidden_extensions_id_seq'::text) NOT NULL,
  extension varchar(100) DEFAULT '' NOT NULL, 
  CONSTRAINT phpbb_forbidden_extensions_pkey PRIMARY KEY (ext_id)
);

/* --- Table structure for table 'phpbb_extension_groups' */
CREATE TABLE phpbb_extension_groups (
  group_id int4 DEFAULT nextval('phpbb_extension_groups_id_seq'::text) NOT NULL,
  group_name varchar(20) NOT NULL,
  cat_id int2 DEFAULT 0 NOT NULL,
  allow_group int2 DEFAULT 0 NOT NULL,
  download_mode int2 DEFAULT 1 NOT NULL,
  upload_icon varchar(100) DEFAULT '',
  max_filesize int4 DEFAULT 0 NOT NULL,
  forum_permissions varchar(255) NOT NULL,
  CONSTRAINT phpbb_extension_groups_pkey PRIMARY KEY (group_id)
);

/* --- Table structure for table 'phpbb_extensions' */
CREATE TABLE phpbb_extensions (
  ext_id int2 DEFAULT nextval('phpbb_extensions_id_seq'::text) NOT NULL,
  group_id int4 DEFAULT 0 NOT NULL,
  extension varchar(100) NOT NULL,
  comment varchar(100),
  CONSTRAINT phpbb_extensions_pkey PRIMARY KEY (ext_id)
);

/* --- Table structure for table 'phpbb_attachments_desc' */
CREATE TABLE phpbb_attachments_desc (
  attach_id int4 DEFAULT nextval('phpbb_attachments_desc_id_seq'::text) NOT NULL,
  physical_filename varchar(255) NOT NULL,
  real_filename varchar(255) NOT NULL,
  download_count int4 DEFAULT 0 NOT NULL,
  comment varchar(255) DEFAULT '',
  extension varchar(100),
  mimetype varchar(100),
  filesize int4 NOT NULL,
  filetime int4 DEFAULT 0 NOT NULL,
  thumbnail int2 DEFAULT 0 NOT NULL,
  CONSTRAINT phpbb_attachments_desc_pkey PRIMARY KEY (attach_id)
);

/* --- Table structure for table 'phpbb_attachments' */
CREATE TABLE phpbb_attachments (
  attach_id int4 DEFAULT 0 NOT NULL, 
  post_id int4 DEFAULT 0 NOT NULL, 
  privmsgs_id int4 DEFAULT 0 NOT NULL,
  user_id_1 int4 NOT NULL,
  user_id_2 int4 NOT NULL
); 
CREATE INDEX attach_id_post_id_phpbb_attachments_index ON phpbb_attachments (attach_id, post_id);
CREATE INDEX attach_id_privmsgs_id_phpbb_attachments_index ON phpbb_attachments (attach_id, privmsgs_id);
CREATE INDEX post_id_phpbb_attachments_index ON phpbb_attachments (post_id);
CREATE INDEX privmsgs_id_phpbb_attachments_index ON phpbb_attachments (privmsgs_id);

/* --- Table structure for table 'phpbb_quota_limits' */
CREATE TABLE phpbb_quota_limits (
  quota_limit_id int4 DEFAULT nextval('phpbb_quota_limits_id_seq'::text) NOT NULL,
  quota_desc varchar(20) DEFAULT '' NOT NULL,
  quota_limit int8 DEFAULT 0 NOT NULL,
  CONSTRAINT phpbb_quota_limits_pkey PRIMARY KEY (quota_limit_id)
);

/* --- Table structure for table 'phpbb_attach_quota' */
CREATE TABLE phpbb_attach_quota (
  user_id int4 DEFAULT 0 NOT NULL,
  group_id int4 DEFAULT 0 NOT NULL,
  quota_type int2 DEFAULT 0 NOT NULL,
  quota_limit_id int4 DEFAULT 0 NOT NULL
);
CREATE INDEX quota_type_phpbb_attach_quota_index ON phpbb_attach_quota (quota_type);

/* --- Alter Table Schema */
ALTER TABLE phpbb_forums ADD auth_download int2;
UPDATE phpbb_forums SET auth_download = 0;
ALTER TABLE phpbb_forums ALTER COLUMN auth_download SET DEFAULT 0;
ALTER TABLE phpbb_forums ADD CONSTRAINT auth_download_notnull CHECK (auth_download NOTNULL);

ALTER TABLE phpbb_auth_access ADD auth_download int2;
UPDATE phpbb_auth_access SET auth_download = 0;
ALTER TABLE phpbb_auth_access ALTER COLUMN auth_download SET DEFAULT 0;
ALTER TABLE phpbb_auth_access ADD CONSTRAINT auth_download_notnull CHECK (auth_download NOTNULL);

ALTER TABLE phpbb_posts ADD post_attachment int2;
UPDATE phpbb_posts SET post_attachment = 0;
ALTER TABLE phpbb_posts ALTER COLUMN post_attachment SET DEFAULT 0;
ALTER TABLE phpbb_posts ADD CONSTRAINT post_attachment_notnull CHECK (post_attachment NOTNULL);

ALTER TABLE phpbb_topics ADD topic_attachment int2;
UPDATE phpbb_topics SET topic_attachment = 0;
ALTER TABLE phpbb_topics ALTER COLUMN topic_attachment SET DEFAULT 0;
ALTER TABLE phpbb_topics ADD CONSTRAINT topic_attachment_notnull CHECK (topic_attachment NOTNULL);

ALTER TABLE phpbb_privmsgs ADD privmsgs_attachment int2;
UPDATE phpbb_privmsgs SET privmsgs_attachment = 0;
ALTER TABLE phpbb_privmsgs ALTER COLUMN privmsgs_attachment SET DEFAULT 0;
ALTER TABLE phpbb_privmsgs ADD CONSTRAINT privmsgs_attachment_notnull CHECK (privmsgs_attachment NOTNULL);