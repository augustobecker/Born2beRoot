<h1 align="center"> Born2beRoot - @42sp</h1>
<p align="center">:information_source: Basic Debian GNU/Linux server setup and configuration on a VM.</p>

<p align="center"><a href="https://www.42sp.org.br/" target="_blank"><img src="https://img.shields.io/static/v1?label=&message=SP&color=000&style=for-the-badge&logo=42""></a></p>
<p align="center"><a href="https://github.com/augustobecker/Born2beRoot/blob/main/README-ptbr.md" target="_blank"><img src="https://img.shields.io/badge/dispon%C3%ADvel%20tamb%C3%A9m%20em-PT--BR-yellow"></a></p>


## Index
* [What is Born2beRoot?](#what-is-born2beroot)
* [How does it work?](#how-does-it-work)

<h2 align="center" id="what-is-born2beroot" > What is Born2beRoot?</h2>
The forth project at 42. It consists of having you set up your first server by following specific rules.

<h3 align="center">:bookmark_tabs: The Rules: </h3>

:small_blue_diamond: Create at least 2 encrypted partitions using LVM.

:small_blue_diamond: The hostname of the virtual machine must be acesar-l42 and I have to modify this hostname during a peer-evaluation.

:small_blue_diamond: In addition to the root user, a user with your acesar-l as username has to be present, and this user has to belong to the user42 and sudo groups.

:small_blue_diamond: Implement a strong password policy, that consists of:

	The password has to expire every 30 days.
	
	The minimum number of days allowed before the modification of a password will be set to 2.
	
	The user has to receive a warning message 7 days before their password expires.
	
	The password must be at least 10 characters long. It must contain an uppercase letter and a number.
	Also, it must not contain more than 3 consecutive identical characters.
	
	The password must not include the name of the user.
	
	The following rule does not apply to the root password: The password must have at least 7 characters
	that are not part of the former password.
	
	 Of course, your root password has to comply with this policy.
	
:small_blue_diamond: Install and configure sudo following strict rules.

	Authentication using sudo has to be limited to 3 attempts in the event of an incorrect password.
	
	A custom message of your choice has to be displayed if an error due to a wrong 
	password occurs when using sudo.
	
	Each action using sudo has to be archived, both inputs and outputs. The log file
	has to be saved in the /var/log/sudo/ folder.
	
	The TTY mode has to be enabled for security reasons.
	
	For security reasons too, the paths that can be used by sudo must be restricted.
  
<h2 align="center" id="how-does-it-work"> How does it work? </h2>

