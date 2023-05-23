# Basics
```bash
name="John"
echo "${name}"
echo "${name/J/j}"    #=> "john" (substitution)
echo "${name:0:2}"    #=> "Jo" (slicing)
echo "${name::2}"     #=> "Jo" (slicing)
echo "${name::-1}"    #=> "Joh" (slicing)
echo "${name:(-1)}"   #=> "n" (slicing from right)
echo "${name:(-2):1}" #=> "h" (slicing from right)
echo "${food:-Cake}"  #=> $food or "Cake"
```
```bash
length=2
echo "${name:0:length}"  #=> "Jo"
```
```bash
str="/path/to/foo.cpp"
echo "${str%.cpp}"    # /path/to/foo
echo "${str%.cpp}.o"  # /path/to/foo.o
echo "${str%/*}"      # /path/to

echo "${str##*.}"     # cpp (extension)
echo "${str##*/}"     # foo.cpp (basepath)

echo "${str#*/}"      # path/to/foo.cpp
echo "${str##*/}"     # foo.cpp

echo "${str/foo/bar}" # /path/to/bar.cpp
```

```bash
str="Hello world"
echo "${str:6:5}"   # "world"
echo "${str: -5:5}"  # "world"
```

```bash
src="/path/to/foo.cpp"
base=${src##*/}   #=> "foo.cpp" (basepath)
dir=${src%$base}  #=> "/path/to/" (dirpath)
```

# Substitution
```bash
${foo%suffix} 	# Remove suffix
${foo#prefix} 	# Remove prefix
${foo%%suffix} 	# Remove long suffix
${foo/%suffix} 	# Remove long suffix
${foo##prefix} 	# Remove long prefix
${foo/#prefix} 	# Remove long prefix
${foo/from/to} 	# Replace first match
${foo//from/to} # Replace all
${foo/%from/to} # Replace suffix
${foo/#from/to} # Replace prefix
```

# Manipulation
```bash
str="HELLO WORLD!"
echo "${str,}"   #=> "hELLO WORLD!" (lowercase 1st letter)
echo "${str,,}"  #=> "hello world!" (all lowercase)

str="hello world!"
echo "${str^}"   #=> "Hello world!" (uppercase 1st letter)
echo "${str^^}"  #=> "HELLO WORLD!" (all uppercase)
```

# Comments
```bash
: '
This is a
multi line
comment
'
```

# Substrings
```bash
${foo:0:3} 	    # Substring (position, length)
${foo:(-3):3} 	# Substring from the right
```

# Length
```bash
${#foo} # Length of $foo
```

# Default values
```bash
${foo:-val}       # $foo, or val if unset (or null)
${foo:=val}       # Set $foo to val if unset (or null)
${foo:+val}       # val if $foo is set (and not null)
${foo:?message}   # Show error message and exit if $foo is unset (or null)
```
