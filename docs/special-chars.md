[Main Page](../README.md)

# Special Characters

## # (sharp)
\# Comment lines beginning with a # (with the exception of #!) are comments and will not be executed
```bash
# Comment
```

multi-line comment is as follows
```bash
<<'COMMENT'
This is a heredoc (<<) redirected to a NOP command (:).
The single quotes around END_COMMENT are important,
because it disables variable resolving and command resolving
within these lines.  Without the single-quotes around END_COMMENT,
the following two $() `` commands would get executed:
$(command)
`rm -r mydir`
comment1
comment2 
COMMENT
```

Or

```bash
: '
This is a
very neat comment
in bash
'
```

## ; (semicolon)
Command separator. Permits putting two or more commands on the same line
```bash
echo hello; echo world
```

## ;; (double semicolon)
Usage for Terminator in a case option

```bash
case "$variable" in
  abc)  echo "\$variable = abc" ;;
  xyz)  echo "\$variable = xyz" ;;
esac
```

## " (double quote)
Partial quoting, "STRING" preserves (from interpretation) most of the special characters within STRING

## ' (single quote) 
Full Quoting, 'STRING' preserves all special characters within STRING. This is a stronger form of quoting than "STRING"

## \ (backslash)
Escape, a quoting mechanism for single characters
\X escapes the character X. This has the effect of "quoting" X, equivalent to 'X'. The \ may be used to quote " and ', so they are expressed literally.

## / (slash)
Path Seperator. Separates the components of a filename (as in /home/bozo/projects/Makefile)

This is also the division arithmetic operator.

## \`\` Command Substitution
The \`command\` construct makes available the output of command for assignment to a variable. This is also known as backquotes or backticks.
```bash
host=`hostname`
${username=`whoami`}
```

## : (colon)  
This is the shell equivalent of a "NOP" (no op, a do-nothing operation). It may be considered a synonym for the shell builtin true. The ":" command is itself a Bash builtin, and its exit status is true (0).
```bash
:
echo $?   # 0
```

## !
Reverse (or negate) the sense of a test or exit status [bang]. The ! operator inverts the exit status of the command to which it is applied. It also inverts the meaning of a test operator. This can, for example, change the sense of equal ( = ) to not-equal ( != ). The ! operator is a Bash keyword.

## Parameter Substitution Operators
Gets case-modification operators

|Char | Description|
|:-|:-
|^  | First character uppercase
|^^ | All characters uppercase
|,  | First character lowercase
|,, | All character lowercase

Example

```bash
#!/bin/bash4
var=veryMixedUpVariable
echo ${var}            # veryMixedUpVariable
echo ${var^}           # VeryMixedUpVariable
echo ${var^^}          # VERYMIXEDUPVARIABLE
echo ${var,}           # veryMixedUpVariable
echo ${var,,}          # verymixedupvariable
```

## * (asterisk)
The * character serves as a "wild card" for filename expansion in globbing. By itself, it matches every filename in a given directory.

The * also represents any number (or zero) characters in a regular expression.

In the context of arithmetic operations, the * denotes multiplication.

\*\* A double asterisk can represent the exponentiation operator or extended file-match globbing.

## ? (question mark)
Test operator. Within certain expressions, the ? indicates a test for a condition.

In a double-parentheses construct, the ? can serve as an element of a C-style trinary operator.

```bash
(( var = var1 < 98 ? 9 : 21 ))
```
Wild card. The ? character serves as a single-character "wild card" for filename expansion in globbing, as well as representing one character in an extended regular expression.

## $ 
A $ prefixing a variable name indicates the value the variable holds.

End of line. In a regular expression, a "$" addresses the end of a line of text.

## $* $@ Operators
Positional parameters

## $? Operator
Exit status variable. The $? variable holds the exit status of a command, a function, or of the script itself

## $$ Operator
Process ID variable. The $$ variable holds the process ID of the script in which it appears

## ()
Command group
```bash
(a='hello'; echo $a)
```
Array initialization.
```bash
array=(element1 element2 element3)
```

## {} (curly brackets)
Block of code. Also referred to as an inline group, this construct, in effect, creates an anonymous function (a function without a name). However, unlike in a "standard" function, the variables inside a code block remain visible to the remainder of the script.

The code block enclosed in braces may have I/O redirected to and from it.
```bash
file=/etc/fstab
{
read line1
read line2
} < $file
```

Saving the output of a code block to a file
```bash
{
  echo
  echo "Archive Description:"
  rpm -qpi $1       # Query description.
  echo
  echo "Archive Listing:"
  rpm -qpl $1       # Query listing.
  echo
  rpm -i --test $1  # Query whether rpm file can be installed.
  if [ "$?" -eq $SUCCESS ]
  then
    echo "$1 can be installed."
  else
    echo "$1 cannot be installed."
  fi  
  echo              # End code block.
} > "$1.test"       # Redirects output of everything in block to file.
```

## {xxx, yyy, zzz, ...}
Brace expansion. A command may act upon a comma-separated list of file specs within braces. Filename expansion (globbing) applies to the file specs between the braces.
```bash
# " prefix and suffix
echo \"{These, words, are, quoted}\"
# "These" "words" "are" "quoted"

cat {file1, file2, file3} > combined_file
# Concatenates the files file1, file2, and file3 into combined_file.

cp file22.{txt, backup}
# Copies "file22.txt" to "file22.backup"
```

## {a..z}
Extended Brace expansion.
The {a..z} extended brace expansion construction is a feature introduced in version 3 of Bash.
```bash
echo {a..z} 
# a b c d e f g h i j k l m n o p q r s t u v w x y z
# Echoes characters between a and z.

echo {0..3} # 0 1 2 3
# Echoes characters between 0 and 3.

base64_charset=( {A..Z} {a..z} {0..9} + / = )
```

## [ ]
Accces to array element.
```bash
array[1]=slot_1
echo ${array[1]}
```

Range of characters. As part of a regular expression, brackets delineate a range of characters to match.

## $[ ] and (( )) Operator
Integer expansion. Evaluate integer expression between $[ ]
```bash
a=3
b=7
echo $[$a + $b]   # 10
echo (($a * $b))   # 21
```

## > < &> >& >> <> Operators
Redirections

`scriptname > filename` redirects the output of scriptname to file filename. Overwrite filename if it already exists.

`command** &> filename` redirects both the stdout and the stderr of command to filename.

`command >&2` redirects stdout of command to stderr.

`scriptname >> filename` appends the output of scriptname to file filename. If filename does not already exist, it is created.

`[i] <> filename` opens file filename for reading and writing, and assigns file descriptor i to it. If filename does not exist, it is created.
  
 ## |
 Pipe. Passes the output (stdout) of a previous command to the input (stdin) of the next one, or to the shell. This is a method of chaining commands together.
 ```bash
echo ls -l | sh
# Passes the output of "echo ls -l" to the shell,
 ```
 
 
