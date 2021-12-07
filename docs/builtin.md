[Main Page](../README.md)

# Bash Builtin Commands

## Top 10 Builtin Commands

### 1) echo
---
Display a line of text

`-n` don't new line

`-e` enable escape character

```
echo "Hello World"
echo -n "Hello World
echo -e "\033[0;31m Hello World
```

### 2) pwd
---
Print name of shell current/working directory

```
pwd
```

### 3) cd
---
Change shell current/working directory

~ change to home directory

\- change to previous working directory 

.. change to parent directory

```
cd
cd ~
cd -
cd ..
cd /root
```

### 4) type
---
Display information about command type

```
type pwd
```

Result

```
pwd is a shell builtin
```

### 5) read
---
One line is read from the standard input, or from the file descriptor

| Args | Description |
| :----- | :- |
| -s         | Silent mode, characters are not echoed. |
| -p         | Prompt output the string PROMPT without a trailing newline before attempting to read |
| -u fd      | Read input from file descriptor fd |
| -n nchars  | Read returns after reading [nchars] characters rather than waiting for a complete line of input |

```
read -s -p "Password :" pass
```

## All Commands
- alias
- bg
- bind
- break
- builtin
- caller
- cd
- command
- compgen
- complete
- compopt
- continue
- declare
- dirs
- disown
- echo
- enable
- eval
- exec
- exit
- export
- fc
- fg
- hash
- help
- history
- jobs
- kill
- let
- local
- logout
- mapfile
- popd
- printf
- pushd
- pwd
- read
- readarray
- readonly
- return
- set
- shift
- shopt
- source
- test
- times
- trap
- type
- typeset
- ulimit
- umask
- unalias
- unset
- wait
