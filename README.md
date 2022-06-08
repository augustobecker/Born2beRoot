<h1 align="center"> Born2beRoot - @42sp</h1>
<p align="center">:information_source: Debian GNU/Linux server setup and configuration on a VM, with some scripts too.</p>

<p align="center"><a href="https://www.42sp.org.br/" target="_blank"><img src="https://img.shields.io/static/v1?label=&message=SP&color=000&style=for-the-badge&logo=42""></a></p>
<p align="center"><img src="https://user-images.githubusercontent.com/81205527/172609635-7e885150-0014-4f7b-815d-45ab7bfc2b47.png"> </p>
<p align="center"><a href="https://github.com/augustobecker/Born2beRoot/blob/main/READMES/README-ptbr.md" target="_blank"><img src="https://img.shields.io/badge/dispon%C3%ADvel%20tamb%C3%A9m%20em-PT--BR-yellow"></a></p>


## Index
* [What is Born2beRoot?](#what-is-born2beroot)
	* [The Rules](#the-rules)
* [How does it work?](#how-does-it-work)
	* [The Scripts](#the-scripts)
		* [Setup](#setup-scripts)
		* [monitoring.sh](#monitoring-sh)
		* [Evaluation](#evaluation-scripts)
* [42 Cursus](#42-cursus)
* [Author](#author)

<h2 align="center" id="what-is-born2beroot" > What is Born2beRoot?</h2>
The forth project at 42. It consists of having you set up your first server by following specific rules, develop a sricpt to display important system informations and turn in a signature.txt file at the root of your repository - the signature of your machine’s virtual disk.

<h3 align="center" id="the-rules">:bookmark_tabs: The Rules: </h3>

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
	
<h3 align="center" id="the-scripts"> The Scripts </h3>
	
<h4 align="center" id="setup-scripts"> Setup Scripts </h2>
	
<h4 align="center" id="monitoring-sh"> monitoring.sh </h2>
	
<h2 align="center" id="42-cursus"> 42 Cursus </h2>
	
42 is a global education initiative that proposes a new way of learning technology: no teachers, no classrooms,
students learning from their fellow students (peer to peer learning),
with a methodology that develops both computing and life skills.
Not to mention that it's completely free of charge and open to all with no prerequisites.

Admissions at 42 are unlike other colleges. We use a merit-based admission process.
The final step of the admission is the Piscine - This is part of the admissions process and 
requires 4 weeks of intensive and immersive coding. No prior coding experience is necessary at all.
	
You can check more about the admission process on the 42sp website: https://www.42sp.org.br or on my github repository: <a href="https://github.com/augustobecker/42sp_Piscine">42 Piscine</a>

To see other projects developed by me at 42, click here: <a href="https://github.com/augustobecker/42cursus">42 Cursus </a>

<h2 align="center" id="author"> Author </h2>
<div>
<img height="180em" src="https://user-images.githubusercontent.com/81205527/152089472-0aa06bd9-d882-4c83-adfc-8230d1e958c1.png">
    
<strong> Augusto Becker | acesar-l | 🇧🇷👨‍🚀</strong>
    
:wave: How to reach me: 
    
  <a href="https://www.linkedin.com/in/augusto-becker/" target="_blank"><img align="center" alt="LinkedIn" height="60" src="https://user-images.githubusercontent.com/81205527/157161849-01a9df02-bf32-45be-add4-122bc40b48cf.png"></a>
<a href="https://www.instagram.com/augusto.becker/" target="_blank"><img align="center" alt="Instagram" height="60" src="https://user-images.githubusercontent.com/81205527/157161841-19ec3ab2-2c8f-4ec0-8b9d-3cd885256098.png"></a>
<a href = "mailto:augustobecker.dev@gmail.com"> <img align="center" alt="Gmail - augustobecker.dev@gmail.com" height="60" src="https://user-images.githubusercontent.com/81205527/157161831-eb9dffee-404b-4ffe-b0af-34671219f7fb.png"></a>
<a href="https://discord.gg/3kxYkBRxUy" target="_blank"><img align="center" alt="Discord - beckerzz#3614" height="60" src="https://user-images.githubusercontent.com/81205527/157161820-de88dc63-61a3-4c9f-9445-07ac98bf0bc2.png"></a>
</div>
