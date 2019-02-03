<script language="JavaScript" type="text/javascript">
<!--
// bbCode control by
// subBlue design
// www.subBlue.com

// Startup variables
var imageTag = false;
var theSelection = false;

// Check for Browser & Platform for PC & IE specific bits
// More details from: http://www.mozilla.org/docs/web-developer/sniffer/browser_type.html
var clientPC = navigator.userAgent.toLowerCase(); // Get client info
var clientVer = parseInt(navigator.appVersion); // Get browser version

var is_ie = ((clientPC.indexOf("msie") != -1) && (clientPC.indexOf("opera") == -1));
var is_nav = ((clientPC.indexOf('mozilla')!=-1) && (clientPC.indexOf('spoofer')==-1)
                && (clientPC.indexOf('compatible') == -1) && (clientPC.indexOf('opera')==-1)
                && (clientPC.indexOf('webtv')==-1) && (clientPC.indexOf('hotjava')==-1));
var is_moz = 0;

var is_win = ((clientPC.indexOf("win")!=-1) || (clientPC.indexOf("16bit") != -1));
var is_mac = (clientPC.indexOf("mac")!=-1);

// Helpline messages
b_help = "{L_BBCODE_B_HELP}";
i_help = "{L_BBCODE_I_HELP}";
u_help = "{L_BBCODE_U_HELP}";
q_help = "{L_BBCODE_Q_HELP}";
c_help = "{L_BBCODE_C_HELP}";
l_help = "{L_BBCODE_L_HELP}";
o_help = "{L_BBCODE_O_HELP}";
p_help = "{L_BBCODE_P_HELP}";
w_help = "{L_BBCODE_W_HELP}";
a_help = "{L_BBCODE_A_HELP}";
s_help = "{L_BBCODE_S_HELP}";
f_help = "{L_BBCODE_F_HELP}";

// Define the bbCode tags
bbcode = new Array();
bbtags = new Array('[b]','[/b]','[i]','[/i]','[u]','[/u]','[quote]','[/quote]','[code]','[/code]','[list]','[/list]','[list=]','[/list]','[img]','[/img]','[url]','[/url]');
imageTag = false;

// Shows the help messages in the helpline window
function helpline(help) {
	document.post.helpbox.value = eval(help + "_help");
}


// Replacement for arrayname.length property
function getarraysize(thearray) {
	for (i = 0; i < thearray.length; i++) {
		if ((thearray[i] == "undefined") || (thearray[i] == "") || (thearray[i] == null))
			return i;
		}
	return thearray.length;
}

// Replacement for arrayname.push(value) not implemented in IE until version 5.5
// Appends element to the array
function arraypush(thearray,value) {
	thearray[ getarraysize(thearray) ] = value;
}

// Replacement for arrayname.pop() not implemented in IE until version 5.5
// Removes and returns the last element of an array
function arraypop(thearray) {
	thearraysize = getarraysize(thearray);
	retval = thearray[thearraysize - 1];
	delete thearray[thearraysize - 1];
	return retval;
}


function checkForm() {

	formErrors = false;    

	if (document.post.signature.value.length < 2) {
		formErrors = "{L_EMPTY_MESSAGE}";
	}

	if (formErrors) {
		alert(formErrors);
		return false;
	} else {
		bbstyle(-1);
		//formObj.preview.disabled = true;
		//formObj.submit.disabled = true;
		return true;
	}
}

function emoticon(text) {
	var txtarea = document.post.signature;
	text = ' ' + text + ' ';
	if (txtarea.createTextRange && txtarea.caretPos) {
		var caretPos = txtarea.caretPos;
		caretPos.text = caretPos.text.charAt(caretPos.text.length - 1) == ' ' ? caretPos.text + text + ' ' : caretPos.text + text;
		txtarea.focus();
	} else {
		txtarea.value  += text;
		txtarea.focus();
	}
}

function bbfontstyle(bbopen, bbclose) {
	var txtarea = document.post.signature;

	if ((clientVer >= 4) && is_ie && is_win) {
		theSelection = document.selection.createRange().text;
		if (!theSelection) {
			txtarea.value += bbopen + bbclose;
			txtarea.focus();
			return;
		}
		document.selection.createRange().text = bbopen + theSelection + bbclose;
		txtarea.focus();
		return;
	}
	else if (txtarea.selectionEnd && (txtarea.selectionEnd - txtarea.selectionStart > 0))
	{
		mozWrap(txtarea, bbopen, bbclose);
		return;
	}
	else
	{
		txtarea.value += bbopen + bbclose;
		txtarea.focus();
	}
	storeCaret(txtarea);
}


function bbstyle(bbnumber) {
	var txtarea = document.post.signature;

	txtarea.focus();
	donotinsert = false;
	theSelection = false;
	bblast = 0;

	if (bbnumber == -1) { // Close all open tags & default button names
		while (bbcode[0]) {
			butnumber = arraypop(bbcode) - 1;
			txtarea.value += bbtags[butnumber + 1];
			buttext = eval('document.post.addbbcode' + butnumber + '.value');
			eval('document.post.addbbcode' + butnumber + '.value ="' + buttext.substr(0,(buttext.length - 1)) + '"');
		}
		imageTag = false; // All tags are closed including image tags :D
		txtarea.focus();
		return;
	}

	if ((clientVer >= 4) && is_ie && is_win)
	{
		theSelection = document.selection.createRange().text; // Get text selection
		if (theSelection) {
			// Add tags around selection
			document.selection.createRange().text = bbtags[bbnumber] + theSelection + bbtags[bbnumber+1];
			txtarea.focus();
			theSelection = '';
			return;
		}
	}
	else if (txtarea.selectionEnd && (txtarea.selectionEnd - txtarea.selectionStart > 0))
	{
		mozWrap(txtarea, bbtags[bbnumber], bbtags[bbnumber+1]);
		return;
	}
	
	// Find last occurance of an open tag the same as the one just clicked
	for (i = 0; i < bbcode.length; i++) {
		if (bbcode[i] == bbnumber+1) {
			bblast = i;
			donotinsert = true;
		}
	}

	if (donotinsert) {		// Close all open tags up to the one just clicked & default button names
		while (bbcode[bblast]) {
				butnumber = arraypop(bbcode) - 1;
				txtarea.value += bbtags[butnumber + 1];
				buttext = eval('document.post.addbbcode' + butnumber + '.value');
				eval('document.post.addbbcode' + butnumber + '.value ="' + buttext.substr(0,(buttext.length - 1)) + '"');
				imageTag = false;
			}
			txtarea.focus();
			return;
	} else { // Open tags
	
		if (imageTag && (bbnumber != 14)) {		// Close image tag before adding another
			txtarea.value += bbtags[15];
			lastValue = arraypop(bbcode) - 1;	// Remove the close image tag from the list
			document.post.addbbcode14.value = "Img";	// Return button back to normal state
			imageTag = false;
		}
		
		// Open tag
		txtarea.value += bbtags[bbnumber];
		if ((bbnumber == 14) && (imageTag == false)) imageTag = 1; // Check to stop additional tags after an unclosed image tag
		arraypush(bbcode,bbnumber+1);
		eval('document.post.addbbcode'+bbnumber+'.value += "*"');
		txtarea.focus();
		return;
	}
	storeCaret(txtarea);
}

// From http://www.massless.org/mozedit/
function mozWrap(txtarea, open, close)
{
	var selLength = txtarea.textLength;
	var selStart = txtarea.selectionStart;
	var selEnd = txtarea.selectionEnd;
	if (selEnd == 1 || selEnd == 2) 
		selEnd = selLength;

	var s1 = (txtarea.value).substring(0,selStart);
	var s2 = (txtarea.value).substring(selStart, selEnd)
	var s3 = (txtarea.value).substring(selEnd, selLength);
	txtarea.value = s1 + open + s2 + close + s3;
	return;
}

// Insert at Claret position. Code from
// http://www.faqts.com/knowledge_base/view.phtml/aid/1052/fid/130
function storeCaret(textEl) {
	if (textEl.createTextRange) textEl.caretPos = document.selection.createRange().duplicate();
}

//-->
</script>

<script type="text/javascript">
function writediv(texte)
{
document.getElementById('pseudobox').innerHTML = texte;
}

function verifPseudo(username)
{
if(username != '')
{
if(username.length<2)
writediv('<span class="gensmall" style="color:#cc0000"><strong>'+username+' :</strong> ce pseudo est trop court</span>');
else if(username.length>30)
writediv('<span class="gensmall" style="color:#cc0000"><strong>'+username+' :</strong> ce pseudo est trop long</span>');
else if(texte = file('verifpseudo.php?username='+escape(username)))
{
if(texte == 1)
writediv('<span class="gensmall" style="color:#cc0000"><strong>'+username+' :</strong> ce pseudo est deja pris</span>');
else if(texte == 2)
writediv('<span class="gensmall" style="color:#1A7917"><strong>'+username+' :</strong> ce pseudo est libre</span>');
else
writediv(texte);
}
}

}

function file(fichier)
{
if(window.XMLHttpRequest) // FIREFOX
xhr_object = new XMLHttpRequest();
else if(window.ActiveXObject) // IE
xhr_object = new ActiveXObject("Microsoft.XMLHTTP");
else
return(false);
xhr_object.open("GET", fichier, false);
xhr_object.send(null);
if(xhr_object.readyState == 4) return(xhr_object.responseText);
else return(false);
}
</script>

<form action="{S_PROFILE_ACTION}" {S_FORM_ENCTYPE} method="post" name="post">
{ERROR_BOX}

<table width="100%" cellspacing="2" cellpadding="2" border="0">
<tr>
	<td class="nav"><a href="{U_INDEX}" class="nav">{L_INDEX}</a></span></td>
</tr>
</table>

<table class="forumline" width="100%" cellpadding="3" cellspacing="1" border="0">
	<tr>
	  <th class="thHead" colspan="2" height="25" valign="middle">{L_REGISTRATION_INFO}</th>
	</tr>
	<tr>
	  <td class="row2" colspan="2"><span class="gensmall">{L_ITEMS_REQUIRED}</span></td>
	</tr>
	<!-- BEGIN switch_namechange_disallowed -->
	<tr>
	  <td class="row1" width="38%"><span class="gen">{L_USERNAME}: *</span></td>
	  <td class="row2"><input type="hidden" name="username" value="{USERNAME}" /><b class="gen">{USERNAME}</b></td>
	</tr>
	<!-- END switch_namechange_disallowed -->
	<!-- BEGIN switch_namechange_allowed -->
	<tr>
	  <td class="row1" width="38%"><span class="gen">{L_USERNAME}: *</span></td>
	  <td class="row2"><input type="text" class="post" style="width:200px" name="username" size="25" maxlength="25" value="{USERNAME}" onKeyUp="verifPseudo(this.value)" /><div id="pseudobox"></div></td>
	</tr>
	<!-- END switch_namechange_allowed -->
	<tr>
	  <td class="row1"><span class="gen">{L_EMAIL_ADDRESS}: *</span></td>
	  <td class="row2"><input type="text" class="post" style="width:200px" name="email" size="25" maxlength="255" value="{EMAIL}" /></td>
	</tr>
	<!-- BEGIN switch_edit_profile -->
	<tr>
	  <td class="row1"><span class="gen">{L_CURRENT_PASSWORD}: *</span><br />
		<span class="gensmall">{L_CONFIRM_PASSWORD_EXPLAIN}</span></td>
	  <td class="row2"> 
		<input type="password" class="post" style="width: 200px" name="cur_password" size="25" maxlength="32" value="{CUR_PASSWORD}" />
	  </td>
	</tr>
	<!-- END switch_edit_profile -->
	<tr>
	  <td class="row1"><span class="gen">{L_NEW_PASSWORD}: *</span><br />
		<span class="gensmall">{L_PASSWORD_IF_CHANGED}</span>
	  </td>
	  <td class="row2"> 
		<input type="password" class="post" style="width: 200px" name="new_password" size="25" maxlength="32" value="{NEW_PASSWORD}" />
	  </td>
	</tr>
	<tr>
	  <td class="row1"><span class="gen">{L_CONFIRM_PASSWORD}: * </span><br />
		<span class="gensmall">{L_PASSWORD_CONFIRM_IF_CHANGED}</span>
	  </td>
	  <td class="row2"> 
		<input type="password" class="post" style="width: 200px" name="password_confirm" size="25" maxlength="32" value="{PASSWORD_CONFIRM}" />
	  </td>
	</tr>
  <!-- BEGIN account_delete_block -->
  <tr> 
    <td class="row1"><span class="gen">{L_ACCOUNT_DELETE}</span></td>
    <td class="row2"> 
    <input type="checkbox" name="deleteuser">
    <span class="gensmall">{L_DELETE_ACCOUNT_EXPLAIN}</span></td>
  </tr>
  <!-- END account_delete_block -->
	<!-- Visual Confirmation -->
	<!-- BEGIN switch_confirm -->
	<tr>
	  <td class="row1" colspan="2" align="center">
		<span class="gensmall">{L_CONFIRM_CODE_IMPAIRED}</span><br /><br />
		{CONFIRM_IMG}<br /><br />
	  </td>
	</tr>
	<tr>
	  <td class="row1"><span class="gen">{L_CONFIRM_CODE}: * </span><br /><span class="gensmall">{L_CONFIRM_CODE_EXPLAIN}</span></td>
	  	  <td class="row2"><input type="text" class="post" style="width: 200px" name="confirm_code" size="10" maxlength="10" value="" /></td>
	</tr>
	<!-- END switch_confirm -->
  </table>
  <br class="nav" />

  <table class="forumline" width="100%" cellpadding="3" cellspacing="1" border="0">
	<tr>
	  <th class="thSides" colspan="2" height="25" valign="middle">{L_PROFILE_INFO}</th>
	</tr>
	<tr>
	  <td class="row2" colspan="2"><span class="gensmall">{L_PROFILE_INFO_NOTICE}</span></td>
	</tr>
	<tr>
	  <td class="row1" width="38%"><span class="gen">{L_ICQ_NUMBER}:</span></td>
	  <td class="row2"> 
		<input type="text" name="icq" class="post" style="width: 100px" size="10" maxlength="15" value="{ICQ}" />
	  </td>
	</tr>
	<tr>
	  <td class="row1"><span class="gen">{L_AIM}:</span></td>
	  <td class="row2"> 
		<input type="text" class="post" style="width: 150px" name="aim" size="20" maxlength="255" value="{AIM}" />
	  </td>
	</tr>
	<tr>
	  <td class="row1"><span class="gen">{L_MESSENGER}:</span></td>
	  <td class="row2"> 
		<input type="text" class="post" style="width: 150px" name="msn" size="20" maxlength="255" value="{MSN}" />
	  </td>
	</tr>
	<tr>
	  <td class="row1"><span class="gen">{L_SKYPE}:</span></td>
	  <td class="row2"> 
		<input type="text" name="skype" class="post" style="width: 150px" size="20" maxlength="255" value="{SKYPE}" />
	  </td>
	</tr>
	
	  <td class="row1"><span class="gen">{L_YAHOO}:</span></td>
	  <td class="row2"> 
		<input type="text" class="post" style="width: 150px" name="yim" size="20" maxlength="255" value="{YIM}" />
	  </td>
	</tr>
	<tr>
	  <td class="row1"><span class="gen">{L_WEBSITE}:</span></td>
	  <td class="row2"> 
		<input type="text" class="post" style="width: 200px" name="website" size="25" maxlength="255" value="{WEBSITE}" />
	  </td>
	</tr>
	<tr>
	  <td class="row1"><span class="gen">{L_LOCATION}:</span></td>
	  <td class="row2"> 
		<input type="text" class="post" style="width: 200px" name="location" size="25" maxlength="100" value="{LOCATION}" />
	  </td>
	</tr>
	<tr>
	  <td class="row1"><span class="gen">{L_OCCUPATION}:</span></td>
	  <td class="row2"> 
		<input type="text" class="post" style="width: 200px" name="occupation" size="25" maxlength="100" value="{OCCUPATION}" />
	  </td>
	</tr>
	<tr>
	  <td class="row1"><span class="gen">{L_INTERESTS}:</span></td>
	  <td class="row2"> 
		<input type="text" class="post" style="width: 200px" name="interests" size="35" maxlength="150" value="{INTERESTS}" />
	  </td>
	</tr>
<!-- BEGIN flags -->
	<tr>
	  <td class="row1"><span class="gen">{L_FLAG} :</span></td>
	  <td class="row2"><span class="genmed">{S_FLAGS_LIST}&nbsp;
		<img name="flag_img" src="{I_FLAG}" border="0" alt="" title="{L_FLAG_TITLE}" />
	  </span></td>
	</tr>
<!-- END flags -->
<!-- BEGIN browsers -->
	<tr>
	  <td class="row1"><span class="gen">{L_BROWSER} :</span></td>
	  <td class="row2"><span class="genmed">{S_BROWSERS_LIST}&nbsp;
		<img name="browser_img" src="{I_BROWSER}" align="absmiddle" border="0" alt="" title="{L_BROWSER_TITLE}" />
	  </span></td>
	</tr>
<!-- END browsers -->
	<tr>
	  <td class="row1" width="35%"><span class="gen">{L_BDAY_BIRTHDATE} :{L_BDAY_REQUIRED}</span></td>
	  <td class="row2"><span class="genmed">
		{L_BDAY_DAY}: {S_BDAY_DAY_OPTIONS}&nbsp;
		{L_BDAY_MONTH}: {S_BDAY_MONTH_OPTIONS}&nbsp;
		{L_BDAY_YEAR}: {S_BDAY_YEAR_OPTIONS}
	  </span></td>
	</tr>
<!-- Start add - Gender MOD -->
	<tr> 
	      <td class="row1"><span class="gen">{L_GENDER} :</span></td> 
	      <td class="row2"> 
	      <input type="radio" {LOCK_GENDER} name="gender" value="0" {GENDER_NO_SPECIFY_CHECKED}/> 
	      <span class="gen">{L_GENDER_NOT_SPECIFY}</span>
	      <input type="radio" name="gender" value="1" {GENDER_MALE_CHECKED}/> 
	      <span class="gen">{L_GENDER_MALE}</span> {I_GENDER_MALE}
	      <input type="radio" name="gender" value="2" {GENDER_FEMALE_CHECKED}/> 
	      <span class="gen">{L_GENDER_FEMALE}</span> {I_GENDER_FEMALE}</td> 
	</tr>
<!-- End add - Gender MOD -->
	<tr> 
	  <td class="row1"><span class="gen">{L_USER_ABSENT} :</span><span class="gensmall"><br />{L_USER_ABSENT_EXPLAIN}</span></td>
	  <td class="row2"> 
		<input type="radio" name="user_absent" value="1" {USER_ABSENT_YES} />
		<span class="gen">{L_YES}</span>&nbsp;&nbsp; 
		<input type="radio" name="user_absent" value="0" {USER_ABSENT_NO} />
		<span class="gen">{L_NO}</span></td>
	</tr>
<!-- BEGIN switch_point_system -->
	<tr> 
	  <td class="row1"><span class="gen">{L_NOTIFY_DONATION}:</span><br />
		<span class="gensmall">{L_NOTIFY_DONATION_EXPLAIN}</span></td>
	  <td class="row2"> 
		<input type="radio" name="notifydonation" value="1" {NOTIFY_DONATION_YES} />
		<span class="gen">{L_YES}</span>&nbsp;&nbsp; 
		<input type="radio" name="notifydonation" value="0" {NOTIFY_DONATION_NO} />
		<span class="gen">{L_NO}</span></td>
	</tr>
<!-- END switch_point_system -->
  </table>
  <br class="nav" />

  <table class="forumline" width="100%" cellpadding="3" cellspacing="1" border="0">
	<tr>
		<th class="thSides" colspan="2" height="25" valign="middle">{L_SIGNATURE}</th>
	</tr>
	<tr>
	  <td class="row2" colspan="2"><span class="gensmall">{L_PROFILE_INFO_NOTICE}</span></td>
	</tr>
	<tr>
	  <td class="row1" valign="top" width="38%"><span class="gensmall">{L_SIGNATURE_EXPLAIN}<br /><br />{HTML_STATUS}<br />{BBCODE_STATUS}<br />{SMILIES_STATUS}</p></span></td>
	  <td class="row2"><table cellspacing="0" cellpadding="2" border="0">
		  <tr align="center" valign="middle"> 
			<td><span class="genmed"> 
			  <input type="button" class="button" accesskey="b" name="addbbcode0" value=" B " style="font-weight:bold; width: 30px" onClick="bbstyle(0)" onMouseOver="helpline('b')" />
			  </span></td>
			<td><span class="genmed"> 
			  <input type="button" class="button" accesskey="i" name="addbbcode2" value=" i " style="font-style:italic; width: 30px" onClick="bbstyle(2)" onMouseOver="helpline('i')" />
			  </span></td>
			<td><span class="genmed"> 
			  <input type="button" class="button" accesskey="u" name="addbbcode4" value=" u " style="text-decoration: underline; width: 30px" onClick="bbstyle(4)" onMouseOver="helpline('u')" />
			  </span></td>
			<td><span class="genmed"> 
			  <input type="button" class="button" accesskey="q" name="addbbcode6" value="Quote" style="width: 50px" onClick="bbstyle(6)" onMouseOver="helpline('q')" />
			  </span></td>
			<td><span class="genmed"> 
			  <input type="button" class="button" accesskey="c" name="addbbcode8" value="Code" style="width: 40px" onClick="bbstyle(8)" onMouseOver="helpline('c')" />
			  </span></td>
			<td><span class="genmed"> 
			  <input type="button" class="button" accesskey="l" name="addbbcode10" value="List" style="width: 40px" onClick="bbstyle(10)" onMouseOver="helpline('l')" />
			  </span></td>
			<td><span class="genmed"> 
			  <input type="button" class="button" accesskey="o" name="addbbcode12" value="List=" style="width: 40px" onClick="bbstyle(12)" onMouseOver="helpline('o')" />
			  </span></td>
			<td><span class="genmed"> 
			  <input type="button" class="button" accesskey="p" name="addbbcode14" value="Img" style="width: 40px"  onClick="bbstyle(14)" onMouseOver="helpline('p')" />
			  </span></td>
			<td><span class="genmed"> 
			  <input type="button" class="button" accesskey="w" name="addbbcode16" value="URL" style="text-decoration: underline; width: 40px" onClick="bbstyle(16)" onMouseOver="helpline('w')" />
			  </span></td>
		  </tr>
		  <tr> 
			<td colspan="9"> 
			  <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
				<tr> 
				  <td align="center"><span class="genmed">
					<select name="addbbcode18" onChange="bbfontstyle('[color=' + this.form.addbbcode18.options[this.form.addbbcode18.selectedIndex].value + ']', '[/color]');this.selectedIndex=0;" onMouseOver="helpline('s')">
					  <option style="color:black;" class="genmed">{L_FONT_COLOR}</option>
					  <option style="color:darkred;" value="darkred" class="genmed">{L_COLOR_DARK_RED}</option>
					  <option style="color:red;" value="red" class="genmed">{L_COLOR_RED}</option>
					  <option style="color:orange;" value="orange" class="genmed">{L_COLOR_ORANGE}</option>
					  <option style="color:brown;" value="brown" class="genmed">{L_COLOR_BROWN}</option>
					  <option style="color:yellow;" value="yellow" class="genmed">{L_COLOR_YELLOW}</option>
					  <option style="color:green;" value="green" class="genmed">{L_COLOR_GREEN}</option>
					  <option style="color:olive;" value="olive" class="genmed">{L_COLOR_OLIVE}</option>
					  <option style="color:cyan;" value="cyan" class="genmed">{L_COLOR_CYAN}</option>
					  <option style="color:blue;" value="blue" class="genmed">{L_COLOR_BLUE}</option>
					  <option style="color:darkblue;" value="darkblue" class="genmed">{L_COLOR_DARK_BLUE}</option>
					  <option style="color:indigo;" value="indigo" class="genmed">{L_COLOR_INDIGO}</option>
					  <option style="color:violet;" value="violet" class="genmed">{L_COLOR_VIOLET}</option>
					  <option style="color:white;" value="white" class="genmed">{L_COLOR_WHITE}</option>
					  <option style="color:black;" value="black" class="genmed">{L_COLOR_BLACK}</option>
					</select>   <select name="addbbcode20" onChange="bbfontstyle('[size=' + this.form.addbbcode20.options[this.form.addbbcode20.selectedIndex].value + ']', '[/size]');this.selectedIndex=0;" onMouseOver="helpline('f')">
					  <option class="genmed">{L_FONT_SIZE}</option>
					  <option value="7" class="genmed">{L_FONT_TINY}</option>
					  <option value="9" class="genmed">{L_FONT_SMALL}</option>
					  <option value="12" class="genmed">{L_FONT_NORMAL}</option>
					  <option value="18" class="genmed">{L_FONT_LARGE}</option>
					  <option  value="24" class="genmed">{L_FONT_HUGE}</option>
					</select>
					</span></td>
				  <td nowrap="nowrap" align="right"><span class="gensmall"><a href="javascript:bbstyle(-1)" class="genmed" onMouseOver="helpline('a')">{L_BBCODE_CLOSE_TAGS}</a></span></td>
				</tr>
			  </table>
			</td>
		  </tr>
		  <tr> 
			<td colspan="9"> <span class="gensmall"> 
			  <input type="text" name="helpbox" size="45" maxlength="100" style="width:450px; font-size:10px" class="helpline" value="{L_STYLES_TIP}" />
			  </span></td>
		  </tr>
		  <tr> 
			<td colspan="9"><textarea name="signature" style="width:450px" rows="6" cols="30" wrap="virtual" class="post" onselect="storeCaret(this);" onclick="storeCaret(this);" onkeyup="storeCaret(this);">{SIGNATURE}</textarea></td>
		</tr>
	  </table>
	  </td>
	</tr>
  </table>
  <br class="nav" />

  <table class="forumline" width="100%" cellpadding="3" cellspacing="1" border="0">
	<tr>
		<th class="thSides" colspan="2" height="25" valign="middle">{L_QP_SETTINGS}</th>
	</tr>
	<!-- BEGIN qpes -->
	<tr>
		<td class="row1" width="38%"><span class="gen">{qpes.L_QP_TITLE}</span><br /><span class="gensmall">{qpes.L_QP_DESC}</span></td>
		<td class="row2"><span class="gen">
			<input type="radio" name="{qpes.QP_VAR}" value="1"{qpes.QP_YES} /> {L_YES}&nbsp;
			<input type="radio" name="{qpes.QP_VAR}" value="0"{qpes.QP_NO} /> {L_NO}
		</span></td>
	</tr>
	<!-- END qpes -->
  </table>
  <br class="nav" />

  <table class="forumline" width="100%" cellpadding="3" cellspacing="1" border="0">
	<tr>
	  <th class="thSides" colspan="2" height="25" valign="middle">{L_PREFERENCES}</th>
	</tr>
	<tr>
	  <td class="row1" width="38%"><span class="gen">{L_PUBLIC_VIEW_EMAIL}:</span></td>
	  <td class="row2"><span class="gen">
		<input type="radio" name="viewemail" value="1" {VIEW_EMAIL_YES} /> {L_YES}&nbsp;
		<input type="radio" name="viewemail" value="0" {VIEW_EMAIL_NO} /> {L_NO}
	  </span></td>
	</tr>
	<tr>
	  <td class="row1"><span class="gen">{L_HIDE_USER}:</span></td>
	  <td class="row2"><span class="gen">
		<input type="radio" name="hideonline" value="1" {HIDE_USER_YES} /> {L_YES}&nbsp;
		<input type="radio" name="hideonline" value="0" {HIDE_USER_NO} /> {L_NO}
	  </span></td>
	</tr>
	<tr>
	  <td class="row1"><span class="gen">{L_NOTIFY_ON_REPLY}:</span><br /><span class="gensmall">{L_NOTIFY_ON_REPLY_EXPLAIN}</span></td>
	  <td class="row2"><span class="gen">
		<input type="radio" name="notifyreply" value="1" {NOTIFY_REPLY_YES} /> {L_YES}&nbsp;
		<input type="radio" name="notifyreply" value="0" {NOTIFY_REPLY_NO} /> {L_NO}
	  </span></td>
	</tr>
	<tr>
	  <td class="row1"><span class="gen">{L_NOTIFY_ON_PRIVMSG}:</span></td>
	  <td class="row2"><span class="gen">
		<input type="radio" name="notifypm" value="1" {NOTIFY_PM_YES} /> {L_YES}&nbsp;
		<input type="radio" name="notifypm" value="0" {NOTIFY_PM_NO} /> {L_NO}
	  </span></td>
	</tr>
	<tr>
	  <td class="row1"><span class="gen">{L_POPUP_ON_PRIVMSG}:</span><br /><span class="gensmall">{L_POPUP_ON_PRIVMSG_EXPLAIN}</span></td>
	  <td class="row2"><span class="gen">
		<input type="radio" name="popup_pm" value="1" {POPUP_PM_YES} /> {L_YES}&nbsp;
		<input type="radio" name="popup_pm" value="0" {POPUP_PM_NO} /> {L_NO}
	  </span></td>
	</tr>
	<tr>
	  <td class="row1"><span class="gen">{L_ALWAYS_ADD_SIGNATURE}:</span></td>
	  <td class="row2"><span class="gen">
		<input type="radio" name="attachsig" value="1" {ALWAYS_ADD_SIGNATURE_YES} /> {L_YES}&nbsp;
		<input type="radio" name="attachsig" value="0" {ALWAYS_ADD_SIGNATURE_NO} /> {L_NO}
	  </span></td>
	</tr>
	<tr>
	  <td class="row1"><span class="gen">{L_ALWAYS_ALLOW_BBCODE}:</span></td>
	  <td class="row2"><span class="gen">
		<input type="radio" name="allowbbcode" value="1" {ALWAYS_ALLOW_BBCODE_YES} /> {L_YES}&nbsp;
		<input type="radio" name="allowbbcode" value="0" {ALWAYS_ALLOW_BBCODE_NO} /> {L_NO}
	  </span></td>
	</tr>
	<tr>
	  <td class="row1"><span class="gen">{L_ALWAYS_ALLOW_HTML}:</span></td>
	  <td class="row2"><span class="gen">
		<input type="radio" name="allowhtml" value="1" {ALWAYS_ALLOW_HTML_YES} /> {L_YES}&nbsp;
		<input type="radio" name="allowhtml" value="0" {ALWAYS_ALLOW_HTML_NO} /> {L_NO}
	  </span></td>
	</tr>
	<tr>
	  <td class="row1"><span class="gen">{L_ALWAYS_ALLOW_SMILIES}:</span></td>
	  <td class="row2"><span class="gen">
		<input type="radio" name="allowsmilies" value="1" {ALWAYS_ALLOW_SMILIES_YES} /> {L_YES}&nbsp;
		<input type="radio" name="allowsmilies" value="0" {ALWAYS_ALLOW_SMILIES_NO} /> {L_NO}
	  </span></td>
	</tr>
	<tr>
	  <td class="row1"><span class="gen">{L_BOARD_LANGUAGE}:</span></td>
	  <td class="row2"><span class="gensmall">{LANGUAGE_SELECT}</span></td>
	</tr>
	<tr>
	  <td class="row1"><span class="gen">{L_BOARD_STYLE}:</span></td>
	  <td class="row2"><span class="gensmall">{STYLE_SELECT}</span></td>
	</tr>
	<tr>
	  <td class="row1"><span class="gen">{L_TIMEZONE}:</span></td>
	  <td class="row2"><span class="gensmall">{TIMEZONE_SELECT}</span></td>
	</tr>
	<tr>
	  <td class="row1"><span class="gen">{L_DATE_FORMAT}:</span><br />
		<span class="gensmall">{L_DATE_FORMAT_EXPLAIN}</span></td>
	  <td class="row2"> 
		<input type="text" name="dateformat" value="{DATE_FORMAT}" maxlength="14" class="post" />
	  </td>
	</tr>
  </table>
  <br class="nav" />

  <table class="forumline" width="100%" cellpadding="3" cellspacing="1" border="0">
<!-- BEGIN switch_avatar_block -->
	<tr>
	  <th class="thSides" colspan="2" height="12" valign="middle">{L_AVATAR_PANEL}</th>
	</tr>
	<tr>
	  <td class="row1" width="38%" colspan="2"><table width="70%" cellspacing="2" cellpadding="0" border="0" align="center">
		<tr>
		  <td width="65%"><span class="gensmall">{L_AVATAR_EXPLAIN}</span></td>
		  <td align="center"><span class="gensmall">
			{L_CURRENT_IMAGE}<br />{AVATAR}<br />
			<input type="checkbox" name="avatardel" /> {L_DELETE_AVATAR}
		  </span></td>
		</tr>
	  </table></td>
	</tr>
  <!-- BEGIN switch_avatar_local_upload -->
	<tr>
	  <td class="row1" width="38%"><span class="gen">{L_UPLOAD_AVATAR_FILE}:</span></td>
	  <td class="row2">
		<input type="hidden" name="MAX_FILE_SIZE" value="{AVATAR_SIZE}" />
		<input type="file" name="avatar" class="post" style="width:200px" />
	  </td>
	</tr>
  <!-- END switch_avatar_local_upload -->
  <!-- BEGIN switch_avatar_remote_upload -->
	<tr>
	  <td class="row1" width="38%"><span class="gen">{L_UPLOAD_AVATAR_URL}:</span><br /><span class="gensmall">{L_UPLOAD_AVATAR_URL_EXPLAIN}</span></td>
	  <td class="row2"><input type="text" name="avatarurl" size="40" class="post" style="width:200px" /></td>
	</tr>
  <!-- END switch_avatar_remote_upload -->
  <!-- BEGIN switch_avatar_remote_link -->
	<tr>
	  <td class="row1" width="38%"><span class="gen">{L_LINK_REMOTE_AVATAR}:</span><br /><span class="gensmall">{L_LINK_REMOTE_AVATAR_EXPLAIN}</span></td>
	  <td class="row2"><input type="text" name="avatarremoteurl" size="40" class="post" style="width:200px" /></td>
	</tr>
  <!-- END switch_avatar_remote_link -->
  <!-- BEGIN switch_avatar_local_gallery -->
	<tr>
	  <td class="row1" width="38%"><span class="gen">{L_AVATAR_GALLERY}:</span></td>
	  <td class="row2"><input type="submit" name="avatargallery" value="{L_SHOW_GALLERY}" class="liteoption" /></td>
	</tr>
  <!-- END switch_avatar_local_gallery -->
<!-- END switch_avatar_block -->
	<tr>
	  <td class="catBottom" colspan="2" align="center" height="28">
	  	{S_HIDDEN_FIELDS}
	  	<input type="submit" name="submit" value="{L_SUBMIT}" class="mainoption" />&nbsp;
	  	<input type="reset" value="{L_RESET}" name="reset" class="liteoption" />
	  </td>
	</tr>
  </table>
</form>