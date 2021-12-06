[Main Page](../README.md)

# Conditions

## Numerical Comparison
| Condintion | Description |
|:-|:-|
| `-lt` | Little than |
| `-le` | Little and equal than |
| `-gt` | Greater than |
| `-ge` | Greater and equal than 
| `-eq` | Equals than |
| `-ne` | Not equals than |

## File Tests
| Condintion | Description |
|:-|:-|
| `-a` | File exists |
| `-b` | Block special file exists |
| `-c` | Character special file exists |
| `-d` | Directory exists |
| `-e` | File or directory exists |
| `-f` | Regular file exists |
| `-g` | Set group id bit set |
| `-h` | Symbolic-Link |
| `-k` | Sticky bit is set |
| `-p` | Named pipe (FIFO) |
| `-r` | Readable |
| `-s` | Size greater than zero |
| `-t fd` | File descriptor open and refers to a terminal |
| `-u` | Set user id bit set |
| `-w` | Writable |
| `-x` | Executable |
| `-O` | Owned by the effective user id |
| `-G` | Owned by the effective group id |
| `-L` | Symbolic-Link |
| `-S` | Socket |
| `-N` | Has been modified since it was last read |
| `file1 -nt file2` | Returns true if file1 is newer (has a newer modification date/time) than file2 |
| `file1 -ot file2` | Returns true if file1 is older (has an older modification date/time) than file2 |
| `file1 -ef file2` | Returns true if file1 is a hard link to file2 |

## String Comparison
| Condintion | Description |
|:-|:-|
| `=` | Equals |
| `!=` | Not equals |
| `<` | Little |
| `>` | Greater |
| `-z` | String is empty |
| `-n` | String length greater than zero |

## Shell Option & Variable
| Condintion | Description |
|:-|:-|
| `-o` | Returns true if the shell option opt is enabled |
| `{-V \| -R} var` | Returns true if the shell variable var is set |

## Test
The test command is used to check file types and compare values.
- File attributes comparisons
- Perform string comparisons
- Basic arithmetic comparisons

```bash
$ test $# -lt 2 && echo "Missing argument !"
$ test -f /etc/resolv.conf && echo "File /etc/resolv.conf found." || echo "File /etc/resolv.conf not found."
$ test -c /dev/uinput; echo $?
```

## Expression [ exp ]
The expression is what gives the test command its true power. The test can use strings, files, and integers for comparison.
Here’s a quick list of all the available test expression formats.

```bash
$ [ -z $ENV ] && echo “ENV defined” || echo “ENV not defined !”
```
