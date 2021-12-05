[Main Page](../README.md)

# Bash
Bash is the shell, or command language interpreter, for the Linux operating system. The name is an acronym for the Bourne-Again SHell

## Bash Command Types
The bash shell understand the following types of commands

- aliases       (**ll**)
- keywords      (**if**)
- functions     (**user defined functions such as genpasswd**)
- builtin       (**pwd**)
- files         (**/bin/date**)

## Login Shell
User can login locally into the console when in runlevel 3 or graphically when in runlevel 5 

In both cases you need to provide username and password. 

Bash uses the following initialization and start-up files

| File | Description |
| :- | :- |
| /etc/profile  | The systemwide initialization file, executed for login shells. |
| /etc/bash.bashrc | The systemwide per-interactive-shell startup file. This is a non-standard file which may not exist on your distribution. Even if it exists, it will not be sourced unless it is done explicitly in another start-up file.
| /etc/bash.logout | The systemwide login shell cleanup file, executed when a login shell exits.
| $HOME/.bash_profile | The personal initialization file, executed for login shells.
| $HOME/.bashrc | The individual per-interactive-shell startup file.
| $HOME/.bash_logout | The individual login shell cleanup file, executed when a login shell exits.
| $HOME/.inputrc | Individual readline initialization file.


**/etc/profile** runs first when a user logs in runlevel **$HOME/.bash_profile**, **$HOME/.bash_login**, and **$HOME/.profile**, Runs second when a user logs in in that order. 

**$HOME/.bash_profile** calls **$HOME/.bashrc**, which calls **/etc/bashrc** (/etc/bash.bashrc).