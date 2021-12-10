[Main Page](../README.md)

# Functions
Syntax
```bash
hello() { 
  echo "Hello World" ; 
}
```

Or

```bash
function hello() { 
  echo "Hello World" ; 
}
```

## Display Functions
To display defined function names use the declare command. Type the following command at a shell prompt
```bash
declare -f functionName
```
To unset or remove the function use the unset command as follows
```bash
unset -f functionName
```

## Pass Arguments
Shell functions have their own command line argument or parameters.
Use shell variable $1, $2,..$n to access argument passed to the function.

Example
```bash
functionName() {
  arg1=$1
  arg2=$2
  commands...
}
```

## Invoke Function
```bash
functionName arg1 arg2 argn..
```

## Function Shell Variables
All function parameters or arguments can be accessed via $1, $2, $3,..., $n
- $0 always point to the shell script name.
- $* or $@ holds all parameters or arguments passed to the function.
- $# holds the number of positional parameters passed to the function.

> How do I display function name?

> $0 always point to the shell script name. However, you can use an array variable called FUNCNAME which contains the names of all shell functions currently in the execution call stack. The element with index 0 is the name any currently-executing shell function.This variable exists only when a shell function is executing.

FUNCNAME Example
```bash
backup() {
	local dir="$1"
	[[ -z $dir ]] && { echo "${FUNCNAME}(): directory name not specified"; exit 1; }
	echo "Starting backup..."
}
backup $1

$ backup(): directory name not specified
```

## Return Values
Terminates a function. A return command optionally takes an **integer argument**, which is returned to the calling script as the "exit status" of the function, and this exit status is assigned to the variable $?

You can get the value from bash functions in different ways.
- Using global variable
- Using function command
- Using return statement

### Return statement
```bash
sum () {
    return $(( $1 + $2 ))
}
```

### Using global variable
Bash function can return a string value by using a global variable
```bash
Func () {
    retval='I like programming'
}
retval='I hate programming'
echo $retval
Func
echo $retval
```

### Using function command
You can receive the return value of a bash function and store it in a variable at the time of calling.
```bash
Func () {
    local retval='Using BASH Function'
    echo "$retval"
}
val=$(Func)  
echo $val
```


## Local Variable
- By default all variables are global
- Modifying a variable in a function changes it in the whole script

