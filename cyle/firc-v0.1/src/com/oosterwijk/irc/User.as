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
	/**
	 * This class is used to represent a user on an IRC server.
	 * Instances of this class are returned by the getUsers method
	 * in the AsIrcClient class.
	 */
	public class User
	{
    
	    private var  _prefix:String;
	    private var  _nick:String;
	    private var _lowerNick:String;
		 
	    /**
	     * Constructs a User object with a known prefix and nick.
	     *
	     * @param prefix The status of the user, for example, "@".
	     * @param nick The nick of the user.
	     */
	    public function User(prefix:String, nick:String):void 
	    {
	        _prefix = prefix;
	        _nick = nick;
	        _lowerNick = nick.toLowerCase();
	    }
	    
	    
	    /**
	     * Returns the prefix of the user. If the User object has been obtained
	     * from a list of users in a channel, then this will reflect the user's
	     * status in that channel.
	     *
	     * @return The prefix of the user. If there is no prefix, then an empty
	     *         String is returned.
	     */
	    public function getPrefix():String 
	    {
	        return _prefix;
	    }
	    
	    
	    /**
	     * Returns whether or not the user represented by this object is an
	     * operator. If the User object has been obtained from a list of users
	     * in a channel, then this will reflect the user's operator status in
	     * that channel.
	     * 
	     * @return true if the user is an operator in the channel.
	     */
	    public function isOp():Boolean
		{
	        return _prefix.indexOf('@') >= 0;
	    }
	    
	    
	    /**
	     * Returns whether or not the user represented by this object has
	     * voice. If the User object has been obtained from a list of users
	     * in a channel, then this will reflect the user's voice status in
	     * that channel.
	     * 
	     * @return true if the user has voice in the channel.
	     */
	    public  function hasVoice():Boolean 
	    {
	        return _prefix.indexOf('+') >= 0;
	    }        
	    
	    
	    /**
	     * Returns the nick of the user.
	     * 
	     * @return The user's nick.
	     */
	    public function getNick():String
	    {
	        return _nick;
	    }
	    
	    
	    /**
	     * Returns the nick of the user complete with their prefix if they
	     * have one, e.g. "@Dave".
	     * 
	     * @return The user's prefix and nick.
	     */
	    public function  toString():String 
	    {
	        return this.getPrefix() + this.getNick();
	    }
	    
	    
	    /**
	     * Returns true if the nick represented by this User object is the same
	     * as the argument. A case insensitive comparison is made.
	     * 
	     * @return true if the nicks are identical (case insensitive).
	     */
	    public function  equals(nick:String ):Boolean {
	        return nick.toLowerCase() == (_lowerNick);
	    }
	    
	    
	    
	}
}