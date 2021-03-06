/*
Action Script 3/Flex IRC Client Implementation 
Copyright (C) 2007 Leon Oosterwijk
Based on PircBot by Paul James Mutton (http://www.jibble.org/)

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
*/

package com.oosterwijk.irc
{
	public final class ReplyConstants
	{
		/**
		 * This class contains the values of all numeric replies specified
		 * in section 6 of RFC 1459.  Refer to RFC 1459 for further information.
		 *  <p>
		 * If you override the onServerResponse method in the AsIrcClient class,
		 * you may find these constants useful when comparing the numeric
		 * value of a given code.
		 * 
		 */
	    // Error Replies.
	    public static  var   ERR_NOSUCHNICK:int = 401;
	    public static  var   ERR_NOSUCHSERVER:int = 402;
	    public static  var   ERR_NOSUCHCHANNEL:int = 403;
	    public static  var   ERR_CANNOTSENDTOCHAN:int = 404;
	    public static  var   ERR_TOOMANYCHANNELS:int = 405;
	    public static  var   ERR_WASNOSUCHNICK:int = 406;
	    public static  var   ERR_TOOMANYTARGETS:int = 407;
	    public static  var   ERR_NOORIGIN:int = 409;
	    public static  var   ERR_NORECIPIENT:int = 411;
	    public static  var   ERR_NOTEXTTOSEND:int = 412;
	    public static  var   ERR_NOTOPLEVEL:int = 413;
	    public static  var   ERR_WILDTOPLEVEL:int = 414;
	    public static  var   ERR_UNKNOWNCOMMAND:int = 421;
	    public static  var   ERR_NOMOTD:int = 422;
	    public static  var   ERR_NOADMININFO:int = 423;
	    public static  var   ERR_FILEERROR:int = 424;
	    public static  var   ERR_NONICKNAMEGIVEN:int = 431;
	    public static  var   ERR_ERRONEUSNICKNAME:int = 432;
	    public static  var   ERR_NICKNAMEINUSE:int = 433;
	    public static  var   ERR_NICKCOLLISION:int = 436;
	    public static  var   ERR_USERNOTINCHANNEL:int = 441;
	    public static  var   ERR_NOTONCHANNEL:int = 442;
	    public static  var   ERR_USERONCHANNEL:int = 443;
	    public static  var   ERR_NOLOGIN:int = 444;
	    public static  var   ERR_SUMMONDISABLED:int = 445;
	    public static  var   ERR_USERSDISABLED:int = 446;
	    public static  var   ERR_NOTREGISTERED:int = 451;
	    public static  var   ERR_NEEDMOREPARAMS:int = 461;
	    public static  var   ERR_ALREADYREGISTRED:int = 462;
	    public static  var   ERR_NOPERMFORHOST:int = 463;
	    public static  var   ERR_PASSWDMISMATCH:int = 464;
	    public static  var   ERR_YOUREBANNEDCREEP:int = 465;
	    public static  var   ERR_KEYSET:int = 467;
	    public static  var   ERR_CHANNELISFULL:int = 471;
	    public static  var   ERR_UNKNOWNMODE:int = 472;
	    public static  var   ERR_INVITEONLYCHAN:int = 473;
	    public static  var   ERR_BANNEDFROMCHAN:int = 474;
	    public static  var   ERR_BADCHANNELKEY:int = 475;
	    public static  var   ERR_NOPRIVILEGES:int = 481;
	    public static  var   ERR_CHANOPRIVSNEEDED:int = 482;
	    public static  var   ERR_CANTKILLSERVER:int = 483;
	    public static  var   ERR_NOOPERHOST:int = 491;
	    public static  var   ERR_UMODEUNKNOWNFLAG:int = 501;
	    public static  var   ERR_USERSDONTMATCH:int = 502;
	    
	    // Command Responses.
	    public static  var   RPL_TRACELINK:int = 200;
	    public static  var   RPL_TRACECONNECTING:int = 201;
	    public static  var   RPL_TRACEHANDSHAKE:int = 202;
	    public static  var   RPL_TRACEUNKNOWN:int = 203;
	    public static  var   RPL_TRACEOPERATOR:int = 204;
	    public static  var   RPL_TRACEUSER:int = 205;
	    public static  var   RPL_TRACESERVER:int = 206;
	    public static  var   RPL_TRACENEWTYPE:int = 208;
	    public static  var   RPL_STATSLINKINFO:int = 211;
	    public static  var   RPL_STATSCOMMANDS:int = 212;
	    public static  var   RPL_STATSCLINE:int = 213;
	    public static  var   RPL_STATSNLINE:int = 214;
	    public static  var   RPL_STATSILINE:int = 215;
	    public static  var   RPL_STATSKLINE:int = 216;
	    public static  var   RPL_STATSYLINE:int = 218;
	    public static  var   RPL_ENDOFSTATS:int = 219;
	    public static  var   RPL_UMODEIS:int = 221;
	    public static  var   RPL_STATSLLINE:int = 241;
	    public static  var   RPL_STATSUPTIME:int = 242;
	    public static  var   RPL_STATSOLINE:int = 243;
	    public static  var   RPL_STATSHLINE:int = 244;
	    public static  var   RPL_LUSERCLIENT:int = 251;
	    public static  var   RPL_LUSEROP:int = 252;
	    public static  var   RPL_LUSERUNKNOWN:int = 253;
	    public static  var   RPL_LUSERCHANNELS:int = 254;
	    public static  var   RPL_LUSERME:int = 255;
	    public static  var   RPL_ADMINME:int = 256;
	    public static  var   RPL_ADMINLOC1:int = 257;
	    public static  var   RPL_ADMINLOC2:int = 258;
	    public static  var   RPL_ADMINEMAIL:int = 259;
	    public static  var   RPL_TRACELOG:int = 261;
	    public static  var   RPL_NONE:int = 300;
	    public static  var   RPL_AWAY:int = 301;
	    public static  var   RPL_USERHOST:int = 302;
	    public static  var   RPL_ISON:int = 303;
	    public static  var   RPL_UNAWAY:int = 305;
	    public static  var   RPL_NOWAWAY:int = 306;
	    public static  var   RPL_WHOISUSER:int = 311;
	    public static  var   RPL_WHOISSERVER:int = 312;
	    public static  var   RPL_WHOISOPERATOR:int = 313;
	    public static  var   RPL_WHOWASUSER:int = 314;
	    public static  var   RPL_ENDOFWHO:int = 315;
	    public static  var   RPL_WHOISIDLE:int = 317;
	    public static  var   RPL_ENDOFWHOIS:int = 318;
	    public static  var   RPL_WHOISCHANNELS:int = 319;
	    public static  var   RPL_LISTSTART:int = 321;
	    public static  var   RPL_LIST:int = 322;
	    public static  var   RPL_LISTEND:int = 323;
	    public static  var   RPL_CHANNELMODEIS:int = 324;
	    public static  var   RPL_NOTOPIC:int = 331;
	    public static  var   RPL_TOPIC:int = 332;
	    public static  var   RPL_TOPICINFO:int = 333;
	    public static  var   RPL_INVITING:int = 341;
	    public static  var   RPL_SUMMONING:int = 342;
	    public static  var   RPL_VERSION:int = 351;
	    public static  var   RPL_WHOREPLY:int = 352;
	    public static  var   RPL_NAMREPLY:int = 353;
	    public static  var   RPL_LINKS:int = 364;
	    public static  var   RPL_ENDOFLINKS:int = 365;
	    public static  var   RPL_ENDOFNAMES:int = 366;
	    public static  var   RPL_BANLIST:int = 367;
	    public static  var   RPL_ENDOFBANLIST:int = 368;
	    public static  var   RPL_ENDOFWHOWAS:int = 369;
	    public static  var   RPL_INFO:int = 371;
	    public static  var   RPL_MOTD:int = 372;
	    public static  var   RPL_ENDOFINFO:int = 374;
	    public static  var   RPL_MOTDSTART:int = 375;
	    public static  var   RPL_ENDOFMOTD:int = 376;
	    public static  var   RPL_YOUREOPER:int = 381;
	    public static  var   RPL_REHASHING:int = 382;
	    public static  var   RPL_TIME:int = 391;
	    public static  var   RPL_USERSSTART:int = 392;
	    public static  var   RPL_USERS:int = 393;
	    public static  var   RPL_ENDOFUSERS:int = 394;
	    public static  var   RPL_NOUSERS:int = 395;
	    
	    // Reserved Numerics.
	    public static  var   RPL_TRACECLASS:int = 209;
	    public static  var   RPL_STATSQLINE:int = 217;
	    public static  var   RPL_SERVICEINFO:int = 231;
	    public static  var   RPL_ENDOFSERVICES:int = 232;
	    public static  var   RPL_SERVICE:int = 233;
	    public static  var   RPL_SERVLIST:int = 234;
	    public static  var   RPL_SERVLISTEND:int = 235;
	    public static  var   RPL_WHOISCHANOP:int = 316;
	    public static  var   RPL_KILLDONE:int = 361;
	    public static  var   RPL_CLOSING:int = 362;
	    public static  var   RPL_CLOSEEND:int = 363;
	    public static  var   RPL_INFOSTART:int = 373;
	    public static  var   RPL_MYPORTIS:int = 384;
	    public static  var   ERR_YOUWILLBEBANNED:int = 466;
	    public static  var   ERR_BADCHANMASK:int = 476;
	    public static  var   ERR_NOSERVICEHOST:int = 492;
		
	}
}