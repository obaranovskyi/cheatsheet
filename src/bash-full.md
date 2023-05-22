# Bash Cheat Sheet

## Display info with `echo`:
```bash
echo Hello World!
```
- `echo` ignores `\n`. In order to apply `\n` add `-e` parameter.
- `echo` also can use be used as a return value.
  In this case it should be used as last statement in the function or command.
- `echo` isn't stable on different environments, it's better to use `printf`

## Variables:
When you assign variable value there shouldn't be a space around the equal sign: `var=123` \
Use lowercase underscore variables for regular variables.\
For environment variables use uppercase underscore variable names.

```bash  
name="Bob"
echo "My name is $name"
echo "or, My name is ${name}"
```

`${}` is used when variable has some characters around, for instance:
```bash
greet_ending_1='i'
greet_ending_2='ello'
echo "h${greet_ending_1} John, or better to say h${greet_ending_2}"
```

## Read user input
```bash
read -p "Enter your name: " name
echo "Hello $name, nice to meet you!"
```

## Reading the arguments
`$1`, `$2`, `$3` ... - get argument by number \
`@` - list of passed arguments \
`$#` - variable returns the input size 

loop through the arguments using flags:
```bash
while getopts u:a:f: flag
do
  case "${flag}" in
    u) username=${OPTARG};;
    a) age=${OPTARG};;
    f) fullname=${OPTARG};;
  esac
done

echo "username: $username"
echo "age: $age"
echo "fullname: $fullname"

# ./script.sh -u oleh -a 18 -f baranovskyi
```

loop through the arguments
```bash
i=1;
for arg in "$@" 
do
    echo "Arg - $i: $arg";
    i=$((i + 1));
done
```
shift the position of the command line arguments
```bash
i=1;
j=$#;
while [ $i -le $j ] 
do
    echo "Username - $i: $1";
    i=$((i + 1));
    shift 1;
done
```
`shift n` - shifts the argument position, where n is the number of positions to move

## `if` statement
When you use `if` statements the space has to be around the square brackets (`[`, and `]`), `if [ ... ]`

```bash
if [ "$NAME" == "Brad" ];
then
  echo "Your name is Brad"
fi
```

## `test` command
Every command has it's exit code which is number:
- `0` - is successful (`true`)
- `1` and higher - is failure (`false`)

We can test command we want using the `test` command:

```bash
test $var -eq 2 && echo true || echo false
echo $?
```
`$?` - is the last statement result

## Stream types
* `0` - stands for standard input stream (STDIN)
* `1` - stands for standard output stream (STDOUT)
* `2` - stands for standard error stream (STDERR)

## Stream redirections
We can redirect streams in the following way:
* `1>&2` - STDOUT to STDERR 
* `2>&1` - STDERR to STDOUT
* `1>&/dev/null` - STDOUT to nowhere
* `2>&/dev/null` - STDERR to nowhere
* `<` - pass input from file or I/O device data to a command `wc -l < text.txt`

We can redirect the streams if we don't want to see the results:

```bash
function get_latest_version() {
    echo "Resolving Host" 
    echo "Starting Connection"
    echo "Resolving Host" 
    echo "3.2.28" # this is the result we want to return 
}

echo "The current version of foo is $(get_latest_version)"
```
If run this we get the following:
```
The current version of foo is Resolving Host
Starting Connection
Resolving Host
3.2.28
```

Obviously, this is not what we want.
One workaround would be to redirect standard output stream to standard error streams.

To do so:
```bash
function get_latest_version() {
    echo "Resolving Host" 1>&2
    echo "Starting Connection" 1>&2
    echo "Resolving Host" 1>&2
    echo "3.2.28" # this is the result we want to return 
}

echo "The current version of foo is $(get_latest_version)"
```
Here is the result:
```
Resolving Host
Starting Connection
Resolving Host
The current version of foo is 3.2.28
```
Now if want to hide the logs:
```bash
function get_latest_version() {
    echo "Resolving Host" 1>&2
    echo "Starting Connection" 1>&2
    echo "Resolving Host" 1>&2
    echo "3.2.28" # this is the result we want to return 
}

echo "The current version of foo is $(get_latest_version 2>/dev/null)"
```
```
The current version of foo is 3.2.28
```

If we want to discard standard out and show standard error instead,\
we can do the following:

```bash
function get_latest_version() {
    echo "Resolving Host" 1>&2
    echo "Starting Connection" 1>&2
    echo "Resolving Host" 1>&2
    echo "3.2.28" # this is the result we want to return 
}

echo "The current version of foo is $(get_latest_version 2>&1 1>/dev/null)"
```
```
The current version of foo is Resolving Host
Starting Connection
Resolving Host
```

**Note:** Here is the good explanation: https://www.youtube.com/watch?v=XGSK5xr_B_Q 


## if-else
```bash
if [ "$name" == "Brad" ];
then
  echo "Your name is Brad"
else 
  echo "Your name is NOT Brad"
fi
```

## else-if (elif)
```bash
if [ "$name" == "Brad" ];
then
  echo "Your name is Brad"
elif [ "$name" == "Jack" ];
then  
  echo "Your name is Jack"
else 
  echo "Your name is NOT Brad or Jack"
fi
```

## Number comparison
```bash
num1=31
num2=5
if [ "$num1" -gt "$num2" ];
then
  echo "$num1 is greater than $num2"
else
  echo "$num1 is less than $num2"
fi
```

* `$val1 -eq $val2` - Returns true if the values are equal  
* `$val1 -ne $val2` - Returns true if the values are not equal  
* `$val1 -gt $val2` - Returns true if `val1` is greater than `val2`  
* `$val1 -ge $val2` - Returns true if `val1` is greater than or equal to `val2`  
* `$val1 -lt $val2` - Returns true if `val1` is less than `val2`  
* `$val1 -le $val2` - Returns true if `val1` is less than or equal to `val2`  

## String comparison
* `string1 = string2` and `string1 == string2` - The equality operator returns true if the operands are equal.
  * Use the `=` operator with the `test [` command.
  * Use the `==` operator with the `[[` command for pattern matching.
* `string1 != string2` - The inequality operator returns true if the operands are not equal.
* `string1 =~ regex` - The regex operator returns true if the left operand matches the extended regular expression on the right.
* `string1 > string2` - The greater than operator returns true if the left operand is greater than the right sorted by lexicographical (alphabetical) order.
* `string1 < string2` - The less than operator returns true if the right operand is greater than the right sorted by lexicographical (alphabetical) order.
* `-z string` - True if the string length is zero.
* `-n string` - True if the string length is non-zero.

Following are a few points to be noted when comparing strings:
* A blank space must be used between the binary operator and the operands.
* Always use double quotes around the variable names to avoid any word splitting or globbing issues.
* Bash does not segregate variables by “type”, variables are treated as integer or string depending on the context.

#### Are strings equal
```bash
VAR1="Some value"
VAR2="Some value"

if [ "$VAR1" = "$VAR2" ]; then
    echo "Strings are equal."
else
    echo "Strings are not equal."
fi
```

```bash
read -p "Enter first string: " VAR1
read -p "Enter second string: " VAR2

if [[ "$VAR1" == "$VAR2" ]]; then
    echo "Strings are equal."
else
    echo "Strings are not equal."
fi
```

#### Logical and `&&` and or `||` to compare strings 
```bash
[[ "string1" == "string2" ]] && echo "Equal" || echo "Not equal"
```

#### Check if string contains a substring
One approach is to use surround the substring with asterisk symbols `*` which means match all characters.
```bash
VAR='GNU/Linux is an operating system'
if [[ $VAR == *"Linux"* ]]; then
  echo "It's there."
fi
```
Another option is to use the regex operator =~
```bash
#!/bin/bash

VAR='GNU/Linux is an operating system'
if [[ $VAR =~ .*Linux.* ]]; then
  echo "It's there."
fi
```

### Check if string is empty
```bash
VAR=''
if [[ -z $VAR ]]; then
  echo "String is empty."
fi
```

```bash
VAR='Some value'
if [[ -n $VAR ]]; then
  echo "String is not empty."
fi
```

Instead of using the test operators you can also use the case statement to compare strings:
```bash
VAR="Arch Linux"

case $VAR in

  "Arch Linux")
    echo -n "Some value matched"
    ;;

  Fedora | CentOS)
    echo -n "Red Hat"
    ;;
esac
```
#### Lexicographic comparison
```bash
VAR1="Some value"
VAR2="Ubuntu"

if [[ "$VAR1" > "$VAR2" ]]; then
    echo "${VAR1} is lexicographically greater then ${VAR2}."
elif [[ "$VAR1" < "$VAR2" ]]; then
    echo "${VAR2} is lexicographically greater than ${VAR1}."
else
    echo "Strings are equal"
fi
```

## Arrays

#### Defining arrays
```bash
Fruits=('Apple' 'Banana' 'Orange')
```

```bash
Fruits[0]="Apple"
Fruits[1]="Banana"
Fruits[2]="Orange"
```

#### Working with arrays
```bash
echo "${Fruits[0]}"           # Element #0
echo "${Fruits[-1]}"          # Last element
echo "${Fruits[@]}"           # All elements, space-separated
echo "${#Fruits[@]}"          # Number of elements
echo "${#Fruits}"             # String length of the 1st element
echo "${#Fruits[3]}"          # String length of the Nth element
echo "${Fruits[@]:3:2}"       # Range (from position 3, length 2)
echo "${!Fruits[@]}"          # Keys of all elements, space-separated
```

#### Operations
```bash
Fruits=("${Fruits[@]}" "Watermelon")    # Push
Fruits+=('Watermelon')                  # Also Push
Fruits=( "${Fruits[@]/Ap*/}" )          # Remove by regex match
unset Fruits[2]                         # Remove one item
Fruits=("${Fruits[@]}")                 # Duplicate
Fruits=("${Fruits[@]}" "${Veggies[@]}") # Concatenate
lines=(`cat "logfile"`)                 # Read from file
```

#### Iterations
```bash
for i in "${arrayName[@]}"; do
  echo "$i"
done
```

## Dictionaries

#### Defining 
```bash
declare -A sounds
```

```bash
sounds[dog]="bark"
sounds[cow]="moo"
sounds[bird]="tweet"
sounds[wolf]="howl"
```

#### Working with dictionaries
```bash
echo "${sounds[dog]}" # Dog's sound
echo "${sounds[@]}"   # All values
echo "${!sounds[@]}"  # All keys
echo "${#sounds[@]}"  # Number of elements
unset sounds[dog]     # Delete dog
```

#### Iteration
Iterate over values
```bash
for val in "${sounds[@]}"; do
  echo "$val"
done
```
Iterate over keys
```bash
for key in "${!sounds[@]}"; do
  echo "$key"
done
```

## File conditions:
```bash
FILE="test.txt"
if [ -e "$FILE" ];
then
  echo "$FILE exists"
else
  echo "$FILE does NOT exist"
fi
```

`-d file` - True if the file is a directory  
`-e file` - True if the file exists (note that this is not particularly portable, thus -f is generally used)  
`-f file` - True if the provided string is a file  
`-g file` - True if the group id is set on a file  
`-r file` - True if the file is readable  
`-s file` - True if the file has a non-zero size  
`-u` - True if the user id is set on a file  
`-w` - True if the file is writable  
`-x` - True if the file is an executable  


## `case` statement
```bash
read -p "Are you 21 or over? Y/N " ANSWER
case "$ANSWER" in 
  [yY] | [yY][eE][sS])
    echo "You can have a beer :)"
    ;;
  [nN] | [nN][oO])
    echo "Sorry, no drinking"
    ;;
  *)
    echo "Please enter y/yes or n/no"
    ;;
esac
```

## simple `for` loop
```bash
NAMES="Brad Kevin Alice Mark"
for NAME in $NAMES
  do
    echo "Hello $NAME"
done
```

## `for` loop to rename files
```bash
FILES=$(ls *.txt)
NEW="new"
for FILE in $FILES  
  do
    echo "Renaming $FILE to new-$FILE"
    mv $FILE $NEW-$FILE
done
```

## `while` loop - read through a file line by line
```bash
LINE=1
while read -r CURRENT_LINE
  do
    echo "$LINE: $CURRENT_LINE"
    ((LINE++))
done < "./new-1.txt"
```

## Function
```bash
function sayHello() {
  echo "Hello World"
}
sayHello
```

## Function with params
```bash
function greet() {
  echo "Hello, I am $1 and I am $2"
}

greet "Brad" "36"
```


## Create folder and write to a file
```bash
mkdir hello
touch "hello/world.txt"
echo "Hello World" >> "hello/world.txt"
echo "Created hello/world.txt"
```

## Cheatsheet
* https://devhints.io/bash#conditionals
* https://linuxize.com/post/how-to-compare-strings-in-bash/

## TODO - Important questions to answer
* () vs (())
* ''  vs ""
* when to use single, or double quotes and when to use `${}` syntax with or without quotes 
* understand how to use `xargs`
* Understand how to use `.. -- ..`

## Resorces:
- [The simplicity and complecity of using quotes on Linux](https://www.networkworld.com/article/3669850/the-simplicity-and-complexity-of-using-quotes-on-linux.html)
- [How to compare strings](https://linuxize.com/post/how-to-compare-strings-in-bash/)
- [bash](https://devhints.io/bash)

