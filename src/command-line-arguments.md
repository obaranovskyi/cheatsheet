`$1`, `$2`, `$3` ... - get argument by number

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
`@` - list of passed arguments

shifts the position of the command line arguments
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
`$#` - variable returns the input size 

shift n, where n is the number of positions to move
