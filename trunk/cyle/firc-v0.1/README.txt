Firc readme.txt
Updated August, 2007 by Leon Oosterwijk

Send all feedback/comments/problems to leon@isdn.net
 
WHAT IS FIRC
================
The AsIrcClient class is an ActionScript 3 based IRC Client Library. 
The class offers support for most IRC features that are easily supported 
by the Flash Player 9(+). Because the Flash Player doesn't allow incoming
connections, features such as DCC and ident are not implemented. This means
you might not be able to use this library to connect to an IRC network
 that requires ident.
	 
WHY SHOULD I USE FIRC?
==========================
If you plan to develop a flash/flex-based application that needs to 
access an IRC network this might be the library for you. As of this writing
there is no IRC-compatible flash-based client or API other than this one. 

The Flex IRC Client, which is also available at http://code.google.com/p/flexircclient/
is a very simple client built on the FIRC library. 


INSTALLATION
============
There are two ways to use this project. 

a) Put the Firc.swc file on the build-path of your flex/flash project to access the api. 
b) checkout the Firc project from subversion and reference this project from your
flex project where you wish to use the library.

For an example of how to use the library look at the Flex IRC Client. 


PROBLEMS USING FIRC
=======================
If you run into any problems using this library please drop me a line at leon@isdn.net


FIRC HISTORY
================

Aug, 2007 v0.1 Initial Release
This is the initial release of the Firc library. 

KNOWN ISSUES
===============
Currently I've noticed there is some problems with internationalisation. 
Incoming strings are displayed ok, but sending some unicode causes gibberish to appear

Under some circumstances people parting a channel causes a nullpointer problem

DCC etc. is not support and likely won't be since it requires incoming connections and file-system access




