[Main Page](../README.md)

# Variable
You can use variables to store data and configuration options. There are two types of variable as follows
- System Variables
- User Defined Variables

## System Variables
Created and maintained by Linux bash shell itself. This type of variable (with the exception of auto_resume and histchars) is defined in CAPITAL LETTERS. You can configure aspects of the shell by modifying system variables such as PS1, PATH, LANG,HISTSIZE,and DISPLAY etc.

To see all system variables, type the following command at a console / terminal:
```bash
set
env
printenv
```

## Commonly Used Shell Variables
| System Variable | Meaning | To View Variable Value Type
|:- | :- |:- |
| BASH_VERSION | Holds the version of this instance of bash. |	echo $BASH_VERSION
| HOSTNAME	   | The name of the your computer.	| echo $HOSTNAME
| CDPATH	     | The search path for the cd command. | echo $CDPATH
| HISTFILE	   | The name of the file in which command history is saved. | echo $HISTFILE
| HISTFILESIZE | The maximum number of lines contained in the history file. | echo $HISTFILESIZE
| HISTSIZE	   | The number of commands to remember in the command history. The default value is 500. | echo $HISTSIZE
| HOME	       | The home directory of the current user. | echo $HOME
| IFS	         | The Internal Field Separator that is used for word splitting after expansion and to split lines into words with the read builtin command. The default value is | echo $IFS
| LANG	       | Used to determine the locale category for any category not specifically selected with a variable starting with LC_. | echo $LANG
| PATH	       | The search path for commands. It is a colon-separated list of directories in which the shell looks for commands.	| echo $PATH
| PS1	         | Your prompt settings. | echo $PS1
| TMOUT	       | The default timeout for the read builtin command. Also in an interactive shell, the value is interpreted as the number of seconds to wait for input after issuing the command. If not input provided it will logout user. | echo $TMOUT
| TERM	       | Your login terminal type. | echo $TERM ; export TERM=vt100
| SHELL	       | Set path to login shell. | echo $SHELL
| DISPLAY	     | Set X display name	| echo $DISPLAY; export DISPLAY=:0.1
| EDITOR	     | Set name of default text editor. | export EDITOR=/usr/bin/vim

## How Do I Display The Value Of a Variable
Use echo command to display variable value. To display the program search path
```bash
echo $PATH
# Or
echo ${PATH}
```
## User Defined Variables
Created and maintained by user. This type of variable defined may use any valid variable name, but it is good practice to avoid all uppercase names as many are used by the shell.

Creating and setting variables within a script is fairly simple. Use the following syntax
```bash
varName=someValue
```

Store current date (you can store the output of date by running the shell command):
```bash
now=$(date)
```

## Default Shell Variables Value
You can set the default shell variable value using the following syntax.
```bash
${var:=defaultValue}
# Or
${var:-defaultValue}
```

Example
```bash
die(){
  local error=${1:-Undefined error}
  echo "$0: $error" 
}
die "File not found"
die
```

## Rules For Variable Naming
- Variable name must begin with alphanumeric character or underscore character (_), followed by one or more alphanumeric or underscore characters. 
- Do not use ?,* and other special characters, to name your variable.
- Variables names are case-sensitive
- Variables defined a NULL variable as follows (NULL variable is variable which has no value at the time of definition)

Valid shell variable examples:
```bash
HOME
SYSTEM_VERSION
vech
no
```

Do not put spaces on either side of the equal sign when assigning value to variable. For example, the following is valid variable declaration:
```bash
var=10
```

However, any of the following variable declaration will result into an error such as command not found:
```bash
var  =10
var=  10
var  =  10
```

Not initialized or NULL variable
```bash
var=
var=''
```

## Export Variables
The export builtin automatically exports to the environment of child processes.
By default all user defined variables are local. They are not exported to new processes. Use export command to export variables and functions to child processes. 
If no variable names or function names are given, or if the -p option is given, a list of all names that are exported in this shell is printed. An argument of -n says to remove the export property from subsequent NAMEs
```bash
export backup="/nas10/mysql"
echo "Backup dir $backup"
```

## Unset Variable
Use unset command to delete the variables during program execution. It can remove both functions and shell variables.
```bash
var=/etc/profile
echo $var
unset var
echo $var
```

## Arithmetic Expansion
```bash
$((expression))
$(( n1+n2 ))
$(( n1/n2 ))
$(( n1-n2 ))
```
| Operator | Description | Example | Evaluates To |
| :- | :- | :- | :- | 
| + | Addition | $(( 20 + 5 )) | | 
| - | Substraction | $(( 20 - 5 ))| | 
| / | Divison | $(( x / 2 )) | | 
| % | Modules | $(( x % 10 )) | | 
| * | Multipilication | $(( x * y )) | |
| ++ | post-increment | $(( x++ )) | |
| -- | post-decrement | $(( x-- )) | |
| ** | Exponentiation | $(( x ** y )) | |

## Create Integer Variable
To create an integer variable use the declare command as follows
```bash
declare -i x=10
declare -i y=10
declare -i z=0
z=$(( x + y ))
echo "$x + $y = $z" 
```

## Create The Constants Variable
You can create the constants variables using the readonly command or declare command
Syntax
```bash
readonly var
readonly varName=value

declare -r var
declare -r varName=value
```
Example
```bash
readonly DATA=/home/sales/data/feb09.dat
```

## Bash Variable Existence Check
If the variable is not defined, you can stop executing the Bash script with the following syntax
```bash
${varName?Error varName is not defined}
${varName:?Error varName is not defined or is empty}
```

Example
```bash
#!/bin/bash
# varcheck.sh: Variable sanity check with :? 
path=${1:?Error command line argument not passed}
echo "Backup path is $path."
echo "I'm done if \$path is set."
```

## Array
### Declaration Array
We can explicitly create an array by using the declare command
```bash
declare -a my_array
```

We can create indexed arrays with a more concise syntax, by simply assign them some values
```bash
my_array=(foo bar)
```

In this case we assigned multiple items at once to the array, but we can also insert one value at a time, specifying its index
```bash
my_array[0]=foo
```

### Print The Values Of An Array
```bash
echo ${my_array[@]}
# Or
echo ${my_array[*]}
# Or
for i in "${my_array[@]}"; do echo "$i"; done
```
> When using *, and the variable is quoted, instead, a single “result” will be produced, containing all the elements of the array

### Print The Keys Of A Bash Array
It’s even possible to retrieve and print the keys used in an indexed or associative array, instead of their respective values. The syntax is almost identical, but relies on the use of the ! operator
```bash
my_array=(foo bar baz)
for index in "${!my_array[@]}"; do echo "$index"; done
```

### Associative Arrays
```bash
${!variable[@]}
```

Example
```bash
declare -A my_array
my_array=([foo]=bar [baz]=foobar)
for key in "${!my_array[@]}"; do echo "$key"; done
```

### Getting The Size Of An Bash Array
```bash
${#variable[@]}
```

Example
```bash
my_array=(foo bar baz)
echo "the array size : ${#my_array[@]}"
$ the array size : 3
```

### Adding Elements To An Bash Array
```bash
variable+=(value)
```

Example
```bash
my_array=(foo bar)
my_array+=(baz)

# Or

my_array=(foo bar)
my_array+=(baz foobar)
```

To add elements to an associative array, we are bound to specify also their associated keys:
```bash
declare -A my_array
my_array[foo]="bar"
my_array+=([baz]=foobar [foobarbaz]=baz)
```

### Deleting An Element From The Bash Array
To delete an element from the array we need to know it’s index or its key in the case of an associative array, and use the unset command

Example 
```bash
my_array=(foo bar baz)
unset my_array[1]
echo ${my_array[@]}
foo baz
```

The same thing it’s valid for associative arrays:
```bash
declare -A my_array
my_array+=([foo]=bar [baz]=foobar)
unset my_array[foo]
echo ${my_array[@]}
foobar
```
